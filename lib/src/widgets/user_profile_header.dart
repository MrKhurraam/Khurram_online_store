import 'package:flutter/cupertino.dart';
import 'package:khurram_store/src/models/login_user_model.dart';
import 'package:provider/provider.dart';

import '../services/login_service.dart';

class UserProfileHeader extends StatelessWidget {
  UserProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginService>(builder: (context, loginService, child) {
      String imgPath = loginService.loggedInUserModel?.photoUrl ?? '';

      if (imgPath.length > 0) {
        return Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(10),
          child: ClipOval(
            child: Image.network('$imgPath'),
          ),
        );
      } else {
        return SizedBox(
          height: 40,
          width: 40,
        );
      }
    });
  }
}
