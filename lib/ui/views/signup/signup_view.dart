import 'package:codexia/ui/common/ui_helpers.dart';
import 'package:codexia/ui/widgets/customButton.dart';
import 'package:codexia/ui/widgets/customTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
   ) {
    return Scaffold(
        backgroundColor: const Color(0xfff8f8fa),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter Your Signup Detail",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  verticalSpaceSmall,
                  const Text(
                    "Lorem ipsum dolai sit amer.conset tetuer\n smple mistadishbbeh efd, sed",
                    style: TextStyle(fontSize: 16, color: Colors.black38),
                    textAlign: TextAlign.start,
                  ),
                  verticalSpaceSmall,
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        viewModel.imagePick();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/profile-placeholder.svg",
                        height: 52,
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  CustomTextFormField(
                    controller: viewModel.userNameCtrl,
                    hintText: "Enter your name",
                  ),
                  verticalSpaceSmall,
                  CustomTextFormField(
                    controller: viewModel.signUpEmailCtrl,
                    hintText: "Email Address",
                  ),
                  verticalSpaceSmall,
                  CustomTextFormField(
                    controller: viewModel.phoneCtrl,
                    hintText: "phone No",
                  ),
                  verticalSpaceSmall,
                  CustomTextFormField(
                    controller: viewModel.signUpPasswordCtrl,
                    hintText: "password",
                  ),
                  verticalSpaceSmall,
                  CustomTextFormField(
                    controller: viewModel.confirmpasswordCtrl,
                    hintText: "Enter confirm password",
                  ),
                  verticalSpaceMedium,
                  CustomTextButton(
                      buttonColor: Colors.red,
                      text: "Signup",
                      onPress: () {
                        viewModel.authenticationApi(
                          viewModel.signUpEmailCtrl.text,
                          viewModel.signUpPasswordCtrl.text,
                          viewModel.userNameCtrl.text,
                          viewModel.phoneCtrl.text.toString(),
                          viewModel.confirmpasswordCtrl.text,
                        );
                      })
                ],
              ),
            ),
          ),
        ));
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
