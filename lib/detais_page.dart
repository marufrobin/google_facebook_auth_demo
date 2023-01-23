import 'package:flutter/material.dart';
import 'package:google_facebook_auth_demo/model/artists_bio.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.index}) : super(key: key);
  int index;
  List<ArtistsBio> artistsData = ArtistsBio.artistsBio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.cyanAccent,
          child: Image.asset(artistsData[index].img),
        ),
      ),
    );
  }
}
