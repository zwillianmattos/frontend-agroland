import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/env/variables.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/modules/main/bottom_navigator_store.dart';
import 'package:plant_care/app/modules/main/submodules/education/videos/models/video_model.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:universal_io/io.dart' as IO;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'percent_indicator.dart';

Widget logoTitle(context) {
  return Image.asset(
    'images/logo.png',
    width: MediaQuery.of(context).size.width * 0.3,
    height: 53,
  );
}

TextFormField appEditTextStyle(var hintText,
    {isPassword = true,
    onSaved,
    onValidation,
    readonly = false,
    controller,
    enableLabel = true,
    maxLines = 1,
    enableBorder = true,
    initialValue = '',
    keyboardType = TextInputType.text,
    textInputAction = TextInputAction.next}) {
  return TextFormField(
    initialValue: initialValue,
    maxLines: maxLines,
    style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
    obscureText: isPassword,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(16, 8, 4, 8),
      labelText: enableLabel ? hintText : null,
      hintText: hintText,
      border: enableBorder
          ? new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal))
          : InputBorder.none,
      hintStyle: TextStyle(color: color_textColorSecondary),
    ),
    onSaved: onSaved,
    validator: onValidation,
    readOnly: readonly,
    controller: controller,
    textInputAction: textInputAction,
    keyboardType: keyboardType,
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

  IconData? icon;
  VoidCallback onPressed;

  appButton({
    required this.textContent,
    required this.onPressed,
    this.icon,
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
              widget.icon != null
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.only(left: 5.0),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        width: 35,
                        height: 35,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            widget.icon,
                            color: t8_white,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          )),
    );
  }
}

class text extends StatelessWidget {
  final String textString;
  var fontSize = textSizeLargeMedium;
  Color? textColor;
  var fontFamily;
  var isCentered = false;
  var maxLine = 1;
  var latterSpacing = 0.5;
  bool textAllCaps = false;
  var isLongText = false;
  bool lineThrough = false;
  bool bold = false;
  bool justifyText = false;

  text(this.textString,
      {this.fontSize = textSizeLargeMedium,
      this.textColor,
      this.fontFamily,
      this.isCentered = false,
      this.maxLine = 1,
      this.latterSpacing = 0.5,
      this.textAllCaps = false,
      this.isLongText = false,
      this.lineThrough = false,
      this.bold = false,
      this.justifyText = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAllCaps ? textString.toUpperCase() : textString,
      textAlign: justifyText
          ? TextAlign.justify
          : isCentered
              ? TextAlign.center
              : TextAlign.start,
      maxLines: isLongText ? null : maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: fontFamily ?? fontRegular,
        fontSize: fontSize,
        fontWeight: bold ? FontWeight.bold : null,
        color: textColor ?? Theme.of(context).textTheme.button!.color,
        height: 1.5,
        letterSpacing: latterSpacing,
        decoration:
            lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
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

Widget appLabelViewAll(var texto, {bool limiter = false}) {
  return RelativeBuilder(
    builder: (context, height, width, sy, sx) {
      return Container(
        width: width >= 1024 && limiter ? 1024 : width,
        padding:
            width >= 1024 && limiter ? EdgeInsets.all(0) : EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            text(texto,
                textColor: black,
                fontSize: textSizeNormal,
                fontFamily: fontBold),
          ],
        ),
      );
    },
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
            textColor: Theme.of(context).dialogBackgroundColor,
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
  var fontSize = textSizeLargeMedium;
  appButton3(
      {required this.textContent,
      required this.onPressed,
      this.isStroked = false,
      this.height = 50.0,
      this.fontSize = textSizeLargeMedium});

  @override
  appButton3State createState() => appButton3State();
}

class appButton3State extends State<appButton3> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
        alignment: Alignment.center,
        child: text(widget.textContent,
            textColor: widget.isStroked
                ? color_textColorPrimary
                : color_textColorSecondary,
            fontSize: widget.fontSize,
            isCentered: true,
            fontFamily: fontSemibold,
            textAllCaps: false,
            maxLine: 1),
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
  final Function()? onPressed;

  const CardButton(
      {Key? key,
      required this.icon,
      required this.description,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return InkWell(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.only(left: 13, right: 1, bottom: 16, top: 16),
          padding: EdgeInsets.only(left: 16, right: 13, bottom: 16, top: 16),
          width: sx(width) > 500 ? sx(100) : width / 2.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Theme.of(context).primaryColor,
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
        ),
      );
    });
  }
}

