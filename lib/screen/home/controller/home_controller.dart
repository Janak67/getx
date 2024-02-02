import 'package:get/get.dart';
import 'package:getx/screen/home/model/home_model.dart';
import 'package:getx/utils/api_helper.dart';

class HomeController extends GetxController {
  RxList<HomeModel> productList = <HomeModel>[].obs;
  RxList<HomeModel> cartList = <HomeModel>[].obs;

  Future<void> getProductData() async {
    List<HomeModel>? list = await APIHelper.apiHelper.productApiCall();
    if (list != null) {
      productList.value = list;
    }
  }
}
