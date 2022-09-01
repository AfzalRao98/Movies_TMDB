import 'package:flutter/material.dart';
import 'package:movies/toprated_description.dart';
import 'package:movies/utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated ({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Top Rated Movies',
            size: 26,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TopRatedDescription(name: toprated[index]['title'], total_votes: toprated[index]['vote_count'].toString(), description: toprated[index]['overview'], bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'], posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'], vote: toprated[index]['vote_average'].toString(), release_date: toprated[index]['release_date'])));
                    },
                    child: toprated[index]['title']!=null?Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path']))),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: modified_text(
                                text: toprated[index]['title'] != null
                                    ? toprated[index]['title']
                                    : 'Loading'),
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
