import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viacep/enums/page_types.dart';
import 'package:viacep/pages/cep/cep_page.dart';
import 'package:viacep/shared/widgets/custom_app_bar.dart';
import 'package:viacep/shared/widgets/custom_navibar.dart';
import 'package:viacep/shared/widgets/custom_navibar_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController =
      PageController(initialPage: PageTypes.ceps.index);
  int pagePosition = PageTypes.ceps.index;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (pos) {
          setState(() {
            pagePosition = pos;
          });
        },
        children: const [
          CepPage(),
        ],
      ),
      bottomNavigationBar: CustomNavibar(
        onTap: (value) {
          _pageController.jumpToPage(value);
        },
        items: const <Widget>[
          CustomNavibarItem(
            icon: Icons.home,
          ),
        ],
        index: pagePosition,
      ),
    );
  }
}
