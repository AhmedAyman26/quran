class ApIMushafModel {
  int? code;
  String? status;
  ApiData? data;

  ApIMushafModel({
    this.code,
    this.status,
    this.data,
  });

  factory ApIMushafModel.fromJson(Map<String, dynamic> json) => ApIMushafModel(
    code: json["code"],
    status: json["status"],
    data: json["data"] == null ? null : ApiData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data?.toJson(),
  };
}

class ApiData {
  List<ApiSurah>? surahs;
  Edition? edition;

  ApiData({
    this.surahs,
    this.edition,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) => ApiData(
    surahs: json["surahs"] == null ? [] : List<ApiSurah>.from(json["surahs"]!.map((x) => ApiSurah.fromJson(x))),
    edition: json["edition"] == null ? null : Edition.fromJson(json["edition"]),
  );

  Map<String, dynamic> toJson() => {
    "surahs": surahs == null ? [] : List<dynamic>.from(surahs!.map((x) => x.toJson())),
    "edition": edition?.toJson(),
  };
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
    identifier: json["identifier"],
    language: json["language"],
    name: json["name"],
    englishName: json["englishName"],
    format: json["format"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "language": language,
    "name": name,
    "englishName": englishName,
    "format": format,
    "type": type,
  };
}

class ApiSurah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<ApiAyah>? ayahs;

  ApiSurah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory ApiSurah.fromJson(Map<String, dynamic> json) => ApiSurah(
    number: json["number"],
    name: json["name"],
    englishName: json["englishName"],
    englishNameTranslation: json["englishNameTranslation"],
    revelationType: json["revelationType"]!,
    ayahs: json["ayahs"] == null ? [] : List<ApiAyah>.from(json["ayahs"]!.map((x) => ApiAyah.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "englishName": englishName,
    "englishNameTranslation": englishNameTranslation,
    "revelationType": revelationType,
    "ayahs": ayahs == null ? [] : List<dynamic>.from(ayahs!.map((x) => x.toJson())),
  };
}

class ApiAyah {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  ApiAyah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory ApiAyah.fromJson(Map<String, dynamic> json) => ApiAyah(
    number: json["number"],
    text: json["text"],
    numberInSurah: json["numberInSurah"],
    juz: json["juz"],
    manzil: json["manzil"],
    page: json["page"],
    ruku: json["ruku"],
    hizbQuarter: json["hizbQuarter"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "text": text,
    "numberInSurah": numberInSurah,
    "juz": juz,
    "manzil": manzil,
    "page": page,
    "ruku": ruku,
    "hizbQuarter": hizbQuarter,
    "sajda": sajda,
  };
}


