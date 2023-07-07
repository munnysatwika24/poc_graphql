import 'package:graphql_flutter/graphql_flutter.dart';
import '../queries.dart';

Future<List> getAllUsers() async {
  HttpLink link = HttpLink("http://10.0.2.2:4000/graphql"); // this is api call for getting all users
  GraphQLClient qlClient = GraphQLClient( // same client create
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );
  QueryResult queryResult = await qlClient.query( // here it's get type so using query method
    QueryOptions(
      document: gql(
        getAllUsersQuery, // let's see query string
      ),
    ),
  );

  return queryResult.data?['getUsers'] ?? []; // here i am getting list in getUsers field which i am return
}