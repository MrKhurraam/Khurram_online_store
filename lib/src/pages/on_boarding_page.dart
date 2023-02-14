import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import '../helpers/icon_helper.dart';
import '../helpers/utils.dart';
import '../models/on_boarding_content.dart';
import '../widgets/icon_font.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/theme_button.dart';
import 'category_list_pages.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<OnBoardingContent> _content = Utils.getOnboarding();
  late PageController _controller;
  int pageIndex = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                children: List.generate(
                  _content.length,
                  (index) => Container(
                    padding: EdgeInsets.only(left: 40,top: 40,right: 40,bottom: 20),
                    margin: EdgeInsets.only(
                        left: 40, right: 40, top: 40, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.MAIN_COLOR.withOpacity(0.3),
                          blurRadius: 20,
                          offset: Offset.zero,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconFont(
                                  color: AppColors.MAIN_COLOR,
                                  iconName: IconFontHelper.LOGO,
                                  size: 40,
                                ),
                              ),
                              Image.asset(
                                  'assets/imgs/${_content[index].img}.png'),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                '${_content[index].message}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.MAIN_COLOR,fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: index == _content.length - 1,
                          child: ThemeButton(
                            onClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryListPage()),
                              );
                            },
                            label: 'Enter Now!',
                            color: AppColors.DARK_GREEN,
                            highlight: AppColors.DARKER_GREEN,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _content.length,
                (index) => GestureDetector(
                  onTap: () {
                    _controller.animateTo(
                        MediaQuery.of(context).size.width * index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: AppColors.MAIN_COLOR,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            width: 6,
                            color: index == pageIndex
                                ? Color(0xFFC1E09E)
                                : Theme.of(context).canvasColor)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ThemeButton(
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryListPage()),
                );
              },
              label: 'Try Now',
            ),
          ],
        ),
      ),
    );
  }
}
