import 'package:flutter/material.dart';
import 'package:movies/tv_description.dart';
import 'package:movies/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Popular Tv Shows',
            size: 26,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>TVDescription(name: tv[index]['original_name'], description: tv[index]['overview'], bannerurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'], posterurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'], vote: tv[index]['vote_average'].toString(), total_votes: tv[index]['vote_count'].toString(), first_air_date: tv[index]['first_air_date'])));
                    },
                    child:
                    tv[index]['original_name']!=null?Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+
                                            tv[index]['backdrop_path'].toString()),
                                fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: modified_text(
                                text: tv[index]['original_name']!= null? tv[index]['original_name']:'Loading'),
                          )
                        ],
                      ),
                    ):Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
