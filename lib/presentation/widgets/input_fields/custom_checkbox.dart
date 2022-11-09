import 'package:firebase_auth_demo/data/constants/colors.dart';
import 'package:flutter/material.dart';

enum CustomCheckboxType {
  basic,
  circle,
  square,
  custom,
}

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox(
      {Key? key,
      this.size = 30,
      this.type = CustomCheckboxType.basic,
      this.activeBgColor = AppColors.primaryColor,
      this.inactiveBgColor = Colors.white,
      this.activeBorderColor = Colors.white,
      this.inactiveBorderColor = Colors.black,
      required this.onChanged,
      required this.value,
      this.activeIcon = const Icon(
        Icons.check,
        size: 20,
        color: Colors.white,
      ),
      this.inactiveIcon,
      this.customBgColor = Colors.green,
      this.autofocus = false,
      this.focusNode})
      : super(key: key);

  /// type of [CustomCheckboxType] which is of four type is basic, square, circular and custom
  final CustomCheckboxType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activeBgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactiveBgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<bool>? onChanged;

  /// Used to set the current state of the checkbox
  final bool value;

  /// type of [Widget] used to change the  checkbox's active icon
  final Widget activeIcon;

  /// type of [Widget] used to change the  checkbox's inactive icon
  final Widget? inactiveIcon;

  /// type of [Color] used to change the background color of the custom active checkbox only
  final Color customBgColor;

  /// on true state this widget will be selected as the initial focus
  /// when no other node in its scope is currently focused
  final bool autofocus;

  /// an optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool get enabled => widget.onChanged != null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FocusableActionDetector(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        enabled: enabled,
        child: InkResponse(
          highlightShape: widget.type == CustomCheckboxType.circle
              ? BoxShape.circle
              : BoxShape.rectangle,
          containedInkWell: widget.type != CustomCheckboxType.circle,
          canRequestFocus: enabled,
          onTap: widget.onChanged != null
              ? () {
                  widget.onChanged!(!widget.value);
                }
              : null,
          child: Container(
            height: widget.size,
            width: widget.size,
            margin: widget.type != CustomCheckboxType.circle
                ? const EdgeInsets.all(10)
                : EdgeInsets.zero,
            decoration: BoxDecoration(
                color: enabled
                    ? widget.value
                        ? widget.type == CustomCheckboxType.custom
                            ? Colors.white
                            : widget.activeBgColor
                        : widget.inactiveBgColor
                    : Colors.grey,
                borderRadius: widget.type == CustomCheckboxType.basic
                    ? BorderRadius.circular(3)
                    : widget.type == CustomCheckboxType.circle ||
                            widget.type == CustomCheckboxType.custom
                        ? BorderRadius.circular(50)
                        : BorderRadius.zero,
                border: Border.all(
                    width: 2,
                    color: widget.value
                        ? widget.activeBorderColor
                        : widget.inactiveBorderColor)),
            child: widget.value
                ? widget.type == CustomCheckboxType.custom
                    ? Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                          ),
                          Container(
                            margin: const EdgeInsets.all(3),
                            alignment: Alignment.center,
                            width: widget.size * 0.8,
                            height: widget.size * 0.8,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.primaryColor, width: 2),
                                shape: BoxShape.circle,
                                color: widget.customBgColor),
                          )
                        ],
                      )
                    : widget.activeIcon
                : widget.inactiveIcon,
          ),
        ),
      );
}
