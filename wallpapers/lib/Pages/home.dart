import 'package:flutter/material.dart';
import 'package:wallpapers/Pages/wallPage.dart';
import 'package:wallpapers/future_process/collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    //Collection.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wallpapers",
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.data_usage,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  //print("Hello");
                });
              },
            ),
            title: Text(
              "Wallpapers",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: FutureBuilder(
            future: Collection.fetchData(),
            builder: (context, snapshot) {
              //  print("This is $snapshot.data");
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    String title = snapshot.data[index].collectionName;
                    Size size = MediaQuery.of(context).size;
                    return Container(
                        width: size.width,
                        height: 226,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WallPage(
                                        title, snapshot.data[index].id)));
                              },
                              child: CachedNetworkImage(
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, errorMessage) {
                                  return Center(child: Icon(Icons.error));
                                },
                                fit: BoxFit.fill,
                                imageUrl: snapshot.data[index].displayImageUrl,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Material(
                                color: Colors.white54,
                                child: ListTile(
                                  onTap: () {},
                                  title: Text(
                                    snapshot.data[index].collectionName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                  subtitle:
                                      Text("This is wallpaper application"),
                                ),
                              ),
                            )
                          ],
                        ));
                  },
                );
              }
            },
          )),
    );
  }
}
