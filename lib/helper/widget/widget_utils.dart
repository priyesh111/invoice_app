import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:invoice_app/helper/constant/color_data.dart';
import 'package:invoice_app/helper/constant/constant.dart';
import 'package:invoice_app/helper/widget/fetch_pixels.dart';

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getAssetImage(String image, double width, double height,
    {Color? color, BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
    scale: FetchPixels.getScale(),
  );
}

// Widget getLocalImage(String image, double width, double height,
//     {Color? color, BoxFit boxFit = BoxFit.contain}) {
//   return Image.file(
//     File(image),
//     color: color,
//     width: width,
//     height: height,
//     fit: boxFit,
//     scale: FetchPixels.getScale(),
//   );
// }

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getPaddingWidget(EdgeInsets edgeInsets, Widget widget) {
  return Padding(
    padding: edgeInsets,
    child: widget,
  );
}

DecorationImage getDecorationAssetImage(BuildContext buildContext, String image,
    {BoxFit fit = BoxFit.cover}) {
  return DecorationImage(
      image: AssetImage((Constant.assetImagePath) + image),
      fit: fit,
      scale: FetchPixels.getScale());
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
      FontStyle fontStyle = FontStyle.normal,
    txtHeight}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: fontStyle,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight,
    ),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
  );
}




Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight = 1.0}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
    textScaleFactor: FetchPixels.getTextScale(),
  );
}

BoxDecoration getButtonDecoration(Color bgColor,
    {BorderRadius? borderRadius,
    Border? border,
    List<BoxShadow> shadow = const [],
    DecorationImage? image}) {
  return BoxDecoration(
      color: bgColor,
      borderRadius: borderRadius,
      border: border,
      boxShadow: shadow,
      image: image);
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
    key: key,
  );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: iconButtonWidget,
    )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
    height: height ?? 0,
    width: width ?? 0,
    child: IconButton(
      padding: EdgeInsets.zero,
      icon: Container(
        height: height ?? 0,
        width: width ?? 0,
        padding: padding ?? EdgeInsets.zero,
        decoration: decoration ??
            BoxDecoration(
              color: Color(0XFFF8F8F8),
              borderRadius: BorderRadius.circular(24),
            ),
        child: child,
      ),
      onPressed: onTap,
    ),
  );
}

Widget getButton(BuildContext context, Color bgColor, String text,
    Color textColor, Function function, double fontsize,
    {bool isBorder = false,
    EdgeInsetsGeometry? insetsGeometry,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.w500,
    bool isIcon = false,
    String? image,
    Color? imageColor,
    double? imageWidth,
    double? imageHeight,
    bool smallFont = false,
    double? buttonHeight,
    double? buttonWidth,
    List<BoxShadow> boxShadow = const [],
    EdgeInsetsGeometry? insetsGeometrypadding,
    BorderRadius? borderRadius,
    double? borderWidth,
      bool isLoading = false,
    }) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: buttonHeight,
      decoration: getButtonDecoration(
        bgColor,
        borderRadius: borderRadius,
        shadow: boxShadow,
        border: (isBorder)
            ? Border.all(color: borderColor, width: borderWidth!)
            : null,
      ),
      child: isLoading == true ? Center(child: CircularProgressIndicator(color: Colors.white,)) : Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isIcon) ? getSvgImage(image!) : getHorSpace(0),
          (isIcon)
              ? getHorSpace(FetchPixels.getPixelWidth(10))
              : getHorSpace(0),
          getCustomFont(text, fontsize, textColor, 1,
              textAlign: TextAlign.center,
              fontWeight: weight,
              fontFamily: Constant.fontsFamily)
        ],
      ),
    ),
  );
}

bool isButtonEnabled(String startAtString) {
  DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
  DateTime startAt = format.parse(startAtString);
  DateTime now = DateTime.now();
  int differenceInMinutes = now.difference(startAt).inMinutes;
  return differenceInMinutes >= 10;
}


Widget getConfirmButton(BuildContext context, Color bgColor, String text,
    Color textColor, Function function, double fontsize,
    {bool isBorder = false,
    EdgeInsetsGeometry? insetsGeometry,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.bold,
    bool isIcon = false,
    String? image,
    Color? imageColor,
    double? imageWidth,
    double? imageHeight,
    bool smallFont = false,
    double? buttonHeight,
    double? buttonWidth,
    List<BoxShadow> boxShadow = const [],
    EdgeInsetsGeometry? insetsGeometrypadding,
    BorderRadius? borderRadius,
    double? borderWidth,
    bool isLoading = false,
    required String startAtString}) {

  bool isButtonActive = isButtonEnabled(startAtString);

  return InkWell(
    onTap: isButtonActive ? () {
      function();
        } : null, // Disable button by passing null to onTap when inactive
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: buttonHeight,
      decoration: getButtonDecoration(
        isButtonActive ? bgColor : Colors.grey, // Change color when disabled
        borderRadius: borderRadius,
        shadow: boxShadow,
        border: (isBorder)
            ? Border.all(color: borderColor, width: borderWidth!)
            : null,
      ),
      child: isLoading == true
          ? Center(child: CircularProgressIndicator(color: Colors.white,))
          : Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isIcon) ? getSvgImage(image!) : getHorSpace(0),
          (isIcon)
              ? getHorSpace(FetchPixels.getPixelWidth(10))
              : getHorSpace(0),
          getCustomFont(text, fontsize, textColor, 1,
              textAlign: TextAlign.center,
              fontWeight: weight,
              fontFamily: Constant.fontsFamily)
        ],
      ),
    ),
  );
  /*return InkWell(
    onTap: isButtonActive ? () {
            function();
          } : null,
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: buttonHeight,
      decoration: getButtonDecoration(
        bgColor,
        borderRadius: borderRadius,
        shadow: boxShadow,
        border: (isBorder)
            ? Border.all(color: borderColor, width: borderWidth!)
            : null
      ),
      child: isLoading == true ? Center(child: CircularProgressIndicator(color: Colors.white,)) : Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isIcon) ? getSvgImage(image!) : getHorSpace(0),
          (isIcon)
              ? getHorSpace(FetchPixels.getPixelWidth(10))
              : getHorSpace(0),
          getCustomFont(text, fontsize, textColor, 1,
              textAlign: TextAlign.center,
              fontWeight: weight,
              fontFamily: Constant.fontsFamily)
        ],
      ),
    ),
  );*/
}

