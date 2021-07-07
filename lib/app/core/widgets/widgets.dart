import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:relative_scale/relative_scale.dart';

TextFormField appEditTextStyle(var hintText,
    {isPassword = true,
    onSaved,
    onValidation,
    readonly = false,
    controller,
    enableLabel = true,
    maxLines = 1,
    enableBorder = true,
    keyboardType = TextInputType.text,
    textInputAction = TextInputAction.next}) {
  return TextFormField(
    maxLines: maxLines,
    style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
    obscureText: isPassword,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(16, 8, 4, 8),
      labelText: enableLabel ? hintText : null,
      hintText: hintText,
      border: enableBorder ? null : InputBorder.none,
      hintStyle: TextStyle(color: color_textColorSecondary),
    ),
    onSaved: onSaved,
    validator: onValidation,
    readOnly: readonly,
    controller: controller,
    textInputAction: textInputAction,
  );
}

Divider appDivider() {
  return Divider(
    height: 1,
    color: t8_view_color,
    thickness: 1,
  );
}

class appButton extends StatefulWidget {
  var textContent;

  //   var icon;
  VoidCallback onPressed;

  appButton({
    required this.textContent,
    required this.onPressed,
    //   @required this.icon,
  });

  @override
  appButtonState createState() => appButtonState();
}

class appButtonState extends State<appButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          decoration: boxDecoration(bgColor: color_colorPrimary, radius: 3),
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: text(widget.textContent,
                    textColor: t8_white,
                    fontFamily: fontMedium,
                    textAllCaps: false),
              ),
              // Align(
              //   alignment: Alignment.topRight,
              //   child: Container(
              //     decoration: BoxDecoration(
              //         shape: BoxShape.circle, color: color_colorPrimaryDark),
              //     width: 35,
              //     height: 35,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Icon(
              //         Icons.arrow_forward,
              //         color: t8_white,
              //         size: 20,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          )),
    );
  }
}

Widget text(
  String text, {
  var fontSize = textSizeLargeMedium,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
  bool bold = false,
}) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      fontWeight: bold ? FontWeight.bold : null,
      color: textColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

class AppTopBar extends StatefulWidget {
  var titleName;

  AppTopBar(var this.titleName);

  @override
  State<StatefulWidget> createState() {
    return AppTopBarState();
  }
}

class AppTopBarState extends State<AppTopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: t8_colorPrimary,
              onPressed: () {
                finish(context);
              },
            ),
            Center(
              child: Text(
                widget.titleName,
                maxLines: 2,
                style: TextStyle(
                    fontFamily: fontBold,
                    fontSize: 22,
                    color: t8_textColorPrimary),
              ).center(),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget>? createState() {
    return null;
  }
}

Container appHeaderText(var text) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Text(
      text,
      maxLines: 2,
      style: TextStyle(
          fontFamily: fontBold, fontSize: 22, color: t8_textColorPrimary),
    ),
  );
}

class PinEntryTextField extends StatefulWidget {
  final String lastPin;
  final int fields;
  final onSubmit;
  final fieldWidth;
  final fontSize;
  final isTextObscure;
  final showFieldAsBox;

  PinEntryTextField(
      {required this.lastPin,
      this.fields: 4,
      this.onSubmit,
      this.fieldWidth: 40.0,
      this.fontSize: 16.0,
      this.isTextObscure: false,
      this.showFieldAsBox: false})
      : assert(fields > 0);

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  late List<String>? _pin;
  late List<FocusNode>? _focusNodes;
  late List<TextEditingController>? _textControllers;

  Widget textfields = Container();

