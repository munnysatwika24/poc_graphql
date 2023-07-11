import 'package:graphql_flutter/graphql_flutter.dart';

import '../queries.dart';

Future<bool> deleteUser({
  int? id,
}) async {
  HttpLink link = HttpLink("http://10.0.2.2:4000/graphql"); // same link
  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );
  QueryResult queryResult = await qlClient.query(
    QueryOptions(
        fetchPolicy: FetchPolicy.networkOnly, // this is not required , use only in get i.e when you are fetching data
        document: gql(
          deleteUSerMutation,
        ),
        variables: {
          'id': id,
        }),
  );

  return queryResult.data?['deleteUser'] ?? false;  // same as other getting true or false in response
}
