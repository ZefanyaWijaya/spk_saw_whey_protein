import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'layout_manager_state.dart';

class LayoutManagerCubit extends Cubit<LayoutManagerState> {
  LayoutManagerCubit() : super(const LayoutManagerState.unknown());

  void updateLayoutState(BoxConstraints constraints) {
    if (constraints.maxWidth > 920) {
      emit(LayoutManagerState.desktop(
        windowSize: Size(constraints.maxWidth, constraints.maxHeight),
      ));
    } else if (constraints.maxWidth < 920 && constraints.maxWidth > 650) {
      emit(LayoutManagerState.tablet(
          windowSize: Size(constraints.maxWidth, constraints.maxHeight)));
    } else if (constraints.maxWidth < 650) {
      emit(LayoutManagerState.phone(
          windowSize: Size(constraints.maxWidth, constraints.maxHeight)));
    }
  }
}