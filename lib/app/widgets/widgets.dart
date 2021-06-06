import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';

TextFormField appEditTextStyle(var hintText,
    {isPassword = true, onSaved, onValidation, readonly = false, controller}) {
  return TextFormField(
    style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
    obscureText: isPassword,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
      hintText: hintText,
      border: InputBorder.none,
      hintStyle: TextStyle(color: color_textColorSecondary),
    ),
    onSaved: onSaved,
    validator: onValidation,
    readOnly: readonly,
    controller: controller,
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
          decoration: boxDecoration(bgColor: color_colorPrimary, radius: 16),
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
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: color_colorPrimaryDark),
                  width: 35,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: t8_white,
                      size: 20,
                    ),
                  ),
                ),
              ),
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
}) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
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
            textColor: color_colorPrimaryDark,
            fontSize: textSizeNormal,
            fontFamily: fontBold),

        // Text(text, style: TextStyle(fontSize: 18, color: color_colorPrimaryDark, fontFamily: fontMedium)),
        Text("ver tudo",
            style: TextStyle(fontSize: 14, color: color_textColorSecondary)),
      ],
    ),
  );
}
