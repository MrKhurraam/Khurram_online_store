import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/category_part_model.dart';
import '../models/on_boarding_content_model.dart';
import '../models/sub_category_model.dart';
import 'app_colors.dart';
import 'icon_helper.dart';
import 'unitenums.dart';

class Utils {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static List<OnBoardingContent> getOnboarding() {
    return [
      OnBoardingContent(
          message: 'Fresh products from the land to your table',
          img: 'onboard1'),
      OnBoardingContent(
          message: 'Fresh and healthy meats and sausages for your delight',
          img: 'onboard2'),
      OnBoardingContent(
          message: 'Buy them from the comfort of your \nmobile device',
          img: 'onboard3')
    ];
  }

  static List<Category> getMockedCategories() {
    return [
      Category(
        color: AppColors.MEATS,
        name: 'Meat',
        imgName: 'cat1',
        icon: IconFontHelper.MEATS,
        subCategories: [
          // SubCategory(
          //   color: AppColors.MEATS,
          //   name: 'Pig',
          //   imgName: 'cat1_1',
          //   icon: IconFontHelper.MEATS,
          //   parts: [
          //     CategoryPart(
          //         name: 'Ham', imgName: 'cat1_1_p1', isSelected: false),
          //     CategoryPart(
          //         name: 'Paws', imgName: 'cat1_1_p2', isSelected: false),
          //     CategoryPart(
          //         name: 'Bacon', imgName: 'cat1_1_p3', isSelected: false),
          //     CategoryPart(
          //         name: 'Loin', imgName: 'cat1_1_p4', isSelected: false),
          //     CategoryPart(
          //         name: 'Ribs', imgName: 'cat1_1_p5', isSelected: false),
          //     CategoryPart(
          //         name: 'Belly', imgName: 'cat1_1_p6', isSelected: false),
          //   ],
          // ),
          SubCategory(
            color: AppColors.MEATS,
            name: 'Hen',
            imgName: 'cat1_2',
            icon: IconFontHelper.MEATS,
            price: 10,
            parts: [
              CategoryPart(
                  name: 'Ham', imgName: 'cat1_2_p1', isSelected: false),
              CategoryPart(
                  name: 'Paws', imgName: 'cat1_2_p2', isSelected: false),
              CategoryPart(
                  name: 'Bacon', imgName: 'cat1_2_p3', isSelected: false),
              CategoryPart(
                  name: 'Loin', imgName: 'cat1_2_p4', isSelected: false),
              CategoryPart(
                  name: 'Ribs', imgName: 'cat1_2_p5', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            name: 'Cow',
            imgName: 'cat1_3',
            price: 10,
            icon: IconFontHelper.MEATS,
            parts: [
              CategoryPart(
                  name: 'Jamon', imgName: 'cat1_1_p1', isSelected: false),
              CategoryPart(
                  name: 'Patas', imgName: 'cat1_1_p2', isSelected: false),
              CategoryPart(
                  name: 'Tocineta', imgName: 'cat1_1_p3', isSelected: false),
              CategoryPart(
                  name: 'Lomo', imgName: 'cat1_1_p4', isSelected: false),
              CategoryPart(
                  name: 'Costillas', imgName: 'cat1_1_p5', isSelected: false),
              CategoryPart(
                  name: 'Panza', imgName: 'cat1_1_p6', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            name: 'Turkey',
            imgName: 'cat1_4',
            price: 40,
            icon: IconFontHelper.MEATS,
            parts: [
              CategoryPart(
                  name: 'Jamon', imgName: 'cat1_1_p1', isSelected: false),
              CategoryPart(
                  name: 'Patas', imgName: 'cat1_1_p2', isSelected: false),
              CategoryPart(
                  name: 'Tocineta', imgName: 'cat1_1_p3', isSelected: false),
              CategoryPart(
                  name: 'Lomo', imgName: 'cat1_1_p4', isSelected: false),
              CategoryPart(
                  name: 'Costillas', imgName: 'cat1_1_p5', isSelected: false),
              CategoryPart(
                  name: 'Panza', imgName: 'cat1_1_p6', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            name: 'Goat',
            imgName: 'cat1_5',
            icon: IconFontHelper.MEATS,
            parts: [
              CategoryPart(
                  name: 'Jamon', imgName: 'cat1_1_p1', isSelected: false),
              CategoryPart(
                  name: 'Patas', imgName: 'cat1_1_p2', isSelected: false),
              CategoryPart(
                  name: 'Tocineta', imgName: 'cat1_1_p3', isSelected: false),
              CategoryPart(
                  name: 'Lomo', imgName: 'cat1_1_p4', isSelected: false),
              CategoryPart(
                  name: 'Costillas', imgName: 'cat1_1_p5', isSelected: false),
              CategoryPart(
                  name: 'Panza', imgName: 'cat1_1_p6', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            name: 'Rabbit',
            imgName: 'cat1_6',
            icon: IconFontHelper.MEATS,
            parts: [
              CategoryPart(
                  name: 'Jamon', imgName: 'cat1_1_p1', isSelected: false),
              CategoryPart(
                  name: 'Patas', imgName: 'cat1_1_p2', isSelected: false),
              CategoryPart(
                  name: 'Tocineta', imgName: 'cat1_1_p3', isSelected: false),
              CategoryPart(
                  name: 'Lomo', imgName: 'cat1_1_p4', isSelected: false),
              CategoryPart(
                  name: 'Costillas', imgName: 'cat1_1_p5', isSelected: false),
              CategoryPart(
                  name: 'Panza', imgName: 'cat1_1_p6', isSelected: false),
            ],
          ),
        ],
      ),
      Category(
        color: AppColors.FRUITS,
        name: 'Fruits',
        imgName: 'cat2',
        icon: IconFontHelper.FRUITS,
        subCategories: [
          SubCategory(
            color: AppColors.FRUITS,
            name: 'Kiwi',
            imgName: 'cat2_1',
            price: 15,
            icon: IconFontHelper.FRUITS,
            parts: [
              CategoryPart(
                  name: 'Ham', imgName: 'cat2_1_desc', isSelected: false),
              CategoryPart(
                  name: 'Paws', imgName: 'cat2_1_desc', isSelected: false),
              CategoryPart(
                  name: 'Bacon', imgName: 'cat2_1_desc', isSelected: false),
              CategoryPart(
                  name: 'Loin', imgName: 'cat2_1_desc', isSelected: false),
              CategoryPart(
                  name: 'Ribs', imgName: 'cat2_1_desc', isSelected: false),
              CategoryPart(
                  name: 'Belly', imgName: 'cat2_1_desc', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.FRUITS,
            name: 'Banana',
            imgName: 'cat2_2',
            price: 5,
            icon: IconFontHelper.FRUITS,
            parts: [
              CategoryPart(
                  name: 'Jamon', imgName: 'cat2_2_p1', isSelected: false),
              CategoryPart(
                  name: 'Patas', imgName: 'cat2_2_p2', isSelected: false),
              CategoryPart(
                  name: 'Tocineta', imgName: 'cat2_2_p3', isSelected: false),
              CategoryPart(
                  name: 'Lomo', imgName: 'cat2_2_p4', isSelected: false),
              CategoryPart(
                  name: 'Costillas', imgName: 'cat2_2_p5', isSelected: false),
              CategoryPart(
                  name: 'Panza', imgName: 'cat2_2_p6', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.FRUITS,
            name: 'Gallina',
            imgName: 'cat2_3',
            icon: IconFontHelper.FRUITS,
            parts: [
              CategoryPart(
                  name: 'Jamon', imgName: 'cat2_3_p1', isSelected: false),
              CategoryPart(
                  name: 'Patas', imgName: 'cat2_3_p2', isSelected: false),
              CategoryPart(
                  name: 'Tocineta', imgName: 'cat2_3_p3', isSelected: false),
              CategoryPart(
                  name: 'Lomo', imgName: 'cat2_3_p4', isSelected: false),
              CategoryPart(
                  name: 'Costillas', imgName: 'cat2_3_p5', isSelected: false),
              CategoryPart(
                  name: 'Panza', imgName: 'cat2_3_p6', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.FRUITS,
            name: 'Pavo',
            imgName: 'cat2_4',
            icon: IconFontHelper.FRUITS,
            parts: [
              CategoryPart(
                  name: 'Jamon', imgName: 'cat2_4_p1', isSelected: false),
              CategoryPart(
                  name: 'Patas', imgName: 'cat2_4_p2', isSelected: false),
              CategoryPart(
                  name: 'Tocineta', imgName: 'cat2_4_p3', isSelected: false),
              CategoryPart(
                  name: 'Lomo', imgName: 'cat2_4_p4', isSelected: false),
              CategoryPart(
                  name: 'Costillas', imgName: 'cat2_4_p5', isSelected: false),
              CategoryPart(
                  name: 'Panza', imgName: 'cat2_4_p6', isSelected: false),
            ],
          ),
        ],
      ),
      Category(
        color: AppColors.VEGS,
        name: 'Vegetables',
        imgName: 'cat3',
        icon: IconFontHelper.VEGS,
        subCategories: [],
      ),
      Category(
        color: AppColors.SEEDS,
        name: 'Seeds',
        imgName: 'cat4',
        icon: IconFontHelper.SEEDS,
        subCategories: [],
      ),
      Category(
        color: AppColors.SPICES,
        name: 'Spices',
        imgName: 'cat5',
        icon: IconFontHelper.SPICES,
        subCategories: [],
      ),
    ];
  }

  static String weightUnitToString(WeightUnits unit) {
    switch (unit) {
      case WeightUnits.Kg:
        return 'kg.';
      case WeightUnits.Lb:
        return 'lb.';
      case WeightUnits.Oz:
        return 'oz.';
      default:
        return 'lb.';
    }
  }

  static String deviceSuffix(BuildContext context) {
    String deviceSuffix = '';
    TargetPlatform platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.android:
        deviceSuffix = '_android';
        break;
      case TargetPlatform.iOS:
        deviceSuffix = '_ios';
        break;
      default:
        deviceSuffix = '';
        break;
    }

    return deviceSuffix;
  }
}