Widget getButtonWithIcon(BuildContext context, Color bgColor, String text,
    Color textColor, Function function, double fontsize,
    {bool isBorder = false,
    EdgeInsetsGeometry? insetsGeometry,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.bold,
    bool prefixIcon = false,
    bool sufixIcon = false,
    String? prefixImage,
    String? suffixImage,
    Color? imageColor,
    double? imageWidth,
    double? imageHeight,
    bool smallFont = false,
    double? buttonHeight,
    double? buttonWidth,
    List<BoxShadow> boxShadow = const [],
    EdgeInsetsGeometry? insetsGeometrypadding,
    BorderRadius? borderRadius,
    double? borderWidth,
    String fontFamily = Constant.fontsFamily}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: buttonHeight,
      decoration: getButtonDecoration(
        bgColor,
        borderRadius: borderRadius,
        shadow: boxShadow,
        border: (isBorder)
            ? Border.all(color: borderColor, width: borderWidth!)
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              getHorSpace(FetchPixels.getPixelWidth(18)),
              (prefixIcon) ? getSvgImage(prefixImage!,boxFit: BoxFit.fitWidth,width: 25) : getHorSpace(0),
              (prefixIcon)
                  ? getHorSpace(FetchPixels.getPixelWidth(12))
                  : getHorSpace(0),
              getCustomFont(text, fontsize, textColor, 1,
                  textAlign: TextAlign.center,
                  fontWeight: weight,
                  fontFamily: fontFamily)
            ],
          ),
          Row(
            children: [
              (sufixIcon) ? getSvgImage(suffixImage!) : getHorSpace(0),
              (sufixIcon)
                  ? getHorSpace(FetchPixels.getPixelWidth(18))
                  : getHorSpace(0),
            ],
          )
        ],
      ),
    ),
  );
}

Widget getButtonWithIconSubTitle(BuildContext context, Color bgColor, String text, String subtext,
    Color textColor, Function function, double fontsize,double subFontsize,
    {bool isBorder = false,
    EdgeInsetsGeometry? insetsGeometry,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.bold,
    FontWeight subWeight = FontWeight.bold,
    bool prefixIcon = false,
    bool sufixIcon = false,
    String? prefixImage,
    String? suffixImage,
    Color? imageColor,
    double? imageWidth,
    double? imageHeight,
    bool smallFont = false,
    double? buttonHeight,
    double? buttonWidth,
    List<BoxShadow> boxShadow = const [],
    EdgeInsetsGeometry? insetsGeometrypadding,
    BorderRadius? borderRadius,
    double? borderWidth,
    String fontFamily = Constant.fontsFamily}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: buttonHeight,
      decoration: getButtonDecoration(
        bgColor,
        borderRadius: borderRadius,
        shadow: boxShadow,
        border: (isBorder)
            ? Border.all(color: borderColor, width: borderWidth!)
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              getHorSpace(FetchPixels.getPixelWidth(18)),
              (prefixIcon) ? getSvgImage(prefixImage!,width: 20) : getHorSpace(0),
              (prefixIcon)
                  ? getHorSpace(FetchPixels.getPixelWidth(12))
                  : getHorSpace(0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getCustomFont(text, fontsize, textColor, 1,
                      textAlign: TextAlign.center,
                      fontWeight: weight,
                      fontFamily: fontFamily),
                  getCustomFont(subtext, subFontsize, textColor, 1,
                      textAlign: TextAlign.center,
                      fontWeight: subWeight,
                      fontFamily: fontFamily),
                ],
              )
            ],
          ),
          Row(
            children: [
              (sufixIcon) ? getSvgImage(suffixImage!) : getHorSpace(0),
              (sufixIcon)
                  ? getHorSpace(FetchPixels.getPixelWidth(18))
                  : getHorSpace(0),
            ],
          )
        ],
      ),
    ),
  );
}

