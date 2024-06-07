import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/home/home_state.dart';
import 'package:tarvel_app/model/home/place_model.dart';

import '../../controller/home/home_cubit.dart';
import '../../core/app_helper/app_navigator.dart';
import '../../core/style/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_icon_with_text.dart';
import '../widgets/facilities_widget.dart';
import '../widgets/fav_button_widget.dart';
import '../widgets/read_more_widget.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({
    super.key,
    required this.placeData,
  });

  final PlaceModel placeData;

  // @override
  // void initState() {
  //   super.initState();
  //   // HomeCubit.get(context).handleFacilitiesDataList(widget.placeData.id);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              /// Screen Body
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 366,
                        child: Stack(
                          children: [
                            Container(
                              height: 340,
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    placeData.image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  onTap: () => AppNavigator.pop(context),
                                  child: Container(
                                    width: 33,
                                    height: 33,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    decoration: const BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: AppColors.darkGrey,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: BlocBuilder<HomeCubit, HomeState>(
                                builder: (context, state) {
                                  return FavButtonWidget(
                                    onTap: () =>
                                        HomeCubit.get(context).toggleFav(
                                      placeData.id,
                                      placeData.isFav,
                                    ),
                                    height: 45,
                                    width: 45,
                                    iconSize: 25,
                                    isFav: placeData.isFav == 1,
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            placeData.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Show map',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue,
                            ),
                          ),
                        ],
                      ),
                      CustomIconWithText(
                        icon: const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        text:
                            '${placeData.rate} (${placeData.reviewers} Reviews)',
                        textStyle: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ReadMoreWidget(
                        text: placeData.description,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Facilities',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 75,
                        child: FacilitiesWidget(facilities: placeData.facilities,),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// Bottom Widget
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$${placeData.prices}',
                        style: const TextStyle(
                            fontSize: 24,
                            color: Color(0xff2DD7A4),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: CustomButton(
                        onTap: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Book Now',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward,
                              color: AppColors.white,
                              size: 18,
                            )
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
