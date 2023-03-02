// ignore_for_file: unused_element, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef SelectedMapper<String> = String Function(String item);

class CustomDropDown extends StatefulWidget {
  final String? initialText;
  final String? hintText;
  final String? labelText;
  final String? titleOfDDBtn;
  final bool? isShowHintText;

  final String Function(dynamic)? selectedmapper;
  final List<dynamic>? dataSource;
  final bool? dropdownMini;
  final bool? isHasLabelText;
  final bool? isDateTimePicker;
  final bool? readOnly;
  final bool? isPopUpMenu;
  bool? isTabDropdown;

  final Function(dynamic)? ontapPopUp;
  final GestureTapCallback? ontap;

  final List<dynamic>? listPopUp;
  final String? itemSelection;

  ///This will generate number
  final int? itemCount;
  final Widget Function(BuildContext context, int index, dynamic model)?
      itembuilder;
  final void Function(int index, dynamic itemModel)? onChange;

  CustomDropDown({
    Key? key,
    this.ontapPopUp,
    this.ontap,
    this.isTabDropdown = false,
    this.itemSelection,
    this.listPopUp = const [],
    this.initialText,
    this.dropdownMini = false,
    this.isDateTimePicker = false,
    this.readOnly = false,
    this.dataSource,
    this.itembuilder,
    this.itemCount,
    this.isShowHintText = false,
    this.isPopUpMenu = false,
    this.onChange,
    this.hintText,
    this.selectedmapper,
    this.labelText,
    this.isHasLabelText = false,
    this.titleOfDDBtn,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String selectedText = '';
  bool showHintText = false;
  int? keyDropdown = 0;

  Widget _hintText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.grey[100],
      child: Text(
        "${widget.hintText}",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  void _handdleSelection(BuildContext? context, String text, int index,
      {bool pop = true}) {
    widget.onChange != null ? widget.onChange!(index, text) : null;
    selectedText = widget.selectedmapper != null
        ? widget.selectedmapper!(widget.dataSource![index])
        : '';
    setState(() {});
    pop ? Navigator.pop(context!) : null;
  }

  void _handdlehintText() {
    if (selectedText.isNotEmpty) {
      showHintText = false;
    } else {
      showHintText = true;
    }
    setState(() {});
  }

  // Widget _dateTimerPicker() {
  //   return CupertinoDatePicker(
  //     dateOrder: DatePickerDateOrder.dmy,
  //     onDateTimeChanged: (value) {
  //       debugPrint('Value = $value');
  //       selectedText = value.toString();
  //       _handdleSelection(context, '$value', 1, pop: false);
  //       _handdlehintText();
  //     },
  //   );
  // }

  @override
  void initState() {
    selectedText = widget.initialText ?? '';
    _handdlehintText();
    super.initState();
  }

  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController();

  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return widget.isPopUpMenu == true
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: tapped == true ? Colors.white : Colors.black26),
            ),
            height: Get.height * 0.072,
            child: PopupMenuButton<dynamic>(
              onSelected: (value) {
                tapped = false;
                setState(() {});
              },
              onCanceled: () {
                tapped = false;
                setState(() {});
              },
              enabled: !widget.readOnly!,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              padding: const EdgeInsets.all(10),

              color: const Color(0xFFEDEDED),
              offset: const Offset(10, 60), // SET THE (X,Y) POSITION
              iconSize: 30,
              itemBuilder: (_) {
                tapped = true;
                setState(() {});
                return [
                  for (int i = 0; i < widget.listPopUp!.length; i++) ...[
                    PopupMenuItem(
                      height: Get.height * 0.04,
                      onTap: () {
                        widget.ontapPopUp?.call(i);
                      },
                      value: widget.listPopUp,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 0, top: 0, right: Get.width * 0.3),
                        child: Text(
                          widget.listPopUp![i].toString().toLowerCase().tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000),
                                  fontSize: 17),
                        ),
                      ),
                    ),
                    if (i < widget.listPopUp!.length - 1)
                      const PopupMenuDivider(
                        height: 1,
                      ),
                  ],
                ];
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.isHasLabelText == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${widget.labelText}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff333333)),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${widget.hintText}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: widget.isShowHintText ?? false
                                        ? 14
                                        : 10,
                                    fontWeight: widget.isShowHintText ?? false
                                        ? FontWeight.w500
                                        : FontWeight.w400,
                                    color: widget.isShowHintText ?? false
                                        ? const Color(0xff010D10)
                                        : const Color(0xffC2C2C2),
                                  ),
                            )
                          ],
                        )
                      : Text(
                          '${widget.labelText}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff010D10)),
                        ),
                  // SvgPicture.asset(
                  //   "assets/images/Polygon 2.svg",
                  //   height: 8,
                  // )
                  Image.asset(
                    "assets/images/arrow drop_down.png",
                    height: 24,
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              debugPrint('HELLLOBRooos1');
              tapped = true;
              if (widget.readOnly != true) {
                var defaultContext = context;
                debugPrint('HELLLOBRooo');
                showCupertinoModalPopup(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => ClipRRect(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                            ),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(""),
                                GestureDetector(
                                  onTap: () {
                                    tapped = false;
                                    widget.ontapPopUp!(keyDropdown);
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "done_label".tr,
                                      style: Theme.of(defaultContext)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              fontSize: 18,
                                              color: const Color(0xff3080DC),
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListWheelScrollView.useDelegate(
                              useMagnifier: true,
                              controller: _scrollController,
                              itemExtent: 35,
                              physics: const FixedExtentScrollPhysics(),
                              overAndUnderCenterOpacity: 0.3,
                              perspective: 0.009,
                              diameterRatio: 6,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  keyDropdown = index;
                                });
                              },
                              childDelegate: ListWheelChildLoopingListDelegate(
                                  children: widget.listPopUp!
                                      .asMap()
                                      .entries
                                      .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey[100]!
                                                    .withOpacity(0.6),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            child: Text(
                                              "${e.value}",
                                              style: Theme.of(defaultContext)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xff3C3C43)
                                                            .withOpacity(0.8),
                                                  ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: Get.height * 0.072,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: tapped == true ? Colors.white : Colors.black26),
                  ),
                  alignment: Alignment.centerLeft,
                  child: widget.isHasLabelText == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${widget.labelText}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: const Color(0xff333333),
                                        fontFamily: 'inter_regular',
                                      ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "${widget.hintText}",
                                  // showHintText ? widget.hintText ?? '' : selectedText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight:
                                            widget.isShowHintText ?? false
                                                ? FontWeight.w500
                                                : FontWeight.w400,
                                        color: widget.isShowHintText ?? false
                                            ? Colors.black
                                            : widget.readOnly == true
                                                ? Colors.black
                                                : const Color(0xffC2C2C2),
                                        fontFamily: 'inter_regular',
                                      ),
                                ),
                              ],
                            ),
                            Center(
                              child: Image.asset(
                                "assets/images/arrow drop_down.png",
                                height: 24,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.labelText}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: widget.isShowHintText == true
                                        ? FontWeight.w500
                                        : FontWeight.w400,
                                    color: const Color(0xff010D10),
                                    fontFamily: 'inter_regular',
                                  ),
                            ),
                            Image.asset(
                              "assets/images/arrow drop_down.png",
                              height: 24,
                            ),
                          ],
                        ),
                ),
                !showHintText
                    ? Positioned(left: 30, top: -8, child: _hintText())
                    : const SizedBox.shrink()
              ],
            ),
          );
  }
}
