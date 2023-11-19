import 'package:models/models.dart';

class CategoryRepo {
  Future<Category> getCategoryById(String categoryId) async {
    //this method is responsible for connecting database to retrieve category by id
    return Category.sampleData
        .firstWhere((category) => category.id == categoryId);
  }

  getCategories() async {
    //  Coonect with DB to retrieve the categories
    return Category.sampleData;
  }
}
