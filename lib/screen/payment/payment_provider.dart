// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/CartList_model/cartSummaryModel.dart';
import 'package:utardia/model/adddressListMdoel/addressModel.dart';
import 'package:utardia/model/coupenModel/CartBaseCoupenModel.dart';
import 'package:utardia/model/payment_model/pamentModel.dart';
import 'package:utardia/model/payment_model/payment_drop_down.dart';
import 'package:utardia/model/shipping_addrss_model/Shipping_address_model.dart';
import 'package:utardia/screen/authorization/registration/Bottomsheet/terms_bottom_sheet.dart';
import 'package:utardia/screen/dashboard/cart/cart_provider.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/screen/payment/PaymentProcessScreen.dart';
import 'package:utardia/screen/payment/PaymentStatusScreen.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';
import 'package:utardia/util/string.dart';

class PaymentProvider extends ChangeNotifier {
  late AddressListDataModel addressListChoice;
  late CartListModel cartListChoice;
  late CampaingListModel campaingListChoice = campaingDataList[0];

  List<PaymentModel>? paymentTypeList;
  PaymentModel? currentPayment;

  //Coupen Codes
  List<CartBaseCoupenModel>? coupenList;
  CartBaseCoupenModel? currentCoupen;
  //address model
  List<addressModel>? addressList;
  addressModel? currentAddress;
  CartSummaryModel? cartSummary;
  bool loader = false;
  ShipingAddressModel? shippingAddress;
  // AddressListDataModel _addressListChoice = addressDataList[0];

  void onDropDownItemSelected(addressModel newSelectedBank) {
    currentAddress = newSelectedBank;
    notifyListeners();
  }

  void onDropDownCartSelected(PaymentModel newSelectedCart) {
    currentPayment = newSelectedCart;
    notifyListeners();
  }

  void onDropDownCampaingSelected(
      CartBaseCoupenModel newSelectedCampaing, BuildContext context) {
    applyCoupenCode(context, newSelectedCampaing);
    currentCoupen = newSelectedCampaing;
    notifyListeners();
  }

  Widget onTapTerms(BuildContext context, String title, String subText) {
    return TermsBottomSheet(title, subText);
  }

