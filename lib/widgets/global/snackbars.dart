 // ignore_for_file: non_constant_identifier_names

 import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

MySnackBar({state,title,msg}){
  return SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: title??'Snackbar',
                    message:
                        msg??'Snack Message',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: state??ContentType.success,
                  ),
                );
}