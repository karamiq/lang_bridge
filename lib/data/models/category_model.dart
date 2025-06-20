import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/services/clients/_clients.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

// Custom JsonConverter for CategoryEnum
class CategoryEnumConverter implements JsonConverter<CategoryEnum, String> {
  const CategoryEnumConverter();

  @override
  CategoryEnum fromJson(String json) {
    // Try PhraseEnum first
    try {
      return PhraseEnum.fromJson(json);
    } catch (_) {
      // If it fails, try WordEnum
      try {
        return WordEnum.fromJson(json);
      } catch (_) {
        // Default fallback
        return PhraseEnum.introduction;
      }
    }
  }

  @override
  String toJson(CategoryEnum object) => object.toJson();
}

@freezed
abstract class CategorynModel with _$CategorynModel {
  @JsonSerializable()
  const factory CategorynModel({
    required String id,
    required String english,
    required String arabic,
    required String arabicPronunciation,
    required String englishPronunciation,
    @CategoryEnumConverter() required CategoryEnum category,
    // Id get isarId => fastHash(id!);
  }) = _CategorynModel;

  factory CategorynModel.fromJson(Map<String, dynamic> json) => _$CategorynModelFromJson(json);
}

abstract class CategoryEnum {
  String get jsonValue;
  String toJson() => jsonValue;
  String name(BuildContext context);
}

@JsonEnum(alwaysCreate: true)
enum PhraseEnum implements CategoryEnum {
  @JsonValue('introduction')
  introduction,
  @JsonValue('greetings')
  greetings,
  @JsonValue('common_phrases')
  commonPhrases,
  @JsonValue('questions')
  questions,
  @JsonValue('directions')
  directions,
  @JsonValue('shopping')
  shopping,
  @JsonValue('food_and_drink')
  foodAndDrink,
  @JsonValue('travel')
  travel,
  @JsonValue('emergencies')
  emergencies;

  @override
  String name(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case PhraseEnum.introduction:
        return l10n.introduction;
      case PhraseEnum.greetings:
        return l10n.greetings;
      case PhraseEnum.commonPhrases:
        return l10n.common_phrases;
      case PhraseEnum.questions:
        return l10n.questions;
      case PhraseEnum.directions:
        return l10n.directions;
      case PhraseEnum.shopping:
        return l10n.shopping;
      case PhraseEnum.foodAndDrink:
        return l10n.food_and_drink;
      case PhraseEnum.travel:
        return l10n.travel;
      case PhraseEnum.emergencies:
        return l10n.emergencies;
    }
  }

  @override
  String get jsonValue {
    switch (this) {
      case PhraseEnum.introduction:
        return 'introduction';
      case PhraseEnum.greetings:
        return 'greetings';
      case PhraseEnum.commonPhrases:
        return 'common_phrases';
      case PhraseEnum.questions:
        return 'questions';
      case PhraseEnum.directions:
        return 'directions';
      case PhraseEnum.shopping:
        return 'shopping';
      case PhraseEnum.foodAndDrink:
        return 'food_and_drink';
      case PhraseEnum.travel:
        return 'travel';
      case PhraseEnum.emergencies:
        return 'emergencies';
    }
  }

  factory PhraseEnum.fromJson(String json) {
    return PhraseEnum.values.firstWhere(
      (e) => e.jsonValue == json,
      orElse: () => PhraseEnum.introduction,
    );
  }

  @override
  String toJson() {
    return jsonValue;
  }
}

@JsonEnum(alwaysCreate: true)
enum WordEnum implements CategoryEnum {
  @JsonValue('animals')
  animals,
  @JsonValue('colors')
  colors,
  @JsonValue('numbers')
  numbers,
  @JsonValue('family')
  family,
  @JsonValue('school')
  school,
  @JsonValue('food')
  food;

