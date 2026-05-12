-module(color).

%% A small RGBA color helper using maps.
%%
%% Representation:
%%   #{red := R, green := G, blue := B, alpha := A}
%% where all channels are floats in the inclusive range [0.0, 1.0].
%%
%% Blending:
%%   blend/2 implements standard “source-over” alpha compositing.
%%   It computes premultiplied channels internally and then normalizes
%%   back to straight (non-premultiplied) RGB by dividing by the output alpha.

-export([new/4, blend/2]).

%% Guards used by new/4: enforce float channels in [0.0, 1.0].
-define(is_channel(V), (is_float(V) andalso V >= 0.0 andalso V =< 1.0)).

%% Create a color map from straight (non-premultiplied) channel values.
new(R, G, B, A) when ?is_channel(R), ?is_channel(G),
                     ?is_channel(B), ?is_channel(A) ->
  #{red => R, green => G, blue => B, alpha => A}.

%% Blend Src “over” Dst using their alpha channels (source-over).
%% Returns a color map in the same straight-RGB representation.
blend(Src, Dst) ->
  blend(Src, Dst, alpha(Src, Dst)).

%% Internal helper: if output alpha is > 0, normalize premultiplied RGB.
blend(Src, Dst, Alpha) when Alpha > 0.0 ->
  Dst#{
    red := red(Src, Dst) / Alpha,
    green := green(Src, Dst) / Alpha,
    blue := blue(Src, Dst) / Alpha,
    alpha := Alpha
   };

%% If the resulting alpha is 0, RGB is undefined; return fully transparent.
blend(_,Dst,_) ->
  Dst#{
    red := 0.0,
    green := 0.0,
    blue := 0.0,
    alpha := 0.0
   }.

%% Output alpha for source-over: Aout = As + Ad * (1 - As)
alpha(#{alpha := SA}, #{alpha := DA}) ->
  SA + DA * (1.0 - SA).

%% Premultiplied channel contributions (normalized by Alpha in blend/3).
red(#{red := SV, alpha := SA}, #{red := DV, alpha := DA}) ->
    SV * SA + DV * DA*(1.0 - SA).

green(#{green := SV, alpha := SA}, #{green := DV, alpha := DA}) ->
    SV * SA + DV * DA * (1.0 - SA).

blue(#{blue := SV, alpha := SA}, #{blue := DV, alpha := DA}) ->
    SV * SA + DV * DA * (1.0 - SA).