  @override
  void initState() {
    super.initState();
    _pin = (widget.fields) as List<String>?;
    _focusNodes = (widget.fields) as List<FocusNode>?;
    _textControllers = (widget.fields) as List<TextEditingController>?;

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin.length; i++) {
            _pin![i] = widget.lastPin[i];
          }
        }
        textfields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    _textControllers!.forEach((TextEditingController t) => t.dispose());
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context);
    });

    if (_pin!.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes![0]);
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    _textControllers!.forEach(
        (TextEditingController tEditController) => tEditController.clear());
    _pin!.clear();
  }

  Widget buildTextField(int i, BuildContext context) {
    if (_focusNodes![i] == null) {
      _focusNodes![i] = FocusNode();
    }
    if (_textControllers![i] == null) {
      _textControllers![i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers![i].text = widget.lastPin[i];
      }
    }

    _focusNodes![i].addListener(() {
      if (_focusNodes![i].hasFocus) {}
    });

    final String lastDigit = _textControllers![i].text;

    return Container(
      width: widget.fieldWidth,
      margin: EdgeInsets.only(right: 10.0),
      child: TextField(
        controller: _textControllers![i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(
            color: Colors.black,
            fontFamily: fontMedium,
            fontSize: widget.fontSize),
        focusNode: _focusNodes![i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(
            counterText: "",
            border: widget.showFieldAsBox
                ? OutlineInputBorder(borderSide: BorderSide(width: 2.0))
                : null),
        onChanged: (String str) {
          setState(() {
            _pin![i] = str;
          });
          if (i + 1 != widget.fields) {
            _focusNodes![i].unfocus();
            if (lastDigit != null && _pin![i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes![i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes![i + 1]);
            }
          } else {
            _focusNodes![i].unfocus();
            if (lastDigit != null && _pin![i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes![i - 1]);
            }
          }
          if (_pin!.every((String digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin!.join());
          }
        },
        onSubmitted: (String str) {
          if (_pin!.every((String digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin!.join());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textfields;
  }
}

showToast(String caption) {
  Fluttertoast.showToast(
      msg: caption,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: getColorFromHex("5362FB"),
      textColor: color_white,
      fontSize: 16.0);
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Widget appLabelViewAll(var texto) {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        text(texto,
            textColor: black, fontSize: textSizeNormal, fontFamily: fontBold),
      ],
    ),
  );
}

class appButton2 extends StatefulWidget {
  static String tag = '/dpButton';
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;
  var height = 50.0;
  var radius = 5.0;
  Color? bgColors = color_colorPrimary;
  Color? color = color_colorPrimary;

  appButton2(
      {required this.textContent,
      required this.onPressed,
      this.isStroked = false,
      this.height = 50.0,
      this.radius = 5.0,
      this.color,
      this.bgColors = color_colorPrimary});

  @override
  appButtonState2 createState() => appButtonState2();
}

class appButtonState2 extends State<appButton2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
        alignment: Alignment.center,
        child: text(widget.textContent,
            textColor: widget.isStroked ? color_textColorPrimary : color_white,
            fontSize: textSizeLargeMedium,
            isCentered: true,
            fontFamily: fontSemibold,
            textAllCaps: true),
        decoration: widget.isStroked
            ? boxDecoration(
                bgColor: Colors.transparent, color: color_colorPrimary)
            : boxDecoration(bgColor: widget.bgColors, radius: widget.radius),
      ),
    );
  }
}

class appButton3 extends StatefulWidget {
  static String tag = '/dpButton';
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;
  var height = 50.0;

  appButton3(
      {required this.textContent,
      required this.onPressed,
      this.isStroked = false,
      this.height = 50.0});

  @override
  appButton3State createState() => appButton3State();
}

class appButton3State extends State<appButton3> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
        alignment: Alignment.center,
        child: text(widget.textContent,
            textColor: widget.isStroked
                ? color_textColorPrimary
                : color_textColorSecondary,
            fontSize: textSizeLargeMedium,
            isCentered: true,
            fontFamily: fontSemibold,
            textAllCaps: false),
        decoration: widget.isStroked
            ? boxDecoration(bgColor: color_white, color: color_white)
            : boxDecoration(bgColor: color_white, radius: 5.0),
      ),
    );
  }
}


class ClippedPartsWidget extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  final double Function(Size, double) splitFunction;

  ClippedPartsWidget({
    required this.top,
    required this.bottom,
    required this.splitFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          // I'm putting unmodified top widget to back. I wont cut it.
          // Instead I'll overlay it with clipped bottom widget.
          Container(child: top),

          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: FunctionClipper(splitFunction: splitFunction),
              child: Container(child: bottom),
            ),
          ),
        ],
      ),
    );
  }
}

class FunctionClipper extends CustomClipper<Path> {
  final double Function(Size, double) splitFunction;

  FunctionClipper({required this.splitFunction}) : super();

  Path getClip(Size size) {
    final path = Path();

    // move to split line starting point
    path.moveTo(0, splitFunction(size, 0));

    // draw split line
    for (double x = 1; x <= size.width; x++) {
      path.lineTo(x, splitFunction(size, x));
    }
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);

    // close bottom part of screen
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // I'm returning fixed 'true' value here for simplicity, it's not the part of actual question
    // basically that means that clipping will be redrawn on any changes
    return true;
  }
}

class CardButton extends StatelessWidget {
  final Widget icon;
  final String description;

  const CardButton({Key? key, required this.icon, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        margin: EdgeInsets.only(left: 13, right: 13, bottom: 16, top: 16),
        padding: EdgeInsets.only(left: 16, right: 13, bottom: 16, top: 16),
        width: sx(width) > 500 ? sx(100) : sx(width / 1.8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: color_colorPrimary,
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon,
            text(description, textColor: color_white, fontSize: 15.0),
          ],
        ),
        alignment: Alignment.center,
      );
    });
  }
}
