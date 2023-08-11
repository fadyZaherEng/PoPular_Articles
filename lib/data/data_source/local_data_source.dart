// ignore_for_file: constant_identifier_names

import 'package:most_popular_articales/data/network/error_handler.dart';
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/PopularArticlesResponse.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minute cache in millis

abstract class LocalDataSource {
  Future<PopularArticlesResponse> getHomeData();
  Future<void> saveHomeToCache(PopularArticlesResponse homeResponse);
  void clearCache();
  void removeFromCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = Map();
  @override
  Future<PopularArticlesResponse> getHomeData() async {
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      // return the response from cache
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }
  @override
  Future<void> saveHomeToCache(PopularArticlesResponse homeResponse) async {
    cacheMap[CACHE_HOME_KEY] = CachedItem(homeResponse);
  }
  @override
  void clearCache() {
    cacheMap.clear();
  }
  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;
  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
    // expirationTimeInMillis -> 60 sec
    // currentTimeInMillis -> 1:00:00
    // cacheTime -> 12:59:30
    // valid -> till 1:00:30
    return isValid;
  }
}