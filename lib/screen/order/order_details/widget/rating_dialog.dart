import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/util/color_res.dart';

class Rating_dialog extends StatelessWidget {
  String pid, uid;
  Rating_dialog({super.key, required this.uid, required this.pid});

  @override
  Widget build(BuildContext context) {
    OrderProvider provider = Provider.of<OrderProvider>(context, listen: false);
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          const Text(
            "Rate Your Experience",
            style: TextStyle(
                color: ColorRes.black,
                fontWeight: FontWeight.w700,
                fontSize: 20.0),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text("It will help us serve better, next time.",
              style: TextStyle(color: ColorRes.grey, fontSize: 11.0)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          RatingBar(
            //  initialRating: 3,
            ratingWidget: RatingWidget(
              full: const Icon(
                Icons.star_rounded,
                color: Colors.amber,
              ),
              half: const Icon(
                Icons.star_border_rounded,
                color: Colors.amber,
              ),
              empty: const Icon(
                Icons.star_border_rounded,
                color: Colors.amber,
              ),
            ),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            glow: false,
            unratedColor: Colors.amber,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),

            onRatingUpdate: (rating) {
              Provider.of<OrderProvider>(context, listen: false).Rating =
                  rating;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Your comment",
                    style: TextStyle(color: ColorRes.grey, fontSize: 11.0)),
                TextField(
                  controller: provider.txtConComment,
                  decoration: const InputDecoration(
                    // Enabled Border
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorRes.grey),
                    ),
                    // Focused Border
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorRes.grey, width: 1),
                    ),
                    // Error Border
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorRes.grey, width: 1),
                    ),
                    // Focused Error Border
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorRes.grey, width: 1),
                    ),
                  ),
                ),
                Text(
                  provider.errorTxtComment == null
                      ? ""
                      : provider.errorTxtComment!.toString(),
                  style: const TextStyle(color: ColorRes.red, fontSize: 11.0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Provider.of<OrderProvider>(context, listen: false)
                                  .pushRate(
                                pid,
                                uid,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorRes.blue),
                            child: const Text("Rate")),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
