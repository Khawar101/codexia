import 'package:codexia/ui/widgets/customButton.dart';
import 'package:codexia/ui/widgets/customTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:codexia/ui/common/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8fa),
      body: SingleChildScrollView(
        child: viewModel.isBusy
            ? const CircularProgressIndicator()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Hello",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              viewModel.userName.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 18,
                          backgroundImage:
                              NetworkImage(viewModel.userImage.toString()),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    CustomTextFormField(
                      hintText: "search field",
                      prefix: const Icon(Icons.search),
                    ),
                    verticalSpaceSmall,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Deiray Beach, FL",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.map_outlined,
                        )
                      ],
                    ),
                    verticalSpaceSmall,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/mac-logo.svg",
                              height: 60,
                            ),
                            horizontalSpaceSmall,
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mcdonald's",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Text(
                                  "Burger-fries-chicken",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                Text(
                                  "\$12.99",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Resturent",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "view All",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    verticalSpaceMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextButton(
                          buttonColor: viewModel.oncheck == 0
                              ? Colors.red
                              : Colors.white,
                          text: "cafe",
                          height: 30,
                          width: 70,
                          textColor: viewModel.oncheck == 0
                              ? Colors.white
                              : Colors.black,
                          onPress: () {
                            viewModel.onset(0);
                          },
                        ),
                        CustomTextButton(
                          buttonColor: viewModel.oncheck == 1
                              ? Colors.red
                              : Colors.white,
                          text: "Bakery",
                          height: 30,
                          width: 70,
                          textColor: viewModel.oncheck == 1
                              ? Colors.white
                              : Colors.black,
                          onPress: () {
                            viewModel.onset(1);
                          },
                        ),
                        CustomTextButton(
                          buttonColor: viewModel.oncheck == 2
                              ? Colors.red
                              : Colors.white,
                          text: "Italian",
                          height: 30,
                          width: 70,
                          textColor: viewModel.oncheck == 2
                              ? Colors.white
                              : Colors.black,
                          onPress: () {
                            viewModel.onset(2);
                          },
                        ),
                        CustomTextButton(
                          buttonColor: viewModel.oncheck == 3
                              ? Colors.red
                              : Colors.white,
                          text: "Chinese",
                          height: 30,
                          width: 70,
                          textColor: viewModel.oncheck == 3
                              ? Colors.white
                              : Colors.black,
                          onPress: () {
                            viewModel.onset(3);
                          },
                        ),
                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.hotelData![0].restaurants!.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisExtent: 200,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              height: 190,
                              // width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: SvgPicture.network(
                                        viewModel.hotelData![0]
                                            .restaurants![index].coverImage
                                            .toString(),
                                        fit: BoxFit.cover,
                                        height: 250,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  verticalSpaceTiny,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          viewModel.hotelData![0]
                                              .restaurants![index].name
                                              .toString(),
                                          // "Resturnet Name",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        verticalSpace(5),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: Colors.red,
                                              size: 12,
                                            ),
                                            horizontalSpaceTiny,
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.36,
                                              child: Text(
                                                viewModel.hotelData![0]
                                                    .restaurants![index].address
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black45),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        verticalSpace(5),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 12,
                                            ),
                                            horizontalSpaceTiny,
                                            Text(
                                              viewModel.hotelData![0]
                                                  .restaurants![index].rating
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black45),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        verticalSpace(15),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    verticalSpaceSmall,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Favourite Resturent",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "view All",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          // viewModel .hotelData![0].popularRestaurants!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                color: Colors.transparent,
                                width: 150,
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 300,
                                      // width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            width: double.infinity,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: SvgPicture.network(
                                                viewModel
                                                    .hotelData![0]
                                                    .popularRestaurants![index]
                                                    .coverImage
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                height: 250,
                                                width: double.infinity,
                                              ),
                                            ),
                                          ),
                                          verticalSpaceTiny,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  viewModel
                                                      .hotelData![0]
                                                      .popularRestaurants![
                                                          index]
                                                      .name
                                                      .toString(),
                                                  // "Resturnet Name",
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                verticalSpace(5),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on,
                                                      color: Colors.red,
                                                      size: 12,
                                                    ),
                                                    horizontalSpaceTiny,
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                      child: Text(
                                                        viewModel
                                                            .hotelData![0]
                                                            .popularRestaurants![
                                                                index]
                                                            .address
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color:
                                                                Colors.black45),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                verticalSpace(5),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                      size: 12,
                                                    ),
                                                    horizontalSpaceTiny,
                                                    Text(
                                                      viewModel
                                                          .hotelData![0]
                                                          .popularRestaurants![
                                                              index]
                                                          .rating
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Colors.black45),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                verticalSpace(15),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.hotelDataGet();
    super.onViewModelReady(viewModel);
  }
}
