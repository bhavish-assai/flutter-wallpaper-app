import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:wallpaper/wallpaper.dart';

class WallDetail extends StatefulWidget {
  final String url;
  WallDetail(this.url);

  @override
  _WallDetailState createState() => _WallDetailState();
}

class _WallDetailState extends State<WallDetail> {
 bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.url,
            ),
          ),
          Align(
            alignment: Alignment(0.85, 0.9),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                showDialog(
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        
                        contentPadding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        title: Center(
                            child: Text(
                          "Set this as : ",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )),
                        children: <Widget>[
                         Divider(),
                          MaterialButton(   padding: EdgeInsets.all(0),
                                onPressed: () => null,
                                child: Text("Home Screen Wallpaper"),
                              ),
                         
                          MaterialButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => null,
                            child: Text("Lock Screen Wallpaper"),
                          ),
                        
                          MaterialButton(
                            onPressed: () => null,
                            child: Text("Both"),
                          )
                        ],
                      );
                    },
                    context: context);

                // final res = await Wallpaper.homeScreen(widget.url);
              },
              child: Icon(
                Icons.wallpaper,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
