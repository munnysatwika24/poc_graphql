import 'package:graphql_flutter/graphql_flutter.dart';
import '../queries.dart' ;

Future<Map<String,dynamic>> getUser({int? id}) async {
  HttpLink link = HttpLink("http://10.0.2.2:4000/graphql"); // url
  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ), // cache
  );
  QueryResult queryResult = await qlClient.query( // this is get so query methods
    QueryOptions(
      //  we use QueryOptions , for mutate
        fetchPolicy: FetchPolicy.networkOnly,
        document: gql(
          getUserQuery, // let'see string
        ),
        variables: {
          "id":id,// passing id in varibles
        }
    ),
  );

  return queryResult.data?['getUserInfo'] ?? {}; // i am getting json respone in getUserInfo which i am returning
}