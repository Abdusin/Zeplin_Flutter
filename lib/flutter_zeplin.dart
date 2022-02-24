library flutter_zeplin;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart' show Color, TextStyle, Colors, FontWeight, SizedBox, FontStyle, protected;

part 'zeplin_color.dart';
part 'zeplin_text_style.dart';
part 'zeplin_spacing.dart';

///
/// `Zeplin - Connection`
///
/// ```
/// var zeplinData = ZeplinFlutter.fetchFromZeplin(token: @token, projectId: @projectId);
/// ```
///
/// ```
/// zeplinData.getColor(@COLORNAME); //Color
/// zeplinData.getTextStyle(@STYLENAME); //TextStyle
/// zeplinData.boxSpace(@SPACERNAME); //SizedBox
/// zeplinData.horizontalSpace(@SPACERNAME); //SizedBox
/// zeplinData.verticalSpace(@SPACERNAME); //SizedBox
///```
///
class ZeplinFlutter {
  static const String zeplinBaseUrl = "https://api.zeplin.dev/v1/projects/";
  final Map<String, Color> colors;
  final Map<String, TextStyle> textStyles;
  final Map<String, SizedBox> spacing;
  static late ZeplinFlutter instance;
  const ZeplinFlutter._({
    required this.colors,
    required this.textStyles,
    required this.spacing,
  });

  Color getColor(String name) {
    return colors[name] ?? Colors.white;
  }

  TextStyle getTextStyle(String name) {
    return textStyles[name] ?? const TextStyle(color: Colors.white);
  }

  SizedBox boxSpace(String name) {
    return spacing['box_' + name] ?? const SizedBox.shrink();
  }

  SizedBox horizontalSpace(String name) {
    return spacing['horizontal_' + name] ?? const SizedBox.shrink();
  }

  SizedBox verticalSpace(String name) {
    return spacing['vertical_' + name] ?? const SizedBox.shrink();
  }

  static Future<ZeplinFlutter> fetchFromZeplin(
      {required token, required projectId, includeLinkedStyleguides = true}) async {
    var responses = await Future.wait([
      _getColors(token, projectId, includeLinkedStyleguides),
      _getTextStyles(token, projectId, includeLinkedStyleguides),
      _getSpacings(token, projectId, includeLinkedStyleguides)
    ]);

    instance = ZeplinFlutter._(
      colors: responses[0],
      textStyles: responses[1],
      spacing: responses[2],
    );

    return instance;
  }

  @protected
  static Future<Map<String, Color>> _getColors(token, projectId, includeLinkedStyleguides) async {
    var colorsUrl = "$zeplinBaseUrl/$projectId/colors?include_linked_styleguides=$includeLinkedStyleguides";
    var response = await http.get(Uri.parse(colorsUrl), headers: {
      "Authorization": "Bearer $token",
    });

    if (response.statusCode == 200) {
      var colors = (json.decode(response.body) as List).map((e) => ZeplinColor.fromMap(e));
      var datas = <String, Color>{};
      for (var color in colors) {
        datas[color.name] = color.color;
      }
      return datas;
    } else {
      throw Exception("Failed to get project");
    }
  }

  @protected
  static Future<Map<String, TextStyle>> _getTextStyles(token, projectId, includeLinkedStyleguides) async {
    var textStyleUrl = "$zeplinBaseUrl/$projectId/text_styles?include_linked_styleguides=$includeLinkedStyleguides";
    var response = await http.get(Uri.parse(textStyleUrl), headers: {
      "Authorization": "Bearer $token",
    });

    if (response.statusCode == 200) {
      var styles = (json.decode(response.body) as List).map((e) => ZeplinTextStyle.fromMap(e));
      var datas = <String, TextStyle>{};
      for (var value in styles) {
        datas[value.name] = value.getTextStyle();
      }
      return datas;
    } else {
      throw Exception("Failed to get project");
    }
  }

  @protected
  static Future _getSpacings(token, projectId, includeLinkedStyleguides) async {
    var spacingsUrl = "$zeplinBaseUrl/$projectId/spacing_tokens?include_linked_styleguides=$includeLinkedStyleguides";
    var response = await http.get(Uri.parse(spacingsUrl), headers: {
      "Authorization": "Bearer $token",
    });

    if (response.statusCode == 200) {
      var spacing = (json.decode(response.body) as List).map((e) => ZeplinSpace.fromMap(e));
      var datas = <String, SizedBox>{};
      for (var value in spacing) {
        datas['box_' + value.name] = value.box;
        datas['vertical_' + value.name] = value.verticalBox;
        datas['horizontal_' + value.name] = value.horizontalBox;
      }
      return datas;
    } else {
      throw Exception("Failed to get project");
    }
  }
}
