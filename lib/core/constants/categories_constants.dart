class CategoriesConstants {

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      id: "1",
      image: "assets/images/categories/camera.png",
      name: "Cameras",
    ),
    CategoriesModel(
      id: "1",
      image: "assets/images/categories/iphone.png",
      name: "Phones",
    ),
    CategoriesModel(
      id: "1",
      image: "assets/images/categories/laptop.png",
      name: "Laptops",
    ),
    CategoriesModel(
      id: "1",
      image: "assets/images/categories/airPods.png",
      name: "Air Pods",
    ),
    CategoriesModel(
      id: "1",
      image: "assets/images/categories/smartWatch.png",
      name: "Watches",
    ),
    // CategoriesModel(
    //   id: "1",
    //   image: "assets/images/categories/clothes.png",
    //   name: "Clothes",
    // ),
    // CategoriesModel(
    //   id: "1",
    //   image: "assets/images/categories/electronics.png",
    //   name: "Accessories",
    // ),
    CategoriesModel(
      id: "1",
      image: "assets/images/categories/tools.png",
      name: "Tools",
    ),
    CategoriesModel(
      id: "1",
      image: "assets/images/categories/drones.png",
      name: "Drones",
    ),
    CategoriesModel(
      id: "1",
      image: "assets/images/categories/sport.png",
      name: "Sports",
    ),
  ];

}

class CategoriesModel {
  final String id, image, name;

  CategoriesModel({
    required this.id,
    required this.image,
    required this.name,
  });
}