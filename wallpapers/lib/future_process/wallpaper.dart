import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Wallpaper {
  final int id;
  final String wallpaperName;
  final String description;
  final String url;

  Wallpaper(this.wallpaperName, this.url,
      {this.id = 0, this.description = "This wallpapser has no description"});

  static Future<List<Wallpaper>> fetchWallapers(int id) async {
    try {
      var response = await http.get(
          "https://raw.githubusercontent.com/bhavish-assai/MyApp-Bhavish/master/Contents/wallpapers$id.json");

      var resp = json.decode(response.body);

      List<Wallpaper> wallpapers = [];

      for (var u in resp) {
        Wallpaper wallpaper =
            Wallpaper(u["collection_name"], u["display_image_url"]);

        wallpapers.add(wallpaper);
      }
      //print(wallpapers);

      return wallpapers;
    } catch (e) {
      print("An error Occured");
      return null;
    }
  }
}
