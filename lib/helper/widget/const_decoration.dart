import 'package:flutter/material.dart';
import 'package:invoice_app/helper/constant/color_data.dart';

class AppDecoration {
  static BoxDecoration get txtFillPink800 => BoxDecoration(
    color: primaryColor,
  );
  static BoxDecoration get fillGray50 => BoxDecoration(
    color: ColorConstant.gray50,
  );
  static BoxDecoration get fillGreen600 => BoxDecoration(
    color: ColorConstant.green600,
  );
  static BoxDecoration get fillDeeppurple50 => BoxDecoration(
    color: Color(0XFFEFEFFF),
  );
  static BoxDecoration get fillRed => BoxDecoration(
    color: Color(0XFFFFEBF0),
  );

  static BoxDecoration get fillIndigo => BoxDecoration(
    color: Color(0XFF5757D8),
    borderRadius: BorderRadius.circular(28),
  );
  static BoxDecoration get fillPink => BoxDecoration(
    color: Color(0XFFED5A87),
    borderRadius: BorderRadius.circular(28),
  );

  static BoxDecoration get outlinePink8001 => BoxDecoration(
    color: ColorConstant.pink50,
    border: Border.all(
      color: ColorConstant.pink800,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
  static BoxDecoration get outlineGray3001 => BoxDecoration(
    border: Border.all(
      color: ColorConstant.gray300,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
  static BoxDecoration get outlinePink8002 => BoxDecoration(
    color: ColorConstant.gray50,
    border: Border.all(
      color: ColorConstant.pink800,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
  static BoxDecoration get outlinePink800 => BoxDecoration(
    border: Border.all(
      color: ColorConstant.pink800,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
  static BoxDecoration get outlineBlack9000f => BoxDecoration(
    color: ColorConstant.whiteA700,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.black9000f,
        blurRadius: getHorizontalSize(
          4,
        ),
        offset: Offset(
          0,
          0,
        ),
      ),
    ],
  );
  static BoxDecoration get fillPink50 => BoxDecoration(
    color: ColorConstant.pink50,
  );
  static BoxDecoration get fillRed100 => BoxDecoration(
    color: ColorConstant.red100,
  );
  static BoxDecoration get outlineGray300 => BoxDecoration(
    color: ColorConstant.whiteA700,
    border: Border(
      bottom: BorderSide(
        color: ColorConstant.gray300,
        width: getHorizontalSize(
          1,
        ),
      ),
    ),
  );
  static BoxDecoration get white => BoxDecoration(
    color: ColorConstant.whiteA700,
  );
  static BoxDecoration get fillGray6006c => BoxDecoration(
    color: ColorConstant.gray6006c,
  );
  static BoxDecoration get fillBlack90066 => BoxDecoration(
    color: ColorConstant.black90066,
  );
  static BoxDecoration get fillBlack90021 => BoxDecoration(
    color: ColorConstant.black90021,
  );
  static BoxDecoration get outlineBlack9000c => BoxDecoration(
    color: ColorConstant.whiteA700,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.black9000c,
        spreadRadius: getHorizontalSize(
          2,
        ),
        blurRadius: getHorizontalSize(
          2,
        ),
        offset: Offset(
          0,
          5,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray9000f => BoxDecoration(
    color: ColorConstant.whiteA700,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.gray9000f,

        blurRadius: getHorizontalSize(
          20,
        ),
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );
  static BoxDecoration get txtFillGray50 => BoxDecoration(
    color: ColorConstant.gray50,
  );
  static BoxDecoration get fillPink8006c => BoxDecoration(
    color: ColorConstant.pink8006c,
  );
  static BoxDecoration get fillPink800 => BoxDecoration(
    color: ColorConstant.pink800,
  );
  static BoxDecoration get txtOutlinePink800 => BoxDecoration(
    border: Border.all(
      color: ColorConstant.pink800,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
}

class BorderRadiusStyle {
  static BorderRadius customBorderTL32 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        32,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        32,
      ),
    ),
  );

  static BorderRadius txtCustomBorderTL16 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
  );

  static BorderRadius customBorderTL16 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
  );

  static BorderRadius customBorderTL8 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        8,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        8,
      ),
    ),
  );

  static BorderRadius txtCustomBorderTL161 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
  );

  static BorderRadius circleBorder29 = BorderRadius.circular(
    getHorizontalSize(
      29,
    ),
  );

  static BorderRadius roundedBorder19 = BorderRadius.circular(
    getHorizontalSize(
      19,
    ),
  );

  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getVerticalSize(
      16,
    ),
  );

  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius circleBorder45 = BorderRadius.circular(
    getHorizontalSize(
      45,
    ),
  );

