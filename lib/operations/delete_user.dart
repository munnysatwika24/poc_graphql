import 'package:graphql_flutter/graphql_flutter.dart';
import '../queries.dart';

Future<bool> deleteUser({int? id}) async {
  HttpLink link = HttpLink("http://10.0.2.2:4000/graphql");
  GraphQLClient graphQLClient =
      GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));
  QueryResult result = await graphQLClient.query(
      QueryOptions(document: gql(deleteUSerMutation), variables: {'id': id}));
  return result.data?['deleteUser'] ?? false;
}
