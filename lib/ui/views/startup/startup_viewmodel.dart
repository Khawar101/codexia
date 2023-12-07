import 'package:codexia/app/app.router.dart';
import 'package:codexia/ui/views/startup/widgets/widget1.dart';
import 'package:codexia/ui/views/startup/widgets/widget2.dart';
import 'package:codexia/ui/views/startup/widgets/widget3.dart';
import 'package:codexia/ui/views/startup/widgets/widget4.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:codexia/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
 var pageInde = 0;
  final List<Widget> pages = [
    const StartupView1(),
    const StartupView2(),
    const StartupView3(),
    const StartupView4(),
  ];
  next() {
    if (pages.length >= pageInde + 2) {
      pageInde++;
      notifyListeners();
    }
  }

   moveToSignup(){
    _navigationService.navigateToSignupView();
   }
}
