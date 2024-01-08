import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/carousel_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class HomeCarouselController extends GetxController {
  List<CarouselModel>? _carouselList = [];
  int _currentIndex = 0;

  bool _inProgress = false;
  bool _loaded = false;

  List<CarouselModel>? get carouselList => _carouselList;
  bool get inProgress => _inProgress;
  int get currentIndex => _currentIndex;

  Future<void> getHomeCarousel() async {
    if (_loaded) {
      return;
    }
    _inProgress = true;
    update();
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.listProductSlider);
    _inProgress = false;
    _loaded = true;
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

  void getCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }
}