  void onTapPlaceOrder(BuildContext context) {
    UpdateAddress().then((value) {
      placeOrder(context).then((value) {
        if (value != "") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PaymentProcessScreen(
                        id: value.toString(),
                        amount: cartSummary!.grandTotalValue.toString(),
                      ))).whenComplete(() => init(context));
        }
      });
    });
  }

  void init(BuildContext context) {
    getPaymentList();
    getShipppingAddress();
    getCartSummary();
    getCoupen(context);
  }

  void getPaymentList() async {
    loader = true;
    notifyListeners();
    try {
      http.Response? res =
          await HttpService.getApi(url: ApiEndPoint.getPayment, header: {
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
      });

      if (res != null && res.statusCode == 200) {
        List<dynamic> paymentRawList = jsonDecode(res.body) as List<dynamic>;
        paymentTypeList = paymentRawList.map((e) {
          return PaymentModel.fromJson(e);
        }).toList();
        if (paymentTypeList != null) {
          paymentTypeList!.forEach((element) {
            if (element.paymentType == "paystack") {
              currentPayment = element;
              return;
            }
          });
        }
      } else {
        showToast("went Wrong !! ${res!.statusCode}");
      }
      loader = false;
      notifyListeners();
    } on RangeError catch (e) {
      print(e.toString());
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
      loader = false;
      notifyListeners();
    } finally {
      loader = false;
      notifyListeners();
    }
  }

  void getShipppingAddress() async {
    try {
      http.Response? res = await HttpService.getApi(
          url:
              "${ApiEndPoint.getAddress}${PrefService.getString(PrefKeys.uid)}",
          header: {
            "Authorization":
                "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
          });

      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> data =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        List<dynamic> addressRawList = data['data'] as List<dynamic>;

        addressList = addressRawList.map((e) {
          return addressModel.fromJson(e);
        }).toList();
        if (addressList!.isNotEmpty) {
          currentAddress = addressList![0];
        }
      } else {
        showToast("went Wrong !! ${res!.statusCode}");
      }
      notifyListeners();
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  IconData? getIcon(String string) {
    if (string == Strings.work) {
      return Icons.business_center_sharp;
    } else if (string == Strings.home) {
      return Icons.home;
    } else {
      return Icons.location_on;
    }
  }

  void getCartSummary() async {
    try {
      http.Response? res = await HttpService.getApi(
          url:
              "${ApiEndPoint.cartSummary}${PrefService.getString(PrefKeys.uid)}",
          header: {
            "Authorization":
                "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
          });
      if (res != null && res.statusCode == 200) {
        cartSummary = CartSummaryModel.fromJson(jsonDecode(res.body));
        if (cartSummary != null) {
          notifyListeners();
        }
      } else {
        showToast("went Wrong !! ${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void getCoupen(BuildContext context) async {
    try {
      http.Response? res =
          await HttpService.getApi(url: ApiEndPoint.getcampign, header: {
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
      });
      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> data =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        List<dynamic> rawCoupenList = data['data'] as List<dynamic>;
        List<dynamic> rawVartBaseCoupenlist = rawCoupenList
            .where((element) => element['type'] == "cart_base")
            .toList();
        if (rawVartBaseCoupenlist.isNotEmpty) {
          coupenList = rawVartBaseCoupenlist
              .map((e) => CartBaseCoupenModel.fromJson(e))
              .toList();
          if (coupenList!.isNotEmpty) {
            currentCoupen = coupenList![0];
            if (currentCoupen != null) {
              applyCoupenCode(context, currentCoupen!);
            }

            notifyListeners();
          }
        } else {
          showToast("No coupen Code");
        }
      } else {
        showToast("went Wrong !! ${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  Future<String> placeOrder(BuildContext context) async {
    try {
      http.Response? res =
          await HttpService.postApi(url: ApiEndPoint.plaeOrder, header: {
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
      }, body: {
        "owner_id": Provider.of<CartProvider>(context, listen: false)
            .cartListDataModel
            .ownerId
            .toString(),
        "user_id": PrefService.getString(PrefKeys.uid),
        "payment_type": "paystack"
      });

      if (res != null && res.statusCode == 200) {
        Logger().e(jsonDecode(res.body));
        showToast(jsonDecode(res.body)['message']);
        if (jsonDecode(res.body)['result'] == true) {
          return jsonDecode(res.body)['combined_order_id'].toString();
        } else {
          return "";
        }
      } else {
        showToast(res!.statusCode.toString());
        return "";
      }
    } catch (e) {
      kDebugMode ? Logger().e(e.toString()) : "";
      showToast(e.toString());
      return "";
    } finally {}
  }

  void applyCoupenCode(BuildContext context, CartBaseCoupenModel coupen) async {
    try {
      Map<String, dynamic> param = {
        "user_id": PrefService.getString(PrefKeys.uid),
        "owner_id": Provider.of<CartProvider>(context, listen: false)
            .cartListDataModel
            .ownerId
            .toString(),
        "coupon_code": "${coupen.code}"
      };
      http.Response? res = await HttpService.postApi(
          url: ApiEndPoint.applyCoupen,
          header: {
            "Authorization":
                "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
          },
          body: param);
      Logger().e(jsonDecode(res!.body));
      if (res.statusCode == 200) {
        if (jsonDecode(res.body)['result'] == true) {
          getCartSummary();
        }
        showToast(jsonDecode(res.body)['message']);
      } else {
        showToast("error code from coupen apply ${res.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  Future<void> UpdateAddress() async {
    try {
      http.Response? res = await HttpService.postApi(
          url: ApiEndPoint.updateAddressInCart,
          header: {
            "Authorization":
                "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
          },
          body: {
            "user_id": PrefService.getString(PrefKeys.uid),
            "address_id": "${currentAddress!.id}"
          });

      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> data =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        Logger().e(data);
      } else {
        showToast(
            "Error code from update address in cart code:-${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void callPaymentResponse(BuildContext context, String id) async {
    try {
      http.Response? res =
          await HttpService.postApi(url: ApiEndPoint.paymentResponse, header: {
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
      }, body: {
        "combined_order_id": id,
        "status": "success",
        "payment_type": "cart_payment"
      });
      if (res != null && res.statusCode == 200) {
        Logger().e(jsonDecode(res.body));
        if (jsonDecode(res.body)['result']) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => PaymentStatusScreen(
                        isSuccess: 0,
                        orderId: id,
                      )),
              (Route<dynamic> route) => false);
        }
      } else {
        showToast("${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void onTapTrackOrder(String orderid, BuildContext con) {
    Provider.of<OrderProvider>(con, listen: false).getOrders().then((value) {
      navigator.currentState!.pop();
      Provider.of<OrderProvider>(con, listen: false).onTapNext(con, 0);
    });
  }
}
