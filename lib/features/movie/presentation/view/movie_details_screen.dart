import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netbox/core/utils/extensions/widget_extensions.dart';
import 'package:netbox/features/movie/domain/entity/movie_entity.dart';
import 'package:netbox/features/movie/presentation/bloc/home_bloc.dart';
import 'package:netbox/features/movie/presentation/widget/movie_card.dart';

import '../../../../core/utils/widgets/custom_filled_button.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieEntity movie;

  const MovieDetailsScreen({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                movie.show!.image!.original!,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              movie.show!.name!,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ).paddingAll(16),
            Row(
              children: [
                Text(
                  movie.show!.premiered!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ).paddingOnly(
                  left: 16,
                  right: 8,
                ),
                Text(
                  "${movie.show!.runtime.toString()}m",
                  style: Theme.of(context).textTheme.bodyMedium,
                ).paddingOnly(
                  left: 16,
                  right: 8,
                ),
                const Icon(
                  Icons.hd_outlined,
                  color: Colors.white,
                ),
              ],
            ),
            customFilledButton(
              context: context,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              icon: Icons.play_arrow,
              label: "Resume",
              onPressed: () {},
            ).paddingOnly(left: 16, right: 16, top: 16),
            customFilledButton(
              context: context,
              backgroundColor: Colors.grey.shade900,
              foregroundColor: Colors.white,
              icon: Icons.download,
              label: "Download",
              onPressed: () {},
            ).paddingOnly(left: 16, right: 16, bottom: 16, top: 8),
            Text(
              movie.show!.summary!,
              style: Theme.of(context).textTheme.bodyMedium,
            ).paddingOnly(
              left: 16,
              right: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text("My List"),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.white,
                    ),
                    Text("Rate"),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    Text("Share"),
                  ],
                ),
              ],
            ).paddingSymmetric(vertical: 32),
            TabBar(
              tabs: const [
                Tab(
                  text: "More Like This",
                ),
                Tab(
                  text: "Trailers & More",
                ),
              ],
              dividerColor: Colors.grey,
              indicatorColor: Colors.red,
              indicatorWeight: 4,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: Colors.red,
              labelStyle: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 500,
              child: TabBarView(
                  children: [
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: homeBloc.movieList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) => movieCard(
                    context: context,
                    movie: homeBloc.movieList[index],
                    moreLikeThis: homeBloc.movieList,
                  ),
                ).paddingSymmetric(horizontal: 16),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    movie.show!.image!.original!,
                    fit: BoxFit.cover,
                  ),
                ),
              ]),
            )
          ],
        ),
      );
  }

  AppBar _buildAppBar() => AppBar(
    elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.download,
            ),
          ),
        ],
      );
}
