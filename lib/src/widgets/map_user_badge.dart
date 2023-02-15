import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../models/login_user_model.dart';
import '../services/login_service.dart';

class MapUserBadge extends StatelessWidget {
  MapUserBadge({Key? key, this.isSelected = false}) : super(key: key);
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    final loginService = Provider.of<LoginService>(context, listen: false);
    LoginUserModel? _userModel = loginService.loggedInUserModel;
    String? userImg = _userModel != null ? _userModel.photoUrl : '';
    String? userName = _userModel != null ? _userModel.displayName : '';
    bool showMapUserBadge = userImg!.isNotEmpty && userName.isNotEmpty;

    return Visibility(
      visible: showMapUserBadge,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(left: 20, bottom: 10, right: 20, top: 10),
        decoration: BoxDecoration(
            color: this.isSelected ? AppColors.MAIN_COLOR : Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset.zero,
                  blurRadius: 10)
            ]),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: NetworkImage('$userImg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: this.isSelected ? Colors.white : AppColors.MAIN_COLOR,
                  width: 1,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$userName',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: this.isSelected ? Colors.white : Colors.grey,
                    ),
                  ),
                  Text(
                    'My Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          this.isSelected ? Colors.white : AppColors.MAIN_COLOR,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.location_pin,
              color: AppColors.MAIN_COLOR,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
