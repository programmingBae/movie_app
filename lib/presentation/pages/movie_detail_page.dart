import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/presentation/widgets/black_button.dart';
import 'package:movie_app/repository/movie_repository.dart';

import '../../bloc/bloc/page_bloc.dart';
import '../../entities/credit.dart';
import '../../entities/movie.dart';
import '../widgets/credits_card.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(OpenMainPage());
        throw (Error);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffd4e1f4),
          body: ListView(children: [
            ..._buildBackground(context, movie),
            _buildMovieInformation(context),
            Positioned(
                bottom: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlackButton(
                          onPressed: () {
                            context
                                .read<PageBloc>()
                                .add(OpenBookSchedulePage(movie));
                          },
                          text: "Book")
                    ],
                  ),
                )),
          ]),
        ),
      ),
    );
  }

  Positioned _buildMovieInformation(BuildContext context) {
    List<Credit>? credits;
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              movie.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '${movie.originalTitle} | ${movie.releaseDate}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RatingBar.builder(
                initialRating: movie.voteAverage.toDouble() / 2,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 20,
                unratedColor: Colors.white,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: ((context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                }),
                onRatingUpdate: (rating) {}),
            const SizedBox(height: 20),
            FutureBuilder(
                future: MovieRepository().getCredits(movie.id),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    credits = snapshot.data;
                    return SizedBox(
                      height: 115,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: credits!.length,
                        itemBuilder: (_, index) => Container(
                          margin: EdgeInsets.only(
                            left: (index == 0) ? 5 : 0,
                            right: (index == credits!.length - 1) ? 4 : 16,
                          ),
                          child: CreditsCard(credits![index]),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 50,
                    );
                  }
                }),
            Text(
              movie.overview,
              maxLines: 8,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(height: 1.75, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackground(context, movie) {
    return [
      Container(
        // height: double.infinity,
        color: Color(0xffd4e1f4),
      ),
      Image.network(
        "https://image.tmdb.org/t/p/" + "w1280" + movie.backdropPath ??
            movie.posterPath,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
          child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Color(0xffd4e1f4)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.3, 0.5]))))
    ];
  }
}
