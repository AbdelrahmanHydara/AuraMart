import 'package:shopx/core/entity/products_entity.dart';

ProductsEntity getDummyProduct() {
  return ProductsEntity(
    description: 'This is a dummy product for testing purposes.',
    price: 294545,
    code: '1',
    name: 'Smart Watch',
    reviews: [],
    discount: 20,
    oldPrice: 12,
    quantity: 8,
    imageUrl: null,
    categoryId: '',
    category: '',
  );
}

List<ProductsEntity> getDummyProductsList(int count) {
  return List.generate(count, (index) => getDummyProduct());
}