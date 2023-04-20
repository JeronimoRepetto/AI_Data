import 'package:ai_data/features/ranking/data/model/ranking.dart';

class RankingHelper {
  static List<RankingModel> formatResult(String text) {
    List<String> splitText = text.split(RegExp(r'\d+\.'));
    List<RankingModel> rankingList = [];
    for (String item in splitText) {
      if (item.trim().isNotEmpty) {
        List<String> nameAndInfo = item.split(":");
        try {
          String name = nameAndInfo[0].trim();
          String info = nameAndInfo[1].trim();
          rankingList.add(RankingModel(name: name, info: info));
        } catch (error) {
          continue;
        }
      }
    }
    return rankingList;
  }
}