Widget getDefaultTextFiledWithLabel(BuildContext context, String s,
    TextEditingController textEditingController, Color fontColor,
    {bool withprefix = false,
    bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    String? suffiximage,
    required Function function,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft}) {
  FocusNode myFocusNode = FocusNode();

  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: isEnable,
        child: Container(
          height: height,
          margin: margin,
          alignment: alignmentGeometry,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0.0, 4.0)),
              ],
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          child: Focus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  setState(() {
                    myFocusNode.canRequestFocus = true;
                  });
                } else {
                  setState(() {
                    myFocusNode.canRequestFocus = false;
                  });
                }
              },
              child: MediaQuery(
                data: mqDataNew,
                child: Row(
                  children: [
                    (!withprefix)
                        ? getHorSpace(FetchPixels.getPixelWidth(16))
                        : Padding(
                            padding: EdgeInsets.only(
                                right: FetchPixels.getPixelWidth(12),
                                left: FetchPixels.getPixelWidth(18)),
                            child: getSvgImage(image!,
                                height: FetchPixels.getPixelHeight(24),
                                width: FetchPixels.getPixelHeight(24)),
                          ),
                    Expanded(
                      child: TextField(
                        maxLines: (minLines) ? null : 1,
                        controller: textEditingController,
                        obscuringCharacter: "*",
                        autofocus: false,
                        focusNode: myFocusNode,
                        obscureText: isPass,
                        showCursor: true,
                        onTap: () {
                          // function();
                        },
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: Constant.fontsFamily),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            hintText: s,
                            hintStyle: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: Constant.fontsFamily)),
                      ),
                    ),
                    (!withSufix)
                        ? getHorSpace(FetchPixels.getPixelWidth(16))
                        : Padding(
                            padding: EdgeInsets.only(
                                right: FetchPixels.getPixelWidth(18),
                                left: FetchPixels.getPixelWidth(12)),
                            child: InkWell(
                              onTap: () {
                                if(imagefunction!=null) {
                                  imagefunction();
                                }
                              },
                              child: getSvgImage(suffiximage!,
                                  height: FetchPixels.getPixelHeight(24),
                                  width: FetchPixels.getPixelHeight(24)),
                            ),
                          ),
                  ],
                ),
              )),
        ),
      );
    },
  );
}

/*Widget getDefaultTextField(BuildContext context, String s,
    TextEditingController textEditingController, Color fontColor,
    {bool withprefix = false,
     bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    String? suffiximage,
    required Function function,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
      TextInputType? keyboardType
    }) {

  // Create the FocusNode outside the StatefulBuilder
  FocusNode myFocusNode = FocusNode();

  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: !isEnable, // This should be !isEnable to disable input
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: height,
            margin: margin,
            alignment: alignmentGeometry,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0.0, 4.0)),
                ],
                borderRadius:
                    BorderRadius.circular(FetchPixels.getPixelHeight(12))),
            child: Focus(
                onFocusChange: (hasFocus) {
                  setState(() {
                    myFocusNode.canRequestFocus = hasFocus;
                  });
                },
                child: MediaQuery(
                  data: mqDataNew,
                  child: Row(
                    children: [
                      (!withprefix)
                          ? getHorSpace(FetchPixels.getPixelWidth(16))
                          : Padding(
                              padding: EdgeInsets.only(
                                  right: FetchPixels.getPixelWidth(12),
                                  left: FetchPixels.getPixelWidth(18)),
                              child: getAssetImage(image!, FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18), color: Colors.grey),
                            ),
                      Expanded(
                        child: TextField(
                          keyboardType: keyboardType,
                          maxLines: (minLines) ? 5 : 1,
                          controller: textEditingController,
                          obscuringCharacter: "*",
                          autofocus: false,
                          focusNode: myFocusNode,
                          obscureText: isPass,
                          showCursor: true,
                          onTap: () {
                            function();
                          },
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: Constant.fontsFamily),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              hintText: s,
                              hintStyle: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: Constant.fontsFamily)),
                        ),
                      ),
                      (!withSufix)
                          ? getHorSpace(FetchPixels.getPixelWidth(16))
                          : Padding(
                              padding: EdgeInsets.only(
                                  right: FetchPixels.getPixelWidth(18),
                                  left: FetchPixels.getPixelWidth(12)),
                              child: InkWell(
                                onTap: () {
                                  if(imagefunction != null) {
                                    imagefunction();
                                  }
                                },
                                child: getSvgImage(suffiximage!,
                                    height: FetchPixels.getPixelHeight(24),
                                    width: FetchPixels.getPixelHeight(24)),
                              ),
                            ),
                    ],
                  ),
                )),
          ),
        ),
      );
    },
  );
}
*/
Widget getDefaultTextFiled(BuildContext context, String s,
    TextEditingController textEditingController, Color fontColor,FocusNode focusNode,
    {bool withprefix = false,
      bool withSufix = false,
      bool minLines = false,
      EdgeInsetsGeometry margin = EdgeInsets.zero,
      bool isPass = false,
      bool isEnable = true,
      double? height,
      double? imageHeight,
      double? imageWidth,
      String? image,
      String? suffiximage,
      required Function function,
      Function? imagefunction,
      AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
      TextInputType? keyboardType,
      final ValueChanged<String>? onChanged,
      List<TextInputFormatter>? inputFormatters,
      TextCapitalization textCapitalization = TextCapitalization.none
      /*FocusNode? focusNode*/
    }) {

  // Create the FocusNode outside the StatefulBuilder
  // FocusNode myFocusNode = FocusNode();

  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
      mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: !isEnable,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: height,
            margin: margin,
            alignment: alignmentGeometry,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0.0, 4.0)),
                ],
                borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(12))),
            child: Focus(
                onFocusChange: (hasFocus) {
                  // setState(() {
                  //   myFocusNode.canRequestFocus = hasFocus;
                  // });
                  setState(() {
                    focusNode.canRequestFocus = hasFocus;
                  });
                },
                child: MediaQuery(
                  data: mqDataNew,
                  child: Row(
                    children: [
                      (!withprefix)
                          ? getHorSpace(FetchPixels.getPixelWidth(16))
                          : Padding(
                        padding: EdgeInsets.only(
                            right: FetchPixels.getPixelWidth(12),
                            left: FetchPixels.getPixelWidth(18)),
                        child: getAssetImage(image!, FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18), color: Colors.grey),
                      ),
                      Expanded(
                        child: TextField(
                          textCapitalization: textCapitalization, // This will open the keyboard in all caps
                          keyboardType: keyboardType,
                          maxLines: (minLines) ? 5 : 1,
                          controller: textEditingController,
                          obscuringCharacter: "*",
                          autofocus: false,
                          onChanged: onChanged,
                          focusNode: focusNode,
                          obscureText: isPass,
                          showCursor: true,
                          inputFormatters: inputFormatters,
                          onTap: () {
                            function();
                          },
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: Constant.fontsFamily),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              hintText: s,
                              hintStyle: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: Constant.fontsFamily)),
                        ),
                      ),
                      (!withSufix)
                          ? getHorSpace(FetchPixels.getPixelWidth(16))
                          : Padding(
                        padding: EdgeInsets.only(
                            right: FetchPixels.getPixelWidth(18),
                            left: FetchPixels.getPixelWidth(12)),
                        child: InkWell(
                          onTap: () {
                            if(imagefunction != null) {
                              imagefunction();
                            }
                          },
                          child: getSvgImage(suffiximage!,
                              height: FetchPixels.getPixelHeight(24),
                              width: FetchPixels.getPixelHeight(24)),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      );
    },
  );
}