  static BorderRadius circleBorder25 = BorderRadius.circular(
    getHorizontalSize(
      25,
    ),
  );

  static BorderRadius circleBorder160 = BorderRadius.circular(
    getHorizontalSize(
      160,
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );

  static BorderRadius roundedBorder3 = BorderRadius.circular(
    getHorizontalSize(
      3,
    ),
  );

  static BorderRadius roundedBorder22 = BorderRadius.circular(
    getHorizontalSize(
      22,
    ),
  );

  static BorderRadius circleBorder54 = BorderRadius.circular(
    getHorizontalSize(
      54,
    ),
  );

  static BorderRadius txtCircleBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius customBorderTL162 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
  );

  static BorderRadius txtRoundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius customBorderTL161 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
  );

  static BorderRadius circleBorder94 = BorderRadius.circular(
    getHorizontalSize(
      94,
    ),
  );

  static BorderRadius circleBorder50 = BorderRadius.circular(
    getHorizontalSize(
      50,
    ),
  );

  static BorderRadius txtCircleBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;


class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color red700 = fromHex('#D93636');

  static Color red600 = fromHex('#E14545');

  static Color green600 = fromHex('#49ac26');

  static Color gray50 = fromHex('#fafafa');

  static Color green500 = fromHex('#3aad64');

  static Color red100 = fromHex('#feccd5');

  static Color black90021 = fromHex('#21000000');

  static Color black90066 = fromHex('#66000000');

  static Color pink8006c = fromHex('#6ca81650');

  static Color yellow500 = fromHex('#f7e632');

  static Color black900 = fromHex('#000000');

  static Color yellow800 = fromHex('#f7a521');

  static Color deepOrange700 = fromHex('#ef3a10');

  static Color gray6006c = fromHex('#6c808080');

  static Color pink800 = fromHex('#a81650');

  static Color gray9000f = fromHex('#0f202020');

  static Color gray600 = fromHex('#808080');

  static Color pink50 = fromHex('#f6e8ee');

  static Color red60001 = fromHex('#f22d42');

  static Color lime600 = fromHex('#a5d631');

  static Color blueGray400 = fromHex('#888888');

  static Color black9000f = fromHex('#0f000000');

  static Color black9000c = fromHex('#0c000000');

  static Color gray300 = fromHex('#e6e6e6');

  static Color gray60028 = fromHex('#28787880');

  static Color gray100 = fromHex('#f5f5f5');

  static Color green60002 = fromHex('#4aa54a');

  static Color green60001 = fromHex('#28a757');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray8004c = fromHex('#4c3c3c43');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;

get width {
  return size.width;
}

get height {
  num statusBar =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).viewPadding.top;
  num bottomBar = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
      .viewPadding
      .bottom;
  num screenHeight = size.height - statusBar - bottomBar;
  return screenHeight;
}

const num FIGMA_DESIGN_WIDTH = 428;
const num FIGMA_DESIGN_HEIGHT = 926;
const num FIGMA_DESIGN_STATUS_BAR = 47;

double getHorizontalSize(double px) {
  return ((px * width) / FIGMA_DESIGN_WIDTH);
}

double getVerticalSize(double px) {
  return ((px * height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR));
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

EdgeInsetsGeometry getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to get padding or margin responsively
EdgeInsetsGeometry getMarginOrPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left: getVerticalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    right: getVerticalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}