class PlatformSvg {
  static Widget asset(
    String assetName, {
    required BuildContext context,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
    alignment = Alignment.center,
    String? semanticsLabel,
  }) {
    if (kIsWeb) {
      if (width == null || height == null) {
        return Image.network("/assets/$assetName",
            fit: fit,
            color: color ?? Theme.of(context).textTheme.button!.color,
            alignment: alignment,
            semanticLabel: semanticsLabel);
      }

      return SizedBox(
        width: width,
        height: height,
        child: Image.network("/assets/$assetName",
            fit: fit,
            color: color ?? Theme.of(context).textTheme.button!.color,
            alignment: alignment,
            semanticLabel: semanticsLabel),
      );
    }

    return SvgPicture.asset(
      assetName,
      fit: fit,
      color: color ?? Theme.of(context).textTheme.button!.color,
      allowDrawingOutsideViewBox: true,
      alignment: alignment,
      semanticsLabel: semanticsLabel,
      width: width,
      height: height,
    );
  }
}

class RetryWidget extends StatefulWidget {
  final String? message;
  final Function onRetry;
  final String icon = "images/danger.svg";

  const RetryWidget({Key? key, this.message, required this.onRetry})
      : super(key: key);

  @override
  _RetryWidgetState createState() => _RetryWidgetState();
}

class _RetryWidgetState extends State<RetryWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.message != null) text(widget.message!),
            // Image error from the internet
            PlatformSvg.asset(
              widget.icon,
              context: context,
              width: 100,
              height: 100,
              color: Colors.black,
            ),
            SizedBox(
              height: textSizeXLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                appButton(
                  textContent: "Tentar novamente",
                  onPressed: () {
                    widget.onRetry();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String icon;
  final BottomNavigatorStore store;
  final String title;
  final int index;

  const DrawerListTile(
      {Key? key,
      required this.icon,
      required this.store,
      required this.title,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          leading: PlatformSvg.asset(
            icon,
            context: context,
          ),
          title: text(title, fontFamily: fontRegular),
          onTap: () {
            store.changePage(index);
          },
          selected: store.currentPage == index ? true : false,
          selectedTileColor: Theme.of(context).accentColor.withOpacity(0.1),
        ),
      );
    });
  }
}

Widget networkImage(String image,
    {String aPlaceholder = "",
    double? aWidth,
    double? aHeight,
    BoxFit fit = BoxFit.fill}) {
  return CachedNetworkImage(
    imageUrl: '$image',
    width: aWidth,
    height: aHeight,
    fit: fit,
  );
}

Widget itemSubTitle(BuildContext context, var titleText,
    {var fontFamily = fontRegular,
    var fontsize = textSizeNormal,
    var colorThird = false,
    isLongText = true}) {
  return text(
    titleText,
    fontSize: fontsize,
    fontFamily: fontFamily,
    isLongText: isLongText,
    textColor: colorThird ? textPrimaryColor : textSecondaryColor,
    maxLine: 10,
  );
}

Widget itemTitle(BuildContext context, var titleText,
    {var fontfamily = fontMedium}) {
  return text(titleText,
      fontSize: textSizeNormal,
      fontFamily: fontfamily,
      textColor: textPrimaryColor);
}

Widget subType(context, key, VoidCallback callback, icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      icon != null
          ? Padding(
              child: icon,
              padding: EdgeInsets.only(right: spacing_standard),
            )
          : SizedBox(),
      Expanded(child: itemTitle(context, key)),
      Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Modular.get<UserPreferencesStore>().darkTheme
            ? color_white
            : blackColor,
      )
    ],
  )
      .paddingOnly(
          left: spacing_standard_new,
          right: 12,
          top: spacing_standard_new,
          bottom: spacing_standard_new)
      .onTap(callback);
}