Widget getTextFiled(BuildContext context, String s,
    TextEditingController textEditingController, Color fontColor,FocusNode focusNode,
    {bool withprefix = false,
      bool withSufix = false,
      bool minLines = false,
      EdgeInsetsGeometry margin = EdgeInsets.zero,
      bool isPass = false,
      bool isEnable = true,
      double? height,
      double? imageHeight,
      double? imageWidth,
      String? image,
      String? suffiximage,
      required Function function,
      Function? imagefunction,
      AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
      TextInputType? keyboardType,
      final ValueChanged<String>? onChanged,
      List<TextInputFormatter>? inputFormatters,
      TextCapitalization textCapitalization = TextCapitalization.none
      /*FocusNode? focusNode*/
    }) {

  // Create the FocusNode outside the StatefulBuilder
  // FocusNode myFocusNode = FocusNode();

  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
      mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: !isEnable,
        child: Container(
          height: height,
          margin: margin,
          alignment: alignmentGeometry,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0.0, 4.0)),
              ],
              borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          child: Focus(
              onFocusChange: (hasFocus) {
                // setState(() {
                //   myFocusNode.canRequestFocus = hasFocus;
                // });
                setState(() {
                  focusNode.canRequestFocus = hasFocus;
                });
              },
              child: MediaQuery(
                data: mqDataNew,
                child: Row(
                  children: [
                    (!withprefix)
                        ? getHorSpace(FetchPixels.getPixelWidth(16))
                        : Padding(
                      padding: EdgeInsets.only(
                          right: FetchPixels.getPixelWidth(12),
                          left: FetchPixels.getPixelWidth(18)),
                      child: getAssetImage(image!, FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18), color: Colors.grey),
                    ),
                    Expanded(
                      child: TextField(
                        textCapitalization: textCapitalization, // This will open the keyboard in all caps
                        keyboardType: keyboardType,
                        maxLines: (minLines) ? 5 : 1,
                        controller: textEditingController,
                        obscuringCharacter: "*",
                        autofocus: false,
                        onChanged: onChanged,
                        focusNode: focusNode,
                        obscureText: isPass,
                        showCursor: true,
                        inputFormatters: inputFormatters,
                        onTap: () {
                          function();
                        },
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: Constant.fontsFamily),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            hintText: s,
                            hintStyle: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: Constant.fontsFamily),),
                      ),
                    ),
                    (!withSufix)
                        ? getHorSpace(FetchPixels.getPixelWidth(16))
                        : Padding(
                      padding: EdgeInsets.only(
                          right: FetchPixels.getPixelWidth(18),
                          left: FetchPixels.getPixelWidth(12)),
                      child: InkWell(
                        onTap: () {
                          if(imagefunction != null) {
                            imagefunction();
                          }
                        },
                        child: getSvgImage(suffiximage!,
                            height: FetchPixels.getPixelHeight(24),
                            width: FetchPixels.getPixelHeight(24)),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      );
    },
  );
}

Widget getDefaultTextFiledMax(BuildContext context, String s,
    TextEditingController textEditingController, Color fontColor,FocusNode focusNode,
    {bool withprefix = false,
      bool withSufix = false,
      bool minLines = false,
      EdgeInsetsGeometry margin = EdgeInsets.zero,
      bool isPass = false,
      bool isEnable = true,
      double? height,
      double? imageHeight,
      double? imageWidth,
      String? image,
      String? suffiximage,
      required Function function,
      Function? imagefunction,
      AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
      TextInputType? keyboardType,
      /*FocusNode? focusNode*/
    }) {

  // Create the FocusNode outside the StatefulBuilder
  // FocusNode myFocusNode = FocusNode();

  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
      mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: !isEnable,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: height,
            margin: margin,
            alignment: alignmentGeometry,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0.0, 4.0)),
                ],
                borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(12))),
            child: Focus(
                onFocusChange: (hasFocus) {
                  // setState(() {
                  //   myFocusNode.canRequestFocus = hasFocus;
                  // });
                  setState(() {
                    focusNode.canRequestFocus = hasFocus;
                  });
                },
                child: MediaQuery(
                  data: mqDataNew,
                  child: Row(
                    children: [
                      (!withprefix)
                          ? getHorSpace(FetchPixels.getPixelWidth(16))
                          : Padding(
                        padding: EdgeInsets.only(
                            right: FetchPixels.getPixelWidth(12),
                            left: FetchPixels.getPixelWidth(18)),
                        child: getAssetImage(image!, FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18), color: Colors.grey),
                      ),
                      Expanded(
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                          ],
                          keyboardType: keyboardType,
                          maxLines: (minLines) ? 5 : 1,
                          controller: textEditingController,
                          obscuringCharacter: "*",
                          autofocus: false,
                          focusNode: focusNode,
                          obscureText: isPass,
                          showCursor: true,
                          onTap: () {
                            function();
                          },
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: Constant.fontsFamily),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              hintText: s,
                              hintStyle: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: Constant.fontsFamily)),
                        ),
                      ),
                      (!withSufix)
                          ? getHorSpace(FetchPixels.getPixelWidth(16))
                          : Padding(
                        padding: EdgeInsets.only(
                            right: FetchPixels.getPixelWidth(18),
                            left: FetchPixels.getPixelWidth(12)),
                        child: InkWell(
                          onTap: () {
                            if(imagefunction != null) {
                              imagefunction();
                            }
                          },
                          child: getSvgImage(suffiximage!,
                              height: FetchPixels.getPixelHeight(24),
                              width: FetchPixels.getPixelHeight(24)),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      );
    },
  );
}

