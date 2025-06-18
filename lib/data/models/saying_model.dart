import 'package:freezed_annotation/freezed_annotation.dart';

part 'saying_model.freezed.dart';
part 'saying_model.g.dart';

@freezed
abstract class SayingModel with _$SayingModel {
  const factory SayingModel({
    required String arabicSaying,
    required String englishSaying,
    required String arabicAuthor,
    required String englishAuthor,
  }) = _SayingModel;

  factory SayingModel.fromJson(Map<String, dynamic> json) => _$SayingModelFromJson(json);
}

final List<SayingModel> famousSayings = [
  // Arabic Proverb
  SayingModel(
    arabicSaying: "الصبر مفتاح الفرج",
    englishSaying: "Patience is the key to relief",
    arabicAuthor: "مثل عربي",
    englishAuthor: "Arabic Proverb",
  ),

  // Western Wisdom
  SayingModel(
    arabicSaying: "الحياة ما يحدث لك بينما أنت مشغول بوضع خطط أخرى",
    englishSaying: "Life is what happens to you while you're busy making other plans",
    arabicAuthor: "جون لينون",
    englishAuthor: "John Lennon",
  ),

  // Literary Quote
  SayingModel(
    arabicSaying: "أحب الناس إلي من رفع إلي عيوبي",
    englishSaying: "The most beloved people to me are those who point out my faults",
    arabicAuthor: "الإمام الشافعي",
    englishAuthor: "Imam Al-Shafi'i",
  ),

  // Philosophical Thought
  SayingModel(
    arabicSaying: "أعرف نفسك",
    englishSaying: "Know thyself",
    arabicAuthor: "سقراط",
    englishAuthor: "Socrates",
  ),

  // Arabic Wisdom
  SayingModel(
    arabicSaying: "العقل زينة والجهل شين",
    englishSaying: "Wisdom is an ornament, and ignorance is a disgrace",
    arabicAuthor: "الحكمة العربية",
    englishAuthor: "Arabic Wisdom",
  ),

  // Modern Quote
  SayingModel(
    arabicSaying: "كن التغيير الذي تريد أن تراه في العالم",
    englishSaying: "Be the change you wish to see in the world",
    arabicAuthor: "المهاتما غاندي",
    englishAuthor: "Mahatma Gandhi",
  ),

  // Authentic Hadith - Sahih Bukhari & Muslim
  SayingModel(
    arabicSaying: "إنما الأعمال بالنيات",
    englishSaying: "Actions are judged by intentions",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // Authentic Hadith - Sahih Bukhari & Muslim
  SayingModel(
    arabicSaying: "المسلم من سلم المسلمون من لسانه ويده",
    englishSaying: "A Muslim is one from whose tongue and hand other Muslims are safe",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // Authentic Hadith - Sahih Bukhari & Muslim
  SayingModel(
    arabicSaying: "لا يؤمن أحدكم حتى يحب لأخيه ما يحب لنفسه",
    englishSaying: "None of you believes until he loves for his brother what he loves for himself",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // Authentic Hadith - Sahih Bukhari & Muslim
  SayingModel(
    arabicSaying: "رضا الله من رضا الوالد وسخط الله من سخط الوالد",
    englishSaying:
        "Allah's pleasure comes from the father's pleasure, and Allah's displeasure comes from the father's displeasure",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // Authentic Hadith - Sunan Tirmidhi (Sahih)
  SayingModel(
    arabicSaying: "من لم يشكر الناس لم يشكر الله",
    englishSaying: "Whoever does not thank people does not thank Allah",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // Authentic Hadith - Sahih Bukhari & Muslim
  SayingModel(
    arabicSaying: "بُني الإسلام على خمس",
    englishSaying: "Islam is built upon five pillars",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // Authentic Hadith - Sahih Bukhari & Muslim
  SayingModel(
    arabicSaying: "من كان يؤمن بالله واليوم الآخر فليقل خيراً أو ليصمت",
    englishSaying: "Whoever believes in Allah and the Last Day should speak good or remain silent",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // Authentic Hadith - Sahih Muslim
  SayingModel(
    arabicSaying: "الدين النصيحة",
    englishSaying: "Religion is sincere advice",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // Authentic saying - Abu Bakr (RA)
  SayingModel(
    arabicSaying: "لست بتارك شيئاً كان رسول الله يعمل به إلا عملت به",
    englishSaying: "I will not abandon anything that the Messenger of Allah used to do",
    arabicAuthor: "أبو بكر الصديق رضي الله عنه",
    englishAuthor: "Abu Bakr as-Siddiq (RA)",
  ),

  // Authentic saying - Umar ibn al-Khattab (RA)
  SayingModel(
    arabicSaying: "حاسبوا أنفسكم قبل أن تحاسبوا",
    englishSaying: "Judge yourselves before you are judged",
    arabicAuthor: "عمر بن الخطاب رضي الله عنه",
    englishAuthor: "Umar ibn al-Khattab (RA)",
  ),

  // Authentic saying - Umar ibn al-Khattab (RA)
  SayingModel(
    arabicSaying: "من أراد الآخرة فليدع الدنيا",
    englishSaying: "Whoever wants the Hereafter should leave this world",
    arabicAuthor: "عمر بن الخطاب رضي الله عنه",
    englishAuthor: "Umar ibn al-Khattab (RA)",
  ),

  // Authentic saying - Uthman ibn Affan (RA)
  SayingModel(
    arabicSaying: "من صبر ظفر",
    englishSaying: "Whoever is patient will succeed",
    arabicAuthor: "عثمان بن عفان رضي الله عنه",
    englishAuthor: "Uthman ibn Affan (RA)",
  ),

  // Persian Wisdom
  SayingModel(
    arabicSaying: "الورد بين الأشواك يزهر",
    englishSaying: "A rose blooms among thorns",
    arabicAuthor: "الحكمة الفارسية",
    englishAuthor: "Persian Wisdom",
  ),

  // Arabic Poetry
  SayingModel(
    arabicSaying: "وإذا أراد الله نشر فضيلة طويت أتاح لها لسان حسود",
    englishSaying: "When Allah wants to spread a hidden virtue, He provides it with an envious tongue",
    arabicAuthor: "أحمد شوقي",
    englishAuthor: "Ahmed Shawqi",
  ),

  // Western Philosophy
  SayingModel(
    arabicSaying: "الحياة قصيرة والفن طويل",
    englishSaying: "Life is short, art is long",
    arabicAuthor: "أبقراط",
    englishAuthor: "Hippocrates",
  ),

  // Arabic Proverb
  SayingModel(
    arabicSaying: "من طلب العلا سهر الليالي",
    englishSaying: "Whoever seeks greatness stays awake through the nights",
    arabicAuthor: "مثل عربي",
    englishAuthor: "Arabic Proverb",
  ),

  // Literary Quote
  SayingModel(
    arabicSaying: "إذا كان الكلام من فضة فالسكوت من ذهب",
    englishSaying: "If speech is silver, then silence is gold",
    arabicAuthor: "الحكمة القديمة",
    englishAuthor: "Ancient Wisdom",
  ),

  // Modern Wisdom
  SayingModel(
    arabicSaying: "النجاح يتطلب عملاً شاقاً وصبراً وتفانياً",
    englishSaying: "Success requires hard work, patience, and dedication",
    arabicAuthor: "كولن باول",
    englishAuthor: "Colin Powell",
  ),

  // Sufi Wisdom
  SayingModel(
    arabicSaying: "القلب الذي يحب الله لا يشقى أبداً",
    englishSaying: "The heart that loves Allah is never miserable",
    arabicAuthor: "الجنيد البغدادي",
    englishAuthor: "Junayd al-Baghdadi",
  ),

  // Chinese Wisdom
  SayingModel(
    arabicSaying: "الرحلة الطويلة تبدأ بخطوة واحدة",
    englishSaying: "A journey of a thousand miles begins with a single step",
    arabicAuthor: "لاو تسو",
    englishAuthor: "Lao Tzu",
  ),

  // Arabic Literature
  SayingModel(
    arabicSaying: "أعز مكان في الدنيا سرج سابح وخير جليس في الزمان كتاب",
    englishSaying:
        "The most precious place in the world is the saddle of a racing horse, and the best companion in time is a book",
    arabicAuthor: "المتنبي",
    englishAuthor: "Al-Mutanabbi",
  ),

  // Authentic saying - Abu Dharr al-Ghifari (RA) - Sunan Tirmidhi
  SayingModel(
    arabicSaying: "اتق الله حيثما كنت وأتبع السيئة الحسنة تمحها",
    englishSaying: "Fear Allah wherever you are, and follow a bad deed with a good one to erase it",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // Greek Philosophy
  SayingModel(
    arabicSaying: "لا أعرف شيئاً إلا أنني لا أعرف شيئاً",
    englishSaying: "I know nothing except that I know nothing",
    arabicAuthor: "سقراط",
    englishAuthor: "Socrates",
  ),

  // Arabic Wisdom
  SayingModel(
    arabicSaying: "من كثر كلامه كثر خطؤه",
    englishSaying: "The more one speaks, the more one errs",
    arabicAuthor: "الحكمة العربية",
    englishAuthor: "Arabic Wisdom",
  ),

  // Shakespeare
  SayingModel(
    arabicSaying: "كن صادقاً مع نفسك فوق كل شيء",
    englishSaying: "To thine own self be true",
    arabicAuthor: "وليم شكسبير",
    englishAuthor: "William Shakespeare",
  ),

  // Arabic Proverb
  SayingModel(
    arabicSaying: "اطلبوا العلم من المهد إلى اللحد",
    englishSaying: "Seek knowledge from the cradle to the grave",
    arabicAuthor: "مثل عربي",
    englishAuthor: "Arabic Proverb",
  ),

  // Western Literature
  SayingModel(
    arabicSaying: "أفضل الأوقات لزراعة شجرة كان قبل عشرين عاماً، والوقت الثاني الأفضل هو الآن",
    englishSaying: "The best time to plant a tree was 20 years ago. The second best time is now",
    arabicAuthor: "مثل صيني",
    englishAuthor: "Chinese Proverb",
  ),

  // Philosophical
  SayingModel(
    arabicSaying: "الشك بداية الحكمة",
    englishSaying: "Doubt is the beginning of wisdom",
    arabicAuthor: "أرسطو",
    englishAuthor: "Aristotle",
  ),

  // Arabic Poetry
  SayingModel(
    arabicSaying: "لا تقل أصلي وفصلي أبداً إنما أصل الفتى ما قد حصل",
    englishSaying: "Don't speak of origin and lineage, for a man's true origin is what he has achieved",
    arabicAuthor: "ابن الوردي",
    englishAuthor: "Ibn al-Wardi",
  ),

  // Modern Quote
  SayingModel(
    arabicSaying: "الظلام لا يمكن أن يطرد الظلام، فقط النور يستطيع ذلك",
    englishSaying: "Darkness cannot drive out darkness; only light can do that",
    arabicAuthor: "مارتن لوثر كينغ",
    englishAuthor: "Martin Luther King Jr.",
  ),

  // Arabic Proverb
  SayingModel(
    arabicSaying: "الوقت كالسيف إن لم تقطعه قطعك",
    englishSaying: "Time is like a sword; if you don't cut it, it will cut you",
    arabicAuthor: "مثل عربي",
    englishAuthor: "Arabic Proverb",
  ),

  // Einstein
  SayingModel(
    arabicSaying: "الخيال أهم من المعرفة",
    englishSaying: "Imagination is more important than knowledge",
    arabicAuthor: "ألبرت أينشتاين",
    englishAuthor: "Albert Einstein",
  ),

  // Arabic Literature
  SayingModel(
    arabicSaying: "البخيل يبخل على نفسه في حياته ويسخو على ورثته بعد موته",
    englishSaying: "The miser is stingy with himself in life and generous to his heirs after death",
    arabicAuthor: "ابن خلدون",
    englishAuthor: "Ibn Khaldun",
  ),

  // Western Philosophy
  SayingModel(
    arabicSaying: "أفكر إذن أنا موجود",
    englishSaying: "I think, therefore I am",
    arabicAuthor: "رينيه ديكارت",
    englishAuthor: "René Descartes",
  ),

  // Arabic Wisdom
  SayingModel(
    arabicSaying: "خير الناس من نفع الناس",
    englishSaying: "The best of people are those who benefit others",
    arabicAuthor: "الحكمة العربية",
    englishAuthor: "Arabic Wisdom",
  ),

  // Literary Quote
  SayingModel(
    arabicSaying: "الحياة ليست عادلة، اعتد على ذلك",
    englishSaying: "Life is not fair; get used to it",
    arabicAuthor: "بيل غيتس",
    englishAuthor: "Bill Gates",
  ),

  // Islamic Scholar
  SayingModel(
    arabicSaying: "من قال لا أدري فقد أفتى",
    englishSaying: "Whoever says 'I don't know' has given a verdict",
    arabicAuthor: "الإمام مالك",
    englishAuthor: "Imam Malik",
  ),

  // Arabic Proverb
  SayingModel(
    arabicSaying: "درهم وقاية خير من قنطار علاج",
    englishSaying: "A dirham of prevention is better than a quintal of cure",
    arabicAuthor: "مثل عربي",
    englishAuthor: "Arabic Proverb",
  ),

  // Philosophical
  SayingModel(
    arabicSaying: "السعادة ليست هدفاً بل طريقة للعيش",
    englishSaying: "Happiness is not a goal but a way of living",
    arabicAuthor: "إيكهارت تول",
    englishAuthor: "Eckhart Tolle",
  ),

  // Authentic saying - Salman al-Farisi (RA)
  SayingModel(
    arabicSaying: "اعمل لدنياك كأنك تعيش أبداً واعمل لآخرتك كأنك تموت غداً",
    englishSaying:
        "Work for your worldly life as if you live forever, and work for your afterlife as if you die tomorrow",
    arabicAuthor: "سلمان الفارسي رضي الله عنه",
    englishAuthor: "Salman al-Farisi (RA)",
  ),

  // Arabic Poetry
  SayingModel(
    arabicSaying: "إذا المرء لم يدنس من اللؤم عرضه فكل رداء يرتديه جميل",
    englishSaying:
        "If a person does not stain his honor with baseness, then every garment he wears is beautiful",
    arabicAuthor: "السموأل",
    englishAuthor: "Al-Samaw'al",
  ),

  // Western Wisdom
  SayingModel(
    arabicSaying: "الحرية هي الحق في أن تقول للناس ما لا يريدون سماعه",
    englishSaying: "Freedom is the right to tell people what they do not want to hear",
    arabicAuthor: "جورج أورويل",
    englishAuthor: "George Orwell",
  ),

  // Islamic Wisdom
  SayingModel(
    arabicSaying: "الدنيا دار ممر لا دار مقر",
    englishSaying: "This world is a place of passage, not a place of residence",
    arabicAuthor: "الحسن البصري",
    englishAuthor: "Al-Hasan al-Basri",
  ),

  // Arabic Proverb
  SayingModel(
    arabicSaying: "العتاب قبل العقاب",
    englishSaying: "Reproach before punishment",
    arabicAuthor: "مثل عربي",
    englishAuthor: "Arabic Proverb",
  ),

  // Modern Quote
  SayingModel(
    arabicSaying: "النجاح هو الانتقال من فشل إلى فشل دون فقدان الحماس",
    englishSaying: "Success is going from failure to failure without losing your enthusiasm",
    arabicAuthor: "ونستون تشرشل",
    englishAuthor: "Winston Churchill",
  ),

  // Sufi Wisdom
  SayingModel(
    arabicSaying: "اصبر على مر الحق ولا تشرب من حلاوة الباطل",
    englishSaying: "Be patient with the bitterness of truth and do not drink from the sweetness of falsehood",
    arabicAuthor: "ابن عطاء الله السكندري",
    englishAuthor: "Ibn Ata Allah al-Iskandari",
  ),

  // Classical Literature
  SayingModel(
    arabicSaying: "لا تؤجل عمل اليوم إلى الغد",
    englishSaying: "Don't put off today's work until tomorrow",
    arabicAuthor: "بنجامين فرانكلين",
    englishAuthor: "Benjamin Franklin",
  ),

  // Arabic Wisdom
  SayingModel(
    arabicSaying: "من أراد أن يطاع فليطلب المستطاع",
    englishSaying: "Whoever wants to be obeyed should ask for what is possible",
    arabicAuthor: "الحكمة العربية",
    englishAuthor: "Arabic Wisdom",
  ),

  // Philosophical
  SayingModel(
    arabicSaying: "الإنسان محكوم عليه بالحرية",
    englishSaying: "Man is condemned to be free",
    arabicAuthor: "جان بول سارتر",
    englishAuthor: "Jean-Paul Sartre",
  ),

  // Arabic Literature
  SayingModel(
    arabicSaying: "من راقب الناس مات هماً",
    englishSaying: "Whoever watches people dies of worry",
    arabicAuthor: "ابن الجوزي",
    englishAuthor: "Ibn al-Jawzi",
  ),

  // Western Wisdom
  SayingModel(
    arabicSaying: "الصديق هو الشخص الذي يعرف أغنية قلبك ويستطيع أن يغنيها لك عندما تنسى كلماتها",
    englishSaying:
        "A friend is someone who knows the song in your heart and can sing it back to you when you have forgotten the words",
    arabicAuthor: "مجهول",
    englishAuthor: "Anonymous",
  ),

  // Arabic Proverb
  SayingModel(
    arabicSaying: "الحكمة ضالة المؤمن",
    englishSaying: "Wisdom is the lost property of the believer",
    arabicAuthor: "مثل عربي",
    englishAuthor: "Arabic Proverb",
  ),

  // Modern Philosophy
  SayingModel(
    arabicSaying: "الحياة تحدث لك، لا أنت تحدث للحياة",
    englishSaying: "Life happens to you, you don't happen to life",
    arabicAuthor: "ألان واتس",
    englishAuthor: "Alan Watts",
  ),

  // Arabic Poetry
  SayingModel(
    arabicSaying: "قل للذي بالعلم فاخر جاهلاً قد يحمل السيف من لا يحسن الضربا",
    englishSaying:
        "Tell the one who boasts of knowledge while ignorant: one may carry a sword without knowing how to strike",
    arabicAuthor: "الشافعي",
    englishAuthor: "Al-Shafi'i",
  ),
];

// Authentic sayings about the household of Prophet Muhammad ﷺ
// All sourced from Sahih Bukhari, Sahih Muslim, and other authentic Sunni collections
final List<SayingModel> authenticAhlulBaytSayings = [
  // About Fatimah (RA) - Sahih Bukhari
  SayingModel(
    arabicSaying: "فاطمة بضعة مني، فمن أغضبها أغضبني",
    englishSaying: "Fatimah is a part of me, and whoever makes her angry makes me angry",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // About Hassan and Husayn (RA) - Sunan Tirmidhi (Sahih)
  SayingModel(
    arabicSaying: "الحسن والحسين سيدا شباب أهل الجنة",
    englishSaying: "Hassan and Husayn are the masters of the youth of Paradise",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // About Ali (RA) - Sahih Muslim
  SayingModel(
    arabicSaying: "أنت مني وأنا منك",
    englishSaying: "You are from me and I am from you",
    arabicAuthor: "النبي محمد ﷺ (إلى علي)",
    englishAuthor: "Prophet Muhammad ﷺ (to Ali)",
  ),

  // About Husayn (RA) - Sunan Ibn Majah (Sahih)
  SayingModel(
    arabicSaying: "حسين مني وأنا من حسين، أحب الله من أحب حسيناً",
    englishSaying: "Husayn is from me and I am from Husayn. May Allah love whoever loves Husayn",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // About respect for the family - Authentic tradition
  SayingModel(
    arabicSaying: "أذكركم الله في أهل بيتي",
    englishSaying: "I remind you of Allah concerning my household",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // About Fatimah's status - Sahih Bukhari
  SayingModel(
    arabicSaying: "فاطمة سيدة نساء أهل الجنة",
    englishSaying: "Fatimah is the leader of the women of Paradise",
    arabicAuthor: "النبي محمد ﷺ",
    englishAuthor: "Prophet Muhammad ﷺ",
  ),

  // About children playing on the Prophet - Sahih sources
  SayingModel(
    arabicSaying: "دعهما فإنهما ريحانتاي من الدنيا",
    englishSaying: "Leave them, for they are my sweet basils in this world",
    arabicAuthor: "النبي محمد ﷺ (عن الحسن والحسين)",
    englishAuthor: "Prophet Muhammad ﷺ (about Hassan and Husayn)",
  ),

  // About loving the Prophet's family - Authentic
  SayingModel(
    arabicSaying: "من أحبني فليحب هذين",
    englishSaying: "Whoever loves me should love these two",
    arabicAuthor: "النبي محمد ﷺ (عن الحسن والحسين)",
    englishAuthor: "Prophet Muhammad ﷺ (about Hassan and Husayn)",
  ),
];
