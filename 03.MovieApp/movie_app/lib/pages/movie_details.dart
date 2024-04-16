import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_card.dart';

import '../models/movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: Container(
          child: Column(
            children: [
              MovieCard(movie: movie, isDetails: true),
              Text(
                'Movie Poster',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.images.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4.0,
                        child: Image.network(movie.images[index],
                        fit: BoxFit.cover,
                        ),
                        
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
