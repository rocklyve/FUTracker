import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink _httpLink = HttpLink(uri: 'localhost:4000');

final AuthLink _authLink =
    AuthLink(getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>');

final Link _link = _authLink.concat(_httpLink);

ValueNotifier<GraphQLClient> _client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: _link,
  ),
);

final String signUp = """
mutation {
  signup(name: "Toni", email: "Toni@prisma.io", password: "graphql") {
    token
  }
}
""";

final String login = """
mutation {
  login(email: "katharina@prisma.io", password: "graphql") {
    token
  }
}
""";

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
