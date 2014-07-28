-module(consensus_greeting_controller, [Req]).
-compile(export_all).

hello('GET', []) ->
  {output, "Hello, world! Let's start!"}.

hi_neo('GET', []) ->
  Neo = neo4j:connect([{base_uri, <<"http://localhost:7474/db/data/">>}]),
  Result = neo4j:get_node(Neo, 1),
  Data = lkup(<<"data">>, Result),
  A = lkup(<<"a">>, Data),
  {output, A}.

lkup(What, {List}) ->
      lkup(What, List);
lkup(What, List) ->
      proplists:get_value(What, List).
