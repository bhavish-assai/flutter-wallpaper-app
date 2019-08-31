import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Collection {
  final int id;
  final String displayImageUrl;
  final String collectionName;

  Collection(this.id, this.displayImageUrl, this.collectionName);

  static Future<List<Collection>> fetchData() async {
    var response = await http.get(
        "https://raw.githubusercontent.com/bhavish-assai/MyApp-Bhavish/master/Contents/collections.json");

    var resp = json.decode(response.body);

    List<Collection> collections = [];

    for (var u in resp) {
      Collection collection =
          Collection(u["id"], u["display_image_url"], u["collection_name"]);

      collections.add(collection);
      // print(collection.hashCode);
    }
    collections.shuffle();
    return collections;
  }
}
