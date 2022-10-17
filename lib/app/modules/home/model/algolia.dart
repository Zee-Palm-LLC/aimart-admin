
import 'package:algolia/algolia.dart';

class AlgoliaApplication{
  static const Algolia algolia = Algolia.init(
    applicationId: 'TSBEHU8R8C', //ApplicationID
    apiKey:
        '4b1a38aae662a0fdd1dacc7e143cfc08', //search-only api key in flutter code
  );
}