import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/entities/movie.dart';

class MovieCard extends StatelessWidget {
  // const MovieCard({super.key});
  final Movie movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500" + movie.posterPath),
              fit: BoxFit.cover),
          border: Border.all(
              color: Color(0xff2F3943), style: BorderStyle.solid, width: 5),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(1, 1))
          ]),
    );
  }
}
