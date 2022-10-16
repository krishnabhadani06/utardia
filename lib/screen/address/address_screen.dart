import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/common_loader.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/address/address_provider.dart';
import 'package:utardia/screen/address/widget/address_bottom_sheet.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorRes.appBarColor,
              leading: GestureDetector(
                child: Icon(IconRes.icBack, size: 30),
                onTap: () {
                  navigator.currentState!.pop(context);
                },
              ),
              centerTitle: true,
              title:
                  const Text(Strings.myAddress, style: TextStyle(fontSize: 22)),
              actions: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      provider.init(isAdd: true);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)),
                        ),
                        builder: (BuildContext context) =>
                            const AddressBottomSheet(),
                      );
                    },
                    child: Icon(
                      IconRes.icPlus,
                      size: 45,
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceWidth / 45,
                ),
              ],
            ),
            body: provider.userAddress != null
                ? provider.userAddress != null &&
                        provider.loader == false &&
                        provider.userAddress!.data!.isNotEmpty
                    ? ListView.builder(
                        itemCount: provider.userAddress!.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 23.0, left: 8.0, right: 8.0),
                            child: Container(
                              height: deviceHeight * 0.08,
                              width: deviceWidth / 1,
                              decoration: BoxDecoration(
                                color: ColorRes.white,
                                border: Border.all(
                                  color: ColorRes.lightGrey,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorRes.black.withOpacity(0.3),
                                    //color of shadow
                                    spreadRadius: 0, //spread radius
                                    blurRadius: 3, // blur radius
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: deviceWidth * 0.02),
                                      Icon(
                                        provider.getIcon(provider.userAddress!
                                            .data![index].workType),
                                        color: ColorRes.grey,
                                        size: 35,
                                      ),
                                      SizedBox(width: deviceWidth * 0.04),
                                      SizedBox(
                                        width: deviceWidth * 0.66,
                                        // color: Colors.blue,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${provider.userAddress!.data![index].workType}",
                                              style: natoMediumTextStyle(
                                                  fontSize: 16,
                                                  color: ColorRes.black),
                                            ),
                                            Text(
                                              '${provider.userAddress!.data![index].address}',
                                              style: natoRegularTextStyle(
                                                  fontSize: 12,
                                                  color: ColorRes.grey),
                                              textAlign: TextAlign.justify,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Icon(valueItem.bank_logo),

                                  GestureDetector(
                                    onTap: () {
                                      provider.init(
                                          workType: provider.userAddress!
                                              .data![index].workType
                                              .toString(),
                                          isAdd: false,
                                          city_id:
                                              "${provider.userAddress!.data![index].cityId}",
                                          state_id:
                                              "${provider.userAddress!.data![index].stateId}",
                                          data: provider
                                              .userAddress!.data![index]);

                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        // constraints: BoxConstraints(minHeight: deviceHeight/4),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(32.0),
                                              topRight: Radius.circular(32.0)),
                                        ),

                                        builder: (context) =>
                                            provider.onTapEditAddress(provider
                                                .userAddress!.data![index]),
                                      );
                                    },
                                    child: Flexible(
                                      flex: 2,
                                      child: Icon(
                                        IconRes.icNext,
                                        size: 45,
                                        color: ColorRes.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : (provider.userAddress == null &&
                                provider.loader == false &&
                                provider.userAddress!.data!.isEmpty) ||
                            (provider.userAddress != null &&
                                provider.loader == false &&
                                provider.userAddress!.data!.isEmpty)
                        ? Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.17),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 77.0, right: 76.18),
                                child:
                                    Image.asset(AssetsImagesRes.noAddressImage),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                              Text(
                                Strings.noSavedAddress,
                                style: natoBoldTextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Text(
                                Strings.saveYourAddress,
                                style: natoMediumTextStyle(fontSize: 16),
                              ),
                              Text(
                                Strings.useItAll,
                                style: natoMediumTextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        : commonLoader()
                : commonLoader()));
  }
}