// old
/*Widget getDefaultTextFiledOld(BuildContext context, String s,
    TextEditingController textEditingController, Color fontColor,
    {bool withprefix = false,
     bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    String? suffiximage,
    required Function function,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
      TextInputType? keyboardType
    }) {
  FocusNode myFocusNode = FocusNode();

  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: isEnable,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: height,
            margin: margin,
            alignment: alignmentGeometry,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0.0, 4.0)),
                ],
                borderRadius:
                    BorderRadius.circular(FetchPixels.getPixelHeight(12))),
            child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    setState(() {
                      myFocusNode.canRequestFocus = true;
                    });
                  } else {
                    setState(() {
                      myFocusNode.canRequestFocus = false;
                    });
                  }
                },
                child: MediaQuery(
                  data: mqDataNew,
                  child: Row(
                    children: [
                      (!withprefix)
                          ? getHorSpace(FetchPixels.getPixelWidth(16))
                          : Padding(
                              padding: EdgeInsets.only(
                                  right: FetchPixels.getPixelWidth(12),
                                  left: FetchPixels.getPixelWidth(18)),
                              child: getAssetImage(image!, FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18),color: Colors.grey                                                                                                                                                                                                                                                                                                  )
                       ),
                      Expanded(
                        child: TextField(
                          keyboardType: keyboardType,
                          maxLines: (minLines) ? 5 : 1,
                          controller: textEditingController,
                          obscuringCharacter: "*",
                          autofocus: false,
                          focusNode: myFocusNode,
                          obscureText: isPass,
                          showCursor: true,
                          onTap: () {
                            // function();
                          },
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: Constant.fontsFamily),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              hintText: s,
                              hintStyle: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: Constant.fontsFamily)),
                        ),
                      ),
                      (!withSufix)
                          ? getHorSpace(FetchPixels.getPixelWidth(16))
                          : Padding(
                              padding: EdgeInsets.only(
                                  right: FetchPixels.getPixelWidth(18),
                                  left: FetchPixels.getPixelWidth(12)),
                              child: InkWell(
                                onTap: () {
                                  if(imagefunction!=null) {
                                    imagefunction();
                                  }
                                },
                                child: getSvgImage(suffiximage!,
                                    height: FetchPixels.getPixelHeight(24),
                                    width: FetchPixels.getPixelHeight(24)),
                              ),
                            ),
                    ],
                  ),
                )
            ),
          ),
        ),
      );
    },
  );
}*/

Widget getCardDateTextField(
  BuildContext context,
  String s,
  TextEditingController textEditingController,
  Color fontColor, {
  bool minLines = false,
  EdgeInsetsGeometry margin = EdgeInsets.zero,
  bool isPass = false,
  bool isEnable = true,
  double? height,
  required Function function,
}) {
  FocusNode myFocusNode = FocusNode();
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: !isEnable,
        child: Container(
          height: height,
          margin: margin,
          alignment: Alignment.centerLeft,
          padding:
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(18)),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0.0, 4.0)),
              ],
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          child: Focus(
              onFocusChange: (hasFocus) {
                setState(() {

                  myFocusNode.canRequestFocus = hasFocus;

                });
                /*if (hasFocus) {
                  setState(() {
                    myFocusNode.canRequestFocus = true;
                  });
                } else {
                  setState(() {
                    myFocusNode.canRequestFocus = false;
                  });
                }*/
              },
              child: MediaQuery(
                data: mqDataNew,
                child: TextField(
                  maxLines: (minLines) ? null : 1,
                  controller: textEditingController,
                  obscuringCharacter: "*",
                  autofocus: false,
                  focusNode: myFocusNode,
                  obscureText: isPass,
                  showCursor: false,
                  onTap: () {
                    function();
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: Constant.fontsFamily),
                  // textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: s,
                      hintStyle: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: Constant.fontsFamily)),
                ),
              )),
        ),
      );
    },
  );
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

