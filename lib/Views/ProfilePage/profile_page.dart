import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/Views/CustomViews/CustomText.dart';
import 'package:flutter_exercise/Views/CustomViews/app_bar.dart';

import '../../Utils/constant.dart';
import '../../ViewModel/ProfileViewModel/profile_page_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: profileAppBar(context),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _loginRegisterWidget(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (ctx, item) => BlocProvider(
                    create: (context) =>
                        ProfilePageBloc()..add(ProfilePageEvent()),
                    child: _buildListTile(),
                  ),
                  itemCount: 1,
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildListTile() {
    return BlocBuilder<ProfilePageBloc, ProfilePageState>(
      builder: (context, state) {
        if (state is ProfilePageInitial) {
          List<Widget> containers = state.menuItem.map((profileMenuItem) {
            Widget titleContainer = profileMenuItem.title != null
                ? Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 50,
                    color: Colors.grey.shade200,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        title: profileMenuItem.title,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : const SizedBox();
            return Column(
              children: [
                titleContainer,
                Container(
                  // padding: EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 0.5, color: Colors.grey.shade300)),
                  child: ListTile(
                    leading: Icon(
                      profileMenuItem.imageName,
                    ), // Image on the left
                    title: CustomText(
                      title: profileMenuItem.content,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      textColor: const Color(0xFF356C88),
                    ), // Title of the cell
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 20), // Arrow icon on the right
                    onTap: () {
                      // Handle the tap event (e.g., navigate to another screen)
                      print('Item tapped');
                    },
                  ),
                ),
              ],
            );
          }).toList();

          // return ListView.builder(
          //     itemBuilder: (ctx, item) => Column(
          //           children: containers,
          //         ));
          return Column(
            children: containers,
          );
        }
        return const SizedBox();
      },
    );
  }

  Padding _loginRegisterWidget() {
    double buttonHeight = 45;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: buttonHeight,
              width: double.infinity,
              color: const Color(0xFFF06220),
              child: Center(
                child: CustomText(
                  title: CommonConstant.login.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: buttonHeight,
              width: double.infinity,
              color: const Color(0xff022c3a),
              child: Center(
                child: CustomText(
                    title: CommonConstant.register.toUpperCase(),
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
