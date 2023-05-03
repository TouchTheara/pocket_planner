import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

onShowBottomSheet(
    {@required BuildContext? context,
    String? title,
    String? type,
    String? label,
    String? time,
    num? amount,
    Function? onDismissed,
    bool? isAmountFormat = false,
    String? amountFormat,
    Widget? child,
    IconData? icondata,
    Widget? icon,
    Widget? text,
    String? pointAmount,
    bool? isscroll = false,
    double? isHeight,
    double? borderRaduis,
    bool? isLoading = false,
    Color? backgroundColor,
    bool? isNoAppBar = false,
    bool? isDismissible}) {
  showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: backgroundColor,
    isDismissible: isDismissible ?? true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10))),
    context: context!,
    isScrollControlled: true,
    builder: (context) {
      return isLoading!
          ? FractionallySizedBox(
              heightFactor: 20,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: isHeight != null
                    ? MediaQuery.of(context).size.height * 0.9
                    : isHeight,
                child: SingleChildScrollView(
                  physics: isscroll!
                      ? const ScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(borderRaduis ?? 10),
                            color: Colors.grey[300]),
                      ),
                      Row(
                        children: [
                          icondata != null
                              ? IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(icondata))
                              : icon ??
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: kIsWeb
                                          ? const Icon(Icons.arrow_back)
                                          : Platform.isAndroid
                                              ? const Icon(Icons.arrow_back)
                                              : const Icon(
                                                  Icons.arrow_back_ios),
                                    ),
                                  ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: text ??
                                Text(
                                  title ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(fontSize: 18),
                                ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      Divider(
                        thickness: 1.2,
                        color: Colors.grey[300],
                      ),
                      SingleChildScrollView(
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: const SizedBox(
                              height: 150,
                              width: 150,
                              child: Padding(
                                padding: EdgeInsets.all(50.0),
                                child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator()),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ))
          : FractionallySizedBox(
              // heightFactor: 20,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: isHeight != null
                    ? MediaQuery.of(context).size.height * 0.7
                    : null,
                child: SingleChildScrollView(
                  physics: isscroll!
                      ? const ScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!isNoAppBar!)
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(borderRaduis ?? 10),
                              color: Colors.grey[300]),
                        ),
                      if (label != null)
                        const SizedBox(
                          height: 10.0,
                        ),
                      // if (!isNoAppBar)
                      //   label != null
                      // ? CustomHeaderBottomStyle(
                      //     isAmountFormat: isAmountFormat,
                      //     amountFormat: amountFormat,
                      //     type: type,
                      //     label: label,
                      //     time: time,
                      //     amount: amount,
                      //     pointAmount: pointAmount,
                      //   )
                      // : Row(
                      //     children: [
                      //       icondata != null
                      //           ? IconButton(
                      //               onPressed: () {
                      //                 Navigator.pop(context);
                      //               },
                      //               icon: Icon(icondata))
                      //           : icon ??
                      //               Padding(
                      //                 padding:
                      //                     const EdgeInsets.only(left: 10),
                      //                 child: IconButton(
                      //                   onPressed: () {
                      //                     Navigator.pop(context);
                      //                   },
                      //                   icon: kIsWeb
                      //                       ? const Icon(Icons.arrow_back)
                      //                       : Platform.isAndroid
                      //                           ? const Icon(
                      //                               Icons.arrow_back)
                      //                           : const Icon(
                      //                               Icons.arrow_back_ios),
                      //                 ),
                      //               ),
                      //       const Spacer(),
                      //       Padding(
                      //         padding: const EdgeInsets.only(right: 50),
                      //         child: text ??
                      //             Text(
                      //               title ?? '',
                      //               style: Theme.of(context)
                      //                   .textTheme
                      //                   .displayMedium!
                      //                   .copyWith(fontSize: 18),
                      //             ),
                      //       ),
                      //       const Spacer(),
                      //     ],
                      //   ),
                      if (!isNoAppBar)
                        Divider(
                          thickness: 1.2,
                          color: Colors.grey[300],
                        ),
                      SingleChildScrollView(
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: child!),
                      ),
                    ],
                  ),
                ),
              ),
            );
    },
  ).then((value) => onDismissed!(value));
}
