import UIKit
import AVFoundation
import SystemConfiguration

class MainViewController: UIViewController{

    
//API Data
    var country = ""
    var city = ""
    var salaMethod = 4
    var azanStatus:Bool = true
    var defaults = UserDefaults.standard
    
    let urlBaseString = "http://api.aladhan.com/v1/timingsByCity?"
    
//Time Interval
    var timerT:Timer?
    
    let formatterT:DateFormatter = {
        let dateFormatterT = DateFormatter()
        dateFormatterT.dateFormat = "dd-MM-y , HH:mm"
        return dateFormatterT
    }()
    
    var calenderT:String?
    var FajrT:Date?
    var ShroukT:Date?
    var ZohrT:Date?
    var AsrT:Date?
    var MaghrbT:Date?
    var IshaT:Date?
    var MidNightT:Date?
    
//Azan Sound
    var player: AVAudioPlayer?
    
//Setting View
    @IBAction func settingPressed(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Setting", bundle: nil).instantiateViewController(identifier: "navigationSetting")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func premiumPressed(_ sender: UIButton) {
        print("Premium Button Pressed")
    }
    
    
//Main info View
    @IBOutlet weak var todayCalenderLabel: UILabel!
    @IBOutlet weak var nextSalaLabel: UILabel!
    @IBOutlet weak var nextPrayerTimeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
//Main PrayerTime View
    @IBOutlet weak var todayFajrLabel: UILabel!
    @IBOutlet weak var todayZohrLabel: UILabel!
    @IBOutlet weak var todayAsrLabel: UILabel!
    @IBOutlet weak var todayMaghrbLabel: UILabel!
    @IBOutlet weak var todayIshaLabel: UILabel!
    
//Side PrayerTime View
    @IBOutlet weak var todayImsakLabel: UILabel!
    @IBOutlet weak var todayShroukLabel: UILabel!
    @IBOutlet weak var todayMidnightLabel: UILabel!
    
//Azkar View
    @IBAction func azkarSaba7Btn(_ sender: UIButton) {
        show(story: "AzkarSapa7", VC: AzkarSapa7ViewController.self)
    }
    
    @IBAction func azkarMasa2Btn(_ sender: UIButton) {
        show(story: "AzkarMasa2", VC: AzkarMasa2ViewController.self)
    }
    
//Quran View
    @IBAction func goToQuranBtn(_ sender: UIButton) {
        show(story: "Quran", VC: PageViewController.self)
    }
    
//Qibla View
    @IBAction func goToQiblaBtn(_ sender: UIButton) {

        showFull(story: "Qebla", VC: QeblaViewController.self)
    }
    
//A7adeth View
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var timer:Timer?
    var currentCellIndex = 0
    
