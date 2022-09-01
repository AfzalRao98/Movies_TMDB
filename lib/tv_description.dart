import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/text.dart';

class TVDescription extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, first_air_date, total_votes;
  const TVDescription(
      {Key? key,
        required this.name,
        required this.description,
        required this.bannerurl,
        required this.posterurl,
        required this.vote,
        required this.first_air_date, required this.total_votes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(bannerurl, fit: BoxFit.cover,),
                      )),
                  Positioned(
                      bottom: 30,
                      child: modified_text(text: ' ⭐ Rating - '+vote, size: 18,)),
                  Positioned(
                    left: 30,
                      bottom: 5,
                      child: modified_text(text: 'votes : '+total_votes, size: 18,)),
                  Positioned(
                      left: 5,
                      top: 10,
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back, color: Colors.white,))),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(text: name!=null?name:'Not Loaded', size: 24,),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(text: 'Releasing on - '+first_air_date, size: 14,),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ) ,
                Flexible(
                  child: Container(
                    child: modified_text(text: description, size: 18,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
