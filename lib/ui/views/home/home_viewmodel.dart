import 'dart:developer';
import 'package:codexia/app/app.locator.dart';
import 'package:codexia/services/model/hotelModel.dart';
import 'package:codexia/services/sigup_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _newTaskService = locator<SigupService>();
  String? get userName => _newTaskService.authdata!.user!.name;
  String? get userImage => _newTaskService.authdata!.user!.photo;
  var oncheck = 0;

  onset(value) {
    oncheck = value;
    notifyListeners();
  }

  List<HotelData>? hotelData;

  hotelDataGet() async {
    setBusy(true);
    try {
      hotelData = await _newTaskService.hotelDataGet();
      notifyListeners();
      log(hotelData.toString());
    } catch (e) {
      log(e.toString());
    }
    setBusy(false);
  }
}