Widget getCardEditText(BuildContext context, String s,
    TextEditingController textEditingController, Color fontColor,
    {bool withprefix = false,
    bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    String? suffiximage,
    required Function function,
    Function? imagefunction}) {
  FocusNode myFocusNode = FocusNode();
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: isEnable,
        child: Container(
          height: height,
          margin: margin,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0.0, 4.0)),
              ],
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          child: Focus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  setState(() {
                    myFocusNode.canRequestFocus = true;
                  });
                } else {
                  setState(() {
                    myFocusNode.canRequestFocus = false;
                  });
                }
              },
              child: MediaQuery(
                data: mqDataNew,
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CardNumberFormatter(),
                  ],
                  maxLines: (minLines) ? null : 1,
                  controller: textEditingController,
                  maxLength: 19,
                  obscuringCharacter: "*",
                  autofocus: false,
                  focusNode: myFocusNode,
                  obscureText: isPass,
                  showCursor: false,
                  onTap: () {
                    function();
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: Constant.fontsFamily),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: (withprefix)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  right: FetchPixels.getPixelWidth(12),
                                  left: FetchPixels.getPixelWidth(18)),
                              child: getSvgImage(image!,
                                  height: FetchPixels.getPixelHeight(24),
                                  width: FetchPixels.getPixelHeight(24)),
                            )
                          : null,
                      suffixIcon: (withSufix)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  right: FetchPixels.getPixelWidth(18),
                                  left: FetchPixels.getPixelWidth(12)),
                              child: InkWell(
                                onTap: () {
                                  imagefunction!();
                                },
                                child: getSvgImage(suffiximage!,
                                    height: FetchPixels.getPixelHeight(24),
                                    width: FetchPixels.getPixelHeight(24)),
                              ),
                            )
                          : null,
                      border: InputBorder.none,
                      hintText: s,
                      hintStyle: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize:16,
                          fontFamily: Constant.fontsFamily)),
                ),
              )),
        ),
      );
    },
  );
}

Widget getCountryTextField(BuildContext context, String s,
    TextEditingController textEditingController, Color fontColor, String code,
    {bool withprefix = false,
    bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    String? image,
    required Function function,
    Function? imagefunction}) {
  FocusNode myFocusNode = FocusNode();
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: isEnable,
        child: Container(
          height: height,
          margin: margin,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0.0, 4.0)),
              ],
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getHorSpace(FetchPixels.getPixelWidth(18)),
              getAssetImage(image!, FetchPixels.getPixelHeight(24),
                  FetchPixels.getPixelHeight(24)),
              getHorSpace(FetchPixels.getPixelWidth(12)),
              getCustomFont(code, 16, Colors.black, 1,
                  fontWeight: FontWeight.w400,
                  fontFamily: Constant.fontsFamily),
              getSvgImage("down_arrow.svg"),
              getHorSpace(FetchPixels.getPixelWidth(20)),
              Expanded(
                child: MediaQuery(
                  data: mqDataNew,
                  child: TextField(
                    maxLines: (minLines) ? null : 1,
                    controller: textEditingController,
                    obscuringCharacter: "*",
                    autofocus: false,
                    focusNode: myFocusNode,
                    obscureText: isPass,
                    showCursor: false,
                    onTap: () {
                      function();
                    },
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: Constant.fontsFamily),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: s,
                        hintStyle: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: Constant.fontsFamily)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget getSearchWidget(
    BuildContext context,
    TextEditingController searchController,
    Function filterClick,
    ValueChanged<String> onChanged,
    bool isClearVisible,
    Function clearClick,
    {bool withPrefix = true,
    ValueChanged<String>? onSubmit}) {
  double height = FetchPixels.getPixelHeight(60);

  final mqData = MediaQuery.of(context);
  final mqDataNew =
      mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

  return Container(
    width: double.infinity,
    height: height,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, blurRadius: 10, offset: Offset(0.0, 4.0)),
        ],
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(12))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: FetchPixels.getPixelWidth(18),
              left: FetchPixels.getPixelWidth(19)),
          child: getSvgImage("search.svg",
              height: FetchPixels.getPixelHeight(24),
              width: FetchPixels.getPixelHeight(24)),
        ),
        Expanded(
          flex: 1,
          child: MediaQuery(
              data: mqDataNew,
              child: IntrinsicHeight(
                child: TextField(
                  onTap: () {
                    filterClick();
                  },
                  onSubmitted: onSubmit,
                  textInputAction: TextInputAction.search,
                  controller: searchController,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: "Search...",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: Constant.fontsFamily)),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: Constant.fontsFamily),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              )),
        ),
        getHorSpace(FetchPixels.getPixelWidth(3)),
        isClearVisible ?  IconButton(onPressed: (){clearClick();}, icon: Icon(Icons.clear)) : SizedBox()
      ],
    ),
  );
}

Widget gettoolbarMenu(BuildContext context, String image, Function function,
    {bool istext = false,
    double? fontsize,
    String? title,
    Color? textColor,
    FontWeight? weight,
    String fontFamily = Constant.fontsFamily,
    bool isrightimage = false,
    String? rightimage,
    Function? rightFunction}) {
  return Stack(
    children: [


      Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              function();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: getSvgImage(image,
                  height: FetchPixels.getPixelHeight(24),
                  width: FetchPixels.getPixelHeight(24)),
            )),
      ),
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            child: (istext)
                ? getCustomFont(title!, fontsize!, textColor!, 1,
                fontWeight: weight!, fontFamily: fontFamily)
                : null,
          ),
        ),
      ),
      (isrightimage)
          ? Align(
        alignment: Alignment.centerRight,
        child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              rightFunction!();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: getSvgImage(rightimage!,
                  height: FetchPixels.getPixelHeight(24),
                  width: FetchPixels.getPixelHeight(24)),
            )),
          )
          : Container(),

    ],
  );

  // return Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   children: [
  //     InkWell(
  //
  //         onTap: () {
  //           function();
  //         },
  //         child: getSvgImage(image,
  //             height: FetchPixels.getPixelHeight(24),
  //             width: FetchPixels.getPixelHeight(24))),
  //     Expanded(
  //       child: Container(
  //         alignment: Alignment.center,
  //         child: (istext)
  //             ? getCustomFont(title!, fontsize!, textColor!, 1,
  //                 fontWeight: weight!, fontFamily: fontFamily)
  //             : null,
  //       ),
  //     ),
  //     (isrightimage)
  //         ? InkWell(
  //             onTap: () {
  //               rightFunction!();
  //             },
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: getSvgImage(rightimage!,
  //                   height: FetchPixels.getPixelHeight(24),
  //                   width: FetchPixels.getPixelHeight(24)),
  //             ))
  //         : Container(),
  //   ],
  // );
}