Widget formField(
  context,
  String? hint, {
  isEnabled = true,
  isDummy = false,
  controller,
  isPasswordVisible = false,
  isPassword = false,
  keyboardType = TextInputType.text,
  FormFieldValidator<String>? validator,
  onSaved,
  textInputAction = TextInputAction.next,
  FocusNode? focusNode,
  FocusNode? nextFocus,
  IconData? suffixIcon,
  maxLine = 1,
  suffixIconSelector,
  String? initialValue,
}) {
  return TextFormField(
    enabled: isEnabled,
    controller: controller,
    obscureText: isPassword && isPasswordVisible,
    cursorColor: color_colorPrimary,
    maxLines: maxLine,
    keyboardType: keyboardType,
    validator: validator,
    onSaved: onSaved,
    textInputAction: textInputAction,
    focusNode: focusNode,
    onFieldSubmitted: (arg) {
      if (nextFocus != null) {
        FocusScope.of(context).requestFocus(nextFocus);
      }
    },
    initialValue: initialValue ?? "",
    decoration: InputDecoration(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color_colorPrimary)),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: t8_textColorPrimary)),
      labelText: hint,
      labelStyle:
          TextStyle(fontSize: textSizeNormal, color: t8_textColorPrimary),
      suffixIcon: isPassword && isPasswordVisible
          ? GestureDetector(
              onTap: suffixIconSelector,
              child: Icon(suffixIcon, color: color_colorPrimary, size: 20))
          : Icon(suffixIcon, color: color_colorPrimary, size: 20),
      contentPadding: EdgeInsets.only(bottom: 2.0),
    ),
    style: TextStyle(
        fontSize: textSizeNormal,
        color: isDummy ? Colors.transparent : t8_textColorPrimary,
        fontFamily: fontRegular),
  );
}

Widget headingText(BuildContext context, var titleText) {
  return text(titleText,
      fontSize: textSizeSmall,
      fontFamily: fontBold,
      textColor: color_colorPrimary);
}

class ItemProgressHorizontalList extends StatelessWidget {
  List<Movie>? list = <Movie>[];

  ItemProgressHorizontalList(this.list);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height:
          width <= 1000 ? (width * 0.28) * 7.8 / 6 : (width * 0.28) * 2.8 / 6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list!.length,
        padding: EdgeInsets.only(
            left: spacing_standard, right: spacing_standard_new),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: spacing_standard),
            width: width <= 1000 ? (width * 0.5) : (width * 0.2),
            child: InkWell(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 4 / 2.5,
                    child: networkImage(list![index].slideImage!,
                            aWidth: double.infinity, aHeight: double.infinity)
                        .cornerRadiusWithClipRRect(8),
                  ).paddingBottom(spacing_control),
                  Expanded(
                    child: LinearPercentIndicator(
                      width: width <= 1000 ? (width * 0.5) : (width * 0.2),
                      lineHeight: 1.5,
                      percent: list![index].percent!,
                      backgroundColor: Colors.grey,
                      linearStrokeCap: LinearStrokeCap.butt,
                      padding: EdgeInsets.only(left: 2),
                      progressColor: color_colorPrimary,
                    ),
                  )
                ],
              ),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(title: "Action")));
              },
              radius: spacing_control,
            ),
          );
        },
      ),
    );
  }
}

class ItemHorizontalList extends StatelessWidget {
  var list = [];
  var isHorizontal = false;

  ItemHorizontalList(this.list, {this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return !isHorizontal
        ? Container(
            height: width <= 1000
                ? (width * 0.28) * 6.8 / 6
                : (width * 0.28) * 2.8 / 6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  left: spacing_standard, right: spacing_standard_new),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: spacing_standard),
                  width: width <= 1000 ? (width * 0.5) : (width * 0.2),
                  child: InkWell(
                    child: AspectRatio(
                      aspectRatio: 6 / 8.8,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          networkImage(list[index].slideImage!,
                                  aWidth: double.infinity,
                                  aHeight: double.infinity)
                              .cornerRadiusWithClipRRect(8),
                          if (list[index]?.isHD != null)
                            hdWidget(context)
                                .paddingRight(spacing_standard)
                                .visible(list[index].isHD!)
                                .paddingAll(spacing_standard),
                        ],
                      ),
                    ),
                    onTap: () {
                      Modular.to.pushNamed('videos/playlist/${list[index].id}',
                          arguments: list[index],
                          forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                              ? true
                              : false);
                    },
                    radius: spacing_control,
                  ),
                );
              },
            ),
          )
        : Container(
            height: width <= 1000
                ? (width * 0.28) * 6.8 / 6
                : (width * 0.28) * 2.8 / 6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              padding: EdgeInsets.only(
                  left: spacing_standard, right: spacing_standard_new),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: spacing_standard),
                  width: width <= 1000 ? (width * 0.5) : (width * 0.2),
                  child: InkWell(
                    child: AspectRatio(
                      aspectRatio: 4 / 2.5,
                      child: networkImage(list[index].slideImage!,
                              aWidth: double.infinity, aHeight: double.infinity)
                          .cornerRadiusWithClipRRect(8),
                    ),
                    onTap: () {
                      Modular.to.pushNamed('videos/view/${list[index].id}',
                          arguments: list[index],
                          forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                              ? true
                              : false);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(title: "Action")));
                    },
                    radius: spacing_control,
                  ),
                );
              },
            ),
          );
  }
}

