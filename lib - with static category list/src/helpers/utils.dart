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
          SubCategory(
            color: AppColors.MEATS,
            name: 'Pig',
            imgName: 'cat1_1',
            unit: WeightUnits.Kg,
            icon: IconFontHelper.MEATS,
            parts: [
              CategoryPart(
                  name: 'Ham', imgName: 'cat1_1_p1', isSelected: false),
              CategoryPart(
                  name: 'Paws', imgName: 'cat1_1_p2', isSelected: false),
              CategoryPart(
                  name: 'Bacon', imgName: 'cat1_1_p3', isSelected: false),
              CategoryPart(
                  name: 'Loin', imgName: 'cat1_1_p4', isSelected: false),
              CategoryPart(
                  name: 'Ribs', imgName: 'cat1_1_p5', isSelected: false),
              CategoryPart(
                  name: 'Belly', imgName: 'cat1_1_p6', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            name: 'Hen',
            imgName: 'cat1_2',
            unit: WeightUnits.Kg,
            icon: IconFontHelper.MEATS,
            price: 10,
            parts: [
              CategoryPart(
                  name: 'Chest', imgName: 'cat1_2_p1', isSelected: false),
              CategoryPart(
                  name: 'Boneless', imgName: 'cat1_2_p2', isSelected: false),
              CategoryPart(
                  name: 'Leg', imgName: 'cat1_2_p3', isSelected: false),
              CategoryPart(
                  name: 'Panjaa', imgName: 'cat1_2_p4', isSelected: false),
              CategoryPart(
                  name: 'Pota Kaleeji',
                  imgName: 'cat1_2_p5',
                  isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            name: 'Cow',
            imgName: 'cat1_3',
            price: 10,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.MEATS,
            parts: [
              CategoryPart(
                  name: 'Normal ', imgName: 'cat1_3_p1', isSelected: false),
              CategoryPart(
                  name: 'Special', imgName: 'cat1_3_p2', isSelected: false),
              CategoryPart(
                  name: 'Boneless', imgName: 'cat1_3_p3', isSelected: false),
              CategoryPart(
                  name: 'With Bone', imgName: 'cat1_3_p4', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            name: 'Turkey',
            imgName: 'cat1_4',
            price: 40,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.MEATS,
            parts: [
              CategoryPart(
                  name: 'Boneless', imgName: 'cat1_4_p1', isSelected: false),
              CategoryPart(
                  name: 'Leg', imgName: 'cat1_4_p2', isSelected: false),
              CategoryPart(
                  name: 'Mix', imgName: 'cat1_4_p3', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            name: 'Goat',
            imgName: 'cat1_5',
            price: 100,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.MEATS,
            parts: [
              CategoryPart(
                  name: 'Chest', imgName: 'cat1_5_p1', isSelected: false),
              CategoryPart(
                  name: 'Mix', imgName: 'cat1_5_p2', isSelected: false),
              CategoryPart(
                  name: 'Special', imgName: 'cat1_5_p3', isSelected: false),
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            name: 'Rabbit',
            imgName: 'cat1_6',
            price: 60,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.MEATS,
            parts: [
              CategoryPart(
                  name: 'Mix', imgName: 'cat1_6_p1', isSelected: false),
              CategoryPart(
                  name: 'Leg', imgName: 'cat1_6_p2', isSelected: false),
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
            unit: WeightUnits.Kg,
            icon: IconFontHelper.FRUITS,
            parts: [],
          ),
          SubCategory(
            color: AppColors.FRUITS,
            name: 'Banana',
            imgName: 'cat2_2',
            price: 5,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.FRUITS,
            parts: [],
          ),
          SubCategory(
            color: AppColors.FRUITS,
            name: 'Grade',
            imgName: 'cat2_3',
            price: 10,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.FRUITS,
            parts: [],
          ),
          SubCategory(
            color: AppColors.FRUITS,
            name: 'Orange',
            imgName: 'cat2_4',
            price: 20,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.FRUITS,
            parts: [],
          ),
          SubCategory(
            color: AppColors.FRUITS,
            name: 'Nashpati',
            imgName: 'cat2_5',
            price: 30,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.FRUITS,
            parts: [],
          ),
        ],
      ),
      Category(
        color: AppColors.VEGS,
        name: 'Vegetables',
        imgName: 'cat3',
        icon: IconFontHelper.VEGS,
        subCategories: [
          SubCategory(
            color: AppColors.VEGS,
            name: 'Tamater',
            imgName: 'cat3_1',
            price: 40,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.VEGS,
            parts: [],
          ),
          SubCategory(
            color: AppColors.VEGS,
            name: 'Radish',
            imgName: 'cat3_2',
            price: 15,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.VEGS,
            parts: [],
          ),
          SubCategory(
            color: AppColors.VEGS,
            name: 'Lahsan',
            unit: WeightUnits.Kg,
            imgName: 'cat3_3',
            price: 46,
            icon: IconFontHelper.VEGS,
            parts: [],
          ),
          SubCategory(
            color: AppColors.VEGS,
            name: 'Onion',
            imgName: 'cat3_4',
            unit: WeightUnits.Kg,
            price: 33,
            icon: IconFontHelper.VEGS,
            parts: [],
          ),
        ],
      ),
      Category(
        color: AppColors.SEEDS,
        name: 'Seeds',
        imgName: 'cat4',
        icon: IconFontHelper.SEEDS,
        subCategories: [
          SubCategory(
            color: AppColors.SEEDS,
            name: 'Kajuu',
            imgName: 'cat4_1',
            price: 300,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.SEEDS,
            parts: [],
          ),
          SubCategory(
            color: AppColors.SEEDS,
            name: 'Peanuts',
            imgName: 'cat4_2',
            price: 700,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.SEEDS,
            parts: [],
          ),
          SubCategory(
            color: AppColors.SEEDS,
            name: 'Badaam',
            imgName: 'cat4_3',
            price: 1200,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.SEEDS,
            parts: [],
          ),
          SubCategory(
            color: AppColors.SEEDS,
            name: 'Pista',
            imgName: 'cat4_4',
            price: 4000,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.SEEDS,
            parts: [],
          ),
        ],
      ),
      Category(
        color: AppColors.PASTRIES,
        name: 'Sweets',
        imgName: 'cat5',
        icon: IconFontHelper.PASTRIES,
        subCategories: [
          SubCategory(
            color: AppColors.PASTRIES,
            name: 'Barfi',
            imgName: 'cat5_1',
            price: 4000,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.PASTRIES,
            parts: [],
          ),
          SubCategory(
            color: AppColors.PASTRIES,
            name: 'Galeebii',
            imgName: 'cat5_2',
            price: 300,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.PASTRIES,
            parts: [],
          ),
          SubCategory(
            color: AppColors.PASTRIES,
            name: 'Gulab Jaman',
            imgName: 'cat5_3',
            price: 1000,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.PASTRIES,
            parts: [],
          ),
          SubCategory(
            color: AppColors.PASTRIES,
            name: 'Pateesa',
            imgName: 'cat5_4',
            price: 1300,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.PASTRIES,
            parts: [],
          ),
        ],
      ),
      Category(
        color: AppColors.SPICES,
        name: 'Spices',
        imgName: 'cat6',
        icon: IconFontHelper.SPICES,
        subCategories: [
          SubCategory(
            color: AppColors.SPICES,
            name: 'Sabaz Mirch',
            imgName: 'cat6_1',
            price: 20,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.SPICES,
            parts: [],
          ),
          SubCategory(
            color: AppColors.SPICES,
            name: 'Laal Mirch',
            imgName: 'cat6_2',
            price: 300,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.SPICES,
            parts: [],
          ),
          SubCategory(
            color: AppColors.SPICES,
            name: 'Black Mirch',
            imgName: 'cat6_3',
            price: 500,
            unit: WeightUnits.Kg,
            icon: IconFontHelper.SPICES,
            parts: [],
          ),
        ],
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
