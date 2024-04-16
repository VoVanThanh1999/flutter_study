
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie, required this.isDetails,
  });

  final bool isDetails;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(movie.title),
        subtitle: Text('Director: ${movie.director}'),
        leading: CircleAvatar(
          //child: Text(movie.title[0]),
          backgroundImage: NetworkImage(movie.images[0]),
        ),
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 70, bottom: 10),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                          TextSpan(
                              text: 'Released: n',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold)),
                          TextSpan(text: '${movie.released}: \n'),
                          TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.bold),
                            text: 'Plot: ',
                          ),
                          TextSpan(text: '${movie.plot}: ')
                        ])),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>MovieDetails(movie: movie,))
                          );
                        }, child: isDetails  ? const Text(''):  const Text('Read more'))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
