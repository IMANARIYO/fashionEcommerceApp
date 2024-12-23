import 'package:ecom_t/common/utils/environment.dart';
import 'package:ecom_t/src/categories/views/hoooks/results/categories_results.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import '../../models/categories_model.dart';

import 'package:http/http.dart' as Http;

FetchCategories fetchHomeCategories() {
  final categories = useState<List<Categories>>([]);
  final isLoading = useState(true);
  final error = useState<String?>(null);
  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('${Environment.appBaseUrl}/category/read');
      final response = await Http.get(url);
      if (response.statusCode == 200) {
        categories.value = categoriesFromJson(response.body);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return;
  },const []);
  void refetch(){
    isLoading.value = true;
    fetchData();
  }
  return FetchCategories(
    categories: categories.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
