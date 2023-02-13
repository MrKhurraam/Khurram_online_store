
import 'package:flutter/cupertino.dart';
import 'package:khurram_store/src/models/login_user_model.dart';
import 'package:provider/provider.dart';

import '../services/login_service.dart';

class UserProfileHeader extends StatelessWidget {
   UserProfileHeader({Key? key, this.showProfilePic = true}) : super(key: key);
  bool showProfilePic;

  @override
  Widget build(BuildContext context) {
    final loginService =  Provider.of<LoginService>(context, listen: false);
    LoginUserModel? _userModel = loginService.loggedInUserModel;
    String? imgPath = _userModel != null? _userModel.photoUrl:'';

    return
      this.showProfilePic && imgPath!.length>0? Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      child: ClipOval(
        child: Image.network('$imgPath'),
      ),
    ):SizedBox(height: 40,width: 40,);
  }
}
