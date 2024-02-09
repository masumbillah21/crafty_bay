import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/home/models/carousel_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class HomeCarouselController extends GetxController {
  List<CarouselModel>? _carouselList = [];

  bool _inProgress = false;

  List<CarouselModel>? get carouselList => _carouselList;
  bool get inProgress => _inProgress;

  Future<void> getHomeCarousel() async {
    _inProgress = true;
    update();
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.listProductSlider);
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        List<CarouselModel>? carousel = <CarouselModel>[];

        res.jsonResponse['data'].forEach((v) {
          carousel.add(CarouselModel.fromJson(v));
        });

        _carouselList = carousel;
      }
    }
  }
}
