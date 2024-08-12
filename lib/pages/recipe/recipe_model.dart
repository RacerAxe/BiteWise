import '/flutter_flow/flutter_flow_util.dart';
import 'recipe_widget.dart' show RecipeWidget;
import 'package:flutter/material.dart';

class RecipeModel extends FlutterFlowModel<RecipeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Gemini - Text From Image] action in btn_regenerate widget.
  String? recipeDataStr;
  // Stores action output result for [Custom Action - generateImage] action in btn_regenerate widget.
  String? outputIMG;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
