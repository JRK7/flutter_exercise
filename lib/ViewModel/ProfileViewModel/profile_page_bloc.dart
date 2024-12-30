import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../Model/profile_meenu_item.dart';
import '../../Utils/constant.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc() : super(ProfilePageState()) {
    on<ProfilePageEvent>((event, emit) {
      dynamic json = [
        {'image': Icons.language, 'content': CommonConstant.languagePreference},
        {
          'image': Icons.fire_truck_rounded,
          "title": CommonConstant.tradelingServices,
          'content': CommonConstant.tradelingServices
        },
        {
          "title": CommonConstant.helpSupport,
          'image': Icons.contact_support_outlined,
          'content': CommonConstant.contact_us
        },
        {'image': Icons.call, 'content': CommonConstant.call_us},
        {'image': Icons.account_box_outlined, 'content': CommonConstant.about},
      ];
      List<ProfileMenuItem> menuItem = json.map<ProfileMenuItem>((item) {
        return ProfileMenuItem.fromJson(item);
      }).toList();

      emit(ProfilePageInitial(menuItem: menuItem));
    });
  }
}
