import 'package:flutter/material.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

import '../../util/icon_res.dart';

class AddressListDataModel {
  String title;
  String address;
  IconData addressIcon;

  AddressListDataModel(this.title, this.address, this.addressIcon);
}

List<AddressListDataModel> addressDataList = [
  AddressListDataModel(
      'Home', '112,dhara Arced,mta varachha,surat', IconRes.ichome1),
  AddressListDataModel(
      "Office", '121, dhara arced , mota varchha,surat', IconRes.ichome1),
  AddressListDataModel('Home1', 'abc circle,mota varchha,surat', Icons.work),
];

class CartListModel {
  String cartIcon;
  String cartType;
  String cartNumber;
  CartListModel(this.cartIcon, this.cartType, this.cartNumber);
}

List<CartListModel> cartDataList = [
  CartListModel(
    AssetsImagesRes.ruPayImg,
    Strings.ruPay,
    '1234544545485',
  ),
  CartListModel(AssetsImagesRes.masterImg, Strings.master, '5645464186163'),
  CartListModel(AssetsImagesRes.visaImg, Strings.visaCart, '78468464446456918'),
];

class CampaingListModel {
  String campaingIcon;
  String campaingType;
  CampaingListModel(this.campaingIcon, this.campaingType);
}

List<CampaingListModel> campaingDataList = [
  CampaingListModel(AssetsImagesRes.campaingImg, Strings.freeDelivery),
  CampaingListModel(AssetsImagesRes.campaingImg, Strings.freeDelivery),
  CampaingListModel(AssetsImagesRes.campaingImg, 'ByOneGetOne Free'),
];