Widget hdWidget(context) {
  return Container(
    decoration: BoxDecoration(
        color: color_colorPrimary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(spacing_control_half))),
    padding: EdgeInsets.only(
        top: 0, bottom: 0, left: spacing_control, right: spacing_control),
    child: text("HD",
        textColor: Colors.black, fontSize: textSizeSmall, fontFamily: fontBold),
  );
}

Widget headingWidViewAll(
    BuildContext context, var titleText, Function()? callback,
    {limiter = false, desativaBotao = false}) {
  return RelativeBuilder(builder: (context, height, width, sy, sx) {
    return Container(
      width: width >= 1024 && limiter ? 1024 : width,
      padding:
          width >= 1024 && limiter ? EdgeInsets.all(0) : EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: text(titleText,
                textColor: black,
                fontSize: textSizeNormal,
                fontFamily: fontBold),
          ),
          if (!desativaBotao)
            InkWell(
                onTap: callback,
                child: itemSubTitle(context, "Ver mais",
                        fontsize: textSizeMedium,
                        fontFamily: fontMedium,
                        colorThird: true)
                    .paddingAll(spacing_control_half))
        ],
      ),
    );
  });
}

Widget toolBarTitle(BuildContext context, String title) {
  return text(title,
      fontSize: textSizeLarge,
      textColor: color_textColorPrimary,
      fontFamily: fontBold);
}

Widget loadingWidgetMaker() {
  return Container(
    alignment: Alignment.center,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: spacing_control,
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
    ),
  );
}

Widget moviePost(videoController) {
  return LayoutBuilder(builder: (context, constraints) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    YoutubePlayerController controller = videoController;

    if ((kIsWeb || IO.Platform.isWindows) && constraints.maxWidth > 800) {
      return Observer(builder: (_) {
        return Center(
          child: SizedBox(
              height: width <= 1000
                  ? ((width / 2) - 36) * (2.5 / 4) + 40
                  : (width * 0.60) * 2.8 / 6,
              child: YoutubePlayerControllerProvider(
                // Provides controller to all the widget below it.
                controller: controller,
                child: YoutubePlayerIFrame(),
              )),
        );
      });
    }

    return YoutubePlayerControllerProvider(
      // Provides controller to all the widget below it.
      controller: controller,
      child: YoutubePlayerIFrame(
        aspectRatio: 16 / 9,
      ),
    );
  }).paddingAll(spacing_standard_new);
}

var buttonsVideo = Row(
  mainAxisSize: MainAxisSize.max,
  children: <Widget>[
    Expanded(
        child: IconButton(
            icon: Icon(
              Icons.thumb_up,
              size: 24,
              color: color_textColorPrimary,
            ),
            onPressed: () {})),
    Expanded(
        child: IconButton(
      icon: Icon(
        Icons.playlist_add,
        size: 24,
        color: color_textColorPrimary,
      ),
      onPressed: () {},
    )),
    Expanded(
        child: IconButton(
      icon: Icon(Icons.cloud_download, size: 24, color: color_textColorPrimary),
      onPressed: () {},
    )),
    Expanded(
        child: IconButton(
      icon: Icon(Icons.share, size: 24, color: color_textColorPrimary),
      onPressed: () {},
    )),
  ],
).paddingOnly();
