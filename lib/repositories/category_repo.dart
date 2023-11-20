import 'package:bite_sprint/services/api_client.dart';
import 'package:models/models.dart';

class CategoryRepo {
  final ApiClient apiClient;
  CategoryRepo({required this.apiClient});

  Future<Category> getCategoryById(String categoryId) async {
    try {
      final response = await apiClient.getCategory(categoryId);
      return Category.fromJson(response);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      final response = await apiClient.getCategories();
      if (response['categories'] != null) {
        return response['categories']
            .map<Category>((json) => Category.fromJson(json))
            .toList();
      } else {
        return [];
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
