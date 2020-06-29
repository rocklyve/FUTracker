import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink _httpLink = HttpLink(uri: 'localhost:4000');

final AuthLink _authLink = AuthLink(getToken: () async => 'Bearer asdf');

final Link _link = _authLink.concat(_httpLink);

final GraphQLClient _client =
    GraphQLClient(cache: InMemoryCache(), link: _link);

final String getAllWeekendLeagues = """
query {
  allWeekendLeague {
		id,
    name
  }
}
""";

final String createTaskMutation = """
mutation CreateTodo(\$id: ID!, \$title: String!) {
  createTodo(id: \$id, title: \$title, completed: false) {
    id
  }
}
""";

final String updateTaskMutation = """
mutation UpdateTodo(\$id: ID!, \$completed: Boolean!) {
  updateTodo(id: \$id, completed: \$completed) {
    id
  }
}
""";
