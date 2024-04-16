import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_details.dart';
import 'package:movie_app/providers/movie_providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MovieProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<MovieProvider>(context);
    List<Movie> _movieList = moviesData.movieList;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Movie App',
      )),
      body: Center(
        child: ListView.builder(
            itemCount: _movieList.length,
            itemBuilder: (context, index) {
              final movie = _movieList[index];
              return MovieCard(movie: movie, isDetails: false);
            }),
      ),
    );
  }
}
