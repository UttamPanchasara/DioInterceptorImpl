import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:interceptor_impl/base/view_state.dart';
import 'package:interceptor_impl/data/repos/api_repository.dart';

class UserProfilePresenter {
  final StreamController<ViewState> _controller = StreamController.broadcast();

  Stream<ViewState> get getUserDataStream => _controller.stream;

  void getUser() {
    _controller.add(ViewState.loading());
    ApiRepository().getUser().then((value) {
      _controller.add(ViewState.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }

      _controller.add(ViewState.error('Something went wrong'));
    });
  }
}
