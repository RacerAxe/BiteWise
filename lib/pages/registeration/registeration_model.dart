import '/flutter_flow/flutter_flow_util.dart';
import 'registeration_widget.dart' show RegisterationWidget;
import 'package:flutter/material.dart';

class RegisterationModel extends FlutterFlowModel<RegisterationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DisplayNameField widget.
  FocusNode? displayNameFieldFocusNode;
  TextEditingController? displayNameFieldTextController;
  String? Function(BuildContext, String?)?
      displayNameFieldTextControllerValidator;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordFieldVisibility = false;
  }

  @override
  void dispose() {
    displayNameFieldFocusNode?.dispose();
    displayNameFieldTextController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();
  }
}
