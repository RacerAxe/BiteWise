import '/flutter_flow/flutter_flow_util.dart';
import 'enter_ingredients_widget.dart' show EnterIngredientsWidget;
import 'package:flutter/material.dart';

class EnterIngredientsModel extends FlutterFlowModel<EnterIngredientsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PrepTime widget.
  FocusNode? prepTimeFocusNode;
  TextEditingController? prepTimeTextController;
  String? Function(BuildContext, String?)? prepTimeTextControllerValidator;
  // State field(s) for CookTime widget.
  FocusNode? cookTimeFocusNode;
  TextEditingController? cookTimeTextController;
  String? Function(BuildContext, String?)? cookTimeTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for InputIngredients widget.
  FocusNode? inputIngredientsFocusNode;
  TextEditingController? inputIngredientsTextController;
  String? Function(BuildContext, String?)?
      inputIngredientsTextControllerValidator;
  // Stores action output result for [Gemini - Text From Image] action in Button widget.
  String? recipeDataStr;
  // Stores action output result for [Custom Action - generateImage] action in Button widget.
  String? outputIMG;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    prepTimeFocusNode?.dispose();
    prepTimeTextController?.dispose();

    cookTimeFocusNode?.dispose();
    cookTimeTextController?.dispose();

    inputIngredientsFocusNode?.dispose();
    inputIngredientsTextController?.dispose();
  }
}