  @override
  String get jsonValue {
    switch (this) {
      case WordEnum.animals:
        return 'animals';
      case WordEnum.colors:
        return 'colors';
      case WordEnum.numbers:
        return 'numbers';
      case WordEnum.family:
        return 'family';
      case WordEnum.school:
        return 'school';
      case WordEnum.food:
        return 'food';
    }
  }

  factory WordEnum.fromJson(String json) {
    return WordEnum.values.firstWhere(
      (e) => e.jsonValue == json,
      orElse: () => WordEnum.animals,
    );
  }

  @override
  String toJson() {
    return jsonValue;
  }

  @override
  String name(BuildContext context) {
    throw UnimplementedError('WordEnum name is not in the context.l10n it\'s in the page itself');
  }
}

// 100 Essential Arabic-English Phrases Dataset
// Following the CategorynModel structure

final List<CategorynModel> essentialPhrases = [
  // INTRODUCTION (12 phrases)
  CategorynModel(
    id: "intro_001",
    english: "My name is",
    arabic: "اسمي",
    arabicPronunciation: "is-mee",
    englishPronunciation: "mai naym iz",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_002",
    english: "I am from",
    arabic: "أنا من",
    arabicPronunciation: "ana min",
    englishPronunciation: "ai æm frʌm",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_003",
    english: "I am learning Arabic",
    arabic: "أنا أتعلم العربية",
    arabicPronunciation: "ana ata-allam al-arabiyya",
    englishPronunciation: "ai æm lɜrnɪŋ ærəbɪk",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_004",
    english: "Nice to meet you",
    arabic: "تشرفنا بلقائك",
    arabicPronunciation: "tasharrafna bi-liqa-ik",
    englishPronunciation: "naɪs tu mit ju",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_005",
    english: "I work as",
    arabic: "أعمل كـ",
    arabicPronunciation: "a'mal ka",
    englishPronunciation: "ai wɜrk æz",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_006",
    english: "I am a student",
    arabic: "أنا طالب",
    arabicPronunciation: "ana talib",
    englishPronunciation: "ai æm ə studənt",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_007",
    english: "I live in",
    arabic: "أعيش في",
    arabicPronunciation: "a'eesh fee",
    englishPronunciation: "ai lɪv ɪn",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_008",
    english: "How old are you?",
    arabic: "كم عمرك؟",
    arabicPronunciation: "kam umruk?",
    englishPronunciation: "haʊ oʊld ɑr ju",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_009",
    english: "I am 25 years old",
    arabic: "عمري خمسة وعشرون سنة",
    arabicPronunciation: "umree khamsa wa-ishreen sana",
    englishPronunciation: "ai æm twɛnti faɪv jɪrz oʊld",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_010",
    english: "What is your job?",
    arabic: "ما هو عملك؟",
    arabicPronunciation: "ma huwa amalak?",
    englishPronunciation: "wʌt ɪz jʊr ʤɑb",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_011",
    english: "I am married",
    arabic: "أنا متزوج",
    arabicPronunciation: "ana mutazawwij",
    englishPronunciation: "ai æm mɛrid",
    category: PhraseEnum.introduction,
  ),
  CategorynModel(
    id: "intro_012",
    english: "I have children",
    arabic: "لدي أطفال",
    arabicPronunciation: "ladayya atfal",
    englishPronunciation: "ai hæv ʧɪldrən",
    category: PhraseEnum.introduction,
  ),

  // GREETINGS (15 phrases)
  CategorynModel(
    id: "greet_001",
    english: "Hello",
    arabic: "مرحبا",
    arabicPronunciation: "marhaban",
    englishPronunciation: "həloʊ",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_002",
    english: "Peace be upon you",
    arabic: "السلام عليكم",
    arabicPronunciation: "as-salamu alaykum",
    englishPronunciation: "pis bi əpɑn ju",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_003",
    english: "And upon you peace",
    arabic: "وعليكم السلام",
    arabicPronunciation: "wa alaykumu as-salam",
    englishPronunciation: "ænd əpɑn ju pis",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_004",
    english: "Good morning",
    arabic: "صباح الخير",
    arabicPronunciation: "sabah al-khayr",
    englishPronunciation: "gʊd mɔrnɪŋ",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_005",
    english: "Good evening",
    arabic: "مساء الخير",
    arabicPronunciation: "masa al-khayr",
    englishPronunciation: "gʊd ivnɪŋ",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_006",
    english: "Good night",
    arabic: "تصبح على خير",
    arabicPronunciation: "tusbih ala khayr",
    englishPronunciation: "gʊd naɪt",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_007",
    english: "How are you?",
    arabic: "كيف حالك؟",
    arabicPronunciation: "kayf halak?",
    englishPronunciation: "haʊ ɑr ju",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_008",
    english: "I am fine",
    arabic: "أنا بخير",
    arabicPronunciation: "ana bi-khayr",
    englishPronunciation: "ai æm faɪn",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_009",
    english: "Thank God",
    arabic: "الحمد لله",
    arabicPronunciation: "al-hamdu lillah",
    englishPronunciation: "θæŋk gɑd",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_010",
    english: "Welcome",
    arabic: "أهلا وسهلا",
    arabicPronunciation: "ahlan wa sahlan",
    englishPronunciation: "wɛlkəm",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_011",
    english: "Goodbye",
    arabic: "مع السلامة",
    arabicPronunciation: "ma'a as-salama",
    englishPronunciation: "gʊdbaɪ",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_012",
    english: "See you later",
    arabic: "أراك لاحقا",
    arabicPronunciation: "araka lahiqan",
    englishPronunciation: "si ju leɪtər",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_013",
    english: "Have a good day",
    arabic: "يوم سعيد",
    arabicPronunciation: "yawm sa'eed",
    englishPronunciation: "hæv ə gʊd deɪ",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_014",
    english: "Take care",
    arabic: "اعتن بنفسك",
    arabicPronunciation: "i'tanee bi-nafsak",
    englishPronunciation: "teɪk kɛr",
    category: PhraseEnum.greetings,
  ),
  CategorynModel(
    id: "greet_015",
    english: "Long time no see",
    arabic: "لم أرك منذ وقت طويل",
    arabicPronunciation: "lam araka mundhu waqt taweel",
    englishPronunciation: "lɔŋ taɪm noʊ si",
    category: PhraseEnum.greetings,
  ),

  // COMMON PHRASES (15 phrases)
  CategorynModel(
    id: "common_001",
    english: "Please",
    arabic: "من فضلك",
    arabicPronunciation: "min fadlak",
    englishPronunciation: "pliz",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_002",
    english: "Thank you",
    arabic: "شكرا",
    arabicPronunciation: "shukran",
    englishPronunciation: "θæŋk ju",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_003",
    english: "You're welcome",
    arabic: "عفوا",
    arabicPronunciation: "afwan",
    englishPronunciation: "jʊr wɛlkəm",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_004",
    english: "Excuse me",
    arabic: "اعذرني",
    arabicPronunciation: "i'dhurnee",
    englishPronunciation: "ɪkskjuz mi",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_005",
    english: "I'm sorry",
    arabic: "أنا آسف",
    arabicPronunciation: "ana asif",
    englishPronunciation: "aɪm sɔri",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_006",
    english: "Yes",
    arabic: "نعم",
    arabicPronunciation: "na'am",
    englishPronunciation: "jɛs",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_007",
    english: "No",
    arabic: "لا",
    arabicPronunciation: "la",
    englishPronunciation: "noʊ",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_008",
    english: "I don't understand",
    arabic: "لا أفهم",
    arabicPronunciation: "la afham",
    englishPronunciation: "ai doʊnt ʌndərstænd",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_009",
    english: "Can you repeat?",
    arabic: "هل يمكنك الإعادة؟",
    arabicPronunciation: "hal yumkinuka al-i'ada?",
    englishPronunciation: "kæn ju rɪpit",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_010",
    english: "I don't know",
    arabic: "لا أعرف",
    arabicPronunciation: "la a'rif",
    englishPronunciation: "ai doʊnt noʊ",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_011",
    english: "Help me",
    arabic: "ساعدني",
    arabicPronunciation: "sa'idnee",
    englishPronunciation: "hɛlp mi",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_012",
    english: "No problem",
    arabic: "لا مشكلة",
    arabicPronunciation: "la mushkila",
    englishPronunciation: "noʊ prɑbləm",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_013",
    english: "God willing",
    arabic: "إن شاء الله",
    arabicPronunciation: "in sha'allah",
    englishPronunciation: "gɑd wɪlɪŋ",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_014",
    english: "Congratulations",
    arabic: "مبروك",
    arabicPronunciation: "mabruk",
    englishPronunciation: "kənɡrætʃəleɪʃənz",
    category: PhraseEnum.commonPhrases,
  ),
  CategorynModel(
    id: "common_015",
    english: "Good luck",
    arabic: "حظ سعيد",
    arabicPronunciation: "hazz sa'eed",
    englishPronunciation: "gʊd lʌk",
    category: PhraseEnum.commonPhrases,
  ),

  // QUESTIONS (12 phrases)
  CategorynModel(
    id: "quest_001",
    english: "What?",
    arabic: "ماذا؟",
    arabicPronunciation: "madha?",
    englishPronunciation: "wʌt",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_002",
    english: "Where?",
    arabic: "أين؟",
    arabicPronunciation: "ayna?",
    englishPronunciation: "wɛr",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_003",
    english: "When?",
    arabic: "متى؟",
    arabicPronunciation: "mata?",
    englishPronunciation: "wɛn",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_004",
    english: "Why?",
    arabic: "لماذا؟",
    arabicPronunciation: "limadha?",
    englishPronunciation: "waɪ",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_005",
    english: "How?",
    arabic: "كيف؟",
    arabicPronunciation: "kayf?",
    englishPronunciation: "haʊ",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_006",
    english: "Who?",
    arabic: "من؟",
    arabicPronunciation: "man?",
    englishPronunciation: "hu",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_007",
    english: "How much?",
    arabic: "كم؟",
    arabicPronunciation: "kam?",
    englishPronunciation: "haʊ mʌʧ",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_008",
    english: "What time is it?",
    arabic: "كم الساعة؟",
    arabicPronunciation: "kam as-sa'a?",
    englishPronunciation: "wʌt taɪm ɪz ɪt",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_009",
    english: "What is this?",
    arabic: "ما هذا؟",
    arabicPronunciation: "ma hadha?",
    englishPronunciation: "wʌt ɪz ðɪs",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_010",
    english: "Can you help me?",
    arabic: "هل يمكنك مساعدتي؟",
    arabicPronunciation: "hal yumkinuka musa'adatee?",
    englishPronunciation: "kæn ju hɛlp mi",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_011",
    english: "Do you speak English?",
    arabic: "هل تتكلم الإنجليزية؟",
    arabicPronunciation: "hal tatakallam al-injileeziyya?",
    englishPronunciation: "du ju spik ɪŋɡlɪʃ",
    category: PhraseEnum.questions,
  ),
  CategorynModel(
    id: "quest_012",
    english: "What is your name?",
    arabic: "ما اسمك؟",
    arabicPronunciation: "ma ismuka?",
    englishPronunciation: "wʌt ɪz jʊr neɪm",
    category: PhraseEnum.questions,
  ),

  // DIRECTIONS (10 phrases)
  CategorynModel(
    id: "dir_001",
    english: "Where is...?",
    arabic: "أين...؟",
    arabicPronunciation: "ayna...?",
    englishPronunciation: "wɛr ɪz",
    category: PhraseEnum.directions,
  ),
  CategorynModel(
    id: "dir_002",
    english: "Go straight",
    arabic: "اذهب مباشرة",
    arabicPronunciation: "idhhab mubashara",
    englishPronunciation: "ɡoʊ streɪt",
    category: PhraseEnum.directions,
  ),
  CategorynModel(
    id: "dir_003",
    english: "Turn right",
    arabic: "انعطف يمينا",
    arabicPronunciation: "in'atif yameenan",
    englishPronunciation: "tɜrn raɪt",
    category: PhraseEnum.directions,
  ),
  CategorynModel(
    id: "dir_004",
    english: "Turn left",
    arabic: "انعطف يسارا",
    arabicPronunciation: "in'atif yasaran",
    englishPronunciation: "tɜrn lɛft",
    category: PhraseEnum.directions,
  ),
  CategorynModel(
    id: "dir_005",
    english: "It's near",
    arabic: "إنه قريب",
    arabicPronunciation: "innahu qareeb",
    englishPronunciation: "ɪts nɪr",
    category: PhraseEnum.directions,
  ),
  CategorynModel(
    id: "dir_006",
    english: "It's far",
    arabic: "إنه بعيد",
    arabicPronunciation: "innahu ba'eed",
    englishPronunciation: "ɪts fɑr",
    category: PhraseEnum.directions,
  ),
  CategorynModel(
    id: "dir_007",
    english: "Stop here",
    arabic: "توقف هنا",
    arabicPronunciation: "tawaqqaf huna",
    englishPronunciation: "stɑp hɪr",
    category: PhraseEnum.directions,
  ),
  CategorynModel(
    id: "dir_008",
    english: "I am lost",
    arabic: "أنا تائه",
    arabicPronunciation: "ana ta'ih",
    englishPronunciation: "ai æm lɔst",
    category: PhraseEnum.directions,
  ),
  CategorynModel(
    id: "dir_009",
    english: "Can you show me the way?",
    arabic: "هل يمكنك أن تدلني على الطريق؟",
    arabicPronunciation: "hal yumkinuka an tadullanee ala at-tareeq?",
    englishPronunciation: "kæn ju ʃoʊ mi ðə weɪ",
    category: PhraseEnum.directions,
  ),
  CategorynModel(
    id: "dir_010",
    english: "Take me to...",
    arabic: "خذني إلى...",
    arabicPronunciation: "khudhni ila...",
    englishPronunciation: "teɪk mi tu",
    category: PhraseEnum.directions,
  ),

  // SHOPPING (10 phrases)
  CategorynModel(
    id: "shop_001",
    english: "How much does this cost?",
    arabic: "كم يكلف هذا؟",
    arabicPronunciation: "kam yukaliff hadha?",
    englishPronunciation: "haʊ mʌʧ dʌz ðɪs kɔst",
    category: PhraseEnum.shopping,
  ),
  CategorynModel(
    id: "shop_002",
    english: "It's expensive",
    arabic: "إنه غالي",
    arabicPronunciation: "innahu ghalee",
    englishPronunciation: "ɪts ɪkspɛnsɪv",
    category: PhraseEnum.shopping,
  ),
  CategorynModel(
    id: "shop_003",
    english: "It's cheap",
    arabic: "إنه رخيص",
    arabicPronunciation: "innahu rakhees",
    englishPronunciation: "ɪts ʧip",
    category: PhraseEnum.shopping,
  ),
  CategorynModel(
    id: "shop_004",
    english: "I want to buy",
    arabic: "أريد أن أشتري",
    arabicPronunciation: "ureed an ashtaree",
    englishPronunciation: "ai wɑnt tu baɪ",
    category: PhraseEnum.shopping,
  ),
  CategorynModel(
    id: "shop_005",
    english: "Do you have...?",
    arabic: "هل لديك...؟",
    arabicPronunciation: "hal ladayka...?",
    englishPronunciation: "du ju hæv",
    category: PhraseEnum.shopping,
  ),
  CategorynModel(
    id: "shop_006",
    english: "I'll take it",
    arabic: "سآخذه",
    arabicPronunciation: "sa-akhudhuh",
    englishPronunciation: "aɪl teɪk ɪt",
    category: PhraseEnum.shopping,
  ),
  CategorynModel(
    id: "shop_007",
    english: "Can you give me a discount?",
    arabic: "هل يمكنك إعطائي خصم؟",
    arabicPronunciation: "hal yumkinuka i'ta'ee khasm?",
    englishPronunciation: "kæn ju ɡɪv mi ə dɪskaʊnt",
    category: PhraseEnum.shopping,
  ),
  CategorynModel(
    id: "shop_008",
    english: "Where is the cashier?",
    arabic: "أين أمين الصندوق؟",
    arabicPronunciation: "ayna ameen as-sunduq?",
    englishPronunciation: "wɛr ɪz ðə kæʃɪr",
    category: PhraseEnum.shopping,
  ),
  CategorynModel(
    id: "shop_009",
    english: "I'm just looking",
    arabic: "أنا أتطلع فقط",
    arabicPronunciation: "ana atattala'u faqat",
    englishPronunciation: "aɪm ʤʌst lʊkɪŋ",
    category: PhraseEnum.shopping,
  ),
  CategorynModel(
    id: "shop_010",
    english: "What size?",
    arabic: "أي مقاس؟",
    arabicPronunciation: "ayy miqas?",
    englishPronunciation: "wʌt saɪz",
    category: PhraseEnum.shopping,
  ),

  // FOOD AND DRINK (12 phrases)
  CategorynModel(
    id: "food_001",
    english: "I'm hungry",
    arabic: "أنا جائع",
    arabicPronunciation: "ana ja'i",
    englishPronunciation: "aɪm hʌŋɡri",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_002",
    english: "I'm thirsty",
    arabic: "أنا عطشان",
    arabicPronunciation: "ana atshan",
    englishPronunciation: "aɪm θɜrsti",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_003",
    english: "I want water",
    arabic: "أريد ماء",
    arabicPronunciation: "ureed ma'",
    englishPronunciation: "ai wɑnt wɔtər",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_004",
    english: "The menu, please",
    arabic: "القائمة، من فضلك",
    arabicPronunciation: "al-qa'ima, min fadlak",
    englishPronunciation: "ðə mɛnju pliz",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_005",
    english: "I would like...",
    arabic: "أود أن...",
    arabicPronunciation: "uhibbu an...",
    englishPronunciation: "ai wʊd laɪk",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_006",
    english: "It's delicious",
    arabic: "إنه لذيذ",
    arabicPronunciation: "innahu ladheedh",
    englishPronunciation: "ɪts dɪlɪʃəs",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_007",
    english: "The bill, please",
    arabic: "الحساب، من فضلك",
    arabicPronunciation: "al-hisab, min fadlak",
    englishPronunciation: "ðə bɪl pliz",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_008",
    english: "I don't eat meat",
    arabic: "لا آكل اللحم",
    arabicPronunciation: "la akul al-lahm",
    englishPronunciation: "ai doʊnt it mit",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_009",
    english: "Is it spicy?",
    arabic: "هل هو حار؟",
    arabicPronunciation: "hal huwa harr?",
    englishPronunciation: "ɪz ɪt spaɪsi",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_010",
    english: "Coffee",
    arabic: "قهوة",
    arabicPronunciation: "qahwa",
    englishPronunciation: "kɔfi",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_011",
    english: "Tea",
    arabic: "شاي",
    arabicPronunciation: "shay",
    englishPronunciation: "ti",
    category: PhraseEnum.foodAndDrink,
  ),
  CategorynModel(
    id: "food_012",
    english: "I'm full",
    arabic: "أنا شبعان",
    arabicPronunciation: "ana shab'an",
    englishPronunciation: "aɪm fʊl",
    category: PhraseEnum.foodAndDrink,
  ),

  // TRAVEL (8 phrases)
  CategorynModel(
    id: "travel_001",
    english: "Where is the airport?",
    arabic: "أين المطار؟",
    arabicPronunciation: "ayna al-matar?",
    englishPronunciation: "wɛr ɪz ðə ɛrpɔrt",
    category: PhraseEnum.travel,
  ),
  CategorynModel(
    id: "travel_002",
    english: "I need a taxi",
    arabic: "أحتاج تاكسي",
    arabicPronunciation: "ahtaj taksi",
    englishPronunciation: "ai nid ə tæksi",
    category: PhraseEnum.travel,
  ),
  CategorynModel(
    id: "travel_003",
    english: "Train station",
    arabic: "محطة القطار",
    arabicPronunciation: "mahattatu al-qitar",
    englishPronunciation: "treɪn steɪʃən",
    category: PhraseEnum.travel,
  ),
  CategorynModel(
    id: "travel_004",
    english: "Bus stop",
    arabic: "موقف الحافلة",
    arabicPronunciation: "mawqif al-hafila",
    englishPronunciation: "bʌs stɑp",
    category: PhraseEnum.travel,
  ),
  CategorynModel(
    id: "travel_005",
    english: "Hotel",
    arabic: "فندق",
    arabicPronunciation: "funduq",
    englishPronunciation: "hoʊtɛl",
    category: PhraseEnum.travel,
  ),
  CategorynModel(
    id: "travel_006",
    english: "I have a reservation",
    arabic: "لدي حجز",
    arabicPronunciation: "ladayya hajz",
    englishPronunciation: "ai hæv ə rɛzərveɪʃən",
    category: PhraseEnum.travel,
  ),
  CategorynModel(
    id: "travel_007",
    english: "Passport",
    arabic: "جواز سفر",
    arabicPronunciation: "jawaz safar",
    englishPronunciation: "pæspɔrt",
    category: PhraseEnum.travel,
  ),
  CategorynModel(
    id: "travel_008",
    english: "Ticket",
    arabic: "تذكرة",
    arabicPronunciation: "tadhkira",
    englishPronunciation: "tɪkɪt",
    category: PhraseEnum.travel,
  ),

  // EMERGENCIES (6 phrases)
  CategorynModel(
    id: "emergency_001",
    english: "Help!",
    arabic: "النجدة!",
    arabicPronunciation: "an-najda!",
    englishPronunciation: "hɛlp",
    category: PhraseEnum.emergencies,
  ),
  CategorynModel(
    id: "emergency_002",
    english: "Call the police",
    arabic: "اتصل بالشرطة",
    arabicPronunciation: "ittasil bi-ash-shurta",
    englishPronunciation: "kɔl ðə pəlis",
    category: PhraseEnum.emergencies,
  ),
  CategorynModel(
    id: "emergency_003",
    english: "I need a doctor",
    arabic: "أحتاج طبيب",
    arabicPronunciation: "ahtaj tabeeb",
    englishPronunciation: "ai nid ə dɑktər",
    category: PhraseEnum.emergencies,
  ),
  CategorynModel(
    id: "emergency_004",
    english: "Hospital",
    arabic: "مستشفى",
    arabicPronunciation: "mustashfa",
    englishPronunciation: "hɑspɪtəl",
    category: PhraseEnum.emergencies,
  ),
  CategorynModel(
    id: "emergency_005",
    english: "I'm sick",
    arabic: "أنا مريض",
    arabicPronunciation: "ana mareed",
    englishPronunciation: "aɪm sɪk",
    category: PhraseEnum.emergencies,
  ),
  CategorynModel(
    id: "emergency_006",
    english: "Fire!",
    arabic: "حريق!",
    arabicPronunciation: "hareeq!",
    englishPronunciation: "faɪər",
    category: PhraseEnum.emergencies,
  ),
];
