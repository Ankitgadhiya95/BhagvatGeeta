class JsonModel {
  final String? chapter_number;
  final String? verses_count;
  final String? translation;
  final MeaningModel? meaning;
  final SummaryModel? summary;
  final List<SlocksModel>? slocksList;

  JsonModel(
      {required this.chapter_number,
      required this.translation,
      required this.verses_count,
      required this.meaning,
      required this.summary,
      required this.slocksList});

  factory JsonModel.fromJson(Map json) {
    return JsonModel(
        chapter_number: json['chapter_number'],
        translation: json['translation'],
        verses_count: json['verses_count'],
        meaning: MeaningModel.fromJson(json['meaning']),
        summary: SummaryModel.fromJson(json['summary']),
        slocksList: List<SlocksModel>.from(
            json["slocks"].map((x) => SlocksModel.fromJson(x))));
  }
}

class MeaningModel {
  final String? en;

  MeaningModel({required this.en});

  factory MeaningModel.fromJson(Map map) {
    return MeaningModel(
      en: map['en'],
    );
  }
}

class SummaryModel {
  final String? en;

  SummaryModel({required this.en});

  factory SummaryModel.fromJson(Map map) {
    return SummaryModel(
      en: map['en'],
    );
  }
}

class SlocksModel {
  final bool? favourite;
  final String? shlok_img;
  final String? shlok_no;
  final String? shlok_name;
  final String? meaning;
  final String? summary;

  SlocksModel({
    required this.favourite,
    required this.shlok_name,
    required this.meaning,
    required this.summary,
    required this.shlok_img,
    required this.shlok_no,
  });

  factory SlocksModel.fromJson(Map map) {
    return SlocksModel(
        shlok_name: map['shlok_name'],
        meaning: map['meaning'],
        summary: map['summary'],
        shlok_img: map['shlok_img'],
        shlok_no: map['shlok_no'],
        favourite: map['favourite']);
  }
}