    var a7adeth = ["قال الرسول صلى الله عليه وسلم: (المؤمنُ القويُّ خيرٌ وأحبُّ إلى اللهِ من المؤمنِ الضعيفِ ، وفي كلٍ خيرٌ احرصْ على ما ينفعُك واستعنْ باللهِ ولا تعجِزنَّ ، وإن أصابَك شيءٌ فلا تقلْ : لو أني فعلتُ لكانَ كذا وكذا ، ولكن قلْ قدَّرَ اللهُ وما شاءَ فعلَ فإن لو تفتحُ عملَ الشيطانِ).",
                   " قال الرسول صلى الله عليه وسلم: (البِرُّ حُسْنُ الخُلُقِ، وَالإِثْمُ ما حَاكَ في نَفْسِكَ، وَكَرِهْتَ أَنْ يَطَّلِعَ عليه النَّاسُ).",
                   " رُوِي عن أنس بن مالك أنّه قال: (كانَ رسولُ اللَّهِ صلَّى اللَّهُ عليهِ وسلَّمَ يقولُ اللَّهمَّ إنِّي أعوذُ بِكَ منَ العَجزِ والكسلِ والجبنِ والبخلِ والهرَمِ وأعوذُ بِكَ من عذابِ القبرِ وأعوذُ بِكَ من فِتنةِ المحيا والمماتِ).",
                   "قال الرسول صلى الله عليه وسلم: (اجْتَنِبُوا السَّبْعَ المُوبِقَاتِ قالوا: يا رَسُولَ اللَّهِ، وَما هُنَّ؟ قالَ: الشِّرْكُ باللَّهِ، وَالسِّحْرُ، وَقَتْلُ النَّفْسِ الَّتي حَرَّمَ اللَّهُ إِلَّا بالحَقِّ، وَأَكْلُ الرِّبَا، وَأَكْلُ مَالِ اليَتِيمِ، وَالتَّوَلِّي يَومَ الزَّحْفِ، وَقَذْفُ المُحْصَنَاتِ المُؤْمِنَاتِ الغَافِلَاتِ).",
                   "قال الرسول صلى الله عليه وسلم: (إذا تقاضى إليك رجلان، فلا تقضِ للأولِ حتى تسمع كلامَ الآخرِ . فسوف تدري كيف تقضي).",
                   " قال الرسول صلى الله عليه وسلم: (أَرْبَعٌ مَن كُنَّ فيه كانَ مُنَافِقًا خَالِصًا، وَمَن كَانَتْ فيه خَلَّةٌ منهنَّ كَانَتْ فيه خَلَّةٌ مِن نِفَاقٍ حتَّى يَدَعَهَا: إِذَا حَدَّثَ كَذَبَ، وإذَا عَاهَدَ غَدَرَ، وإذَا وَعَدَ أَخْلَفَ، وإذَا خَاصَمَ فَجَرَ. غَيْرَ أنَّ في حَديثِ سُفْيَانَ: وإنْ كَانَتْ فيه خَصْلَةٌ منهنَّ كَانَتْ فيه خَصْلَةٌ مِنَ النِّفَاقِ).",
                   "قال الرسول صلى الله عليه وسلم: (إنَّ هذا الدِّينَ يُسرٌ ولنْ يُشادَّ الدِّينَ أحدٌ إلَّا غلَبه فسدِّدوا وقارِبوا وأبشِروا واستعينوا بالغَدوةِ والرَّواحِ وشيءٍ مِن الدُّلجةِ).",
                   "قال الرسول صلى الله عليه وسلم: (إنَّما الأعمالُ بالنِّيَّاتِ وإنَّما لِكلِّ امرئٍ ما نوى فمَن كانَت هجرتُهُ إلى اللَّهِ ورسولِهِ فَهجرتُهُ إلى اللَّهِ ورسولِهِ ومن كانت هجرتُهُ لدنيا يُصيبُها أوِ امرأةٍ يتزوَّجُها فَهجرتُهُ إلى ما هاجرَ إليْهِ).",
                   "قال الرسول صلى الله عليه وسلم: (عليكمْ بالصِّدقِ؛ فإنَّ الصِّدقَ يهدي إلى البِرِّ، وإن البِرَّ يهدي إلى الجنَّةِ، ولا يزالُ الرَّجلُ يصدُقُ ويتحرَّى الصِّدقَ حتَّى يكتَبَ عندَ اللَّهِ صِدِّيقًا. وإِيَّاكم والكذِبَ، فإن الكذِبَ يهدي إلى الفُجورِ، وإن الفجورَ يهدي إلى النَّارِ، ولا يزالُ الرَّجلُ يكذِبُ ويتحرَّى الكذِبَ حتَّى يُكتبَ عندَ اللَّهِ كذَّابًا).",
                   "قال الرسول صلى الله عليه وسلم: (مَن نَفَّسَ عن مُسلِمٍ كُرْبةً من كُرَبِ الدُّنيا، نَفَّسَ اللهُ عنه كُرْبةً من كُرَبِ يومِ القيامةِ، ومَن يسَّرَ على مُعسِرٍ، يسَّرَ اللهُ عليه في الدُّنيا والآخِرةِ، ومَن سَتَرَ على مُسلِمٍ، سَتَرَ اللهُ عليه في الدُّنيا والآخِرةِ، واللهُ في عَونِ العَبدِ ما كان العَبدُ في عَونِ أخيهِ. قال أبو داودَ: لم يذكُرْ عُثمانُ، عن أبي مُعاويةَ: ومَن يسَّرَ على مُعسِرٍ).",
                   " قال الرسول صلى الله عليه وسلم: (المؤمنُ الَّذي يخالطُ النَّاسَ ويصبِرُ علَى أذاهُم خيرٌ منَ الَّذي لا يخالِطُ النَّاسَ ولا يصبرُ علَى أذاهم).",
                   " قال الرسول صلى الله عليه وسلم: (حَقُّ المُسْلِمِ علَى المُسْلِمِ سِتٌّ قيلَ: ما هُنَّ يا رَسولَ اللهِ؟ قالَ: إذا لَقِيتَهُ فَسَلِّمْ عليه، وإذا دَعاكَ فأجِبْهُ، وإذا اسْتَنْصَحَكَ فانْصَحْ له، وإذا عَطَسَ فَحَمِدَ اللَّهَ فَسَمِّتْهُ، وإذا مَرِضَ فَعُدْهُ وإذا ماتَ فاتَّبِعْهُ).",
                   "قال الرسول صلى الله عليه وسلم: (إنَّ اللَّهَ حَرَّمَ علَيْكُم: عُقُوقَ الأُمَّهَاتِ، ووَأْدَ البَنَاتِ، ومَنَعَ وهَاتِ، وكَرِهَ لَكُمْ قيلَ وقالَ، وكَثْرَةَ السُّؤَالِ، وإضَاعَةَ المَالِ).",
                   "قال الرسول صلى الله عليه وسلم: (ألا إنَّ اللَّهَ يَنْهاكُمْ أنْ تَحْلِفُوا بآبائِكُمْ، مَن كانَ حالِفًا فَلْيَحْلِفْ باللَّهِ أوْ لِيَصْمُتْ).",
                   "قال الرسول صلى الله عليه وسلم: (أنا و كافلُ اليتيمِ في الجنةِ هكذا و قال بإصبعيْهِ السبابةِ و الوسطى).",
                   "قال الرسول صلى الله عليه وسلم: (أثقلُ الصلاةِ على المنافقينَ صلاةُ العشاءِ وصلاةُ الفجرِ ولو يعلمونَ ما فيهما لأَتَوْهُمَا ولو حَبْوًا ولقد هممتُ أن آمُرَ بالصلاةِ فتُقامَ ثم آمُرَ رجلًا يُصلِّي بالناسِ ثم أنطلقُ معي برجالٍ معهم حِزَمٌ من حطبٍ إلى قومٍ لا يشهدونَ الصلاةَ فأحْرِقُ عليهم بُيوتَهم بالنارِ ولو عَلِمَ أحدُكم أنهُ إذا وجدَ عَرْقًا من شاةٍ سمينةٍ أو مِرْمَاتينِ حسَنتَينِ لأتيتُموهما أجمعينَ).",
                   "قال الرسول صلى الله عليه وسلم: (مَن تَقرَّبَ إلى اللهِ شِبرًا، تَقرَّبَ إليه ذِراعًا، ومَن تَقرَّبَ إلى اللهِ ذِراعًا، تَقرَّبَ إليه باعًا، ومَن أقبَلَ على اللهِ ماشيًا، أقبَلَ اللهُ إليه مُهَروِلًا، واللهُ أَعْلى وأَجَلُّ، واللهُ أَعْلى وأَجَلُّ، واللهُ أَعْلى وأَجَلُّ).",
                   "قال الرسول صلى الله عليه وسلم: (إنَّ عبدًا أصاب ذنبًا فقال: ربِّ أذنبْتُ ، فاغفِرْه ، فقال ربُّه : أَعَلِمَ عبدي أنَّ له ربًّا يغفر الذَّنبَ ويأخذُ به ؟ غفرتُ لعبدي ، ثم مكث ما شاء اللهُ ، ثم أصاب ذنبًا ، فقال : ربي أذنبتُ آخرَ ، فاغفِرْ لي قال : أَعِلِمَ عبدي أنَّ له ربًّا يغفر الذَّنبَ . ويأخذُ به ؟ غفرتُ لعبدي ، ثم أصاب ذنبًا ، فقال : ربِّ أذنبتُ آخرَ ، فاغفِرْ لي ، قال : أَعَلِمَ عبدي أنَّ له ربًّا يغفر الذَّنبَ ويأخذُ به ؟ قد غفرتُ لعبدي فلْيعمَلْ ما شاء).",
                   "قال الرسول صلى الله عليه وسلم: (إنَّ خَلْقَ أحدِكم يُجمَعُ في بطنِ أمِّه أربعينَ يومًا وأربعينَ ليلةً ثمَّ يكونُ عَلَقةً مِثْلَ ذلك ثمَّ يكونُ مُضغةً مِثْلَ ذلك ثمَّ يبعَثُ اللهُ إليه ملَكًا فيُؤمَرُ بأربعِ كلماتٍ فيقولُ : اكتُبْ عمَلَه وأجَلَه ورِزْقَه وشقيٌّ أو سعيدٌ وإنَّ الرَّجُلَ لَيعمَلُ بعمَلِ أهلِ الجنَّةِ حتَّى ما يكونُ بيْنَه وبيْنَ الجنَّةِ إلَّا ذِراعٌ فيغلِبُ عليه الكتابُ الَّذي سبَق فيُختَمُ له بعمَلِ أهلِ النَّارِ وإنَّ الرَّجُلَ لَيعمَلُ بعمَلِ أهلِ النَّارِ حتَّى ما يكونُ بيْنَه وبيْنَها إلَّا ذراعٌ فيغلِبُ عليه الكتابُ الَّذي سبَق فيعمَلُ بعمَلِ أهلِ الجنَّةِ فيدخُلُ الجنَّةَ).",
                   " قال الرسول صلى الله عليه وسلم: (ما يُصِيبُ المسلِمَ من نصَبٍ، ولا وصَبٍ، ولا هَمٍّ، ولا حَزَنٍ، ولا أذًى، ولا غَمٍّ، حتى الشوْكةَ يُشاكُها، إلَّا كفَّرَ اللهُ بِها من خطاياهُ).",
                   "قال الرسول صلى الله عليه وسلم: (مَن كانت عندَهُ مَظلِمَةٌ لأخيهِ في عِرضٍ، أو في مالٍ، فلْيأتِهِ فلْيُحَلِّلْهُ منها، فإنَّه ليْسَ ثَمَّ دِينارٌ ولا دِرهمٌ، مِن قَبلِ أنْ يُؤخَذَ لأخيهِ من حسناتِهِ، فإنْ لمْ يكُنْ له حسناتٌ أُخِذَ من سيِّئاتِ أخيهِ فطُرِحَتْ عليه).",
                   "قال الرسول صلى الله عليه وسلم: (سَبْعَةٌ يُظِلُّهُمُ اللَّهُ في ظِلِّهِ، يَومَ لا ظِلَّ إلَّا ظِلُّهُ: الإمَامُ العَادِلُ، وشَابٌّ نَشَأَ في عِبَادَةِ رَبِّهِ، ورَجُلٌ قَلْبُهُ مُعَلَّقٌ في المَسَاجِدِ، ورَجُلَانِ تَحَابَّا في اللَّهِ اجْتَمعا عليه وتَفَرَّقَا عليه، ورَجُلٌ طَلَبَتْهُ امْرَأَةٌ ذَاتُ مَنْصِبٍ وجَمَالٍ، فَقَالَ: إنِّي أخَافُ اللَّهَ، ورَجُلٌ تَصَدَّقَ، أخْفَى حتَّى لا تَعْلَمَ شِمَالُهُ ما تُنْفِقُ يَمِينُهُ، ورَجُلٌ ذَكَرَ اللَّهَ خَالِيًا فَفَاضَتْ عَيْنَاهُ).",
                   "قال الرسول صلى الله عليه وسلم: (ما أصاب أحدًا قطُّ همٌّ ولا حَزَنٌ فقال اللهمَّ إني عبدُك ابنُ عبدِك ابنُ أمَتِك ناصيَتي بيدِك ماضٍ فيَّ حُكمُك عَدْلٌ فيَّ قضاؤُك أسألُك بكلِّ اسمٍ هو لك سميتَ به نفسَك أوْ علَّمْتَه أحدًا مِنْ خلقِك أو أنزلته في كتابِك أو استأثرتَ به في علمِ الغيبِ عندَك أنْ تجعلَ القرآنَ ربيعَ قلبي ونورَ صدري وجلاءَ حُزني وذهابَ هَمِّي إلا أذهب اللهُ همَّه وحُزْنَه وأبدله مكانه فَرَجًا قال : فقيل : يا رسولَ اللهِ ألا نتعلمُها فقال : بلى ينبغي لِمَنْ سمِعها أنْ يتعلمَها).",
                   " قال الرسول صلى الله عليه وسلم: (لَا أَقُولُ لَكُمْ إلَّا كما كانَ رَسولُ اللهِ صَلَّى اللَّهُ عليه وَسَلَّمَ يقولُ: كانَ يقولُ: اللَّهُمَّ إنِّي أَعُوذُ بكَ مِنَ العَجْزِ، وَالْكَسَلِ، وَالْجُبْنِ، وَالْبُخْلِ، وَالْهَرَمِ، وَعَذَابِ، القَبْرِ اللَّهُمَّ آتِ نَفْسِي تَقْوَاهَا، وَزَكِّهَا أَنْتَ خَيْرُ مَن زَكَّاهَا، أَنْتَ وَلِيُّهَا وَمَوْلَاهَا، اللَّهُمَّ إنِّي أَعُوذُ بكَ مِن عِلْمٍ لا يَنْفَعُ، وَمِنْ قَلْبٍ لا يَخْشَعُ، وَمِنْ نَفْسٍ لا تَشْبَعُ، وَمِنْ دَعْوَةٍ لا يُسْتَجَابُ لَهَا).",
                   "قال الرسول صلى الله عليه وسلم: (أنَّ رَسولَ اللَّهِ صَلَّى اللهُ عليه وسلَّمَ كانَ يَوْمًا بَارِزًا لِلنَّاسِ، إذْ أتَاهُ رَجُلٌ يَمْشِي، فَقالَ: يا رَسولَ اللَّهِ ما الإيمَانُ؟ قالَ: الإيمَانُ أنْ تُؤْمِنَ باللَّهِ ومَلَائِكَتِهِ، وكُتُبِهِ، ورُسُلِهِ، ولِقَائِهِ، وتُؤْمِنَ بالبَعْثِ الآخِرِ قالَ: يا رَسولَ اللَّهِ ما الإسْلَامُ؟ قالَ: الإسْلَامُ أنْ تَعْبُدَ اللَّهَ ولَا تُشْرِكَ به شيئًا، وتُقِيمَ الصَّلَاةَ، وتُؤْتِيَ الزَّكَاةَ المَفْرُوضَةَ، وتَصُومَ رَمَضَانَ، قالَ: يا رَسولَ اللَّهِ ما الإحْسَانُ؟ قالَ: الإحْسَانُ أنْ تَعْبُدَ اللَّهَ كَأنَّكَ تَرَاهُ، فإنْ لَمْ تَكُنْ تَرَاهُ فإنَّه يَرَاكَ، قالَ: يا رَسولَ اللَّهِ مَتَى السَّاعَةُ؟ قالَ: ما المَسْئُولُ عَنْهَا بأَعْلَمَ مِنَ السَّائِلِ، ولَكِنْ سَأُحَدِّثُكَ عن أشْرَاطِهَا: إذَا ولَدَتِ المَرْأَةُ رَبَّتَهَا، فَذَاكَ مِن أشْرَاطِهَا، وإذَا كانَ الحُفَاةُ العُرَاةُ رُؤُوسَ النَّاسِ، فَذَاكَ مِن أشْرَاطِهَا، في خَمْسٍ لا يَعْلَمُهُنَّ إلَّا اللَّهُ: (إنَّ اللَّهَ عِنْدَهُ عِلْمُ السَّاعَةِ ويُنْزِلُ الغَيْثَ ويَعْلَمُ ما في الأرْحَامِ) ثُمَّ انْصَرَفَ الرَّجُلُ، فَقالَ: رُدُّوا عَلَيَّ فأخَذُوا لِيَرُدُّوا فَلَمْ يَرَوْا شيئًا، فَقالَ: هذا جِبْرِيلُ جَاءَ لِيُعَلِّمَ النَّاسَ دِينَهُمْ).",
                   "قال الرسول صلى الله عليه وسلم: (ثَلاثٌ أقسمُ عليهنَّ وأحدِّثُكُم حديثًا فاحفَظوهُ . قال : ما نَقصَ مالُ عبدٍ من صَدقةٍ ، ولا ظلمَ عبدٌ مظلمةً صبرَ عليها إلَّا زادَهُ اللَّهُ عزًّا ، ولا فتحَ عبدٌ بابَ مسألَةٍ إلَّا فتحَ اللَّهُ علَيهِ بابَ فَقرٍ - أو كلِمَةً نحوَها - وأحدِّثُكُم حَديثًا فاحفَظوهُ . فقالَ : إنَّما الدُّنيا لأربعةِ نفرٍ : عبدٌ رزقَه اللَّهُ مالًا وعِلمًا فهوَ يتَّقي ربَّهُ فيهِ ويصلُ بهِ رحِمَهُ ويعلَمُ للَّهِ فيهِ حقًّا فَهَذا بأفضلِ المَنازلِ . وعبدٍ رزقَهُ اللَّهُ علمًا ولم يرزُقهُ مالًا فَهوَ صادقُ النيَّةِ يقولُ : لَو أنَّ لي مالًا لعَمِلتُ فيه بعَملِ فلانٍ فهو بنيَّتهِ فأَجرُهُما سواءٌ. وعَبدٌ رزقَهُ اللَّهُ مالًا ولَم يَرزُقهُ عِلمًا يخبِطُ في مالِهِ بغيرِ عِلمٍ لا يتَّقي فيهِ ربَّهُ ولا يَصلُ فيهِ رحمَهُ ولا يعلَم للهِ فيهِ حقًّا فهو بأخبَثِ المنازلِ ، وعبدٌ لم يَرزُقْهُ اللَّهُ مالًا ولا عِلمًا فَهوَ يقولُ : لَو أنَّ لي مالًا لعَمِلْتُ فيهِ بعمَلِ فلانٍ فَهوَ بنيَّتِهِ فوزرُهُما سواءٌ).",
                   "قال الرسول صلى الله عليه وسلم: (يقولُ اللَّهُ عَزَّ وَجَلَّ: مَن جَاءَ بالحَسَنَةِ فَلَهُ عَشْرُ أَمْثَالِهَا وَأَزِيدُ، وَمَن جَاءَ بالسَّيِّئَةِ فَجَزَاؤُهُ سَيِّئَةٌ مِثْلُهَا، أَوْ أَغْفِرُ وَمَن تَقَرَّبَ مِنِّي شِبْرًا تَقَرَّبْتُ منه ذِرَاعًا، وَمَن تَقَرَّبَ مِنِّي ذِرَاعًا تَقَرَّبْتُ منه بَاعًا، وَمَن أَتَانِي يَمْشِي أَتَيْتُهُ هَرْوَلَةً، وَمَن لَقِيَنِي بقُرَابِ الأرْضِ خَطِيئَةً لا يُشْرِكُ بي شيئًا لَقِيتُهُ بمِثْلِهَا مَغْفِرَةً. وفي روايةٍ : بهذا الإسْنَادِ نَحْوَهُ، غيرَ أنَّهُ قالَ: فَلَهُ عَشْرُ أَمْثَالِهَا، أَوْ أَزِيدُ).",
                   "قال الرسول صلى الله عليه وسلم: (قال اللهُ عزَّ وجلَّ: عَبدي عِندَ ظَنِّهِ بي، وأنا معه إذا دَعاني، وإنْ ذكَرَني في نَفْسِهِ؛ ذكَرتُهُ في نَفْسي، وإنْ ذكَرَني في مَلَإٍ؛ ذكَرتُهُ في مَلَإٍ خَيرٍ منهم وأطيَبَ، وإنْ تقَرَّبَ مِنِّي شِبرًا تقَرَّبتُ منه ذِراعًا، وإنْ تقَرَّبَ ذِراعًا تقَرَّبتُ باعًا، وإنْ أتاني يَمشي أتَيتُهُ هَروَلةً)."
    ]
    
}

