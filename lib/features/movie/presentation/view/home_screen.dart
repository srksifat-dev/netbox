import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:netbox/core/utils/extensions/widget_extensions.dart';
import 'package:netbox/features/movie/presentation/view/loading_home_screen.dart';

import '../../../../core/routes/routes.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../widget/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildBody() => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return loadingHomeScreen(context);
          } else if (state is MovieFetchingError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (state is MovieFetchingDone) {
            return GridView.builder(
              itemCount: state.movies!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => movieCardForHome(
                context: context,
                state: state,
                index: index,
                moreLikeThis: state.movies!,
              ),
            ).paddingSymmetric(horizontal: 16);
          }

          return const SizedBox.shrink();
        },
      );

  AppBar _buildAppBar(BuildContext context) => AppBar(
        title: SvgPicture.asset(
          "assets/svgs/logo.svg",
          height: 40,
        ),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.download,
            ),
          ),
          IconButton(
            onPressed: () {
              context.goNamed(Routes.search);
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      );
}
