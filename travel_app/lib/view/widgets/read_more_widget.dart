import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/home/home_cubit.dart';
import 'package:tarvel_app/controller/home/home_state.dart';
import 'package:tarvel_app/core/style/app_colors.dart';

class ReadMoreWidget extends StatelessWidget {
  const ReadMoreWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: AppColors.mineralGreen,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
              maxLines: HomeCubit.get(context).readMoreMaxLinesCount,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => HomeCubit.get(context).changeReadMoreMaxLines(),
              child: Row(
                children: [
                  Text(
                    HomeCubit.get(context).readMoreMaxLinesCount == 4
                        ? 'Read more'
                        : 'Read less',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                  Icon(
                    HomeCubit.get(context).readMoreMaxLinesCount == 1
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: AppColors.blue,
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
