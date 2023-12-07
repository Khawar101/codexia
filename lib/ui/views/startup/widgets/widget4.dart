import 'package:codexia/ui/common/ui_helpers.dart';
import 'package:codexia/ui/views/startup/startup_viewmodel.dart';
import 'package:codexia/ui/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView4 extends ViewModelWidget<StartupViewModel> {
  const StartupView4({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StartupViewModel viewModel,
  ) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(100),
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset("assets/icons/logo.png", width: 35)),
            verticalSpace(height * 0.4),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextButton(
                  buttonColor: Colors.white,
                  text: "Signup",
                  // width: 100,
                  onPress: viewModel.moveToSignup,
                  textColor: Colors.deepOrange,
                ))
          ],
        ),
      ),
    );
  }
}
