import 'package:flutter/material.dart';
import 'package:wallpapers/Pages/wallDetail.dart';
import 'package:wallpapers/future_process/wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WallPage extends StatefulWidget {
  final String title;
  final int id;

  WallPage(this.title, this.id);

  @override
  _WallPageState createState() => _WallPageState();
}

class _WallPageState extends State<WallPage> {
  @override
  void initState() {
    // Wallpaper.fetchWallapers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: Wallpaper.fetchWallapers(widget.id),
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return StaggeredGridView.countBuilder(
              physics: BouncingScrollPhysics(),
              staggeredTileBuilder: (int index) => StaggeredTile.count(2, 3),
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              crossAxisCount: 4,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            WallDetail(snapshot.data[index].url)));
                  },
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: snapshot.data[index].url,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
