-module(bank).
-include("bank.hrl").
-export([new/2, deposit/2, withdraw/2, get_balance/1, to_map/1, from_map/1]).

-spec new(binary() | list(), term()) -> {ok, #bank_account{}} | {error, invalid_owner}.
-spec deposit(#bank_account{}, term()) -> {ok, #bank_account{}} | {error, invalid_account | invalid_amount}.
-spec withdraw(#bank_account{}, term()) -> {ok, #bank_account{}} | {error, invalid_account | invalid_amount | insufficient_funds}.
-spec get_balance(#bank_account{}) -> {ok, {number(), string()}} | {error, invalid_account}.
-spec to_map(#bank_account{}) -> {ok, map()} | {error, invalid_account}.
-spec from_map(map()) -> {ok, #bank_account{}} | {error, invalid_account_data}.

%% Create a new bank account.
new(Owner, Id) when is_binary(Owner) orelse is_list(Owner) ->
  {ok, #bank_account{
         id = Id,
         owner = Owner,
         balance = 0,
         currency = "KSH"
        }};
new(_, _) ->
  {error, invalid_owner}.

%% Deposit money into an existing account.
deposit(#bank_account{balance = Balance} = Account, Amount) when is_number(Amount), Amount > 0 ->
  {ok, Account#bank_account{balance = Balance + Amount}};
deposit(#bank_account{}, _) ->
  {error, invalid_amount};
deposit(_, _) ->
  {error, invalid_account}.

%% Withdraw money from an existing account.
withdraw(#bank_account{balance = Balance} = Account, Amount) when is_number(Amount), Amount > 0 ->
  case Balance >= Amount of
    true ->
      {ok, Account#bank_account{balance = Balance - Amount}};
    false ->
      {error,insufficient_funds}
  end;
withdraw(#bank_account{}, _) ->
  {error, invalid_amount};
withdraw(_, _) ->
  {error, invalid_account}.

%% Return the current balance and currency.
get_balance(#bank_account{balance = Balance, currency = Currency}) ->
  {ok, {Balance, Currency}};
get_balance(_) ->
  {error, invalid_account}.

%% Convert a record to a map for easier serialization.
to_map(#bank_account{id = Id, owner = Owner, balance = Balance, currency = Currency}) ->
  {ok, #{
    id => Id,
    owner => Owner,
    balance => Balance,
    currency => Currency
   }};
to_map(_) ->
  {error, invalid_account}.

%% Build an account record from a map with the same keys as to_map/1.
from_map(#{id := Id, owner := Owner, balance := Balance, currency := Currency})
  when (is_binary(Owner) orelse is_list(Owner)),
       is_number(Balance),
       Balance >= 0,
       (is_binary(Currency) orelse is_list(Currency)) ->
  {ok, #bank_account{
         id = Id,
         owner = Owner,
         balance = Balance,
         currency = Currency
        }};
from_map(_) ->
  {error, invalid_account_data}.

