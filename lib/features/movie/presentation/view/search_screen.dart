import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netbox/features/movie/presentation/bloc/search_event.dart';
import 'package:netbox/features/movie/presentation/view/loading_home_screen.dart';

import '../bloc/search_state.dart';
import '../bloc/search_bloc.dart';
import '../widget/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16),
          height: 60,
          color: Colors.grey.withOpacity(0.3),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextField(
                  autofocus: true,
                  controller: searchController,
                  onChanged: (p) async => context.read<SearchBloc>().debounce(
                    () async {
                      context
                          .read<SearchBloc>()
                          .add(SearchMoviesEvent(params: p));
                    },
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Movie",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading || state.movies!.isEmpty) {
                return loadingHomeScreen(context);
              } else if (state is SearchError) {
                return const Center(
                  child: Text("There is no movie"),
                );
              } else if (state is SearchingDone) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                    top: 16,
                  ),
                  child: GridView.builder(
                    itemCount: state.movies!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) => movieCardForSearch(
                      context: context,
                      state: state,
                      index: index,
                      moreLikeThis: state.movies!,
                    ),
                  ),
                );
              }
              return const Center(
                child: Text("There is no movie"),
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
}
