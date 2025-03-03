import 'dart:convert';

import 'package:her_future_coding_challenge/features/palindrome_checker/data/models/palindrome_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PalindromeLocalDataSource {
  Future<List<PalindromeModel>> getHistory();
  Future<void> saveHistory(List<PalindromeModel> history);
  Future<void> clearHistory();
}

class PalindromeLocalDataSourceImpl implements PalindromeLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _historyKey = "palindrome_history";

  PalindromeLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> clearHistory() async {
    await sharedPreferences.remove(_historyKey);
  }

  @override
  Future<void> saveHistory(List<PalindromeModel> history) async {
    final historyJsonString = json.encode(
      history.map((model) => model.toJson()).toList(),
    );
    await sharedPreferences.setString(_historyKey, historyJsonString);
  }

  @override
  Future<List<PalindromeModel>> getHistory() async {
    final historyJsonString = sharedPreferences.getString(_historyKey);
    if (historyJsonString == null) {
      return [];
    }
    final List<dynamic> decodedJson = json.decode(historyJsonString);
    return decodedJson.map((json) => PalindromeModel.fromJson(json)).toList();
  }
}
