part of flutter_zeplin;

class ZeplinTextStyle {
  final String id;
  final int created;
  final String name;
  final String postscriptName;
  final String fontFamily;
  final double fontSize;
  final int fontWeight;
  final String fontStyle;
  final int fontStretch;
  final int lineHeight;
  final String textAlign;
  final int r;
  final int g;
  final int b;
  final double a;

  const ZeplinTextStyle({
    required this.id,
    required this.created,
    required this.name,
    required this.postscriptName,
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.fontStyle,
    required this.fontStretch,
    required this.lineHeight,
    required this.textAlign,
    required this.r,
    required this.g,
    required this.b,
    required this.a,
  });

  factory ZeplinTextStyle.fromMap(Map<String, dynamic> map) {
    return ZeplinTextStyle(
      id: map['id'] ?? '',
      created: map['created']?.toInt() ?? 0,
      name: map['name'] ?? '',
      postscriptName: map['postscriptName'] ?? '',
      fontFamily: map['fontFamily'] ?? '',
      fontSize: map['fontSize']?.toDouble() ?? 0,
      fontWeight: map['fontWeight']?.toInt() ?? 0,
      fontStyle: map['fontStyle'] ?? '',
      fontStretch: map['fontStretch']?.toInt() ?? 0,
      lineHeight: map['lineHeight']?.toInt() ?? 0,
      textAlign: map['textAlign'] ?? '',
      r: map['r']?.toInt() ?? 0,
      g: map['g']?.toInt() ?? 0,
      b: map['b']?.toInt() ?? 0,
      a: map['a']?.toDouble() ?? 0,
    );
  }

  TextStyle getTextStyle() {
    return TextStyle(
      color: Color.fromRGBO(r, g, b, a),
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fromIntWeight(fontWeight),
      fontStyle: fromStringStyle(fontStyle),
      height: lineHeight.toDouble(),
    );
  }

  FontStyle fromStringStyle(String style) {
    switch (style) {
      case 'normal':
        return FontStyle.normal;
      case 'italic':
        return FontStyle.italic;
      default:
        return FontStyle.normal;
    }
  }

  FontWeight fromIntWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }
}
