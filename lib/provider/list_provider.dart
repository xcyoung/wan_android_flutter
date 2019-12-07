import 'package:flutter/material.dart';

class ListProvider<T> extends ChangeNotifier {
  final List<T> _list = [];

  List<T> get list => _list;

  void add(T item) {
    _list.add(item);
    notifyListeners();
  }

  void addAll(List<T> items) {
    _list.addAll(items);
    notifyListeners();
  }

  void insert(int i, T data) {
    _list.insert(i, data);
    notifyListeners();
  }

  void insertAll(int i, List<T> data) {
    _list.insertAll(i, data);
    notifyListeners();
  }

  void remove(T data) {
    _list.remove(data);
    notifyListeners();
  }

  void removeAt(int i) {
    _list.removeAt(i);
    notifyListeners();
  }

  void clear() {
    _list.clear();
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