Widget withoutleftIconToolbar(BuildContext context,
    {bool istext = false,
    double? fontsize,
    String? title,
    Color? textColor,
    FontWeight? weight,
    String fontFamily = Constant.fontsFamily,
    bool isrightimage = false,
    String? rightimage,
    Function? rightFunction}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          alignment: Alignment.center,
          child: (istext)
              ? getCustomFont(title!, fontsize!, textColor!, 1, fontWeight: weight!, fontFamily: fontFamily)
              : null,
        ),
      ),
      (isrightimage)
          ? InkWell(
        borderRadius: BorderRadius.circular(500),
              onTap: () {
                rightFunction != null ? rightFunction() : null;
              },
              child: getSvgImage(rightimage!,
                  height: FetchPixels.getPixelHeight(24),
                  width: FetchPixels.getPixelHeight(24)))
          : Container(),
    ],
  );
}

Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

Widget getDivider(Color color, double height, double thickness) {
  return Divider(
    color: color,
    height: height,
    thickness: thickness,
  );
}


Container continueButton(BuildContext context, VoidCallback onTap,String btnTite) {
  return Container(
    color: backGroundColor,
    padding: EdgeInsets.only(
        left: FetchPixels.getPixelWidth(20),
        right: FetchPixels.getPixelWidth(20),
        bottom: FetchPixels.getPixelHeight(0)),
    child: getButton(context, primaryColor, btnTite, Colors.white, /*() {
        Constant.sendToNext(context, Routes.orderDetailRoute);
      }*/onTap, 16,
        weight: FontWeight.w500,
        buttonHeight: FetchPixels.getPixelHeight(50),
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(14))),
  );
}

InkWell cameraField(BuildContext context,VoidCallback onTap,String title,String image,String defaultImage,{he}){
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0.0, 4.0)),
            ],
            borderRadius:
            BorderRadius.circular(FetchPixels.getPixelHeight(12))),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: FetchPixels.getPixelHeight(14),left: FetchPixels.getPixelHeight(18)),
              child: Row(
                children: [
                  getAssetImage("Camera1.png", FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18),color: Colors.grey),
                  SizedBox(width: FetchPixels.getPixelHeight(12)),
                  Expanded(
                    child: Text(title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: Constant.fontsFamily),),
                  ),
                ],
              ),
            ),
            image.isEmpty ? Padding(
                padding: EdgeInsets.only(bottom: 14,left: 8,right: 8,top: 0),
                child: Center(
                  child: SizedBox(
                      height: h * 0.15,
                      width: w * 0.25,
                      child: Image.asset(defaultImage)
                  ),
                )
            ) : Padding(
              padding: EdgeInsets.only(bottom: 14,left: 8,right: 8,top: 10),
              child: SizedBox(
                  height: h * 0.15,
                  child: Image.file(File(image))),
            ),
            Text("Note : Only Upload 2MB Size Images",style: TextStyle(fontSize: 11, color: Colors.black,fontFamily: Constant.fontsFamily)),
            SizedBox(height: 5,),
          ],
        ),
      ),
    ),
  );
}

// InkWell cameraFieldwithUri(BuildContext context,VoidCallback onTap,String title,String image,String defaultImage,String url,bool isEnable,bool isRed){
//   final h = MediaQuery.of(context).size.height;
//   final w = MediaQuery.of(context).size.width;
//
//   return InkWell(
//     onTap: isEnable ? onTap : null,
//     child: Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Container(
//
//         decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: const [
//               BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 5,
//                   offset: Offset(0.0, 4.0)),
//             ],
//             border: isRed ?  Border.all(color: Colors.red) : null,
//             borderRadius:
//             BorderRadius.circular(FetchPixels.getPixelHeight(12))),
//         child: Column(
//           children: [
//             Padding(
//               padding:  EdgeInsets.only(top: FetchPixels.getPixelHeight(14),left: FetchPixels.getPixelHeight(18)),
//               child: Row(
//                 children: [
//                   getAssetImage("Camera1.png", FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18),color: Colors.grey),
//                   SizedBox(width: FetchPixels.getPixelHeight(12)),
//                   Expanded(
//                     child: Text(title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           color: textColor,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 16,
//                           fontFamily: Constant.fontsFamily),),
//                   ),
//                 ],
//               ),
//             ),
//             image.isEmpty ?      url.startsWith('https') ?
//             CachedImage(image: url,   width: double.infinity, height: h * 0.2,boxFit: BoxFit.cover)    :
//                  Padding(
//                 padding: EdgeInsets.only(bottom: 14,left: 8,right: 8,top: 0),
//                 child: Center(
//                   child: SizedBox(
//                       height: h * 0.15,
//                       width: w * 0.25,
//                       child: Image.asset(defaultImage)
//                   ),
//                 )
//             )
//                 : Padding(
//               padding: EdgeInsets.only(bottom: 14,left: 8,right: 8,top: 10),
//               child: SizedBox(
//                   height: h * 0.15,
//                   child: Image.file(File(image))),
//             ),
//             Text("Note : Only Upload 2MB Size Images",style: TextStyle(fontSize: 11, color: Colors.black,fontFamily: Constant.fontsFamily)),
//             SizedBox(height: 5,),
//           ],
//         ),
//       ),
//     ),
//   );
// }

