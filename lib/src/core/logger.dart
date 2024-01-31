// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

abstract class AppLogger {
  @protected
  late Logger _logger;

  void d(dynamic message);
  void t(dynamic message);
  void i(dynamic message);
  void w(dynamic message);
  void e(dynamic message);
  void f(dynamic message);
}

// Singleton class to use the same logger instance across the project
class AppLoggerImpl extends AppLogger {
  static AppLoggerImpl? _instance;

  AppLoggerImpl._internal() {
    // instantiating the logger as a singleton
    _logger = Logger(printer: PrettyPrinter(methodCount: 0));
    _instance = this;
  }

  static AppLoggerImpl get instance {
    _instance ??= AppLoggerImpl._internal();
    return _instance!;
  }

  @override
  void d(message) {
    _logger.d(message);
  }

  @override
  void e(message) {
    _logger.e(message);
  }

  @override
  void f(message) {
    _logger.f(message);
  }

  @override
  void i(message) {
    _logger.i(message);
  }

  @override
  void t(message) {
    _logger.t(message);
  }

  @override
  void w(message) {
    _logger.w(message);
  }
}
