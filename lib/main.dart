import 'package:flutter/material.dart';
import 'package:movies/utils/text.dart';
import 'package:movies/widgets/toprated.dart';
import 'package:movies/widgets/trending.dart';
import 'package:movies/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(app());

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.transparent),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '4dfdfeb5f982799c46546081976c8f77';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZGZkZmViNWY5ODI3OTljNDY1NDYwODE5NzZjOGY3NyIsInN1YiI6IjYyYjFiMmVjYmYwZjYzMDVmNmY4ZGVjYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.f7PzS-sV8oiKVqz5IYZ2lxTDYZ-FGP0txpdIWqhWPD0';


  @override
  void initState(){
    loadmovies();
    super.initState();
  }


  loadmovies() async {
    TMDB tmdbWithCustomlogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdbWithCustomlogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomlogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomlogs.v3.tv.getPopular();


    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(tvresult);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(text: 'The Movies App'),
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies)
        ],
      ),
    );
  }
}
