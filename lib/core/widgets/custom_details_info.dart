import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/core/utils/styles.dart';
import 'package:task_2/core/widgets/date_and_rating_widget.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

class CustomDetailsInfo extends StatelessWidget {
  const CustomDetailsInfo({super.key, required this.movie});
  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            style: AppStyles.getBold30(context),
            maxLines: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          DateAndRatingWidget(
            movie: movie,
            color: AppColors.lightBlack,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(movie.overview),
        ],
      ),
    );
  }
}