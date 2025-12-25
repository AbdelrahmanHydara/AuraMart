import 'package:shopx/core/entity/products_entity.dart';

ProductsEntity getDummyProduct() {
  return ProductsEntity(
    description: 'This is a dummy product for testing purposes.',
    price: 294545,
    code: '1',
    name: 'Smart Watch',
    reviews: [],
    discount: 0,
    oldPrice: 0,
    quantity: 0,
    imageUrl: null,
    categoryId: '',
  );
}

List<ProductsEntity> getDummyProductsList(int count) {
  return List.generate(count, (index) => getDummyProduct());
}