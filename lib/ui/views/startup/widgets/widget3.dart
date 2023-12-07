import 'package:codexia/ui/common/ui_helpers.dart';
import 'package:codexia/ui/views/startup/startup_viewmodel.dart';
import 'package:codexia/ui/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class StartupView3 extends ViewModelWidget<StartupViewModel> {
  const StartupView3({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StartupViewModel viewModel,
  ) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(20),
            Image.asset("assets/icons/logo.png", width: 35),
            verticalSpace(20),
            Center(
              child: SvgPicture.asset(
                "assets/icons/A3-Main.svg",
                height: 300,
              ),
            ),
            verticalSpace(20),
            const Text(
              "Find Your Favorite Food 3",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            verticalSpace(20),
            const Text(
              "Lorem ipsum dolai sit amer.conset tetuer\n smple mistadishbbeh efd, sed",
              style: TextStyle(fontSize: 16, color: Colors.black38),
              textAlign: TextAlign.center,
            ),
            verticalSpace(height * 0.2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 5,
                      ),
                      horizontalSpaceTiny,
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 5,
                      ),
                      horizontalSpaceTiny,
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 5,
                      ),
                    ],
                  ),
                  CustomTextButton(
                    buttonColor: Colors.red,
                    text: "Next",
                    width: 100,
                    onPress: viewModel.next,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
