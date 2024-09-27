import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';

import '../utils/color_utility.dart';

class RatingStar extends StatelessWidget {
  final double rating;
  const RatingStar({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedRatingStars(
      initialRating: rating,
      filledColor: ColorUtility.main,
      emptyColor: ColorUtility.main,
      onChanged: (double rating) {},
      customFilledIcon: Icons.star,
      customHalfFilledIcon: Icons.star_half,
      customEmptyIcon: Icons.star_border,
      starSize: 14,
      readOnly: true,
    );
  }
}
