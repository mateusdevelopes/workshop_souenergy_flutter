import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workshop_souenergy_flutter/shared/models/inverter_model.dart';
import 'package:workshop_souenergy_flutter/shared/repositories/main_rest_api/inverter_repository.dart';
import 'package:workshop_souenergy_flutter/shared/services/rest_exception.dart';
import 'package:workshop_souenergy_flutter/shared/utils/snack_bars.dart';

class FeedController extends GetxController {
  final GetStorage _box = GetStorage();
  final SnackBars _snack = SnackBars();
  final _repository = InverterRepository();
  var isLoading = true.obs;
  List<InverterModel> list = [];
  ScrollController scrollController = ScrollController();
  int listLength = 10;

  @override
  void onInit() async {
    await fetchAllInverters();
    addItems();
    super.onInit();
  }

  bool checkPlatform() {
    if (Platform.isAndroid) {
      return true;
    }
    return false;
  }

  generateList() {
    list = List.generate(
        listLength, (index) => InverterModel(name: (index + 1).toString()));
  }

  addItems() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        for (int i = 0; i < 2; i++) {
          listLength++;
          list.add(InverterModel(name: (listLength).toString()));
          update(); //update GetBuilder each time
        }
      }
    });
  }

  Future<List<InverterModel>?> fetchAllInverters() async {
    try {
      var response = await _repository.fetchAllInverters("id", "desc");
      return response;
    } on RestException catch (e) {
      _snack.errorSnackbar(msg: e.message);
      print(e);
    }
  }
}
