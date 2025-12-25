import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/models/categories_sections_model.dart';
import 'package:shopx/generated/assets.dart';

class AppCategoriesSections {

  static List<CategoriesSectionsModel> categoriesList = [
    CategoriesSectionsModel(
      id: "1",
      image: Assets.categoriesCamera,
      name: AppStrings.cameras,
    ),
    CategoriesSectionsModel(
      id: "1",
      image: Assets.categoriesIphone,
      name: AppStrings.phones,
    ),
    CategoriesSectionsModel(
      id: "1",
      image: Assets.categoriesLaptop,
      name: AppStrings.laptops,
    ),
    CategoriesSectionsModel(
      id: "1",
      image: Assets.categoriesAirPods,
      name: AppStrings.airPods,
    ),
    CategoriesSectionsModel(
      id: "1",
      image: Assets.categoriesSmartWatch,
      name: AppStrings.watches,
    ),
    // CategoriesSectionsModel(
    //   id: "1",
    //   image: "assets/images/categories/electronics.png",
    //   name: "Accessories",
    // ),
    CategoriesSectionsModel(
      id: "1",
      image: Assets.categoriesTools,
      name: AppStrings.tools,
    ),
    CategoriesSectionsModel(
      id: "1",
      image: Assets.categoriesDrones,
      name: AppStrings.drones,
    ),
    CategoriesSectionsModel(
      id: "1",
      image: Assets.categoriesSport,
      name: AppStrings.sports,
    ),
  ];

}

