import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/app/presentation/widgets/custom_err_widget.dart';
import 'package:task_2/core/app/presentation/widgets/custom_home_list_view.dart';
import 'package:task_2/core/app/presentation/widgets/movie_list_loading.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_popular_cubit/get_popular_cubit.dart';

class PopularBlocBuilder extends StatefulWidget {
  const PopularBlocBuilder({super.key});

  @override
  State<PopularBlocBuilder> createState() => _PopularBlocBuilderState();
}

class _PopularBlocBuilderState extends State<PopularBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularCubit, GetPopularState>(
        builder: (context, state) {
      if (state is GetPopularSuccess ||
          state is GetPopularPaginationLoading ||
          state is GetPopularPaginationFailure) {
        return CustomHomeListView(
            onPaginationScroll: () async {
              await BlocProvider.of<GetPopularCubit>(context).getPopularMovies(
                  pageNumber:
                      ++BlocProvider.of<GetPopularCubit>(context).nextPage);
            },
            baseMovieEntity: BlocProvider.of<GetPopularCubit>(context).movies);
      } else if (state is GetPopularFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const MovieListLoading();
      }
    });
  }
}
