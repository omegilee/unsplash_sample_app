import 'dart:developer';

import '../../data/entity/result.dart';
import '../../domain/usecase.dart';

class SearchViewModel {
  String _query = "box";
  int _currentPage = 1;
  final List<Result> _items = List.empty(growable: true);

  Function(int itemCount)? responseLitener;

  Function()? onPageLoading;

  bool isEmptyItems() {
    return _items.isEmpty;
  }

  int getItemCount() {
    return _items.length;
  }

  void copyWith(SearchViewModel old) {
    void logMessage(String header, SearchViewModel model) {
      log("##### ${header} ######");
      log("query > ${model._query}");
      log("page > ${model._currentPage}");
      log("itemCount > ${model._items.length}");
    }

    _items.clear();
    _items.addAll(old._items);
    _query = old._query;
    _currentPage = old._currentPage;

    logMessage("copyWith old", old);
    logMessage("copyWith new", this);
  }

  Result? getItem(int index) {
    if (index < _items.length) {
      return _items[index];
    } else {
      return null;
    }
  }

  void firstPage({
    bool firstPage = false,
  }) {
    if (firstPage) {
      _currentPage = 1;
    }
  }

  void query(String query) {
    _query = query;
  }

  void requestPage() {
    onPageLoading?.call();
    getPhotos(_currentPage, _query).then((value) {
      log("response item : ${value?.length}");
      if (value != null && value.isNotEmpty) {
        if (_currentPage == 1) {
          _items.clear();
        }
        _items.addAll(value);
        _currentPage++;
        responseLitener?.call(_items.length);
      } else {
        responseLitener?.call(_items.length);
      }
    }).onError((error, stackTrace) {
      log("response onError : ${error}");
      responseLitener?.call(_items.length);
    });
  }
}
