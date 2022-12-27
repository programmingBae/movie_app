import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/movie_bloc.dart';
import '../../bloc/bloc/page_bloc.dart';
import '../../entities/movie.dart';
import 'movie_card.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (_, state) {
          if (state is MovieLoaded) {
            List<Movie> movies = state.movies;
            return Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: (index == 0) ? 24 : 0,
                          right: (index == movies.length - 1) ? 24 : 16,
                        ),
                        child: InkWell(
                          onTap: () {
                            context
                                .read<PageBloc>()
                                .add(OpenMovieDetailPage(movies[index]));
                          },
                          child: Row(
                            children: <Widget>[
                              MovieCard(movie: movies[index]),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          ),
                        ),
                      );
                    }));
          } else if (state is MovieInitial) {
            return Text("loading...");
          } else {
            return Text("gamasuk state");
          }
        },
      ),
    );
  }
}