InkWell cameraFieldWithCustomization(BuildContext context,VoidCallback onTap,String title,String image,String defaultImage,{he}){
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0.0, 4.0)),
            ],
            borderRadius:
            BorderRadius.circular(FetchPixels.getPixelHeight(12))),
        child: Column(
          children: [
            // ListTile(
            //   leading:
            //   getAssetImage("Camera1.png", FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18),color: Colors.grey),
            //   title: Text(title,
            //     maxLines: 1,
            //     overflow: TextOverflow.ellipsis,
            //     style: TextStyle(
            //       color: textColor,
            //       fontWeight: FontWeight.w400,
            //       fontSize: 16,
            //       fontFamily: Constant.fontsFamily),),
            // ),
            Padding(
              padding:  EdgeInsets.only(top: FetchPixels.getPixelHeight(14),left: FetchPixels.getPixelHeight(18)),
              child: Row(
                children: [
                  getAssetImage("Camera1.png", FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18),color: Colors.grey),
                      SizedBox(width: FetchPixels.getPixelHeight(12)),
                      Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: Constant.fontsFamily),),
                ],
              ),
            ),
            image.isEmpty ? Padding(
                padding: EdgeInsets.only(bottom: 14,left: 8,right: 8,top: 0),
                child: Center(
                  child: SizedBox(
                    height: h * 0.15,
                    width: w * 0.25,
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                              height: h * 0.09,
                              width: w * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black54,)
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ) : Padding(
              padding: EdgeInsets.only(bottom: 14,left: 8,right: 8,top: 10),
              child: SizedBox(
                  height: h * 0.15,
                  child: Image.file(File(image))),
            ),
            Text("Note : Only Upload 2MB Size Images",style: TextStyle(fontSize: 11, color: Colors.black,fontFamily: Constant.fontsFamily)),
                SizedBox(height: 5,),
          ],
        ),
      ),
    ),
  );
}


Container detailCards(BuildContext context,VoidCallback onTap,String title,String leadingImage,
    String trailingText,Widget trailing ){
  return Container(
    height: FetchPixels.getPixelHeight(70),
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0.0, 4.0)),
      ],
    ),
    child: Center(
      child: ListTile(
        onTap: onTap,
        leading: Padding(
          padding: EdgeInsets.only(left: 8),
          child: getAssetImage(leadingImage, FetchPixels.getPixelHeight(20), FetchPixels.getPixelHeight(20),color: Colors.grey),
        ),
        title: getCustomFont(title, 14, Colors.black, 1),
        trailing: trailing

        /*Container(
          width: FetchPixels.getPixelWidth(110),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                getCustomFont(trailingText, 12, blueColor, 1,fontWeight: FontWeight.w700),
                trailing
              ],
            ),
          ),
        ),*/
      ),
    ),
  );
}


class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;

  CustomTextField({required this.hintText, required this.controller, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0.0, 4.0)),
            ],
            borderRadius:
            BorderRadius.circular(FetchPixels.getPixelHeight(12))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: FetchPixels.getPixelHeight(22),right: FetchPixels.getPixelWidth(2),
                  left: FetchPixels.getPixelWidth(15)), // Adjust this padding to align icon with text
              child: getAssetImage('information.png', FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18), color: Colors.grey),
            ),
            // SizedBox(width: 0),
            Expanded(
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: Constant.fontsFamily),
                decoration: InputDecoration(
                  hintText: hintText,
                    hintStyle: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: Constant.fontsFamily),
                  // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide.none
                  ),
                ),
                maxLines: null,
                minLines: 3, // Adjust according to your needs
              ),
            ),
            getHorSpace(FetchPixels.getPixelWidth(20))
            // Padding(
            //   padding: EdgeInsets.only(top: 25.0,right: FetchPixels.getPixelWidth(12),
            //       left: FetchPixels.getPixelWidth(18)), // Adjust this padding to align icon with text
            //   child: getAssetImage('information.png', FetchPixels.getPixelHeight(18), FetchPixels.getPixelHeight(18), color: Colors.grey),
            // ),
          ],
        ),
      ),
    );
  }
}

String convertTo12HourFormat(String timeString) {
  // Parse the 24-hour format time string into a DateTime object
  DateTime parsedTime = DateFormat('HH:mm:ss').parse(timeString);

  // Format the DateTime object into 12-hour format with AM/PM
  return DateFormat('hh:mm a').format(parsedTime);
}

TimeOfDay convertStringToTimeOfDay(String timeString) {
  DateTime parsedTime = DateFormat('HH:mm:ss').parse(timeString);
  return TimeOfDay.fromDateTime(parsedTime);
}

// Future<File> downloadImage(String url) async {
//
//   final response = await http.get(Uri.parse(url));
//   final directory = await getApplicationDocumentsDirectory();
//   final file = File(join(directory.path, 'downloaded_image.jpg'));
//   await file.writeAsBytes(response.bodyBytes);
//   return file;
// }
