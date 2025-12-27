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
      id: "2",
      image: Assets.categoriesIphone,
      name: AppStrings.phones,
    ),
    CategoriesSectionsModel(
      id: "3",
      image: Assets.categoriesLaptop,
      name: AppStrings.laptops,
    ),
    CategoriesSectionsModel(
      id: "4",
      image: Assets.categoriesAirPods,
      name: AppStrings.airPods,
    ),
    CategoriesSectionsModel(
      id: "5",
      image: Assets.categoriesSmartWatch,
      name: AppStrings.watches,
    ),
    CategoriesSectionsModel(
      id: "6",
      image: Assets.categoriesTools,
      name: AppStrings.tools,
    ),
    CategoriesSectionsModel(
      id: "7",
      image: Assets.categoriesDrones,
      name: AppStrings.drones,
    ),
    CategoriesSectionsModel(
      id: "8",
      image: Assets.categoriesGames,
      name: AppStrings.games,
    ),
  ];
}

