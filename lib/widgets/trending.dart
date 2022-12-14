import 'package:flutter/material.dart';
import 'package:movies/description.dart';
import 'package:movies/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Trending Movies',
            size: 26,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (Context)=>Description(name: trending[index]['title'], total_votes: trending[index]['vote_count'].toString(), description: trending[index]['overview'], bannerurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'], posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'], vote: trending[index]['vote_average'].toString(), launch_on: trending[index]['release_date'])));
                    },
                    child: trending[index]['title']!=null?Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path']))),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: modified_text(
                                text: trending[index]['title'] != null
                                    ? trending[index]['title']
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
