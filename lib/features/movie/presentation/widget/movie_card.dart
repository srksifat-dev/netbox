import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netbox/core/utils/widgets/placeholders.dart';
import 'package:netbox/features/movie/domain/entity/movie_entity.dart';
import 'package:netbox/features/movie/presentation/bloc/search_state.dart';

import '../../../../core/routes/routes.dart';
import '../bloc/home_state.dart';

Widget movieCard({
  required BuildContext context,
  required MovieEntity movie,
  required List<MovieEntity> moreLikeThis,
}) {
  return GestureDetector(
    onTap: () {
      context.pushNamed(Routes.movieDetails,extra: movie);

    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.network(
        movie.show?.image?.original ?? "",
        errorBuilder: (_, __, ___) => const Center(
          child: Icon(
            Icons.movie,
            color: Colors.grey,
            size: 100,
          ),
        ),
        loadingBuilder:
            (BuildContext context, Widget child, ImageChunkEvent? loading) {
          if (loading == null) {
            return child;
          }
          return const MovieThumbnailPlaceholder();
        },
      ),
    ),
  );
}

Widget movieCardForHome({
  required BuildContext context,
  required MovieFetchingDone state,
  required int index,
  required List<MovieEntity> moreLikeThis,
}) {
  return GestureDetector(
    onTap: () {
      context.pushNamed(Routes.movieDetails,extra: state.movies![index]);

    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.network(
        state.movies![index].show?.image?.original ?? "",
        errorBuilder: (_, __, ___) => const Center(
          child: Icon(
            Icons.movie,
            color: Colors.grey,
            size: 100,
          ),
        ),
        loadingBuilder:
            (BuildContext context, Widget child, ImageChunkEvent? loading) {
          if (loading == null) {
            return child;
          }
          return const MovieThumbnailPlaceholder();
        },
      ),
    ),
  );
}

Widget movieCardForSearch({
  required BuildContext context,
  required SearchingDone state,
  required int index,
  required List<MovieEntity> moreLikeThis,
}) {
  return GestureDetector(
    onTap: () {
      context.pushNamed(Routes.movieDetails,extra: state.movies![index]);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.network(
        state.movies![index].show?.image?.original ?? "",
        errorBuilder: (_, __, ___) => const Center(
          child: Icon(
            Icons.movie,
            color: Colors.grey,
            size: 100,
          ),
        ),
        loadingBuilder:
            (BuildContext context, Widget child, ImageChunkEvent? loading) {
          if (loading == null) {
            return child;
          }
          return const MovieThumbnailPlaceholder();
        },
      ),
    ),
  );
}
