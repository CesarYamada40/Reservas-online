import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class EscolherdataModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for dataEntrada widget.
  FocusNode? datadeEntradaFocusNode;
  TextEditingController? datadeEntradaTextController;
  String? Function(BuildContext, String?)? datadeEntradaTextControllerValidator;

  // State field(s) for dataSaida widget.
  FocusNode? datasaidaFocusNode;
  TextEditingController? datasaidaTextController;
  String? Function(BuildContext, String?)? datasaidaTextControllerValidator;

  // State field(s) for hospedes widget.
  FocusNode? hospedesFocusNode;
  TextEditingController? hospedesTextController;
  String? Function(BuildContext, String?)? hospedesTextControllerValidator;

  // State field(s) for quartos widget.
  FocusNode? quartosFocusNode;
  TextEditingController? quartosTextController;
  String? Function(BuildContext, String?)? quartosTextControllerValidator;

  DateTime? datePicked1;
  DateTime? datePicked2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    datadeEntradaFocusNode?.dispose();
    datadeEntradaTextController?.dispose();

    datasaidaFocusNode?.dispose();
    datasaidaTextController?.dispose();

    hospedesFocusNode?.dispose();
    hospedesTextController?.dispose();

    quartosFocusNode?.dispose();
    quartosTextController?.dispose();
  }
}
