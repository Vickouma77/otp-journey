-module(bank).
-include("bank.hrl").
-export([new/2, deposit/2, withdraw/2, get_balance/1, to_map/1]).

%% Create a new bank account
new(Owner, Id) when is_binary(Owner) orelse is_list(Owner) ->
  #bank_account{
     id = Id,
     owner = Owner,
     balance = 0,
     currency = "KSH"
    }.

%% DEposit money
deposit(#bank_account{balance = Balance} = Account, Amount) when is_number(Amount), Amount > 0 ->
  Account#bank_account{balance = Balance + Amount}.

%% Withdraw money
withdraw(#bank_account{balance = Balance} = Account, Amount) when is_number(Account), Amount > 0 ->
  case Balance >= Amount of
    true ->
      {ok, Account#bank_account{balance = Balance - Amount}};
    false ->
      {error,insufficient_funds}
  end.

get_balance(#bank_account{balance = Balance, currency = Currency}) ->
  {Balance, Currency}.

%% Converting record to a map.
to_map(#bank_account{id = Id, owner = Owner, balance = Balance, currency = Currency}) ->
  #{
    id => Id,
    owner => Owner,
    balance => Balance,
    currency => Currency
   }.

