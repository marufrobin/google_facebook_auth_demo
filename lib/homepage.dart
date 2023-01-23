import 'package:flutter/material.dart';
import 'package:google_facebook_auth_demo/detais_page.dart';
import 'package:google_facebook_auth_demo/model/artists_bio.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<ArtistsBio> artistData = ArtistsBio.artistsBio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            artistData.length,
            (index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(index: index),
                    ));
              },
              child: Container(
                margin: EdgeInsets.all(8),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image.asset(
                      "${artistData[index].img}",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(colors: [
                              Colors.white,
                              Colors.white60,
                              Colors.white30,
                              Colors.white24
                            ])),
                        child: Text(
                          "${artistData[index].name}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
