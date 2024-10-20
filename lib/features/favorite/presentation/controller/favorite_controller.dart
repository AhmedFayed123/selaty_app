import 'package:get/get.dart';

import '../../../../services/auth_service.dart';
import '../../model/favorite_model.dart';


class FavoriteController extends GetxController {
  var isLoading = true.obs;
  var favoriteList = <FavoriteProduct>[].obs;

  final FavoriteService favoriteService = FavoriteService();

  @override
  void onReady() {
    fetchFavorites();
    super.onReady();
  }
  void fetchFavorites() async {
    try {
      isLoading(true);
      var favorites = await favoriteService.fetchFavorites();
      favoriteList.assignAll(favorites);
    } catch (e) {
      print("Error fetching favorites: $e");
    } finally {
      isLoading(false);
    }
  }
}
