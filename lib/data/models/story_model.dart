import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/services/clients/_clients.dart';

part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
abstract class StoryModel with _$StoryModel {
  const StoryModel._();

  @jsonSerializable
  const factory StoryModel({
    required String id,
    required String titleEn,
    required String titleAr,
    required String contentEn,
    required String contentAr,
    required String descriptionEn, // ➕ English description
    required String descriptionAr, // ➕ Arabic description
    required EnglishLevelEnum level,
    required int duration,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) => _$StoryModelFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum EnglishLevelEnum {
  @JsonValue('beginner')
  beginner,
  @JsonValue('intermediate')
  intermediate,
  @JsonValue('advanced')
  advanced;

  String toJson() => _$EnglishLevelEnumEnumMap[this]!;

  factory EnglishLevelEnum.fromJson(String json) {
    return EnglishLevelEnum.values.firstWhere(
      (e) => e.toJson() == json,
      orElse: () => EnglishLevelEnum.beginner,
    );
  }

  String name(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case EnglishLevelEnum.beginner:
        return l10n.beginner;
      case EnglishLevelEnum.intermediate:
        return l10n.intermediate;
      case EnglishLevelEnum.advanced:
        return l10n.advanced;
    }
  }

  Color get color {
    switch (this) {
      case EnglishLevelEnum.beginner:
        return Colors.green.shade100;
      case EnglishLevelEnum.intermediate:
        return Colors.orange.shade100;
      case EnglishLevelEnum.advanced:
        return Colors.red.shade100;
    }
  }
}

// 30 Arabian & Islamic Stories
final List<StoryModel> arabianStories = [
  StoryModel(
    id: "13",
    titleEn: "Marco Polo’s Journey to the East",
    titleAr: "رحلة ماركو بولو إلى الشرق",
    level: EnglishLevelEnum.advanced,
    duration: 10,
    contentEn: """
In the late 13th century, a young Venetian merchant named Marco Polo set out on one of the most remarkable journeys in history. Accompanied by his father and uncle, Marco traveled from the canals of Venice across deserts, mountains, and vast plains, seeking trade and adventure.

Their route took them along the Silk Road, an ancient network of trade routes connecting Europe with Asia. Over years of travel, they crossed the harsh Gobi Desert, navigated treacherous mountain passes in the Pamirs, and traversed bustling caravan cities alive with merchants from all corners of the world.

In 1275, they finally reached the magnificent court of Kublai Khan, the Mongol Emperor of China. Marco quickly became a trusted envoy of the Khan, serving on missions throughout the vast empire.

He documented the wonders of the East — from the grandeur of palaces to the intricate systems of irrigation and the diversity of peoples and cultures. He marveled at the use of paper money, the intricate postal system, and the impressive infrastructure connecting distant cities.

After nearly two decades abroad, Marco Polo returned to Venice laden with exotic goods and stories that would captivate Europe for centuries. His accounts expanded Western knowledge and inspired generations of explorers, including Christopher Columbus.

Though some doubted the truth of his tales, Marco Polo’s journey remains a testament to human curiosity, endurance, and the power of cross-cultural exchange.

His story reminds us that exploration is not only about discovering new lands but about bridging worlds through understanding and sharing knowledge.
""",
    contentAr: """
في أواخر القرن الثالث عشر، انطلق تاجر شاب من البندقية يُدعى ماركو بولو في واحدة من أروع الرحلات في التاريخ. رافقه والده وعمه، سافر ماركو من قنوات البندقية عبر الصحارى والجبال والسهول الشاسعة، باحثاً عن التجارة والمغامرة.

أخذتهم رحلتهم عبر طريق الحرير، شبكة قديمة من طرق التجارة التي تربط أوروبا بآسيا. على مدى سنوات من السفر، عبروا صحراء جوبي القاسية، واجتازوا ممرات جبلية خطيرة في جبال بامير، وسافروا عبر مدن قافلة مزدهرة تعج بالتجار من جميع أنحاء العالم.

في عام 1275، وصلوا أخيراً إلى بلاط الخان الكبير، كوبلاي خان، إمبراطور المغول في الصين. أصبح ماركو بسرعة مبعوثاً موثوقاً لدى الخان، حيث خدم في مهمات في جميع أنحاء الإمبراطورية الشاسعة.

وثق عجائب الشرق — من روعة القصور إلى أنظمة الري المعقدة وتنوع الشعوب والثقافات. أُعجب باستخدام النقود الورقية، ونظام البريد المتقن، والبنية التحتية المذهلة التي تربط المدن البعيدة.

بعد ما يقرب من عقدين في الخارج، عاد ماركو بولو إلى البندقية محملاً بالبضائع الغريبة والقصص التي أسرت أوروبا لقرون. وسعت حساباته المعرفة الغربية وألهمت أجيالاً من المستكشفين، من بينهم كريستوفر كولومبوس.

على الرغم من أن البعض شكك في صحة قصصه، تظل رحلة ماركو بولو شهادة على الفضول البشري والصمود وقوة التبادل الثقافي.

تذكرنا قصته بأن الاستكشاف ليس فقط اكتشاف أراضٍ جديدة، بل هو بناء جسور بين العوالم من خلال الفهم وتبادل المعرفة.
""",
    descriptionEn:
        'The incredible travels of Marco Polo across Asia, expanding Western knowledge and inspiring future explorers.',
    descriptionAr:
        'الرحلات المذهلة لماركو بولو عبر آسيا، موسعة المعرفة الغربية وملهمة المستكشفين في المستقبل.',
  ),
  StoryModel(
    id: "16",
    titleEn: "The Great Spirit and the First People",
    titleAr: "الروح العظيمة والشعوب الأولى",
    level: EnglishLevelEnum.advanced,
    duration: 10,
    contentEn: """
Long ago, before the earth was as it is today, the Great Spirit watched over the vast wilderness. The world was wild and untamed, filled with rivers that ran like silver snakes, mountains that pierced the clouds, and forests that whispered ancient secrets.

The Great Spirit wished to bring harmony to the land and created the First People to live in balance with nature. These people were gifted with wisdom, respect, and a deep connection to the earth, sky, and animals.

The First People learned to listen to the wind, to understand the language of the birds, and to honor the spirits of the forests. They followed the cycles of the moon and the sun, planting and harvesting at the right times.

One day, a darkness came to the land — a force of greed and destruction that sought to tear apart the sacred balance. The animals grew fearful, and the rivers began to dry.

The Great Spirit called upon the bravest among the First People to rise and protect the earth. These chosen guardians embarked on a great quest to restore harmony, traveling through sacred mountains, crossing roaring rivers, and facing spirits of chaos.

They taught their people to live with kindness, to respect all living things, and to cherish the gifts of the earth.

Though many trials challenged them, the First People prevailed, ensuring that the balance between humans and nature would endure.

Their story is a timeless reminder of the sacred duty to protect our planet and live in harmony with all beings.

It teaches us humility, respect, and the understanding that we are part of a larger whole — a web of life woven by the Great Spirit.
""",
    contentAr: """
منذ زمن بعيد، قبل أن تكون الأرض كما هي اليوم، كانت الروح العظيمة تراقب البرية الشاسعة. كان العالم بريًا وغير مروض، مليئًا بالأنهار التي تجري كالثعابين الفضية، والجبال التي تخترق الغيوم، والغابات التي تهمس بالأسرار القديمة.

رغبت الروح العظيمة في جلب الانسجام إلى الأرض وخلقت الشعوب الأولى لتعيش في توازن مع الطبيعة. وهبت هؤلاء الناس الحكمة والاحترام والاتصال العميق بالأرض والسماء والحيوانات.

تعلمت الشعوب الأولى أن تستمع إلى الرياح، وتفهم لغة الطيور، وتكرم أرواح الغابات. كانوا يتبعون دورات القمر والشمس، يزرعون ويحصدون في الأوقات المناسبة.

في يوم من الأيام، جاء ظلام إلى الأرض — قوة من الجشع والدمار تسعى لتمزيق التوازن المقدس. أصبحت الحيوانات خائفة، وبدأت الأنهار تجف.

استدعت الروح العظيمة أشجع الناس بين الشعوب الأولى للنهوض وحماية الأرض. شرع هؤلاء الحراس المختارون في مهمة عظيمة لاستعادة الانسجام، سافروا عبر الجبال المقدسة، وعبروا الأنهار الهائجة، وواجهوا أرواح الفوضى.

علموا شعبهم أن يعيشوا بلطف، ويحترموا كل الكائنات الحية، ويقدروا هدايا الأرض.

رغم العديد من التحديات، انتصرت الشعوب الأولى، وضمنت أن يستمر التوازن بين البشر والطبيعة.

قصتهم تذكرنا على الدوام بالواجب المقدس لحماية كوكبنا والعيش في انسجام مع جميع الكائنات.

تعلمنا التواضع والاحترام وفهم أننا جزء من كل أكبر — شبكة حياة نسجتها الروح العظيمة.
""",
    descriptionEn:
        'A Native American legend about the Great Spirit creating the First People to live in harmony with nature.',
    descriptionAr:
        'أسطورة أمريكية أصلية عن الروح العظيمة التي خلقت الشعوب الأولى لتعيش في انسجام مع الطبيعة.',
  ),
  StoryModel(
    id: "17",
    titleEn: "The Legend of Musashi, The Unbeaten Samurai",
    titleAr: "أسطورة موساشي، الساموراي الذي لا يُهزم",
    level: EnglishLevelEnum.advanced,
    duration: 10,
    contentEn: """
Miyamoto Musashi was born in 1584 during Japan’s turbulent Sengoku period. From a young age, he showed great skill with the sword, but also a restless spirit that sought more than simple victories.

At the age of 13, Musashi fought and won his first duel, setting him on a path of becoming one of the most legendary swordsmen in Japanese history. He traveled across Japan, challenging masters in duels, never losing a single fight.

But Musashi was more than a fighter. He was a philosopher and an artist, writing the famous treatise "The Book of Five Rings," which teaches the principles of strategy, timing, and spirit.

His fighting style was unorthodox and innovative, using two swords simultaneously — a technique rare for his time. This gave him an edge over his opponents and added to his mystique.

Musashi’s life was a journey of self-discovery and mastery. He faced many enemies, but also confronted his own fears and doubts. Through meditation and discipline, he found balance between mind, body, and spirit.

He became a symbol of perseverance, courage, and self-reliance — qualities revered by samurai and martial artists worldwide.

Even after retiring from dueling, Musashi continued to teach, paint, and inspire. His legacy lives on not only in Japan but across the globe as a timeless example of strength and wisdom.

His story reminds us that true mastery requires not just skill, but understanding oneself deeply and embracing the path of constant growth.
""",
    contentAr: """
ولد مياتومو موساشي في عام 1584 خلال فترة سينغوكو المضطربة في اليابان. منذ صغره، أظهر مهارة كبيرة في استخدام السيف، ولكن أيضًا روحًا لا تهدأ تبحث عن أكثر من مجرد الانتصارات البسيطة.

في سن الثالثة عشرة، خاض موساشي أول مبارزة وفاز بها، مما مهد له الطريق ليصبح واحدًا من أعظم الساموراي في التاريخ الياباني. تنقل عبر اليابان، متحديًا الأساتذة في المبارزات، ولم يخسر أي قتال قط.

لكن موساشي كان أكثر من مجرد مقاتل. كان فيلسوفًا وفنانًا، وكتب المعاهدة الشهيرة "كتاب الحلقات الخمس"، التي تعلم مبادئ الاستراتيجية والتوقيت والروح.

كان أسلوب قتاله غير تقليدي ومبتكر، حيث استخدم سيفين في نفس الوقت — تقنية نادرة في عصره. هذا منحَه تفوقًا على خصومه وأضاف إلى هالته الغامضة.

كانت حياة موساشي رحلة لاكتشاف الذات وإتقانها. واجه العديد من الأعداء، ولكنه واجه أيضًا مخاوفه وشكوكه. من خلال التأمل والانضباط، وجد التوازن بين العقل والجسد والروح.

أصبح رمزًا للمثابرة والشجاعة والاعتماد على الذات — صفات يحترمها الساموراي والفنانون القتاليون في جميع أنحاء العالم.

حتى بعد اعتزاله المبارزات، واصل موساشي التدريس والرسم والإلهام. إرثه يعيش ليس فقط في اليابان ولكن في جميع أنحاء العالم كمثال خالد للقوة والحكمة.

تذكرنا قصته أن الإتقان الحقيقي لا يتطلب المهارة فقط، بل فهم الذات بعمق واعتناق طريق النمو المستمر.
""",
    descriptionEn:
        'The inspiring life story of Miyamoto Musashi, Japan’s undefeated samurai and master strategist.',
    descriptionAr: 'القصة الملهمة لمياتومو موساشي، الساموراي الياباني الذي لم يهزم وأستاذ الاستراتيجية.',
  ),
  StoryModel(
    id: "21",
    titleEn: "The Epic of Hammurabi: The Code of Justice",
    titleAr: "ملحمة حمورابي: شريعة العدالة",
    level: EnglishLevelEnum.advanced,
    duration: 15,
    contentEn: """
Hammurabi, the sixth king of Babylon, rose to power around 1792 BCE.  
He inherited a kingdom filled with city-states constantly at war, chaotic laws, and social inequalities.  
Determined to bring order and peace, Hammurabi set out to unify Mesopotamia under his rule.  

He believed that justice was the foundation of a stable society, and so he devised one of the earliest and most comprehensive legal codes in human history.  

The Code of Hammurabi consisted of 282 laws inscribed on a massive stone stele, standing over seven feet tall.  
At the top of the stele, a carved relief depicts Hammurabi receiving the law from Shamash, the sun god and god of justice, symbolizing divine authority for his rule.  

The laws covered a wide range of topics: property rights, trade regulations, family law, labor, and criminal justice.  
They were meant to protect the weak—widows, orphans, slaves—while holding the powerful accountable for their actions.  

Hammurabi’s code was strict and precise. It applied the principle of “an eye for an eye, a tooth for a tooth,” meaning punishments often mirrored the crime.  
However, penalties varied depending on social status, distinguishing between nobles, commoners, and slaves.

For example, if a builder constructed a house that collapsed and caused death, the builder could be put to death.  
If a slave caused damage, the punishment might be less severe, reflecting the hierarchical society of Babylon.  

Despite this, the code was revolutionary—it was publicly displayed so all could know the laws, rather than leaving justice to the whims of rulers or priests.  

The Code of Hammurabi influenced legal systems for thousands of years and laid the groundwork for modern concepts of law and governance.  

Hammurabi also led military campaigns to expand his empire, conquering rival cities and ensuring peace through strength and diplomacy.  

He improved irrigation, built temples, and promoted trade, fostering economic prosperity and cultural development.  

The epic story of Hammurabi is one of vision, law, and power—how one king transformed a turbulent land into a structured civilization.  

It speaks to humanity’s enduring struggle to balance justice, authority, and fairness in society.  

As centuries passed, Hammurabi’s stele was lost and rediscovered in the early 20th century, inspiring scholars worldwide.  

Today, his legacy reminds us that law is the cornerstone of civilization, and that fairness requires clear rules known to all.  

His vision shaped the destiny of Mesopotamia and echoed through the ages as a symbol of justice ordained by both human reason and divine will.  

The story of Hammurabi teaches us that with courage and wisdom, laws can unite people, protect rights, and foster peace amid chaos.  

Though harsh at times, his code reflected the complexities of life in an ancient world struggling to thrive.  

Hammurabi's impact extends beyond laws: it is about leadership, responsibility, and the quest for a just society.  

His story continues to be studied, admired, and debated by historians, jurists, and philosophers to this day.  
""",
    contentAr: """
صعد حمورابي، الملك السادس لبابل، إلى السلطة حوالي عام 1792 قبل الميلاد.  
ورث مملكة مليئة بالدول المدن التي كانت في حالة حرب مستمرة، وقوانين فوضوية، وعدم مساواة اجتماعية.  
مصممًا على جلب النظام والسلام، شرع حمورابي في توحيد بلاد ما بين النهرين تحت حكمه.  

كان يؤمن أن العدالة هي أساس المجتمع المستقر، ولذلك وضع واحدة من أقدم وأشمل القوانين في تاريخ البشرية.  

تكون قانون حمورابي من 282 قانونًا منحوتة على حجر ضخم، يبلغ ارتفاعه أكثر من سبعة أقدام.  
في أعلى الحجر، توجد نقوش تصور حمورابي يتلقى القانون من شمش، إله الشمس والعدالة، مما يرمز إلى السلطة الإلهية لحكمه.  

شملت القوانين مجموعة واسعة من المواضيع: حقوق الملكية، تنظيم التجارة، قانون الأسرة، العمل، والعدالة الجنائية.  
كانت تهدف إلى حماية الضعفاء — الأرامل، الأيتام، والعبيد — مع تحميل الأقوياء مسؤولية أفعالهم.  

كان قانون حمورابي صارمًا ودقيقًا. طبق مبدأ "العين بالعين، والسن بالسن"، بمعنى أن العقوبات غالبًا ما تعكس الجريمة نفسها.  
ومع ذلك، اختلفت العقوبات حسب المكانة الاجتماعية، مميزًا بين النبلاء، العامة، والعبيد.  

على سبيل المثال، إذا بنى البنّاء منزلًا انهار وتسبب في وفاة شخص، يمكن أن يُعاقب بالموت.  
أما إذا تسبب عبد في الضرر، فقد تكون العقوبة أخف، مما يعكس النظام الطبقي في بابل.  

رغم ذلك، كان القانون ثوريًا — إذ عُرض بشكل علني ليعرف الجميع القوانين، بدلًا من ترك العدالة لمزاج الحكام أو الكهنة.  

أثر قانون حمورابي على أنظمة القانون لآلاف السنين ووضع الأساس لمفاهيم القانون والحكم الحديثة.  

قاد حمورابي أيضًا حملات عسكرية لتوسيع إمبراطوريته، وغزا مدنًا منافسة، وضمان السلام بالقوة والدبلوماسية.  

حسّن الري، وبنى المعابد، وروّج للتجارة، مما عزز الازدهار الاقتصادي والتنمية الثقافية.  

تحكي ملحمة حمورابي قصة رؤية، قانون، وقوة — كيف حوّل ملك واحد أرضًا مضطربة إلى حضارة منظمة.  

تتحدث عن الصراع الإنساني الدائم لتحقيق التوازن بين العدالة والسلطة والإنصاف في المجتمع.  

مع مرور القرون، فقد الحجر ونُسي ثم أعيد اكتشافه في القرن العشرين، مما ألهم العلماء في جميع أنحاء العالم.  

اليوم، يذكرنا إرثه بأن القانون هو حجر الزاوية للحضارة، وأن العدالة تتطلب قواعد واضحة يعرفها الجميع.  

رؤيته شكلت مصير بلاد ما بين النهرين وترددت أصداؤها عبر العصور كرمز للعدالة التي أمر بها العقل البشري والإرادة الإلهية.  

تعلمنا قصة حمورابي أنه بالشجاعة والحكمة، يمكن للقوانين أن توحد الناس، وتحمي الحقوق، وتعزز السلام وسط الفوضى.  

على الرغم من شدتها أحيانًا، عكست قوانينه تعقيدات الحياة في عالم قديم يكافح من أجل الازدهار.  

يمتد تأثير حمورابي إلى ما هو أبعد من القوانين: فهو عن القيادة، المسؤولية، والسعي نحو مجتمع عادل.  

تستمر قصته في الدراسة، والإعجاب، والنقاش بين المؤرخين، والقانونيين، والفلاسفة حتى يومنا هذا.  
""",
    descriptionEn:
        'The story of King Hammurabi and his groundbreaking code of laws that shaped ancient Mesopotamian justice.',
    descriptionAr: 'قصة الملك حمورابي وقانونه الرائد الذي شكل العدالة في بلاد ما بين النهرين القديمة.',
  ),
  StoryModel(
    id: "19",
    titleEn: "The Epic of Gilgamesh: Quest for Immortality",
    titleAr: "ملحمة جلجامش: البحث عن الخلود",
    level: EnglishLevelEnum.advanced,
    duration: 12,
    contentEn: """
Gilgamesh, the mighty king of Uruk, was part god and part man, ruling with great strength but burdened by loneliness and fear of death.

The people prayed for relief from his harsh rule, so the gods created Enkidu, a wild man who could match Gilgamesh’s strength and challenge his arrogance.

After an intense battle, Gilgamesh and Enkidu became inseparable friends. Together, they journeyed to the Cedar Forest, seeking to defeat Humbaba, its monstrous guardian.

Their victory brought glory but also the wrath of the gods. Enkidu was sentenced to death, leaving Gilgamesh devastated and desperate.

Haunted by the loss of his friend and his own mortality, Gilgamesh embarked on a quest to find Utnapishtim, the immortal survivor of the great flood.

He traveled through dark forests, across treacherous mountains, and into the realm of the gods, facing many challenges that tested his courage and wisdom.

Utnapishtim revealed the secret of eternal life, but it proved elusive. Gilgamesh returned to Uruk, wiser and humbled, understanding that immortality lies in the legacy one leaves behind.

His story is one of friendship, loss, and the human quest to find meaning beyond death.

The epic is a testament to ancient Mesopotamian culture and the universal struggle against the limits of life.

It reminds us that while death is inevitable, our deeds and stories endure through time.
""",
    contentAr: """
كان جلجامش، الملك العظيم لأوروك، نصف إله ونصف إنسان، يحكم بقوة عظيمة لكنه مثقل بالوحدة والخوف من الموت.

صلى الناس من أجل الخلاص من حكمه القاسي، فخلق الآلهة إنكيدو، الرجل البري الذي يستطيع مساواة قوة جلجامش وتحدي كبريائه.

بعد معركة شديدة، أصبح جلجامش وإنكيدو أصدقاء لا ينفصلان. معًا، انطلقوا إلى غابة الأرز، ساعين لهزيمة همبابا، الحارس الوحشي للغابة.

جلب نصرهم المجد لكنه أثار غضب الآلهة. حكم على إنكيدو بالموت، مما ترك جلجامش محطم القلب ويائسًا.

مطاردًا بفقدان صديقه وخوفه من موته، شرع جلجامش في رحلة للعثور على أوتنابشتيم، الناجي الخالد من الطوفان العظيم.

سافر عبر الغابات الكثيفة، عبر الجبال الخطرة، ودخل عالم الآلهة، مواجها العديد من التحديات التي اختبرت شجاعته وحكمته.

كشف له أوتنابشتيم سر الحياة الأبدية، لكنه كان بعيد المنال. عاد جلجامش إلى أوروك، أكثر حكمة وتواضعًا، مدركًا أن الخلود يكمن في الإرث الذي يتركه الإنسان.

قصته هي قصة صداقة وفقدان والسعي الإنساني لإيجاد معنى يتجاوز الموت.

الملحمة هي شهادة على ثقافة بلاد ما بين النهرين القديمة والصراع العالمي ضد حدود الحياة.

تذكرنا أنه رغم حتمية الموت، فإن أفعالنا وقصصنا تبقى خالدة عبر الزمن.
""",
    descriptionEn: 'Ancient Mesopotamian epic about King Gilgamesh’s search for eternal life and wisdom.',
    descriptionAr: 'ملحمة بلاد ما بين النهرين القديمة عن رحلة الملك جلجامش بحثًا عن الحياة الأبدية والحكمة.',
  ),

  StoryModel(
    id: "12",
    titleEn: "Leif Erikson and the Discovery of Vinland",
    titleAr: "ليف إريكسون واكتشاف فينلاند",
    level: EnglishLevelEnum.advanced,
    duration: 9,
    contentEn: """
Around the year 1000 AD, Norse explorer Leif Erikson embarked on a daring voyage from Greenland to unknown lands westward. His father, Erik the Red, had founded the first Norse settlement in Greenland, and tales of lands beyond the horizon had long sparked curiosity and dreams of discovery.

Leif gathered a crew of seasoned sailors and set sail into the uncharted Atlantic, battling fierce storms and treacherous seas. After weeks of navigation by stars and intuition, they sighted lush forests and fertile shores.

Leif named this new land "Vinland," for the abundance of wild grapes and fertile fields, a place promising new beginnings. He and his men established a small settlement, building wooden houses and exploring the rich landscape.

They encountered strange animals, rivers filled with fish, and forests thick with timber. The Norse chroniclers spoke of encounters with indigenous peoples, whom they called "Skraelings," though the nature of these meetings varied from trade to conflict.

Despite the hardships, the Vinland settlement represented hope — a glimpse of a world beyond the known, a chance for prosperity and expansion.

Though the colony was eventually abandoned due to conflicts and distance, Leif Erikson’s voyage marked one of the earliest known European explorations of North America, centuries before Columbus.

His journey embodies the spirit of exploration — the courage to venture beyond familiar shores, and the unquenchable desire to seek new horizons.

Leif’s legacy lives on in sagas and history, reminding us that human curiosity has always been the compass guiding the boldest journeys.
""",
    contentAr: """
في حوالي عام ١٠٠٠ ميلادي، انطلق المستكشف النورس ليف إريكسون في رحلة جريئة من جرينلاند إلى أراضٍ مجهولة في الغرب. كان والده، إريك الأحمر، قد أسس أول مستوطنة نورسية في جرينلاند، وظلت حكايات الأراضي وراء الأفق تثير الفضول وأحلام الاكتشاف.

جمع ليف طاقماً من البحارة المخضرمين وأبحر في المحيط الأطلسي غير المعروف، متحدياً العواصف العنيفة والبحار الغادرة. بعد أسابيع من الملاحة بالنجوم والحدس، رأوا الغابات الكثيفة والسواحل الخصبة.

سمى هذا الأرض الجديدة "فينلاند" بسبب وفرة العنب البري والحقول الخصبة، مكان يعد ببدايات جديدة. أسس هو ورجاله مستوطنة صغيرة، بنوا بيوتاً خشبية واستكشفوا الأراضي الغنية.

التقوا بحيوانات غريبة، وأنهار مليئة بالأسماك، وغابات كثيفة بالأخشاب. تحدث الرواة النورس عن لقاءات مع السكان الأصليين الذين أطلقوا عليهم اسم "سكريلينغز"، رغم أن طبيعة هذه اللقاءات تراوحت بين التجارة والصراع.

رغم الصعوبات، مثلت مستوطنة فينلاند أملاً — لمحة عن عالم أبعد من المعروف، وفرصة للرخاء والتوسع.

على الرغم من أن المستوطنة أُهملت في النهاية بسبب الصراعات والمسافات، فإن رحلة ليف إريكسون تمثل واحدة من أقدم الاستكشافات الأوروبية المعروفة لأمريكا الشمالية، قبل كولومبس بقرون.

تجسّد رحلته روح الاستكشاف — الشجاعة لعبور الشواطئ المألوفة، والرغبة التي لا تُروى في البحث عن آفاق جديدة.

يظل إرث ليف حيًّا في الأساطير والتاريخ، مذكراً أن الفضول البشري كان دائماً البوصلة التي توجه أجرأ الرحلات.
""",
    descriptionEn:
        'The story of Leif Erikson, the Norse explorer who discovered Vinland, representing early European exploration of North America.',
    descriptionAr:
        'قصة ليف إريكسون، المستكشف النورس الذي اكتشف فينلاند، ممثلًا لأوائل الاستكشافات الأوروبية لأمريكا الشمالية.',
  ),
  StoryModel(
    id: "14",
    titleEn: "The Legend of King Arthur and the Knights of the Round Table",
    titleAr: "أسطورة الملك آرثر وفرسان الطاولة المستديرة",
    level: EnglishLevelEnum.advanced,
    duration: 10,
    contentEn: """
In medieval Britain, amid tales of chivalry and magic, there lived a legendary king named Arthur. According to lore, Arthur was the son of King Uther Pendragon and was raised in secret by the wise wizard Merlin.

As a young boy, Arthur pulled the enchanted sword Excalibur from a stone, proving his right to the throne of Britain. With this act, he united the fractured kingdoms and ushered in a golden age of peace and justice.

Arthur established the famed Knights of the Round Table — a brotherhood of noble warriors committed to protecting the realm and upholding chivalric ideals of honor, courage, and kindness.

Together, they embarked on quests, battling giants, dragons, and dark sorcery. Among these knights were Sir Lancelot, whose skill and valor were unmatched, and Sir Gawain, known for his unwavering loyalty.

The kingdom thrived under Arthur’s rule, but his reign was marked by tragedy and betrayal. The love triangle between Arthur, Queen Guinevere, and Sir Lancelot sowed discord among the knights.

The quest for the Holy Grail became a symbol of their spiritual journey, with knights seeking redemption and enlightenment.

Ultimately, Arthur faced his final battle at Camlann, where he was gravely wounded. It is said that he was taken to the mystical Isle of Avalon, where he rests until Britain needs him again.

The legend of King Arthur has inspired countless works of literature, art, and film, embodying the timeless themes of heroism, sacrifice, and the quest for justice.

His story reminds us that true leadership combines strength with compassion, and that even legends are shaped by human flaws and virtues.
""",
    contentAr: """
في بريطانيا في العصور الوسطى، وسط قصص الفروسية والسحر، عاش ملك أسطوري يُدعى آرثر. وفقًا للأسطورة، كان آرثر ابن الملك أذر بندراغون ونشأ في سرية على يد الساحر الحكيم ميرلين.

كصبي صغير، سحب آرثر السيف المسحور إكسكاليبر من الحجر، مما أثبت حقه في عرش بريطانيا. بهذا الفعل، وحد الممالك المتفرقة وأدخل عصرًا ذهبيًا من السلام والعدل.

أسس آرثر فرسان الطاولة المستديرة الشهيرة — أخوية من المحاربين النبلاء الملتزمين بحماية المملكة والدفاع عن قيم الفروسية من الشرف والشجاعة واللطف.

معًا، شرعوا في مغامرات، يقاتلون العمالقة والتنانين والسحر الأسود. من بين هؤلاء الفرسان كان السير لانسيلوت، الذي لا يُضاهى في مهارته وبسالته، والسير جاوين المعروف بولائه الثابت.

ازدهرت المملكة تحت حكم آرثر، لكن عهده تميز بالمآسي والخيانة. مثلث الحب بين آرثر والملكة جوينيفير والسير لانسيلوت تسبب في انقسامات بين الفرسان.

أصبحت رحلة الكأس المقدسة رمزًا لرحلتهم الروحية، حيث سعى الفرسان إلى التكفير والتنير.

في النهاية، خاض آرثر معركته الأخيرة في كاملان، حيث جُرح إصابة بالغة. ويقال إنه نُقل إلى الجزيرة الغامضة أفالون، حيث يرقد حتى تحتاجه بريطانيا مرة أخرى.

ألهمت أسطورة الملك آرثر العديد من الأعمال الأدبية والفنية والسينمائية، متجسدة في موضوعات البطولة والتضحية والسعي من أجل العدالة.

تذكرنا قصته أن القيادة الحقيقية تجمع بين القوة والرحمة، وأن الأساطير حتى تتشكل من عيوب وفضائل بشرية.
""",
    descriptionEn:
        'The legendary tale of King Arthur and his knights, symbolizing heroism, loyalty, and the quest for justice.',
    descriptionAr: 'القصة الأسطورية للملك آرثر وفرسانه، رمز البطولة والولاء والسعي من أجل العدالة.',
  ),

  StoryModel(
    id: "10",
    titleEn: "The 47 Ronin: Loyalty Unto Death",
    titleAr: "الـ47 رونين: الوفاء حتى الموت",
    level: EnglishLevelEnum.advanced,
    duration: 10,
    contentEn: """
It was the early 18th century in Edo-period Japan. A time of strict codes, of silence and honor, where the samurai lived not only by the sword, but by the way of Bushidō—the way of the warrior.

Lord Asano Naganori ruled the domain of Akō. He was a fair man, but unskilled in court politics. One day, he was summoned to the shogun’s castle to receive instructions from Kira Yoshinaka, a powerful and arrogant official.

Kira expected bribes. Asano refused.

Days of tension followed. Kira insulted him repeatedly—mocking his manner, his clothing, his dialect. Finally, Asano, pushed to the brink, drew his sword inside the castle and slashed at Kira.

Kira survived. But Asano had committed a grave offense: drawing a blade in the shogun’s palace. For this, he was ordered to commit seppuku—ritual suicide—to die with honor.

His lands were confiscated. His samurai, now masterless, became **ronin**.

But they would not forget.

For two years, the 47 ronin lived in secret. They dispersed, pretending to abandon Bushidō. Some became merchants. Others fell into poverty. Their leader, Ōishi Kuranosuke, spent months drunk in Kyoto’s pleasure quarters to deflect suspicion.

They waited.

Then, on a snowy night in December, they struck.

They gathered at Kira’s mansion in Edo, climbing the walls silently. In the dark, they tied up guards and searched every chamber. Finally, they found Kira, cowering in a back courtyard shed.

They offered him the honorable path: death by his own hand.

He refused.

Ōishi beheaded him, placed the head in a bucket, and marched the ronin across the city to Asano’s grave. There, they washed the head, placed it before their master, and bowed.

They had fulfilled their oath.

The city was torn. Some praised their loyalty. Others condemned the defiance of law. The shogun, Tokugawa Tsunayoshi, debated for days. In the end, he gave a final verdict: the ronin would be allowed to die with honor.

Each of the 47 committed seppuku. They were buried beside their master in Sengaku-ji Temple.

Centuries passed. But Japan never forgot.

Today, the graves of the 47 ronin are still visited by those who honor duty, loyalty, and the price of keeping one's word. Their story is told in books, films, and Noh theatre.

Not because they killed. But because they believed in something greater than life: **honor**.
""",
    contentAr: """
كان ذلك في أوائل القرن الثامن عشر، خلال فترة إيدو في اليابان. عصر يتسم بالانضباط الشديد، بالصمت والشرف، حيث كان الساموراي لا يعيشون فقط بالسيف، بل وفق قانون البوشيدو – طريق المحارب.

اللورد أسـانو ناغانوري، حاكم إقليم آكو، كان رجلاً نزيهاً لكنه يجهل دهاليز السياسة في البلاط. استُدعي ذات يوم إلى قلعة الشوغون ليتلقى التعليمات من كيرا يوشيناكا، مسؤول متغطرس ونفاذ الصبر.

كان كيرا يتوقع الرشاوى. لكن أسـانو رفض.

توترت الأجواء لأيام. كيرا أهان أسـانو مراراً – سخر من لهجته، من ملبسه، من أصوله. وفي لحظة غضب، استل أسـانو سيفه داخل القصر وضرب كيرا.

نجا كيرا. لكن أسـانو ارتكب فعلاً لا يُغتفر: استخدام السيف في قصر الشوغون. حُكم عليه بالسيبوكو – الانتحار الطقسي – ليحافظ على شرفه.

صودرت ممتلكاته. وتحوّل سامورايه إلى **رونين** – مقاتلين بلا سيد.

لكنهم لم ينسوا.

لمدة عامين، عاش الـ47 رونين في الخفاء. تفرقوا، وتظاهروا بالتخلي عن البوشيدو. البعض أصبح تاجراً، والبعض الآخر فقيراً. زعيمهم، أوئيشي كورانوسوكي، أمضى شهوراً سكراناً في حي المتعة في كيوتو كي يُبعد الشكوك.

وانتظروا.

ثم، في ليلة شتوية مغطاة بالثلج، هجموا.

تسللوا إلى قصر كيرا في إيدو. تسلقوا الجدران بصمت. قيدوا الحراس، وفتشوا الغرف. وأخيراً، وجدوا كيرا مختبئاً في كوخ خلفي.

عرضوا عليه خيار الموت بشرف.

رفض.

فقطع أوئيشي رأسه، ووضع الرأس في دلو، وسار بالرونين عبر المدينة إلى قبر سيدهم أسـانو. هناك، غسلوه، وقدموا الرأس أمامه، وانحنوا.

لقد أوفوا بقسمهم.

انقسمت آراء الناس. البعض مجّد وفاءهم. آخرون أدانوا عصيانهم للقانون. الشوغون توكوجاوا تسونايوشي تردد لأيام، ثم قرر: يُمنح الرونين شرف الموت.

نفذ كل واحد منهم السيبوكو. ودُفنوا إلى جانب سيدهم في معبد سينغاكوجي.

مرت القرون، لكن اليابان لم تنسَ.

ولا تزال قبورهم تُزار حتى اليوم، تكريماً للوفاء، والولاء، وثمن الكلمة.

ليست القصة عن القتل، بل عن شرف يفوق الحياة: **الوفاء**.
""",
    descriptionEn:
        'A legendary tale from feudal Japan about the 47 masterless samurai who avenged their lord’s death and chose honor over life.',
    descriptionAr:
        'قصة أسطورية من اليابان الإقطاعية عن ٤٧ ساموراي بلا سيد، انتقموا لموت ربهم واختاروا الشرف على الحياة.',
  ),

  StoryModel(
    id: "9",
    titleEn: "The Trial of Socrates",
    titleAr: "محاكمة سقراط",
    level: EnglishLevelEnum.advanced,
    duration: 10,
    contentEn: """
It was 399 BCE in Athens. The court was filled with tension. Men of the Assembly, cloaked in white robes, gathered on stone benches under the spring sun. Before them stood an old man—calm, barefoot, with a long beard and a questioning gaze. Socrates.

He had been accused of impiety and corrupting the youth. His student Plato watched from the crowd, recording the events that would echo through millennia.

Socrates did not apologize. He stood firm, as always, in pursuit of truth. “I am a gadfly,” he declared. “I sting the lazy horse of Athens to keep it awake.” His words were not a defense but a challenge.

He reminded them that he had never charged money for his teachings. That he walked the streets of the agora, questioning generals, poets, craftsmen—exposing ignorance and pretension. He sought virtue over victory, and wisdom over wealth.

The prosecutors, Anytus and Meletus, argued that Socrates disrespected the gods of the city and introduced new ones—his inner “daimon,” a divine voice that warned, but never commanded.

Some jurors muttered in disapproval. Socrates had mocked politicians and claimed that true knowledge was admitting ignorance. But Athens was still reeling from the Peloponnesian War. The democracy was fragile. Many blamed thinkers like Socrates for the collapse of old values.

Still, Socrates refused to beg. “Should I lie to save my life?” he asked. “No. I must live as I teach.” His voice was steady. “The unexamined life is not worth living.”

The vote was cast: guilty. The punishment? Death.

The court gave Socrates a final chance to propose an alternative. Some expected exile. But Socrates, with a wry smile, suggested instead that he be rewarded—a lifetime pension for his service to the city.

This defiance sealed his fate. The jury voted for execution.

His friends offered to bribe the guards and help him escape. Socrates declined. “To break the laws would be to betray everything I have taught.” He chose to drink the hemlock.

In his final moments, Socrates joked with his friends. “Crito, we owe a rooster to Asclepius. Please, don’t forget to pay the debt.” A gift to the god of healing. Some say he meant death itself was a cure for the illness of life.

He lifted the cup. Drank. His legs grew cold. Then numb. His breath slowed. And he died.

But his words did not.

Plato would carry his teacher’s voice through *The Apology*, *Phaedo*, and *Crito*. The Stoics would draw inspiration. The Enlightenment would reawaken his spirit. And to this day, philosophy students from Cairo to Kyoto study Socrates—who never wrote a single word.

He taught the world that courage is not in silence, but in inquiry. That a good life requires uncomfortable questions. And that sometimes, the price of truth is death.
""",
    contentAr: """
في عام ٣٩٩ قبل الميلاد، عاشت أثينا لحظة فارقة. امتلأت ساحة المحكمة بالرجال، يجلسون على المقاعد الحجرية تحت شمس الربيع، يلبسون أردية بيضاء. أمامهم، وقف رجل مسن، حافي القدمين، لحيته طويلة، ونظراته حادة: سقراط.

كانت التهم ضده: الكفر بآلهة المدينة، وإفساد عقول الشباب. جلس تلميذه أفلاطون بين الحضور، يدون كل ما سيحدث لاحقاً.

لم يعتذر سقراط. ظل ثابتاً في موقفه، كما كان طوال حياته، باحثاً عن الحقيقة. قال: "أنا أشبه بذبابة تلسع هذا الحصان الكسول الذي يُدعى أثينا. أبقيه يقظاً."

أوضح لهم أنه لم يطلب مالاً مقابل تعليمه. كان يتجول في شوارع السوق، يحاور القادة والشعراء والحرفيين، كاشفاً جهلهم، حاثًا الناس على التفكير. كان يفضل الفضيلة على الانتصار، والحكمة على المال.

اتهمه المدعون، أنيتوس وميليتوس، بازدراء آلهة أثينا، وبأنه اخترع آلهة جديدة، كالصوت الداخلي أو "الدايمون" الذي كان يوجهه بصمت.

همس بعض القضاة بعدم الرضا. كان سقراط يسخر من السياسيين، ويقول إن أولى خطوات المعرفة هي الاعتراف بالجهل. لكن المدينة كانت مجروحة بعد الحرب مع إسبرطة. الديمقراطية ضعيفة، والثقة بالعلماء متزعزعة.

رفض سقراط التوسل. سألهم: "هل ينبغي لي أن أكذب لأُنقذ حياتي؟ لا. يجب أن أعيش كما أُعلّم." وقال جملته الشهيرة: "الحياة غير المفحوصة لا تستحق العيش."

صوت القضاة: مذنب. العقوبة؟ الموت.

أعطته المحكمة فرصة ليقترح بديلاً للعقوبة. ظن البعض أنه سيختار النفي. لكن سقراط، بابتسامة ساخرة، اقترح أن يُكرم، وأن تُمنح له مكافأة لخدمته المدينة.

حُسم أمره. الموت بالسم.

عرض عليه أصدقاؤه أن يهربوه ليلاً، مقابل رشوة للحراس. رفض. "إذا خرقت القوانين، فماذا يبقى من فلسفتي؟" قرر أن يموت بشرف، كما عاش.

في لحظاته الأخيرة، قال لصديقه كريتو: "ندين لديك بأسكليبيوس بدجاجة. لا تنسَ أن تسدد الدين." هدية لإله الشفاء. ربما قصد بها أن الموت هو العلاج الأخير للحياة.

رفع الكأس. شرب. بدأت ساقاه تتجمدان. ثم صدره. ثم توقف التنفس. ومات.

لكن كلماته لم تمت.

نقل أفلاطون صوته في *الدفاع* و*فيدون* و*كريتو*. استلهمه الرواقيون. أعاد التنوير اكتشافه. واليوم، يُدرس سقراط من القاهرة إلى كيوتو، رغم أنه لم يكتب سطراً واحداً.

علمنا أن الشجاعة في التساؤل. وأن الحياة الفاضلة لا تُبنى على الراحة، بل على الأسئلة. وأن الحقيقة أحياناً تتطلب أن ندفع حياتنا ثمناً لها.
""",
    descriptionEn:
        'The story of Socrates’ trial and execution in 399 BCE Athens—an enduring symbol of philosophical inquiry, integrity, and the cost of truth.',
    descriptionAr:
        'قصة محاكمة سقراط وإعدامه في أثينا عام ٣٩٩ ق.م—رمز خالد للسعي الفلسفي والنزاهة وثمن الحقيقة.',
  ),

  // Story 1
  // Historical Story Data Models
  StoryModel(
    id: "7",
    titleEn: "Al-Khwarizmi and the Birth of Algebra",
    titleAr: "الخوارزمي وميلاد الجبر",
    level: EnglishLevelEnum.advanced,
    duration: 12,
    contentEn: """
In the golden heart of Baghdad, during the 9th century, stood a vast complex known as Bayt al-Hikma—the House of Wisdom. It wasn’t just a library; it was a living pulse of the Islamic Golden Age, where scholars of diverse faiths and cultures gathered to study, translate, debate, and create. Among them was a young Persian scholar named Muhammad ibn Musa al-Khwarizmi.

Born near Khiva in present-day Uzbekistan, Al-Khwarizmi arrived in Baghdad with a mind sharpened by astronomy and a curiosity unbound by convention. He soon became one of the leading scientists under the Abbasid Caliph Al-Ma'mun, who was a great patron of knowledge and inquiry.

Al-Khwarizmi’s most influential work, *Kitab al-Jabr wal-Muqabala* (The Compendious Book on Calculation by Completion and Balancing), was written around 820 CE. The word “al-jabr” from the title would later become “algebra,” and his clear, structured approach marked a departure from the geometric proofs of the Greeks.

The book wasn’t just a theoretical document. It was filled with real-life problems—how to divide inheritances, calculate debts, measure land, and more. Al-Khwarizmi devised systematic methods for solving linear and quadratic equations using words, not symbols. His approach made mathematics accessible to people in courts, markets, and fields.

He also introduced the Hindu-Arabic numeral system to the Islamic world, which eventually reached Europe. His Latinized name, “Algoritmi,” gave birth to the term “algorithm,” a word now at the center of the digital age.

Al-Khwarizmi didn’t see mathematics as separate from the world—it was a tool to bring order and justice. He believed that calculation was a moral act, helping ensure fairness in inheritance and contracts. His equations had ethical value.

One day, as students surrounded him in a tiled courtyard of the House of Wisdom, he used sand to draw lines representing unknown quantities. "This,” he said, “is not magic. It is balance. It is the justice of numbers.”

Through him, algebra became a discipline rooted in reason and purpose. His work would later be translated into Latin and taught in European universities for centuries.

When scholars in Toledo translated his texts, they marveled at how a mind from the East could be centuries ahead. They adopted his method, spreading it across the continent.

Without Al-Khwarizmi, there would be no x, no equations, no computational science as we know it today. His legacy lives not just in math classrooms, but in every search engine, every AI, every algorithm that shapes our world.

He was more than a mathematician. He was a bridge between civilizations. A man who turned numbers into justice, and equations into language.
""",
    contentAr: """
في قلب بغداد الذهبي، في القرن التاسع الميلادي، كان يقف صرحٌ عظيم يُعرف باسم "بيت الحكمة". لم يكن مجرد مكتبة، بل كان نابضًا بالحياة، مركزًا للعلم والمعرفة حيث اجتمع العلماء من مختلف الأديان والثقافات للترجمة، والمناقشة، والإبداع. ومن بين هؤلاء كان عالم فارسي شاب يُدعى محمد بن موسى الخوارزمي.

ولد الخوارزمي بالقرب من خوارزم في أوزبكستان الحالية، وجاء إلى بغداد بعقل مشبع بعلم الفلك وفضول لا يعرف القيود. سرعان ما أصبح من أبرز علماء عصره تحت رعاية الخليفة العباسي المأمون، الراعي الكبير للعلم والعلماء.

أهم أعماله كان كتاب "الْجَبْر والمقابلة"، الذي كتبه حوالي عام ٨٢٠ م. الكلمة "الجبر" من عنوان كتابه أصبحت لاحقًا "Algebra"، وكان أسلوبه المنهجي والواضح يمثل تحولًا كبيرًا عن البراهين الهندسية المعقدة عند اليونانيين.

لم يكن الكتاب نظريًا فقط، بل كان عمليًا بدرجة مذهلة. تضمن مسائل من الحياة اليومية: تقسيم الميراث، حساب الديون، قياس الأراضي. قدّم الخوارزمي طرقًا منظمة لحل المعادلات الخطية والتربيعية باستخدام الكلمات لا الرموز، مما جعل الحسابات مفهومة للجميع: القاضي، التاجر، والمزارع.

كما ساهم في إدخال نظام الأرقام الهندية-العربية إلى العالم الإسلامي، والذي انتقل لاحقًا إلى أوروبا. وعندما تُرجم اسمه إلى اللاتينية ليصبح "Algoritmi"، وُلدت كلمة "خوارزمية" التي تقود اليوم كل محرك بحث وكل تقنية رقمية.

لم يكن ينظر إلى الرياضيات كعلمٍ منفصلٍ عن العالم، بل كأداةٍ لإرساء العدل. الحساب، في نظره، كان عملاً أخلاقيًا، يُستخدم لتحقيق العدالة في الميراث والعقود. معادلاته لم تكن فقط رموزًا، بل كانت ذات قيمة أخلاقية.

في أحد الأيام، جلس الخوارزمي في فناء بيت الحكمة، محاطًا بطلابه، ورسم في الرمل خطوطًا تمثل المجهول. قال: "هذا ليس سحرًا، بل توازن. إنه عدل الأرقام."

من خلاله، أصبح الجبر علمًا قائمًا على المنطق والغاية. تُرجمت أعماله إلى اللاتينية، ودرّست في جامعات أوروبا لقرون. عندما ترجم العلماء في طليطلة كتبه، دُهشوا كيف سبقهم عقل من الشرق بقرون.

بدون الخوارزمي، ما كانت لتوجد معادلة، ولا متغير، ولا علم حوسبة كما نعرفه. إرثه حاضرٌ في كل صف دراسي، في كل خوارزمية، في كل فكرة عقلانية تقود العالم الحديث.

كان أكثر من مجرد رياضي. كان جسرًا بين الحضارات. رجلٌ حوّل الأرقام إلى عدالة، والمعادلات إلى لغة.
""",
    descriptionEn:
        'The life and impact of Al-Khwarizmi, whose work in algebra and algorithms laid the foundation for modern mathematics and computation.',
    descriptionAr:
        'قصة حياة الخوارزمي وتأثيره العميق في علم الجبر والخوارزميات، وأساسه للرياضيات الحديثة والعلوم الحاسوبية.',
  ),

  StoryModel(
    id: "2",
    titleEn: "The Library of Alexandria Burns",
    titleAr: "احتراق مكتبة الإسكندرية",
    level: EnglishLevelEnum.advanced,
    duration: 7,
    contentEn:
        """The year was 391 CE, and Theophilus, the Christian Patriarch of Alexandria, stood before the great Library with a torch in his hand. Behind him, a mob of zealous followers chanted prayers and curses against the 'pagan wisdom' housed within these ancient walls. Hypatia, the brilliant mathematician and philosopher, watched in horror from her window across the square. She had spent countless hours in those halls, teaching geometry and astronomy to students from across the Mediterranean. Her father Theon had been the library's last official scholar, and she had inherited his love for the pursuit of knowledge. Inside the library, the elderly librarian Apollodorus frantically gathered scrolls. Works by Euclid, Archimedes, and Eratosthenes - the mathematical foundations of human understanding - lay vulnerable to the flames. He wept as he realized he could save only a handful of the hundreds of thousands of manuscripts. The mob surged forward. Centuries of accumulated human knowledge, painstakingly copied and preserved, began to burn. Smoke filled the Mediterranean sky as works on medicine, engineering, literature, and philosophy turned to ash. The loss was immeasurable - not just books, but the very spirit of inquiry and learning. Young Marcus, a Christian student who had studied under Hypatia, stood torn between his faith and his love of learning. He watched his teacher weep as humanity's greatest repository of knowledge was destroyed in the name of religious purity. In that moment, he understood that wisdom knows no religion, and ignorance is humanity's greatest enemy. As the flames died down, Alexandria's golden age of learning ended. The world would not see such a concentration of knowledge again for over a thousand years. Hypatia would continue teaching until her own tragic death decades later, but the light of ancient learning had been dimmed forever.""",
    contentAr:
        """كان العام 391 م، وثيوفيلوس، البطريرك المسيحي للإسكندرية، يقف أمام المكتبة العظيمة وفي يده مشعل. خلفه، حشد من الأتباع المتحمسين يهتفون بالصلوات واللعنات ضد 'الحكمة الوثنية' المحفوظة داخل هذه الجدران القديمة. هيباتيا، عالمة الرياضيات والفيلسوفة اللامعة، راقبت بفزع من نافذتها عبر الساحة. لقد أمضت ساعات لا تحصى في تلك القاعات، تعلم الهندسة وعلم الفلك لطلاب من جميع أنحاء البحر المتوسط. والدها ثيون كان آخر عالم رسمي للمكتبة، وقد ورثت عنه حبه لسعي المعرفة. داخل المكتبة، أبولودوروس المكتبي المسن يجمع اللفائف بجنون. أعمال إقليدس وأرخميدس وإراتوستينس - الأسس الرياضية للفهم البشري - كانت عرضة للنيران. بكى وهو يدرك أنه يستطيع إنقاذ حفنة فقط من مئات الآلاف من المخطوطات. الحشد اندفع إلى الأمام. قرون من المعرفة البشرية المتراكمة، المنسوخة والمحفوظة بعناية، بدأت تحترق. الدخان ملأ سماء البحر المتوسط بينما تحولت أعمال الطب والهندسة والأدب والفلسفة إلى رماد. الخسارة كانت لا تقدر - ليس فقط الكتب، بل روح البحث والتعلم ذاتها. ماركوس الشاب، الطالب المسيحي الذي درس تحت هيباتيا، وقف ممزقاً بين إيمانه وحبه للتعلم. راقب معلمته تبكي بينما أعظم مستودع للمعرفة البشرية يُدمر باسم النقاء الديني. في تلك اللحظة، فهم أن الحكمة لا تعرف ديناً، والجهل هو أعظم أعداء البشرية. بينما انطفأت النيران، انتهى العصر الذهبي للتعلم في الإسكندرية. العالم لن يرى مثل هذا التركز للمعرفة مرة أخرى لأكثر من ألف عام.""",
    descriptionEn:
        'The tragic destruction of the Library of Alexandria in 391 CE, focusing on the loss of ancient knowledge and the conflict between religious zealotry and scholarly pursuit.',
    descriptionAr:
        'التدمير المأساوي لمكتبة الإسكندرية في عام 391 م، مع التركيز على فقدان المعرفة القديمة والصراع بين التعصب الديني والسعي العلمي.',
  ),

  StoryModel(
    id: "3",
    titleEn: "The Crossing of Hannibal",
    titleAr: "عبور هانيبال",
    level: EnglishLevelEnum.intermediate,
    duration: 6,
    contentEn:
        """The year was 218 BCE, and Hannibal Barca stood at the foot of the Alps, gazing up at the snow-capped peaks that seemed to touch the heavens. Behind him stretched an army of 90,000 men, 12,000 cavalry, and 37 war elephants - the greatest military force Carthage had ever assembled. His father Hamilcar had made him swear eternal hatred against Rome when he was just nine years old. Now, at twenty-nine, Hannibal was ready to fulfill that oath in the most audacious way imaginable - by crossing the impossible mountains and attacking Rome from the north. The local Gallic tribes watched in amazement as the Carthaginian army began its ascent. No one had ever attempted to cross the Alps with such a massive force, especially not with elephants. The Romans, confident in their mountain barrier, had left their northern borders lightly defended. Maharbal, Hannibal's trusted cavalry commander, rode alongside his general as they climbed higher into the treacherous passes. The air grew thin, and men began to collapse from exhaustion. The elephants, magnificent in the warm plains of Spain, struggled desperately in the ice and snow. One by one, they began to fall. After fifteen days of hellish climbing, avalanches, and attacks from mountain tribes, Hannibal's army finally emerged into the Po Valley. But the cost had been enormous - only 26,000 men, 6,000 cavalry, and a handful of elephants had survived the crossing. Yet what they had accomplished was beyond belief. A young Roman scout, Marcus, galloped frantically toward Rome with news that would shake the Republic to its core. The impossible had happened - Hannibal was in Italy. The Second Punic War had begun, and Rome's greatest test awaited.""",
    contentAr:
        """كان العام 218 ق.م، وهانيبال برقة يقف عند سفح جبال الألب، محدقاً في القمم المكسوة بالثلوج التي بدت وكأنها تلامس السماء. خلفه امتد جيش من 90,000 رجل، و12,000 من الفرسان، و37 فيل حرب - أعظم قوة عسكرية جمعتها قرطاج على الإطلاق. والده هاميلكار جعله يقسم بالعداء الأبدي ضد روما عندما كان في التاسعة من عمره فقط. الآن، في التاسعة والعشرين، كان هانيبال مستعداً لتحقيق ذلك القسم بأكثر الطرق جرأة - بعبور الجبال المستحيلة ومهاجمة روما من الشمال. القبائل الغالية المحلية راقبت بدهشة بينما بدأ الجيش القرطاجي صعوده. لم يحاول أحد من قبل عبور جبال الألب بمثل هذه القوة الضخمة، خاصة ليس مع الفيلة. الرومان، الواثقون من حاجز جبالهم، تركوا حدودهم الشمالية محروسة بخفة. مهربال، قائد فرسان هانيبال المؤتمن، ركب بجانب قائده بينما تسلقوا أعلى في الممرات الخطيرة. الهواء أصبح رقيقاً، والرجال بدأوا يسقطون من الإنهاك. الفيلة، الرائعة في سهول إسبانيا الدافئة، كافحت بيأس في الجليد والثلج. واحداً تلو الآخر، بدأوا يسقطون. بعد خمسة عشر يوماً من التسلق الجهنمي والانهيارات الثلجية وهجمات قبائل الجبال، خرج جيش هانيبال أخيراً إلى وادي البو. لكن التكلفة كانت هائلة - فقط 26,000 رجل، و6,000 فارس، وحفنة من الفيلة نجت من العبور. ومع ذلك، ما حققوه كان يفوق التصديق. كشاف روماني شاب، ماركوس، ركض مسرعاً نحو روما بأخبار ستهز الجمهورية إلى جوهرها. المستحيل حدث - هانيبال في إيطاليا.""",
    descriptionEn:
        'The legendary crossing of the Alps by Hannibal in 218 BCE, one of military history\'s most daring and costly campaigns that brought the Second Punic War to Roman soil.',
    descriptionAr:
        'العبور الأسطوري لجبال الألب من قبل هانيبال في 218 ق.م، واحدة من أكثر الحملات جرأة وكلفة في التاريخ العسكري التي جلبت الحرب البونيقية الثانية إلى الأراضي الرومانية.',
  ),

  StoryModel(
    id: "4",
    titleEn: "The Night of Broken Glass",
    titleAr: "ليلة الزجاج المكسور",
    level: EnglishLevelEnum.advanced,
    duration: 9,
    contentEn:
        """November 9, 1938. The streets of Berlin echoed with the sound of shattering glass and angry voices. Kristallnacht - the Night of Broken Glass - had begun. What started as retaliation for the assassination of a German diplomat in Paris had become a coordinated attack on Jewish communities across Nazi Germany. Sarah Goldstein pressed her face against the window of her family's bakery, watching in terror as SA stormtroopers marched down Rosenthaler Straße. Her father Jakob had built this business over thirty years, serving German and Jewish customers alike. The smell of fresh bread had always filled their home above the shop, but tonight it was overwhelmed by smoke and fear. Across the street, the synagogue where Sarah had celebrated her Bat Mitzvah just two years earlier was ablaze. Rabbi Stern, who had taught her Hebrew, was nowhere to be seen. The sacred Torah scrolls, handwritten centuries ago, were feeding the flames along with prayer books and religious artifacts. The fire department stood by, ordered only to prevent the flames from spreading to Aryan-owned buildings. Hans Mueller, their Christian neighbor and longtime customer, knocked frantically on their back door. 'Jakob, you must hide,' he whispered urgently. 'They're coming for all the Jewish shops.' But it was too late. The sound of jackboots on cobblestones grew louder, accompanied by the crash of glass and wood. Young Kurt Weber, barely eighteen and caught up in the Nazi fervor, raised his truncheon against the bakery window. For a moment, he hesitated - he remembered Sarah giving him free cookies when they were children. But the crowd's bloodlust swept away his humanity. By dawn, over 7,500 Jewish businesses lay in ruins. Thirty thousand Jewish men had been arrested and sent to concentration camps. The broken glass crunched underfoot like the shattered dreams of German Jews who had once believed they belonged in the land of their birth.""",
    contentAr:
        """9 نوفمبر 1938. شوارع برلين تردد صدى صوت الزجاج المتكسر والأصوات الغاضبة. ليلة الكريستال - ليلة الزجاج المكسور - قد بدأت. ما بدأ كانتقام لاغتيال دبلوماسي ألماني في باريس أصبح هجوماً منسقاً على المجتمعات اليهودية عبر ألمانيا النازية. سارة غولدشتاين ضغطت وجهها على نافذة مخبز عائلتها، تراقب بفزع بينما جنود العاصفة يسيرون في شارع روزنتالر. والدها يعقوب بنى هذا العمل على مدى ثلاثين عاماً، يخدم الزبائن الألمان واليهود على حد سواء. رائحة الخبز الطازج كانت تملأ منزلهم دائماً فوق المتجر، لكن هذه الليلة غلبت عليها رائحة الدخان والخوف. عبر الشارع، الكنيس حيث سارة احتفلت بالبات ميتزفا قبل عامين فقط كان يحترق. الحاخام شتيرن، الذي علمها العبرية، لم يكن في أي مكان. لفائف التوراة المقدسة، المكتوبة بخط اليد منذ قرون، كانت تغذي النيران مع كتب الصلاة والآثار الدينية. قسم الإطفاء وقف جانباً، مأمور فقط بمنع انتشار النيران إلى المباني المملوكة للآريين. هانز مولر، جارهم المسيحي والزبون القديم، طرق بجنون على بابهم الخلفي. 'يعقوب، يجب أن تختبئ،' همس بإلحاح. 'إنهم قادمون لكل المتاجر اليهودية.' لكن كان الوقت قد فات. صوت الأحذية العسكرية على الحجارة ازداد علواً، مصحوباً بصوت تحطم الزجاج والخشب. كورت ويبر الشاب، بالكاد في الثامنة عشرة ومنجرف في الحماس النازي، رفع هراوته ضد نافذة المخبز. للحظة، تردد - تذكر سارة تعطيه بسكويت مجاني عندما كانوا أطفالاً. لكن عطش الحشد للدماء اجتاح إنسانيته. مع الفجر، أكثر من 7,500 عمل يهودي كان في خراب. ثلاثون ألف رجل يهودي تم اعتقالهم وإرسالهم إلى معسكرات الاعتقال. الزجاج المكسور طقطق تحت الأقدام مثل الأحلام المحطمة لليهود الألمان الذين اعتقدوا يوماً أنهم ينتمون إلى أرض مولدهم.""",
    descriptionEn:
        'A haunting account of Kristallnacht (November 9, 1938), the coordinated Nazi attack on Jewish communities that marked a turning point toward the Holocaust.',
    descriptionAr:
        'سرد مؤثر لليلة الكريستال (9 نوفمبر 1938)، الهجوم النازي المنسق على المجتمعات اليهودية الذي مثل نقطة تحول نحو الهولوكوست.',
  ),

  StoryModel(
    id: "5",
    titleEn: "The Defiance of Spartacus",
    titleAr: "تمرد سبارتاكوس",
    level: EnglishLevelEnum.intermediate,
    duration: 7,
    contentEn:
        """The year was 73 BCE, and the gladiator barracks of Capua reeked of sweat, blood, and desperation. Spartacus, a Thracian warrior enslaved by Rome, sharpened his sword in the dim torchlight. Around him, seventy fellow gladiators - Germans, Gauls, and other conquered peoples - prepared for what seemed like certain death. They had reached their breaking point. No more would they die for the entertainment of Roman crowds. Tonight, they would fight for something greater - their freedom. Crixus, a towering Gaul with scars covering his massive frame, nodded grimly at Spartacus. 'Better to die as free men than live as slaves,' he whispered. Oenomaus, the German gladiator, tested the edge of his stolen kitchen knife. They had no proper weapons, no armor, no plan beyond escape. But they had something the Romans didn't expect - the fury of the oppressed. The rebellion began with a desperate rush from the gladiator school. Spartacus and his men overwhelmed their guards, seized weapons from the armory, and fought their way into the streets of Capua. Roman citizens fled in terror as the very men who had entertained them now turned their combat skills toward freedom. Word of the uprising spread like wildfire through the slave quarters of southern Italy. Field hands, miners, household servants - all the forgotten people of the Roman Empire - began joining the rebellion. Within months, what started as seventy desperate gladiators had become an army of over 100,000 freed slaves. Marcus Crassus, the wealthy Roman general, watched from his villa as reports poured in of Spartacus's victories. This was no mere slave revolt - it was a full-scale war that threatened the very foundation of Roman society. The impossible had happened: slaves had become an army, and Rome trembled.""",
    contentAr:
        """كان العام 73 ق.م، وثكنات المصارعين في كابوا تفوح برائحة العرق والدم واليأس. سبارتاكوس، المحارب التراقي المستعبد من قبل روما، شحذ سيفه في ضوء الشعلة الخافت. حوله، سبعون مصارعاً - ألمان وغاليون وشعوب مقهورة أخرى - استعدوا لما بدا وكأنه موت محقق. لقد وصلوا إلى نقطة الانهيار. لن يموتوا بعد الآن من أجل تسلية الحشود الرومانية. هذه الليلة، سيقاتلون من أجل شيء أعظم - حريتهم. كريكسوس، الغالي الشاهق مع ندوب تغطي جسمه الضخم، أومأ بقتامة لسبارتاكوس. 'من الأفضل أن نموت كرجال أحرار من أن نعيش كعبيد،' همس. أوينوماوس، المصارع الألماني، اختبر حد سكين المطبخ المسروق. لم تكن لديهم أسلحة مناسبة، لا درع، لا خطة عدا الهروب. لكن كان لديهم شيء لم تتوقعه روما - غضب المظلومين. التمرد بدأ باندفاع يائس من مدرسة المصارعين. سبارتاكوس ورجاله غلبوا حراسهم، استولوا على الأسلحة من المستودع، وقاتلوا طريقهم إلى شوارع كابوا. المواطنون الرومان فروا بفزع بينما الرجال الذين سلوهم تحولت مهاراتهم القتالية نحو الحرية. أخبار الانتفاضة انتشرت كالنار في أحياء العبيد في جنوب إيطاليا. عمال الحقول، عمال المناجم، خدم المنازل - كل الناس المنسيين في الإمبراطورية الرومانية - بدأوا بالانضمام للتمرد. في أشهر، ما بدأ كسبعين مصارعاً يائساً أصبح جيشاً من أكثر من 100,000 عبد محرر. ماركوس كراسوس، القائد الروماني الثري، راقب من فيلته بينما تقارير انتصارات سبارتاكوس تتدفق. هذا لم يكن مجرد تمرد عبيد - كانت حرباً كاملة تهدد أساس المجتمع الروماني ذاته. المستحيل حدث: العبيد أصبحوا جيشاً، وروما ارتجفت.""",
    descriptionEn:
        'The legendary slave rebellion led by Spartacus in 73 BCE, which grew from a gladiator school breakout into the largest slave uprising in Roman history.',
    descriptionAr:
        'التمرد الأسطوري للعبيد بقيادة سبارتاكوس في 73 ق.م، الذي نما من هروب من مدرسة مصارعين إلى أكبر انتفاضة عبيد في التاريخ الروماني.',
  ),

  StoryModel(
    id: "6",
    titleEn: "The Miracle of Dunkirk",
    titleAr: "معجزة دونكيرك",
    level: EnglishLevelEnum.advanced,
    duration: 8,
    contentEn:
        """May 26, 1940. The beaches of Dunkirk stretched endlessly under gray skies, packed with over 300,000 British and French soldiers trapped between the advancing German Wehrmacht and the cold English Channel. Operation Dynamo - the greatest evacuation in military history - was about to begin. Tommy Atkins, a young private from Manchester, lay in the sand dunes clutching his rifle, watching German Stukas dive-bomb the harbor. The Luftwaffe controlled the skies, and Panzer tanks were just miles away. It seemed impossible that anyone would escape this trap alive. The Royal Navy's destroyers tried desperately to reach the soldiers, but the harbor was too shallow and under constant attack. That's when the call went out across England: every boat that could float was needed for the rescue. From the Thames, from coastal villages, from yacht clubs and fishing ports, an extraordinary armada began to assemble. Charles Lightoller, the 66-year-old former officer of the Titanic, took his motor yacht Sundowner across the Channel. Beside him sailed fishing boats, pleasure craft, Thames river barges, and even a paddle steamer. The smallest vessel was just 14 feet long. Under heavy fire from German artillery and aircraft, this unlikely fleet of 'little ships' began ferrying soldiers from the beaches to the larger vessels waiting offshore. Young French soldier Henri Dubois found himself packed into a fishing boat with thirty other men, German bullets whistling overhead. The boat's elderly British captain, pipe clenched between his teeth, navigated calmly through the chaos as if he were on a Sunday cruise. For nine days, the evacuation continued. Against all odds, 338,226 Allied soldiers were rescued from certain death or capture. The 'Miracle of Dunkirk' had transformed a military disaster into a symbol of courage and determination that would inspire Britain through its darkest hour.""",
    contentAr:
        """26 مايو 1940. شواطئ دونكيرك امتدت بلا نهاية تحت سماء رمادية، مليئة بأكثر من 300,000 جندي بريطاني وفرنسي محاصرين بين الفيرماخت الألماني المتقدم والمانش الإنجليزي البارد. عملية دينامو - أعظم إجلاء في التاريخ العسكري - كانت على وشك البدء. تومي أتكينز، جندي شاب من مانشستر، استلقى في الكثبان الرملية ممسكاً ببندقيته، يراقب طائرات الستوكا الألمانية تقصف الميناء. اللوفتوافا سيطرت على السماء، ودبابات البانزر كانت على بعد أميال فقط. بدا مستحيلاً أن ينجو أي أحد من هذا الفخ حياً. مدمرات البحرية الملكية حاولت بيأس الوصول للجنود، لكن الميناء كان ضحلاً جداً وتحت هجوم مستمر. عندها صدرت الدعوة عبر إنجلترا: كل قارب يمكنه الطفو مطلوب للإنقاذ. من التايمز، من القرى الساحلية، من نوادي اليخوت وموانئ الصيد، بدأ أسطول استثنائي بالتجمع. تشارلز لايتولر، الضابط السابق في التايتانيك البالغ 66 عاماً، أخذ يخته الآلي ساندوونر عبر المانش. بجانبه أبحرت قوارب الصيد، والقوارب الترفيهية، وبارجات نهر التايمز، وحتى باخرة مجدافية. أصغر سفينة كانت 14 قدماً فقط. تحت نيران ثقيلة من المدفعية والطائرات الألمانية، بدأ هذا الأسطول غير المتوقع من 'السفن الصغيرة' بنقل الجنود من الشواطئ إلى السفن الأكبر المنتظرة في البحر. الجندي الفرنسي الشاب هنري دوبوا وجد نفسه محشوراً في قارب صيد مع ثلاثين رجلاً آخر، والرصاص الألماني يصفر فوق رؤوسهم. قبطان القارب البريطاني المسن، والغليون مشدود بين أسنانه، تنقل بهدوء عبر الفوضى وكأنه في رحلة يوم أحد. لتسعة أيام، استمر الإجلاء. ضد كل الاحتمالات، تم إنقاذ 338,226 جندي من قوات الحلفاء من موت أو أسر محقق. 'معجزة دونكيرك' حولت كارثة عسكرية إلى رمز للشجاعة والعزيمة الذي ألهم بريطانيا خلال أحلك ساعاتها.""",
    descriptionEn:
        'The miraculous evacuation of Allied forces from Dunkirk in May 1940, when hundreds of civilian boats joined the Royal Navy to rescue over 300,000 soldiers from German encirclement.',
    descriptionAr:
        'الإجلاء المعجز لقوات الحلفاء من دونكيرك في مايو 1940، عندما انضمت مئات القوارب المدنية للبحرية الملكية لإنقاذ أكثر من 300,000 جندي من الحصار الألماني.',
  ),
  StoryModel(
    id: "1",
    titleEn: "The Last Stand of Baghdad",
    titleAr: "الوقفة الأخيرة لبغداد",
    level: EnglishLevelEnum.advanced,
    duration: 8,
    contentEn:
        """The year was 1258, and the Mongol army surrounded Baghdad like a storm of death. Caliph Al-Musta'sim stood on the palace walls, watching the endless sea of warriors stretching beyond the horizon. The golden age of Islam trembled on the edge of extinction.
Inside the House of Wisdom, scholars frantically copied manuscripts by candlelight. Ibn Sina's medical texts, Al-Khwarizmi's mathematical theorems, centuries of accumulated knowledge faced obliteration. The librarian, Hassan, wept as he chose which books to save and which to abandon to the flames.
The siege had lasted for days. Food ran scarce, and the people's faith wavered. In the mosques, imams led desperate prayers while outside, catapults hurled stones and fire. The Tigris River would soon run black with ink from the destroyed libraries and red with the blood of the fallen.
Young Omar, a soldier barely sixteen, clutched his scimitar with trembling hands. His father had died defending the outer walls. His mother had sent him her final blessing wrapped in a piece of torn cloth. He thought of the Prophet's words about defending one's home and found courage in his heart.
The final assault began at dawn. Hulagu Khan's forces breached the gates like a flood breaking through a dam. Omar fought with the fury of a lion, his blade singing through the air. But for every Mongol that fell, ten more took his place.
As the palace burned and the last defenders fell, Hassan the librarian made one final act of defiance. He threw the most precious manuscripts into a secret well, hoping future generations might recover the lost wisdom of the Islamic Golden Age. The ink mixed with tears as Baghdad's light was extinguished.""",
    contentAr:
        """كان العام 1258، وجيش المغول يحاصر بغداد كعاصفة من الموت. وقف الخليفة المستعصم على أسوار القصر، يراقب البحر اللانهائي من المحاربين الممتد إلى ما وراء الأفق. العصر الذهبي للإسلام يرتجف على حافة الانقراض.
داخل بيت الحكمة، العلماء ينسخون المخطوطات بجنون على ضوء الشموع. نصوص ابن سينا الطبية، نظريات الخوارزمي الرياضية، قرون من المعرفة المتراكمة تواجه الإبادة. البيبليوتكاري، حسن، بكى وهو يختار أي كتب يحفظ وأي يتركها للنيران.
الحصار استمر لأيام. الطعام نفد، وإيمان الناس تزعزع. في المساجد، الأئمة يقودون صلوات يائسة بينما في الخارج، المنجنيقات تقذف الحجارة والنار. نهر دجلة سيصبح قريباً أسود بحبر المكتبات المدمرة وأحمر بدماء الساقطين.
عمر الشاب، جندي بالكاد يبلغ السادسة عشرة، يمسك بسيفه بيدين مرتجفتين. والده مات وهو يدافع عن الأسوار الخارجية. أمه أرسلت له بركتها الأخيرة ملفوفة في قطعة قماش ممزقة. فكر في كلمات النبي عن الدفاع عن الوطن ووجد الشجاعة في قلبه.
الهجوم الأخير بدأ عند الفجر. قوات هولاكو خان اخترقت البوابات كفيضان يخترق السد. عمر قاتل بغضب الأسد، نصله يغني في الهواء. لكن لكل مغولي يسقط، عشرة آخرون يأخذون مكانه.
وبينما القصر يحترق والمدافعون الأخيرون يسقطون، حسن المكتبي قام بعمل تحدٍ أخير. ألقى أثمن المخطوطات في بئر سري، آملاً أن الأجيال القادمة قد تستعيد الحكمة المفقودة للعصر الذهبي الإسلامي. الحبر امتزج بالدموع وضوء بغداد انطفأ.""",
    descriptionEn:
        'The Last Stand of Baghdad is a gripping tale set during the Mongol siege of Baghdad in 1258, focusing on the courage of a young soldier and the tragic loss of Islamic knowledge.',
    descriptionAr:
        'الوقفة الأخيرة لبغداد هي قصة مثيرة تدور أحداثها خلال حصار المغول لبغداد في عام 1258، تركز على شجاعة جندي شاب والخسارة المأساوية للمعرفة الإسلامية.',
  ),

  // Story 2
  StoryModel(
      descriptionAr:
          'صفقة الجني هي قصة مثيرة عن تاجر يكتشف مصباحًا قديمًا في الصحراء ويواجه جنيًا قويًا يقدم له ثلاث أمنيات، لكن كل أمنية تأتي بثمن باهظ.',
      descriptionEn:
          'The Djinn\'s Bargain is a thrilling tale of a merchant who discovers an ancient lamp in the desert and faces a powerful djinn offering three wishes, each with a heavy price.',
      id: "2",
      titleEn: "The Djinn's Bargain",
      titleAr: "صفقة الجني",
      level: EnglishLevelEnum.intermediate,
      duration: 6,
      contentEn:
          """In the burning sands of the Rub' al Khali, merchant Khalil discovered an ancient brass lamp half-buried beneath a dead palm tree. The caravan had been lost for three days, water running low, hope fading like mirages in the desert heat.
When Khalil rubbed the lamp to clean off the sand, purple smoke erupted like a volcano. The djinn that emerged was not the benevolent genie of children's tales, but a creature of fire and shadow, its eyes burning like twin suns in the darkness of its face.
'Three wishes, mortal,' the djinn hissed, its voice like wind through broken stones. 'But know that every desire comes with a price. I am Malik al-Nar, the King of Fire, bound by Solomon's seal to serve, but not to mercy.'
Khalil's first thought was water for his dying caravan. 'I wish for an oasis to save my men,' he said. The djinn smiled, showing teeth like broken glass. An oasis appeared, but it was inhabited by flesh-eating ghouls that devoured half the caravan before the survivors could escape.
Desperate and guilt-ridden, Khalil made his second wish: 'Bring back my men who died.' The djinn's laughter echoed across the dunes. The dead rose, but as mindless husks that followed Khalil with empty eyes and rotting flesh, a constant reminder of his foolishness.
For his final wish, Khalil had learned wisdom through suffering. 'I wish to undo my first two wishes and accept whatever fate Allah has written for us.' The djinn paused, surprised by the request. With a grudging nod of respect, it granted the wish.
Khalil found himself back at the moment he first rubbed the lamp, but this time he cast it far into the desert sand. His caravan was still lost, but they would face their trials with dignity and faith, trusting in divine providence rather than the treacherous gifts of supernatural beings.""",
      contentAr:
          """في رمال الربع الخالي المحرقة، اكتشف التاجر خليل مصباحاً نحاسياً قديماً مدفوناً نصف دفن تحت نخلة ميتة. القافلة كانت تائهة لثلاثة أيام، الماء ينفد، والأمل يتلاشى كالسراب في حر الصحراء.
عندما فرك خليل المصباح لينظف عنه الرمل، انفجر دخان بنفسجي كالبركان. الجني الذي ظهر لم يكن الجني الخير في حكايات الأطفال، بل مخلوق من نار وظل، عيناه تحترقان كشمسين توأمين في ظلام وجهه.
'ثلاث أمنيات، أيها الفاني,' هسّ الجني، صوته كالريح عبر الحجارة المكسورة. 'لكن اعلم أن كل رغبة لها ثمن. أنا مالك النار، مقيد بخاتم سليمان للخدمة، لكن ليس للرحمة.'
أول ما فكر فيه خليل كان الماء لقافلته الموشكة على الموت. 'أتمنى واحة لإنقاذ رجالي,' قال. ابتسم الجني مظهراً أسناناً كالزجاج المكسور. ظهرت واحة، لكنها كانت مسكونة بغيلان آكلة لحوم التهمت نصف القافلة قبل أن يتمكن الناجون من الهرب.
يائساً ومثقلاً بالذنب، خليل تمنى أمنيته الثانية: 'أعد رجالي الذين ماتوا.' ضحكة الجني صدت عبر الكثبان. الموتى قاموا، لكن كأشباح بلا عقل تتبع خليلاً بعيون فارغة ولحم متعفن، تذكير دائم بحماقته.
لأمنيته الأخيرة، خليل تعلم الحكمة من المعاناة. 'أتمنى إلغاء أمنيتي الأولى والثانية وأقبل أي مصير كتبه الله لنا.' الجني توقف، مفاجأ بالطلب. بإيماءة احترام مترددة، حقق الأمنية.
وجد خليل نفسه عائداً للحظة التي فرك فيها المصباح أول مرة، لكن هذه المرة ألقاه بعيداً في رمل الصحراء. قافلته ما زالت تائهة، لكنهم سيواجهون محنهم بكرامة وإيمان، واثقين في العناية الإلهية بدلاً من هدايا المخلوقات الخارقة الغادرة."""),

  // Story 3
  StoryModel(
      descriptionAr:
          'سيف خالد بن الوليد هو قصة ملحمية عن القائد الإسلامي خالد بن الوليد الذي يقود جيشه في حصار أجنادين ضد البيزنطيين، مستخدمًا استراتيجياته العسكرية الفريدة وقوة إيمانه.',
      descriptionEn:
          'The Sword of Khalid ibn al-Walid is an epic tale of the Islamic commander Khalid ibn al-Walid leading his army in the siege of Ajnadayn against the Byzantines, using his unique military strategies and the strength of his faith.',
      id: "3",
      titleEn: "The Sword of Khalid ibn al-Walid",
      titleAr: "سيف خالد بن الوليد",
      level: EnglishLevelEnum.advanced,
      duration: 7,
      contentEn:
          """The Byzantine fortress of Ajnadayn stood defiant against the desert wind, its walls gleaming white under the merciless sun. Inside, Emperor Heraclius's finest soldiers prepared for what they knew would be their final battle. The undefeated Sword of Allah was coming.
Khalid ibn al-Walid sat on his war horse, studying the fortress through the heat haze. His legendary blade, Dhul-Fiqar, hung at his side, its steel having tasted victory in a hundred battles. Behind him, the combined armies of the Ridda Wars veterans waited like coiled serpents.
'They think their walls will save them,' Khalid murmured to his lieutenant, Ikrimah. 'But walls are only as strong as the men who defend them, and fear has already breached their hearts.' The Muslim army had appeared from the impossible direction - through the waterless desert that no army could cross.
Inside the fortress, Commander Vahan paced the ramparts like a caged lion. His scouts had reported the impossible: a cavalry charge across the Sinai Desert that should have killed every horse and rider. Yet here they stood, barely showing signs of thirst, as if the desert itself had carried them.
The siege began with psychological warfare. Khalid ordered his men to perform their prayers in perfect synchronization, their voices carrying the call to faith across the stone walls. The Byzantine soldiers watched in fascination and growing dread as thousands prostrated as one.
At dawn, the real assault commenced. Khalid's famous pincer movement - the same that had destroyed the Persian armies at Ullais - began to unfold. The Muslim cavalry split into wings, their horses moving like wind-driven sand around the fortress walls.
The defense crumbled not from overwhelming force, but from the erosion of will. Vahan watched his men desert their posts as reports came of impossible Muslim maneuvers. When the final charge came, led by Khalid himself with Dhul-Fiqar raised high, the fortress gates opened not to desperate sorties but to fleeing defenders.
As the dust settled and the Byzantine banners fell, Khalid knelt in prayer among the conquered stones. His victories had opened the path to Jerusalem, but he knew that conquest without justice was merely destruction. The Sword of Allah had drawn blood, but it was faith that had won the day.""",
      contentAr:
          """حصن أجنادين البيزنطي وقف متحديًا ريح الصحراء، جدرانه تلمع بيضاء تحت الشمس القاسية. في الداخل، أفضل جنود الإمبراطور هرقل يستعدون لما يعرفون أنها ستكون معركتهم الأخيرة. سيف الله المسلول قادم.
خالد بن الوليد جلس على جواده الحربي، يدرس الحصن عبر سراب الحر. سيفه الأسطوري، ذو الفقار، معلق على جانبه، فولاذه ذاق النصر في مئة معركة. خلفه، جيوش موحدة من قدماء حروب الردة ينتظرون كالثعابين الملتفة.
'يظنون أن جدرانهم ستنقذهم,' تمتم خليل لملازمه، عكرمة. 'لكن الجدران قوية بقوة الرجال الذين يدافعون عنها، والخوف اخترق قلوبهم بالفعل.' الجيش المسلم ظهر من الاتجاه المستحيل - عبر الصحراء بلا ماء التي لا يمكن لأي جيش عبورها.
داخل الحصن، القائد باهان يمشي على الأسوار كأسد محبوس. كشافته أبلغوا المستحيل: هجوم فرسان عبر صحراء سيناء كان يجب أن يقتل كل حصان وفارس. ومع ذلك هنا يقفون، بالكاد يظهرون علامات العطش، كأن الصحراء نفسها حملتهم.
الحصار بدأ بحرب نفسية. خالد أمر رجاله بأداء صلاتهم في تزامن مثالي، أصواتهم تحمل دعوة الإيمان عبر الجدران الحجرية. الجنود البيزنطيون راقبوا بإعجاب وخوف متزايد آلاف يسجدون كواحد.
عند الفجر، الهجوم الحقيقي بدأ. حركة خالد الكماشية الشهيرة - نفسها التي دمرت الجيوش الفارسية في أُلَّيس - بدأت تتكشف. الفرسان المسلمون انقسموا لأجنحة، خيولهم تتحرك كالرمل المدفوع بالريح حول جدران الحصن.
الدفاع انهار ليس من القوة الساحقة، بل من تآكل الإرادة. باهان راقب رجاله يهجرون مواقعهم وتأتي تقارير عن مناورات مسلمة مستحيلة. عندما جاءت الهجمة الأخيرة، بقيادة خالد نفسه رافعاً ذا الفقار عالياً، بوابات الحصن فُتحت ليس لهجمات يائسة بل لمدافعين هاربين.
وبينما الغبار يهدأ ورايات البيزنطيين تسقط، خالد ركع للصلاة بين الحجارة المفتوحة. انتصاراته فتحت الطريق للقدس، لكنه عرف أن الفتح بلا عدالة مجرد تدمير. سيف الله سفك الدماء، لكن الإيمان هو الذي ربح اليوم."""),

  // Story 4
  StoryModel(
      descriptionAr:
          'ليلة القدر هي قصة ملحمية عن النبي محمد صلى الله عليه وسلم الذي يتلقى أول وحي من الله في غار حراء، مما يغير مجرى التاريخ الإسلامي والعالمي.',
      descriptionEn:
          'The Night of Decree is an epic tale of the Prophet Muhammad (peace be upon him) receiving the first revelation from Allah in the Cave of Hira, changing the course of Islamic and world history.',
      id: "4",
      titleEn: "The Night of Decree",
      titleAr: "ليلة القدر",
      level: EnglishLevelEnum.intermediate,
      duration: 5,
      contentEn:
          """In the cave of Hira, Muhammad ibn Abdullah sat in meditation as he had done for countless nights. The rocky walls seemed to breathe with the weight of divine presence, and the air itself felt charged with unseen energy. Little did he know that this night would change the course of human history.
The forty-year-old merchant had retreated to this mountain cave seeking answers to the spiritual emptiness he felt in Mecca's idol-worshipping society. The wealthy traders below cared only for gold and status, while the poor suffered in silence. His heart ached for truth and justice.
Suddenly, the cave filled with a light brighter than the desert sun at noon. Before Muhammad stood a being of such majesty and terror that his soul trembled. The angel Gabriel, Jibril in Arabic, appeared in his true form, his six hundred wings blocking out the stars themselves.
'Read!' commanded the angel, his voice like thunder rolling across the heavens. Muhammad, who had never learned to read or write, stammered in confusion and fear. 'I cannot read!' The angel embraced him so tightly that he felt his ribs might crack, then released him.
'Read in the name of your Lord who created! Created man from a clot of blood! Read, and your Lord is most generous!' The words burned themselves into Muhammad's memory like fire on parchment. The first revelation of the Quran had been delivered, and the final message to humanity had begun.
Muhammad stumbled down the mountain, his mind reeling from the encounter. His wife Khadijah found him trembling and wrapped him in a cloak, comforting him as he related the impossible experience. 'You speak truth,' she said with unwavering faith. 'You will be the messenger of Allah.'
From that night forward, the revelations would continue for twenty-three years. The Night of Decree had set in motion events that would spread from the Arabian Peninsula to the ends of the earth. In a cave on Mount Hira, the word of God had chosen its final messenger, and the world would never be the same.""",
      contentAr:
          """في غار حراء، محمد بن عبد الله جلس يتأمل كما فعل ليالي لا تُحصى. الجدران الصخرية بدت تتنفس بثقل الحضور الإلهي، والهواء نفسه شعر مشحوناً بطاقة غير مرئية. لم يعلم أن هذه الليلة ستغير مجرى التاريخ البشري.
التاجر الأربعيني انسحب لهذا الكهف الجبلي باحثاً عن إجابات للفراغ الروحي الذي شعر به في مجتمع مكة عابد الأصنام. التجار الأثرياء أسفل يهتمون فقط بالذهب والمكانة، بينما الفقراء يعانون في صمت. قلبه تألم للحق والعدالة.
فجأة، الكهf امتلأ بنور أسطع من شمس الصحراء في الظهيرة. أمام محمد وقف كائن من الجلال والرهبة حتى أن روحه ارتجفت. الملاك جبريل، جبريل بالعربية، ظهر في شكله الحقيقي، أجنحته الستمائة تحجب النجوم نفسها.
'اقرأ!' أمر الملاك، صوته كالرعد يتدحرج عبر السموات. محمد، الذي لم يتعلم القراءة أو الكتابة قط، تلعثم في حيرة وخوف. 'ما أنا بقارئ!' الملاك عانقه بقوة حتى شعر أن أضلاعه قد تنكسر، ثم أطلقه.
'اقرأ باسم ربك الذي خلق! خلق الإنسان من علق! اقرأ وربك الأكرم!' الكلمات احترقت في ذاكرة محمد كالنار على الرق. الوحي الأول من القرآن قد نُزِّل، والرسالة الأخيرة للبشرية بدأت.
محمد تعثر هابطاً الجبل، عقله يترنح من اللقاء. زوجته خديجة وجدته يرتجف ولفته بعباءة، تواسيه وهو يروي التجربة المستحيلة. 'أنت تقول الحق,' قالت بإيمان لا يتزعزع. 'ستكون رسول الله.'
من تلك الليلة فصاعداً، الوحي سيستمر لثلاثة وعشرين عاماً. ليلة القدر وضعت في الحركة أحداثاً ستنتشر من الجزيرة العربية لأقاصي الأرض. في كهف على جبل حراء، كلمة الله اختارت رسولها الأخير، والعالم لن يكون كما كان."""),

  // Story 5
  StoryModel(
      descriptionAr:
          'حصار فيينا هو قصة ملحمية عن الحصار العثماني لفيينا في عام 1683، حيث يواجه جيش الخلافة العثمانية أكبر تحدٍ له في قلب أوروبا.',
      descriptionEn:
          'The Siege of Vienna is an epic tale of the Ottoman siege of Vienna in 1683, where the Ottoman Caliphate\'s army faces its greatest challenge in the heart of Europe.',
      id: "5",
      titleEn: "The Siege of Vienna",
      titleAr: "حصار فيينا",
      level: EnglishLevelEnum.advanced,
      duration: 8,
      contentEn:
          """The Ottoman cannons thundered against Vienna's walls like the voice of Allah himself, each blast shaking the very foundations of Christendom. Grand Vizier Kara Mustafa Pasha sat in his silk pavilion, watching smoke rise from the Austrian capital through his jeweled telescope.
It was September 1683, and the greatest Islamic army ever assembled stood at the gates of Europe's heart. Three hundred thousand Ottoman, Tatar, and allied soldiers stretched across the horizon like a sea of steel and crescent banners. The dream of conquering Europe for Islam had never been closer to reality.
Inside Vienna's walls, Count Ernst Rüdiger von Starhemberg paced the ramparts with growing desperation. Food was running low, ammunition was nearly exhausted, and disease spread through the overcrowded city like wildfire. The promised relief from King John Sobieski of Poland seemed like a cruel fantasy.
Young Janissary Ahmed looked up at the city walls with mixture of anticipation and dread. His father had died at the siege of Candia, his brother at the Battle of Saint Gotthard. Now it was his turn to write his name in glory or join his family in paradise. The assault would begin at dawn.
The Ottoman miners had been working for weeks, digging tunnels beneath Vienna's walls and packing them with gunpowder. When the explosives detonated, entire sections of fortification crumbled into rubble. The way into the city lay open, and the Janissaries prepared for their final charge.
But as the Ottoman forces massed for the decisive assault, war horns echoed from the Kahlenberg heights. Sobieski's winged hussars came thundering down the slope like the wrath of heaven itself, their lances gleaming in the morning sun. The largest cavalry charge in history had begun.
Ahmed found himself caught between the crushing weight of Polish heavy cavalry and Vienna's desperate defenders. His scimitar sang through the air, but there were too many enemies, too few of his brothers left standing. As the Ottoman lines broke and retreat became rout, he understood that the gates of Europe would remain closed to Islam.
Kara Mustafa watched his dream of Islamic conquest die in the dust before Vienna's walls. The green banners of the Prophet retreated across the Hungarian plains, leaving behind thousands of dead and the last great hope of Ottoman expansion into Europe. The tide of Islamic conquest had finally broken against the walls of the West.""",
      contentAr:
          """مدافع العثمانيين رعدت ضد جدران فيينا كصوت الله نفسه، كل انفجار يهز أسس المسيحية ذاتها. الصدر الأعظم قره مصطفى باشا جلس في خيمته الحريرية، يراقب الدخان يتصاعد من العاصمة النمساوية من خلال تلسكوبه المجوهر.
كان سبتمبر 1683، وأعظم جيش إسلامي تم تجميعه يقف على أبواب قلب أوروبا. ثلاثمائة ألف جندي عثماني وتتري وحليف امتدوا عبر الأفق كبحر من الفولاذ ورايات الهلال. حلم فتح أوروبا للإسلام لم يكن أقرب للحقيقة من قبل.
داخل جدران فيينا، الكونت إرنست روديجر فون شتارهمبرغ يخطو على الأسوار بيأس متزايد. الطعام ينفد، الذخيرة تكاد تنتهي، والمرض ينتشر عبر المدينة المكتظة كالنار في الهشيم. الإغاثة الموعودة من الملك جون سوبييسكي من بولندا بدت كخيال قاسٍ.
الانكشاري الشاب أحمد نظر لأسوار المدينة بمزيج من الترقب والخوف. والده مات في حصار كانديا، أخوه في معركة سانت جوتهارد. الآن جاء دوره ليكتب اسمه في المجد أو ينضم لعائلته في الجنة. الهجوم سيبدأ عند الفجر.
المهندسون العثمانيون عملوا لأسابيع، يحفرون أنفاقاً تحت جدران فيينا ويحشونها بالبارود. عندما انفجرت المتفجرات، أقسام كاملة من التحصينات تهاوت لحطام. الطريق للمدينة انفتح، والانكشارية استعدوا لهجمتهم الأخيرة.
لكن بينما القوات العثمانية تحتشد للهجوم الحاسم، أبواق الحرب صدت من مرتفعات كالنبرغ. فرسان سوبييسكي المجنحون جاءوا راعدين هابطين المنحدر كغضب السماء نفسها، رماحهم تلمع في شمس الصباح. أكبر هجمة فرسان في التاريخ بدأت.
أحمد وجد نفسه محاصراً بين الثقل الساحق للفرسان البولنديين الثقيلة ومدافعي فيينا اليائسين. سيفه غنى في الهواء، لكن كان هناك أعداء كثيرون جداً، قلة من إخوته ما زالوا واقفين. وبينما الخطوط العثمانية انكسرت والانسحاب أصبح هزيمة، فهم أن أبواب أوروبا ستبقى مغلقة أمام الإسلام.
قره مصطفى راقب حلمه بالفتح الإسلامي يموت في التراب أمام جدران فيينا. الرايات الخضراء للنبي انسحبت عبر السهول المجرية، تاركة خلفها آلاف الموتى وآخر أمل عظيم للتوسع العثماني في أوروبا. مد الفتح الإسلامي انكسر أخيراً أمام جدران الغرب."""),

  // Story 6
  StoryModel(
      descriptionAr:
          'الكيميائي القرطبي هي قصة مثيرة عن العالم ابن مسرة الذي يسعى لاكتشاف حجر الفلاسفة وإكسير الخلود في قرطبة خلال العصر الذهبي للأندلس.',
      descriptionEn:
          'The Alchemist of Cordoba is a thrilling tale of the scholar Ibn Masarra seeking the Philosopher\'s Stone and the elixir of immortality in Cordoba during the Golden Age of Al-Andalus.',
      id: "6",
      titleEn: "The Alchemist of Cordoba",
      titleAr: "الكيميائي القرطبي",
      level: EnglishLevelEnum.intermediate,
      duration: 6,
      contentEn:
          """In the golden halls of Cordoba, during the reign of Abd al-Rahman III, the scholar Ibn Masarra worked feverishly in his laboratory. The year was 936 CE, and the Umayyad Caliphate of Al-Andalus was at its peak, a beacon of learning in a world shrouded in ignorance.
The alchemist's workshop was filled with strange apparatus: glass tubes that spiraled like serpents, furnaces that burned with blue flames, and countless vials containing mysterious substances that glowed in the darkness. Ibn Masarra sought the greatest prize of all - the Philosopher's Stone that could transform base metals into gold.
But his true obsession was not wealth. In the margins of ancient Greek texts, he had discovered references to an elixir that could grant immortality. With eternal life, he could continue his research forever, unlocking all the secrets of creation that Allah had hidden in the natural world.
One night, as the muezzin's call echoed through Cordoba's marble corridors, Ibn Masarra made a breakthrough. Combining mercury with sulfur under specific astrological conditions, he created a substance that pulsed with inner light. When he fed it to a dying rat, the creature's wounds healed instantly.
Word of his experiments reached the ears of the Caliph himself. Abd al-Rahman III summoned the alchemist to the palace, demanding a demonstration of his miraculous discovery. Before the assembled court, Ibn Masarra prepared his elixir with trembling hands.
'Drink,' commanded the Caliph, offering a goblet of the glowing liquid. Ibn Masarra hesitated, knowing that his calculations might be flawed, that the elixir might kill rather than heal. But under the watchful eyes of the court, he had no choice but to swallow his creation.
Fire coursed through his veins as the elixir took effect. Ibn Masarra felt his heart stop, then restart with supernatural vigor. His gray hair darkened, his wrinkled skin smoothed, and his dimmed eyes blazed with renewed clarity. He had achieved the impossible - he had conquered death itself.
But as days passed, Ibn Masarra realized the horrible truth. The elixir had not granted him immortality - it had trapped him in an endless cycle of death and rebirth. Every sunset, he would age rapidly and die in agony, only to be reborn at dawn, forever cursed to repeat his torment until the end of time.""",
      contentAr:
          """في قاعات قرطبة الذهبية، في عهد عبد الرحمن الثالث، العالم ابن مسرة عمل بحمى في مختبره. العام كان 936 م، والخلافة الأموية في الأندلس في أوجها، منارة تعلم في عالم مكتوم بالجهل.
ورشة الكيميائي امتلأت بأجهزة غريبة: أنابيب زجاجية تلتف كالثعابين، أفران تحترق بلهب أزرق، وقوارير لا تُحصى تحتوي مواد غامضة تتوهج في الظلام. ابن مسرة سعى للجائزة الأعظم - حجر الفلاسفة الذي يمكن أن يحول المعادن الخسيسة لذهب.
لكن هوسه الحقيقي لم يكن الثروة. في هوامش النصوص اليونانية القديمة، اكتشف مراجع لإكسير يمكن أن يمنح الخلود. بالحياة الأبدية، يمكنه متابعة بحثه للأبد، كاشفاً كل أسرار الخلق التي أخفاها الله في العالم الطبيعي.
ليلة واحدة، بينما أذان المؤذن يصدى عبر ممرات قرطبة الرخامية، ابن مسرة حقق اختراقاً. بدمج الزئبق مع الكبريت تحت ظروف فلكية محددة، خلق مادة تنبض بضوء داخلي. عندما أطعمها لجرذ محتضر، جروح المخلوق شُفيت فوراً.
أنباء تجاربه وصلت لآذان الخليفة نفسه. عبد الرحمن الثالث استدعى الكيميائي للقصر، مطالباً بعرض لاكتشافه المعجز. أمام البلاط المجتمع، ابن مسرة حضّر إكسيره بيدين مرتجفتين.
'اشرب,' أمر الخليفة، عارضاً كأساً من السائل المتوهج. ابن مسرة تردد، عارفاً أن حساباته قد تكون خاطئة، أن الإكسير قد يقتل بدلاً من الشفاء. لكن تحت عيون البلاط الراقبة، لم يكن له خيار إلا ابتلاع خلقه.
نار جرت في عروقه بينما الإكسير يؤثر. ابن مسرة شعر بقلبه يتوقف، ثم يعيد البدء بقوة خارقة. شعره الرمادي اسودّ، جلده المتجعد تملّس، وعيناه الخافتتان توهجتا بوضوح متجدد. حقق المستحيل - غلب الموت نفسه.
لكن وبينما الأيام تمر، ابن مسرة أدرك الحقيقة الفظيعة. الإكسير لم يمنحه الخلود - حبسه في دورة لا نهائية من الموت والولادة مجدداً. كل غروب، سيتقدم في السن بسرعة ويموت في عذاب، فقط ليولد مجدداً عند الفجر، ملعون للأبد بتكرار عذابه حتى نهاية الزمن."""),

  // Story 7
  StoryModel(
      descriptionAr:
          'المملوك الأخير هي قصة ملحمية عن السلطان المملوكي طومان باي الذي يقاتل ضد العثمانيين في معركة الريدانية عام 1517، حيث يواجه نهاية سلطنة المماليك.',
      descriptionEn:
          'The Last Mamluk is an epic tale of Mamluk Sultan Tuman Bay fighting against the Ottomans in the Battle of Ridaniya in 1517, facing the end of the Mamluk Sultanate.',
      id: "7",
      titleEn: "The Last Mamluk",
      titleAr: "المملوك الأخير",
      level: EnglishLevelEnum.advanced,
      duration: 7,
      contentEn:
          """The thunder of Ottoman cannons echoed across the Ridaniya plain as Sultan Selim I's army advanced toward Cairo. It was January 1517, and the five-hundred-year reign of the Mamluk Sultanate was about to end in blood and fire. Tuman Bay, the last Mamluk Sultan, prepared for his final battle.
In the ranks of the Mamluk cavalry, Baibars al-Mansouri gripped his lance with hands that had known victory for thirty years. Named after the legendary Baibars who had crushed the Crusaders, he had never tasted defeat. But the world was changing, and gunpowder was making his kind of warrior obsolete.
The Mamluks had been slaves who became kings, warriors torn from their families as children and forged into the finest heavy cavalry the world had ever seen. They had stopped the Mongols at Ain Jalut, driven the Crusaders from the Holy Land, and ruled Egypt with iron discipline for centuries.
But now they faced an enemy that fought with cannons and Janissaries, with tactics that made individual martial prowess meaningless. The Ottoman Empire was a machine of conquest that had devoured Constantinople and was now hungry for Cairo's wealth.
As the battle began, Baibars led his squadron in a thunderous charge against the Ottoman left flank. His horse, trained for years in the arts of war, danced between the enemy spears like a creature of wind and lightning. His sword, Damascus steel that had been passed down through generations, sang its death song.
For a moment, it seemed like the old ways might triumph. The Mamluk charge scattered the Ottoman auxiliaries and reached the Janissary lines. But then the cannons spoke with voices of thunder, and horses and riders vanished in explosions of earth and flame.
Baibars found himself dismounted, his beloved horse dead beneath him, surrounded by Ottoman soldiers. With his back against a palm tree, he made his final stand. His sword cut down three men before a Janissary's musket ball found his heart.
As he lay dying in the Egyptian sand, Baibars heard the sound of his world ending. Cairo's gates had opened, Tuman Bay was fleeing, and the Mamluk Sultanate was becoming history. He closed his eyes and whispered a prayer for the warrior's paradise, knowing he was the last of his kind.""",
      contentAr:
          """رعد مدافع العثمانيين صدى عبر سهل الريدانية بينما جيش السلطان سليم الأول يتقدم نحو القاهرة. كان يناير 1517، وحكم سلطنة المماليك الذي دام خمسمائة عام على وشك الانتهاء بالدم والنار. طومان باي، آخر سلاطين المماليك، يستعد لمعركته الأخيرة.
في صفوف فرسان المماليك، بيبرس المنصوري أمسك برمحه بيدين عرفتا النصر لثلاثين عاماً. مسمى على اسم بيبرس الأسطوري الذي سحق الصليبيين، لم يذق الهزيمة قط. لكن العالم يتغير، والبارود يجعل نوع المحارب مثله عتيق الطراز.
المماليك كانوا عبيداً أصبحوا ملوكاً، محاربين اقتُلعوا من عائلاتهم كأطفال وصُهروا لأفضل فرسان ثقيلة رآها العالم. أوقفوا المغول في عين جالوت، طردوا الصليبيين من الأرض المقدسة، وحكموا مصر بانضباط حديدي لقرون.
لكنهم الآن يواجهون عدواً يقاتل بالمدافع والانكشارية، بتكتيكات تجعل البراعة القتالية الفردية بلا معنى. الإمبراطورية العثمانية كانت آلة فتح التهمت القسطنطينية والآن جائعة لثروة القاهرة.
وبينما المعركة تبدأ، بيبرس قاد سريته في هجمة راعدة ضد الجناح الأيسر العثماني. جواده، المدرب لسنوات في فنون الحرب، رقص بين رماح العدو كمخلوق من ريح وبرق. سيفه، فولاذ دمشقي نُقل عبر الأجيال، غنى أغنية موته.
للحظة، بدا أن الطرق القديمة قد تنتصر. هجمة المماليك شتتت المساعدين العثمانيين ووصلت خطوط الانكشارية. لكن ثم المدافع تكلمت بأصوات الرعد، والخيول والفرسان اختفوا في انفجارات من التراب واللهب.
بيبرس وجد نفسه منزلاً، جواده المحبوب ميت تحته، محاطاً بالجنود العثمانيين. بظهره للنخلة، قام بوقفته الأخيرة. سيفه قطع ثلاثة رجال قبل أن رصاصة بندقية انكشاري تجد قلبه.
وبينما يموت في الرمل المصري، بيبرس سمع صوت عالمه ينتهي. بوابات القاهرة انفتحت، طومان باي يهرب، وسلطنة المماليك تصبح تاريخاً. أغلق عينيه وهمس صلاة لجنة المحاربين، عارفاً أنه آخر من نوعه."""),

  // Story 8
  StoryModel(
      descriptionAr:
          'تاجر سمرقند هي قصة مثيرة عن التاجر عمر السمرقندي الذي يحمل لؤلؤة سوداء غامضة إلى مدينة سمرقند، حيث يواجه غضب تيمورلنك ويكتشف أسراراً مظلمة.',
      descriptionEn:
          'The Merchant of Samarkand is a thrilling tale of the merchant Omar al-Samarkandi carrying a mysterious black pearl to the city of Samarkand, facing the wrath of Tamerlane and uncovering dark secrets.',
      id: "8",
      titleEn: "The Merchant of Samarkand",
      titleAr: "تاجر سمرقند",
      level: EnglishLevelEnum.intermediate,
      duration: 6,
      contentEn:
          """Omar al-Samarkandi clutched his prayer beads as his caravan approached the city gates at dusk. The jeweled domes of Samarkand gleamed like stars in the dying light, but his heart was heavy with the weight of a terrible secret. In his saddlebags lay a cargo that could either make him the richest man in Central Asia or cost him his life.
The year was 1401, and Timur the Lame - Tamerlane to the West - ruled his empire from this magnificent city. The conqueror who had built pyramids from the skulls of his enemies was known for his unpredictable moods and swift justice. Omar had gambled everything on one desperate trade.
Deep in the markets of Delhi, before Timur's army had sacked the city, Omar had acquired something unprecedented: a perfect black pearl the size of a child's fist, said to have been blessed by the Prophet himself. The pearl was rumored to grant its owner victory in battle and wisdom in governance.
But Omar knew the dark truth behind the pearl's origin. It had been stolen from the tomb of a Sufi saint, and the seller had died screaming of visions and curses within days of the transaction. Now Omar carried both immense wealth and what might be divine retribution in his travel pack.
As his caravan entered Samarkand's bazaar, Omar marveled at the city's incredible wealth. Merchants from China displayed silk that flowed like water, while Arab traders offered spices that could flavor a king's banquet. The sound of a dozen languages filled the air as gold changed hands with dizzying speed.
Word of Omar's precious cargo spread through the markets like wildfire. Within hours, he was summoned to appear before Timur himself in the Kok Saray palace. The great conqueror sat on a throne of ivory and gold, his scarred face impassive as Omar prostrated himself on the marble floor.
'Show me this pearl that has half my city talking,' Timur commanded. With trembling hands, Omar unwrapped the black gem. It seemed to absorb light rather than reflect it, and strange whispers filled the air as its dark surface was revealed to the assembled court.
Timur reached for the pearl, but the moment his fingers touched its surface, his eyes widened in horror. Visions of his own death flashed before him - not in glorious battle, but writhing in agony as divine punishment consumed his flesh. He threw the pearl across the room, where it shattered against the wall like ordinary glass.
'Take your cursed treasure and leave my city before dawn,' Timur snarled. 'And pray that whatever djinn you've awakened doesn't follow you into the desert.' Omar gathered the broken fragments and fled into the night, understanding that some forms of wealth come at prices too terrible to pay.""",
      contentAr:
          """عمر السمرقندي أمسك بمسبحته وقافلته تقترب من بوابات المدينة عند الغسق. قباب سمرقند المجوهرة لمعت كالنجوم في الضوء المحتضر، لكن قلبه كان ثقيلاً بوزن سر فظيع. في أكياس سرجه كان حمولة يمكن أن تجعله أغنى رجل في آسيا الوسطى أو تكلفه حياته.
العام كان 1401، وتيمور الأعرج - تامرلان للغرب - يحكم إمبراطوريته من هذه المدينة الرائعة. الفاتح الذي بنى أهراماً من جماجم أعدائه كان معروفاً بمزاجه الغير متوقع وعدالته السريعة. عمر راهن كل شيء على تجارة يائسة واحدة.
عميقاً في أسواق دلهي، قبل أن يدمر جيش تيمور المدينة، عمر حصل على شيء لم يُسبق له مثيل: لؤلؤة سوداء مثالية بحجم قبضة طفل، قيل أنها بُوركت من النبي نفسه. اللؤلؤة شُيع أنها تمنح مالكها النصر في المعركة والحكمة في الحكم.
لكن عمر عرف الحقيقة المظلمة وراء أصل اللؤلؤة. سُرقت من قبر ولي صوفي، والبائع مات صارخاً من الرؤى واللعنات خلال أيام من الصفقة. الآن عمر يحمل ثروة هائلة وما قد يكون انتقاماً إلهياً في حقيبة سفره.
وبينما قافلته تدخل بازار سمرقند، عمر أُعجب بثروة المدينة المذهلة. تجار من الصين عرضوا حريراً يتدفق كالماء، بينما التجار العرب عرضوا توابل يمكن أن تنكه مأدبة ملك. صوت عشرات اللغات ملأ الهواء والذهب يتبادل الأيدي بسرعة مدوخة.
أنباء حمولة عمر الثمينة انتشرت عبر الأسواق كالنار في الهشيم. خلال ساعات، اُستدعي للمثول أمام تيمور نفسه في قصر كوك ساراي. الفاتح العظيم جلس على عرش من عاج وذهب، وجهه المندوب بلا تعبير وعمر يسجد على الأرض الرخامية.
'أرني هذه اللؤلؤة التي جعلت نصف مدينتي يتحدث،' أمر تيمور. بيدين مرتجفتين، عمر كشف الجوهرة السوداء. بدت تمتص الضوء بدلاً من عكسه، وهمسات غريبة ملأت الهواء وسطحها المظلم كُشف للبلاط المجتمع.
تيمور مد يده للؤلؤة، لكن اللحظة التي لمست أصابعه سطحها، عيناه اتسعتا من الرعب. رؤى موته الخاص وميضت أمامه - ليس في معركة مجيدة، بل يتلوى في عذاب بينما العقاب الإلهي يلتهم لحمه. ألقى اللؤلؤة عبر الغرفة، حيث تحطمت ضد الحائط كزجاج عادي.
'خذ كنزك الملعون واترك مدينتي قبل الفجر،' زمجر تيمور. 'وصلّ أن أي جني أيقظته لا يتبعك للصحراء.' عمر جمع الشظايا المكسورة وهرب في الليل، فاهماً أن بعض أشكال الثروة تأتي بأثمان فظيعة جداً للدفع."""),

  // Stories 9-30 continue in similar format...

  // Story 9

  StoryModel(
      descriptionAr:
          'حلم الخطاط هي قصة ملهمة عن حسن الشاب الذي يسعى لفهم أسرار الخط العربي في بغداد خلال العصر الذهبي الإسلامي.',
      descriptionEn:
          'The Calligrapher\'s Dream is an inspiring tale of young Hassan seeking to understand the secrets of Arabic calligraphy in Baghdad during the Islamic Golden Age.',
      id: "9",
      titleEn: "The Calligrapher's Dream",
      titleAr: "حلم الخطاط",
      level: EnglishLevelEnum.beginner,
      duration: 4,
      contentEn:
          """In the great library of Baghdad, young Hassan practiced his calligraphy by candlelight. His teacher, Master Abdullah, had promised that tonight he would reveal the secret of the divine script - the perfect writing that could bring words to life.
Hassan's fingers were stained with ink from years of practice. He had mastered the flowing curves of Kufic script and the elegant lines of Naskh, but still his teacher said he was not ready for the greatest mystery of Islamic art.
'Writing is prayer made visible,' Master Abdullah often said. 'When the heart is pure and the hand is steady, the words themselves become a bridge between earth and heaven.' Hassan longed to understand what his master meant by such mysterious words.
Tonight was different. Master Abdullah unlocked an ancient chest and withdrew a manuscript unlike any Hassan had ever seen. The letters seemed to glow with inner light, and the very air around the pages shimmered with power.
'This is the Quranic verse that saved Baghdad from the Mongols,' his teacher whispered. 'When the great calligrapher Ibn Muqla wrote these words, they rose from the page as golden birds and flew to confuse the enemy's mind.'
Hassan watched in amazement as Master Abdullah began to copy the verse. With each stroke of the reed pen, the letters took on life. The Arabic words for 'protection' and 'guidance' began to pulse with warm light.
'Now you try,' his teacher said, offering Hassan the blessed pen. The young man's hand trembled as he began to write. Slowly, carefully, he formed each letter with love and devotion. As he completed the verse, the words lifted from the paper like butterflies of light.
Hassan understood at last. Calligraphy was not just art - it was a form of worship, a way to make the divine word beautiful for all to see. His dream of becoming a master calligrapher had become a sacred calling.""",
      contentAr:
          """في مكتبة بغداد العظيمة، الشاب حسن يمارس خطه على ضوء الشموع. أستاذه، المعلم عبد الله، وعد أن الليلة سيكشف سر الخط الإلهي - الكتابة المثالية التي يمكن أن تحيي الكلمات.
أصابع حسن ملطخة بالحبر من سنوات الممارسة. أتقن المنحنيات المتدفقة للخط الكوفي والخطوط الأنيقة للنسخ، لكن أستاذه ما زال يقول أنه غير مستعد للغز الأعظم في الفن الإسلامي.
'الكتابة صلاة مرئية،' المعلم عبد الله كان يقول غالباً. 'عندما القلب طاهر واليد ثابتة، الكلمات نفسها تصبح جسراً بين الأرض والسماء.' حسن تاق لفهم ما يعنيه أستاذه بهذه الكلمات الغامضة.
الليلة كانت مختلفة. المعلم عبد الله فتح صندوقاً قديماً وأخرج مخطوطة لم ير حسن مثلها قط. الحروف بدت تتوهج بضوء داخلي، والهواء نفسه حول الصفحات يتلألأ بالقوة.
'هذه الآية القرآنية التي أنقذت بغداد من المغول،' همس أستاذه. 'عندما الخطاط العظيم ابن مقلة كتب هذه الكلمات، ارتفعت من الصفحة كطيور ذهبية وطارت لتشوش عقل العدو.'
حسن راقب بدهشة وأستاذه يبدأ بنسخ الآية. مع كل ضربة من قلم القصب، الحروف تأخذ حياة. الكلمات العربية لـ'الحماية' و'الهداية' بدأت تنبض بضوء دافئ.
'الآن حاول،' قال أستاذه، عارضاً على حسن القلم المبارك. يد الشاب ارتجفت وهو يبدأ الكتابة. ببطء، بحذر، شكّل كل حرف بحب وإخلاص. وبينما أكمل الآية، الكلمات ارتفعت من الورق كفراشات من نور.
حسن فهم أخيراً. الخط لم يكن مجرد فن - كان شكل من العبادة، طريقة لجعل الكلمة الإلهية جميلة للجميع لرؤيتها. حلمه في أن يصبح خطاطاً معلماً أصبح دعوة مقدسة."""),

  // Story 10
  StoryModel(
      descriptionAr:
          'توبة الحشاش هي قصة مثيرة عن الحشاش مالك الموت الذي يسعى للعثور على الخلاص بعد أن يشكك في طريق الدم الذي اختاره في جبال الموت.',
      descriptionEn:
          'The Assassin\'s Redemption is a thrilling tale of the assassin Malik al-Mawt seeking redemption after questioning the path of blood he chose in the Mountains of Death.',
      id: "10",
      titleEn: "The Assassin's Redemption",
      titleAr: "توبة الحشاش",
      level: EnglishLevelEnum.advanced,
      duration: 8,
      contentEn:
          """High in the mountains of Alamut, the fortress of the Assassins cast its shadow over the valleys below. Rashid ad-Din Sinan, the Old Man of the Mountain, had trained his followers to be instruments of death, but Malik al-Mawt was beginning to question the path of blood he had chosen.
For fifteen years, Malik had served the Hashashin with unwavering devotion. His daggers had found the hearts of Crusader lords and Ayyubid generals alike. He had walked through enemy camps invisible as smoke, dealing death in the name of the Ismaili faith. But lately, doubts gnawed at his soul like hungry wolves.
The mission that changed everything was supposed to be simple: eliminate a Christian merchant who was selling weapons to Saladin's enemies. But when Malik infiltrated the man's caravan, he discovered something that shattered his worldview. The merchant was secretly funding hospitals and schools, using his profits to heal rather than harm.
As Malik crept into the merchant's tent with his poisoned blade ready, he found the man praying - not to Christ, but reciting verses from the Quran in perfect Arabic. The merchant was a secret Muslim, risking his life to maintain his cover while serving the greater good of both Christians and Muslims.
'I know why you're here,' the merchant said without turning around. 'The Old Man has sent you to kill me. But before you strike, let me show you something.' He produced a letter written in Hassan-i Sabbah's own hand, revealing that the founder of the Assassins had ordered mercy for those who served justice, regardless of their apparent allegiance.
Malik's hand trembled as he read the letter. Everything he had been taught about absolute obedience was crumbling. The merchant continued, 'The true jihad is not against people, but against the evil in our own hearts. I have spent my life pretending to be what I am not, serving a higher purpose. What higher purpose do you serve with your blade?'
Instead of striking, Malik lowered his weapon. That night, he helped the merchant escape the fortress city and made his way back to Alamut. When he confessed his failure to Rashid ad-Din Sinan, he expected death. Instead, the Old Man smiled and said, 'Sometimes the greatest victory is knowing when not to kill.'
Malik spent his remaining years not as an assassin, but as a teacher of the young initiates. He taught them that the deadliest weapon was not the dagger, but the wisdom to know when mercy was stronger than murder. In finding redemption, he had discovered that the true paradise was not earned through killing, but through choosing life over death.""",
      contentAr:
          """عالياً في جبال الموت، حصن الحشاشين ألقى ظله على الوديان أسفل. رشيد الدين سنان، شيخ الجبل، درب أتباعه ليكونوا آلات موت، لكن مالك الموت بدأ يشكك في طريق الدم الذي اختاره.
لخمسة عشر عاماً، مالك خدم الحشاشين بإخلاص لا يتزعزع. خناجره وجدت قلوب أمراء الصليبيين والجنرالات الأيوبيين على حد سواء. مشى عبر معسكرات العدو غير مرئي كالدخان، يتعامل مع الموت باسم الإيمان الإسماعيلي. لكن مؤخراً، الشكوك نهشت روحه كالذئاب الجائعة.
المهمة التي غيرت كل شيء كان من المفترض أن تكون بسيطة: القضاء على تاجر مسيحي يبيع السلاح لأعداء صلاح الدين. لكن عندما تسلل مالك إلى قافلة الرجل، اكتشف شيئاً هز نظرته للعالم. التاجر كان يمول سراً مستشفيات ومدارس، ويستخدم أرباحه للشفاء لا للضرر.
بينما تسلل مالك إلى خيمة التاجر وسكينه المسموم جاهز، وجده يصلي - ليس للمسيح، بل يتلو آيات من القرآن بالعربية الفصحى. التاجر كان مسلماً سرياً، يخاطر بحياته ليحافظ على غطائه ويخدم الخير الأكبر للمسيحيين والمسلمين معاً.
قال التاجر دون أن يلتفت: 'أعرف لماذا أنت هنا. الشيخ أرسلَك لتقتلني. لكن قبل أن تضرب، دعني أريك شيئاً.' أخرج رسالة مكتوبة بخط حسن الصباح نفسه، تكشف أن مؤسس الحشاشين أمر بالرحمة لمن يخدم العدالة، بغض النظر عن ولائه الظاهري.
يد مالك ارتجفت وهو يقرأ الرسالة. كل ما تعلمه عن الطاعة المطلقة كان ينهار. تابع التاجر: 'الجهاد الحقيقي ليس ضد الناس، بل ضد الشر في قلوبنا. قضيت حياتي أتظاهر بما لست عليه، أخدم غاية أسمى. ما هي غايتك العليا بسيفك؟'
بدلاً من أن يضرب، أنزل مالك سلاحه. تلك الليلة، ساعد التاجر على الهرب من المدينة الحصينة وعاد إلى ألموت. عندما اعترف بفشله لرشيد الدين سنان، توقع الموت. لكن الشيخ ابتسم وقال: 'أعظم انتصار أحياناً أن تعرف متى لا تقتل.'
قضى مالك بقية سنواته ليس كحشاش، بل كمعلم للمبتدئين. علمهم أن أخطر سلاح ليس الخنجر، بل الحكمة لمعرفة متى تكون الرحمة أقوى من القتل. في بحثه عن التوبة، اكتشف أن الجنة الحقيقية لا تُنال بالقتل، بل باختيار الحياة على الموت."""),
];
