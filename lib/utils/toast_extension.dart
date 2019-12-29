import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

extension ToastExtension on Widget {
  void showLoading() {
    BotToast.showLoading();
  }

  void hideLoading() {
    BotToast.closeAllLoading();
  }

  void toast(String message) {
    BotToast.showText(text: message);
  }

  void toastError(int code, String message) {
    toast('[$code]$message');
  }
}
