import UIKit

class fehresTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

    }

    @IBAction func backToQuran(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return swarQuran.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = swarQuran[indexPath.row]
        cell.textLabel?.textAlignment = .right
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "QuranViewController") as? QuranViewController else {return}
        
        if indexPath.row == 0 {
            vc.defaults.setValue(0, forKey: "pageIndex")
        }else if indexPath.row == 1 {
            vc.defaults.setValue(1, forKey: "pageIndex")
        }else if indexPath.row == 2 {
            vc.defaults.setValue(49, forKey: "pageIndex")
        }else if indexPath.row == 3 {
            vc.defaults.setValue(76, forKey: "pageIndex")
        }else if indexPath.row == 4 {
            vc.defaults.setValue(105, forKey: "pageIndex")
        }else if indexPath.row == 5 {
            vc.defaults.setValue(127, forKey: "pageIndex")
        }else if indexPath.row == 6 {
            vc.defaults.setValue(150, forKey: "pageIndex")
        }else if indexPath.row == 7 {
            vc.defaults.setValue(176, forKey: "pageIndex")
        }else if indexPath.row == 8 {
            vc.defaults.setValue(186, forKey: "pageIndex")
        }else if indexPath.row == 9 {
            vc.defaults.setValue(207, forKey: "pageIndex")
        }else if indexPath.row == 10 {
            vc.defaults.setValue(220, forKey: "pageIndex")
        }else if indexPath.row == 11 {
            vc.defaults.setValue(234, forKey: "pageIndex")
        }else if indexPath.row == 12{
            vc.defaults.setValue(248, forKey: "pageIndex")
        }else if indexPath.row == 13{
            vc.defaults.setValue(254, forKey: "pageIndex")
        }else if indexPath.row == 14{
            vc.defaults.setValue(261, forKey: "pageIndex")
        }else if indexPath.row == 15{
            vc.defaults.setValue(266, forKey: "pageIndex")
        }else if indexPath.row == 16{
            vc.defaults.setValue(281, forKey: "pageIndex")
        }else if indexPath.row == 17{
            vc.defaults.setValue(292, forKey: "pageIndex")
        }else if indexPath.row == 18{
            vc.defaults.setValue(304, forKey: "pageIndex")
        }else if indexPath.row == 19{
            vc.defaults.setValue(311, forKey: "pageIndex")
        }else if indexPath.row == 20{
            vc.defaults.setValue(321, forKey: "pageIndex")
        }else if indexPath.row == 21{
            vc.defaults.setValue(331, forKey: "pageIndex")
        }else if indexPath.row == 22{
            vc.defaults.setValue(341, forKey: "pageIndex")
        }else if indexPath.row == 23{
            vc.defaults.setValue(349, forKey: "pageIndex")
        }else if indexPath.row == 24{
            vc.defaults.setValue(358, forKey: "pageIndex")
        }else if indexPath.row == 25{
            vc.defaults.setValue(366, forKey: "pageIndex")
        }else if indexPath.row == 26{
            vc.defaults.setValue(376, forKey: "pageIndex")
        }else if indexPath.row == 27{
            vc.defaults.setValue(384, forKey: "pageIndex")
        }else if indexPath.row == 28{
            vc.defaults.setValue(395, forKey: "pageIndex")
        }else if indexPath.row == 29{
            vc.defaults.setValue(403, forKey: "pageIndex")
        }else if indexPath.row == 30{
            vc.defaults.setValue(410, forKey: "pageIndex")
        }else if indexPath.row == 31{
            vc.defaults.setValue(414, forKey: "pageIndex")
        }else if indexPath.row == 32{
            vc.defaults.setValue(417, forKey: "pageIndex")
        }else if indexPath.row == 33{
            vc.defaults.setValue(427, forKey: "pageIndex")
        }else if indexPath.row == 34{
            vc.defaults.setValue(433, forKey: "pageIndex")
        }else if indexPath.row == 35{
            vc.defaults.setValue(439, forKey: "pageIndex")
        }else if indexPath.row == 36{
            vc.defaults.setValue(445, forKey: "pageIndex")
        }else if indexPath.row == 37{
            vc.defaults.setValue(452, forKey: "pageIndex")
        }else if indexPath.row == 38{
            vc.defaults.setValue(457, forKey: "pageIndex")
        }else if indexPath.row == 39{
            vc.defaults.setValue(466, forKey: "pageIndex")
        }else if indexPath.row == 40{
            vc.defaults.setValue(476, forKey: "pageIndex")
        }else if indexPath.row == 41{
            vc.defaults.setValue(482, forKey: "pageIndex")
        }else if indexPath.row == 42{
            vc.defaults.setValue(488, forKey: "pageIndex")
        }else if indexPath.row == 43{
            vc.defaults.setValue(495, forKey: "pageIndex")
        }else if indexPath.row == 44{
            vc.defaults.setValue(498, forKey: "pageIndex")
        }else if indexPath.row == 45{
            vc.defaults.setValue(501, forKey: "pageIndex")
        }else if indexPath.row == 46{
            vc.defaults.setValue(506, forKey: "pageIndex")
        }else if indexPath.row == 47{
            vc.defaults.setValue(510, forKey: "pageIndex")
        }else if indexPath.row == 48{
            vc.defaults.setValue(514, forKey: "pageIndex")
        }else if indexPath.row == 49{
            vc.defaults.setValue(517, forKey: "pageIndex")
        }else if indexPath.row == 50{
            vc.defaults.setValue(519, forKey: "pageIndex")
        }else if indexPath.row == 51{
            vc.defaults.setValue(522, forKey: "pageIndex")
        }else if indexPath.row == 52{
            vc.defaults.setValue(525, forKey: "pageIndex")
        }else if indexPath.row == 53{
            vc.defaults.setValue(527, forKey: "pageIndex")
        }else if indexPath.row == 54{
            vc.defaults.setValue(530, forKey: "pageIndex")
        }else if indexPath.row == 55{
            vc.defaults.setValue(533, forKey: "pageIndex")
        }else if indexPath.row == 56{
            vc.defaults.setValue(536, forKey: "pageIndex")
        }else if indexPath.row == 57{
            vc.defaults.setValue(541, forKey: "pageIndex")
        }else if indexPath.row == 58{
            vc.defaults.setValue(544, forKey: "pageIndex")
        }else if indexPath.row == 59{
            vc.defaults.setValue(547, forKey: "pageIndex")
        }else if indexPath.row == 60{
            vc.defaults.setValue(550, forKey: "pageIndex")
        }else if indexPath.row == 61{
            vc.defaults.setValue(552, forKey: "pageIndex")
        }else if indexPath.row == 62{
            vc.defaults.setValue(553, forKey: "pageIndex")
        }else if indexPath.row == 63{
            vc.defaults.setValue(555, forKey: "pageIndex")
        }else if indexPath.row == 64{
            vc.defaults.setValue(557, forKey: "pageIndex")
        }else if indexPath.row == 65{
            vc.defaults.setValue(559, forKey: "pageIndex")
        }else if indexPath.row == 66{
            vc.defaults.setValue(561, forKey: "pageIndex")
        }else if indexPath.row == 67{
            vc.defaults.setValue(563, forKey: "pageIndex")
        }else if indexPath.row == 68{
            vc.defaults.setValue(565, forKey: "pageIndex")
        }else if indexPath.row == 69{
            vc.defaults.setValue(567, forKey: "pageIndex")
        }else if indexPath.row == 70{
            vc.defaults.setValue(569, forKey: "pageIndex")
        }else if indexPath.row == 71{
            vc.defaults.setValue(571, forKey: "pageIndex")
        }else if indexPath.row == 72{
            vc.defaults.setValue(573, forKey: "pageIndex")
        }else if indexPath.row == 73{
            vc.defaults.setValue(574, forKey: "pageIndex")
        }else if indexPath.row == 74{
            vc.defaults.setValue(576, forKey: "pageIndex")
        }else if indexPath.row == 75{
            vc.defaults.setValue(577, forKey: "pageIndex")
        }else if indexPath.row == 76{
            vc.defaults.setValue(579, forKey: "pageIndex")
        }else if indexPath.row == 77{
            vc.defaults.setValue(581, forKey: "pageIndex")
        }else if indexPath.row == 78{
            vc.defaults.setValue(582, forKey: "pageIndex")
        }else if indexPath.row == 79{
            vc.defaults.setValue(584, forKey: "pageIndex")
        }else if indexPath.row == 80{
            vc.defaults.setValue(585, forKey: "pageIndex")
        }else if indexPath.row == 81{
            vc.defaults.setValue(586, forKey: "pageIndex")
        }else if indexPath.row == 82{
            vc.defaults.setValue(586, forKey: "pageIndex")
        }else if indexPath.row == 83{
            vc.defaults.setValue(588, forKey: "pageIndex")
        }else if indexPath.row == 84{
            vc.defaults.setValue(589, forKey: "pageIndex")
        }else if indexPath.row == 85{
            vc.defaults.setValue(590, forKey: "pageIndex")
        }else if indexPath.row == 86{
            vc.defaults.setValue(590, forKey: "pageIndex")
        }else if indexPath.row == 87{
            vc.defaults.setValue(591, forKey: "pageIndex")
        }else if indexPath.row == 88{
            vc.defaults.setValue(592, forKey: "pageIndex")
        }else if indexPath.row == 89{
            vc.defaults.setValue(593, forKey: "pageIndex")
        }else if indexPath.row == 90{
            vc.defaults.setValue(594, forKey: "pageIndex")
        }else if indexPath.row == 91{
            vc.defaults.setValue(594, forKey: "pageIndex")
        }else if indexPath.row == 92{
            vc.defaults.setValue(595, forKey: "pageIndex")
        }else if indexPath.row == 93{
            vc.defaults.setValue(595, forKey: "pageIndex")
        }else if indexPath.row == 94{
            vc.defaults.setValue(596, forKey: "pageIndex")
        }else if indexPath.row == 95{
            vc.defaults.setValue(596, forKey: "pageIndex")
        }else if indexPath.row == 96{
            vc.defaults.setValue(597, forKey: "pageIndex")
        }else if indexPath.row == 97{
            vc.defaults.setValue(597, forKey: "pageIndex")
        }else if indexPath.row == 98{
            vc.defaults.setValue(598, forKey: "pageIndex")
        }else if indexPath.row == 99{
            vc.defaults.setValue(598, forKey: "pageIndex")
        }else if indexPath.row == 100{
            vc.defaults.setValue(599, forKey: "pageIndex")
        }else if indexPath.row == 101{
            vc.defaults.setValue(599, forKey: "pageIndex")
        }else if indexPath.row == 102{
            vc.defaults.setValue(600, forKey: "pageIndex")
        }else if indexPath.row == 103{
            vc.defaults.setValue(600, forKey: "pageIndex")
        }else if indexPath.row == 104{
            vc.defaults.setValue(600, forKey: "pageIndex")
        }else if indexPath.row == 105{
            vc.defaults.setValue(601, forKey: "pageIndex")
        }else if indexPath.row == 106{
            vc.defaults.setValue(601, forKey: "pageIndex")
        }else if indexPath.row == 107{
            vc.defaults.setValue(601, forKey: "pageIndex")
        }else if indexPath.row == 108{
            vc.defaults.setValue(602, forKey: "pageIndex")
        }else if indexPath.row == 109{
            vc.defaults.setValue(602, forKey: "pageIndex")
        }else if indexPath.row == 110{
            vc.defaults.setValue(602, forKey: "pageIndex")
        }else if indexPath.row == 111{
            vc.defaults.setValue(603, forKey: "pageIndex")
        }else if indexPath.row == 112{
            vc.defaults.setValue(603, forKey: "pageIndex")
        }else if indexPath.row == 113{
            vc.defaults.setValue(603, forKey: "pageIndex")
        }else {  }
        
        
        dismiss(animated: true, completion: nil)
    }


    let swarQuran = ["سورة الفاتحة","سورة البقرة","سورة آل عمران","سورة النساء","سورة الماىدة","سورةالانعام","سورة الاعراف","سورة الانفال","سورة التوبة","سورة يونس","سورة هود","سورة يوسف","سورة الرعد","سورة إبراهيم","سورة الحجر","سورة النحل","سورة الإسراء","سورة الكهف","سورة مريم","سورة طه","سورة الانبياء","سورة الحج","سورة المؤمنون","سورة النور","سورة الفرقان","سورة الشعراء","سورة النمل","سورة القصص","سورة العنكبوت","سورة الروم","سورة لقمان","سورة السجدة","سورة الاحزاب","سورة سبأ","سورة فاطر","سورة يس","سورة الصافات","سورة ص","سورة الزمر","سورة غافر","سورة فصلت","سورة الشوري","سورة الزخرف","سورة الدخان","سورة الجاثية","سورة الاحقاف","سورة محمد","سورة الفتح","سورة الحجرات","سورة ق","سورة الذاريات","سورة الطور","سورة النجم","سورة القمر","سورة الرحمن","سورة الواقعة","سورة الحديد","سورة المجادلة","سورة الحشر","سورة الممتحنة","سورة الصف","سورة الجمعة","سورة المنافقون","سورة التغابن","سورة الطلاق","سورة التحريم","سورة الملك","سورة القلم","سورة الحاقة","سورة المعارج","سورة نوح","سورة الجن","سورة المزمل","سورة المدثر","سورة القيامة","سورة الإنسان","سورة المرسلات","سورة النبأ","سورة النازعات","سورة عبس","سورة التكوير","سورة الانفطار","سورة المطففين","سورة الانشقاق","سورة البروج","سورة الطارق","سورة الاعلي","سورة الغاشية","سورة الفجر","سورة البلد","سورة الشمس","سورة الليل","سورة الضحي","سورة الشرح","سورة التين","سورة العلق","سورة القدر","سورة البينة","سورة الزلزلة","سورة العاديات","سورة القارعة","سورة التكاثر","سورة العصر","سورة الهمزة","سورة الفيل","سورة قريش","سورة الماعون","سورة الكوثر","سورة الكافرون","سورة النصر","سورة المسد","سورة الاخلاص","سورة الفلق","سورة الناس"]
    
    
}
