import 'package:flutter/material.dart';

enum ViewModelState {
  loading('loading'),
  ready('ready'),
  error('error');

  final String state;

  const ViewModelState(this.state);

  bool get isLoading => this == ViewModelState.loading;
  bool get isReady => this == ViewModelState.ready;
  bool get isError => this == ViewModelState.error;
}

class BaseViewModel extends ChangeNotifier {
  ViewModelState _state = ViewModelState.loading;

  ViewModelState get state => _state;

  void setState(ViewModelState state) {
    _state = state;
    notifyListeners();
  }
}
