import 'package:flutter/material.dart';
import 'package:khurram_store/src/helpers/app_colors.dart';

class Dialogs {
  static SHOW_LOADING_DIALOG(BuildContext context, String title) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
              // height: 300,
              decoration: BoxDecoration(
                color: AppColors.MAIN_COLOR,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset.zero,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 5,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 150,
                    child: Text(
                      '$title',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
