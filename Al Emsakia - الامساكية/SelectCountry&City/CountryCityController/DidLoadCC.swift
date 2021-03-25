import Foundation
import UIKit
import CoreLocation

extension SelectCCViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Picker Delegate & DataSource
        PickerCity.delegate = self
        PickerCity.dataSource = self
 
        PickerCountry.delegate = self
        PickerCountry.dataSource = self
        
        //Data input inside TextField
        CountryPickerTextField.delegate = self
        CityPickerTextField.delegate = self
        
        CountryPickerTextField.inputView = PickerCountry
        CityPickerTextField.inputView = PickerCity
        if city != "" || country != "" {
           AutoCCLabel.textAlignment = .center
           AutoCCLabel.text = "\(city),\(country)"
        }
        
        
        //Adding ToolBar on top of PickerView
        toolBar.sizeToFit()
        toolBar.setItems([DoneBtn], animated: true)
        CountryPickerTextField.inputAccessoryView = toolBar
        CityPickerTextField.inputAccessoryView = toolBar
        
        //Premission for location
        startLocationManager()

        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }

        if authStatus == .denied || authStatus == .restricted {
            showLocationDisabledpopUp()
        }
        
        //AutoLocation Delegate & DataSource
            startLocationManager()
            parsePlacemarks()
            
        
        //Data entry of Country & City
        countriesData = ["Afghanistan", "Algeria", "Bangladesh", "Bahrain",  "Djibouti", "Egypt", "Iran", "Iraq", "Jordan", "Kuwait", "Libya",   "Mauritania", "Morocco", "Oman", "Pakistan", "Palestine", "Qatar", "Saudi Arabia", "Somalia", "Tunisia", "United Arab Emirates","Yemen"]
        
        cityData = [
                    
                    ["Kabul","Kandahar","Herat","Mazar-i-Sharif","Kunduz","Jalalabad","Lashkar Gah","Taluqan","Puli Khumri","Khost","Ghazni","Sheberghan","Sari Pul","Farah"],
                   
                    ["Algiers","Oran","Constantine","Blida","Batna","Sétif","Djelfa","Annaba","Sidi Bel Abbès","Biskra","Tébessa","Tiaret","El Oued","Bejaïa","Tlemcen","Bordj Bou Arreridj","Skikda","Chlef","M’Sila","Jijel","Mostaganem","Tizi Ouzou","Béchar","Saïda","Médéa","Souk Ahras","Ouargla","Ghardaïa","Guelma","Laghouat","Mascara","Khenchela","Oum el Bouaghi","Tamanrasset","Tissemsilt","Bouira","El Bayadh","Adrar","Boumerdes","El Tarf","Tipasa","Tindouf","Illizi","Relizane","Aïn Temouchent","Aïn Defla","Mila","Naama"],
                   
                    ["Dhaka","Chittagong","Khulna","Sylhet","Rājshāhi","Comilla","Mymensingh","Rajshahi","Tongi","Bogra","Barisal","Rangpur"],
                  
                    ["Manama","Riffa","Muharraq","Hamad Town","A'ali","Isa Town","Sitra","Budaiya","Jidhafs","Al-Malikiyah","Jid Ali","Sanabis","Tubli","Saar","Al Dur","Qudaibiya","Salmabad","Jurdab","Diyar AlMuharraq","Amwaj Island","Hidd","Arad","Busaiteen","Janabiyah"],
                  
                    ["Djibouti","Ali Sabieh","Dikhil","Obock","Tadjourah","Ambouli","Arta","Obock","As Ela","Assamo","Balho","Chebelle","Daimoli","Daoudaouya","Dorale","Doumera","Godoria","Khor Angar","Randa","Ras Siyyan","Sagallou","Yoboki"],

                     
                    ["Cairo","Alexandria","Gizeh","Shubra El-Kheima","Port Said","Suez","Luxor","al-Mansura","El-Mahalla El-Kubra","Tanta","Asyut","Ismailia","Fayyum","Zagazig","Aswan","Damietta","Damanhur","al-Minya","Beni Suef","Qena","Sohag","Hurghada","6th of October City","Shibin El Kom","Banha","Kafr el-Sheikh","Arish","Mallawi","10th of Ramadan City","Bilbais","Marsa Matruh","Idfu","Mit Ghamr","Al-Hamidiyya","Desouk","Qalyub","Abu Kabir","Kafr el-Dawwar","Girga","Akhmim","Matareya"],
        
                    ["Tehran","Mashhad","Isfahan","Karaj","Shiraz","Tabriz","Qom","Ahvaz","Kermanshah","Urmia","Rasht","Zahedan","Hamadan","Kerman","Yazd","Ardabil","Bandar Abbas","Arak"],
        
                    ["Baghdad","Basra","Mosul","Erbil","Sulaymaniyah","Kirkuk","Najaf","Karbala","Nasiriyah","Amarah","Al Diwaniyah","Kut","Al Hillah","Ramadi","Fallujah","Tal Afar","Samarra","Samawah","Baqubah","Dahuk","Najaf Governorate","Zubayr","Umm Qasr","Tikrit"],
       
                    ["Amman","Zarqa","Irbid","Russeifa","Al-Quwaysimah","Tila al-Ali","Wadi","al-Jubayhah","Khuraybat","Sahab","Ar Ramtha","Suwaylih","Aqaba","Zaatari refugee camp","Mafraq","Madaba","Salt","Umm Qushayr","Al-Jizah","Marj al-Hamam","Askan Abu Nushayr","Shafa Badran","al-Baq'a","Ayn al-Basha","Aydoun","ad-Dulayl","Jerash"],
                 
                    ["Kuwait City","Abdulla Al-Salem","Adailiya","Bnaid Al-Qar","Daʿiya","Dasma","Doha","Doha Port","Faiha'","Failaka","Ghornata","Jaber Al-Ahmad City","Kaifan","Khaldiya","Mansūriya","Nahdha","North West Sulaibikhat","Nuzha","Qadsiya","Qurtuba","Rawda","Shamiya","Shuwaikh","Shuwaikh Industrial Area","Shuwaikh Port","Sulaibikhat","Surra","Umm an Namil Island","Yarmouk"],
        
                    ["Tripoli","Benghazi","Misrata","Zliten","Zawiya","Bayda","Tobruk","Ajdabiya","Gharyan","Marj","Derna","Sirte","Sabha","Bani Walid","Khoms","Sabratha","Zuwara","Al Qubah","Kufra","Tajura","Tarhuna","Msallata","Jumayl","Sorman","Al Gseibat","Shahhat","Ubari","Asbi'a","Jadid","Waddan","El Agheila","Abyar","Nofaliya","Regdalin","Gasr Akhyar"],
        
                   ["Nouakchott","Nouadhibou","Kiffa","Mbera Refugee Camp","Kaédi","Zouérat","Rosso","Sélibabi","Boû Gâdoûm","Boutilimit","Atar","Bareina","Ghabou","Hamoud","Mâl","Nbeika","Gouraye","Timbedra","Magta-Lahjar","Guerou","Soudoud","Sélibaby","Foum Gleita","Legceïba","Bousteila","Sangrave","Tintane","Néma","Aleg","Tidjikdja","Oualata","Ayoûn el-Atroûs","Bababé","Akjoujt","Cheggar"],
        
                   ["Casablanca","Fez","Tangier","Marrakesh","Salé","Meknes","Rabat","Oujda","Kenitra","Agadir","Tetouan","Temara","Safi","Mohammedia","Khouribga","El Jadida","Beni Mellal","Aït Melloul","Nador","Dar Bouazza","Taza","Settat","Berrechid","Khemisset","Inezgane","Ksar El Kebir","Larache","Guelmim","Khenifra","Berkane","Taourirt","Bouskoura","Fquih Ben Salah","Dcheira El Jihadia","Oued Zem","El Kelaa Des Sraghna","Sidi Slimane","Errachidia","Guercif","Oulad Teima","Ben Guerir","Tifelt","Lqliaa","Taroudant","Sefrou","Essaouira","Fnideq","Sidi Kacem","Tiznit","Tan-Tan","Ouarzazate","Souk El Arbaa","Youssoufia","Lahraouyine","Martil","Ain Harrouda","Sabt Awlad an-Nama","Skhirat","Ouazzane","Benslimane","Al Hoceima","Beni Ansar","M'diq","Sidi Bennour","Midelt","Azrou","Drargua"],
        
                  ["Adam","As Sib","Al Ashkharah","Al Buraimi","Al Hamra","Al Jazer","Al Madina A'Zarqa","Al Suwaiq","Bahla","Barka","Bidbid","Bidiya","Duqm","Haima","Ibra","Ibri","Izki","Jabrin","Jalan Bani Bu Hassan","Khasab","Mahooth","Manah","Masirah","Matrah","Mudhaybi","Mudhaireb","Muscat","Nizwa","Quriyat","Raysut","Rustaq","Ruwi","Saham","Shinas","Saiq","Salalah","Samail","Sohar","Sur","Tan`am","Thumrait"],
        
                  ["Karachi","Lahore","Faisalabad","Rawalpindi","Gujranwala","Peshawar","Multan","Hyderabad","Islamabad","Quetta","Bahawalpur","Sargodha","Sialkot","Sukkur","Larkana","Sheikhupura","Rahim Yar Khan","Jhang","Dera Ghazi Khan","Gujrat","Sahiwal","Wah Cantonment","Mardan","Kasur","Okara","Mingora","Nawabshah","Chiniot","Kotri","Kāmoke","Hafizabad","Sadiqabad","Mirpur Khas","Burewala","Kohat","Khanewal","Dera Ismail Khan","Turbat","Muzaffargarh","Abbotabad","Mandi Bahauddin","Shikarpur","Jacobabad","Jhelum","Khanpur","Khairpur","Khuzdar","Pakpattan","Hub","Daska","Gojra","Dadu","Muridke","Bahawalnagar","Samundri","Tando Allahyar","Tando Adam","Jaranwala","Chishtian","Muzaffarabad","Attock","Vehari","Kot Abdul Malik","Ferozwala","Chakwal","Gujranwala Cantonment","Kamalia","Umerkot","Ahmedpur East","Kot Addu","Wazirabad","Mansehra","Layyah"],
        
                 ["Gaza City","Hebron(al-Khalil)","Khan Yunis","Jabalia","Rafah","Nablus","Beit Lahia","Deir al-Balah","Yatta","Tulkarm","Beit Hanoun","Qalqilya","al-Bireh","Jenin","Bani Suheila","ad-Dhahiriya","Dura","Ramallah","Beit Lahm","Halhul","Bani Na'im","Samu","Beitunia","Idhna","Qabatiya","Abasan al-Kabira","Sa'ir","Jericho","az-Zawayda","Tubas","al-Yamun","Surif","Beit Ummar","Ya'bad","Beit Sahour","Beit Jala","Abu Dis"],
        
                ["Industrial Area","Al Wakrah","Old Airport","Al-Shahaniya","Mesaieed","Madinat Khalifa South","Nu`ayjah","Umm Ghuwailina","Najma","Fereej Bin Mahmoud","Mushayrib","Rawdat Al Khail","Al Thumama(Doha)","New Salata","Al Sadd","Ad Dawhah al Jadidah","Onaiza","The Pearl","Dukhan","Mebaireek","Al Hilal","Fereej Abdel Aziz","Umm Lekhba","Fereej Kulaib","Duhail","Umm Bab","Rawdat Rashed","Hazm Al Markhiya","Al Markhiyah","Al Ghuwariyah","Al Messila","Lejbailat","Shagra","Old Al Ghanim","Lijmiliya","Rumeilah","Al Karaana","Doha International Airport","Al Bidda","Abu Samra","Al Utouriya","Al Nasraniya"],
        
                ["Riyadh","Jeddah","Mecca","Medina","Al Dammam","Al Hofuf","Buraydah","Al Hillah","Al Taif","Tabuk","Khamis Mushayt","Ha'il","Al Qatif","Al Mubarraz","Al Kharj","Najran","Abha","Arar","Sakakah","Jizan","Al Bahah","Yanbu","Al Qunfudhah","Al Jawf","Bisha","Sharurah","Gurayat","Unaizah","Dhahran","Ar Rass","Muzahmiyya","Riyadh Al-Khabra","Baljurashi","Badr","Al Majma'ah","Ad-Dilam","Tanomah","Hotat Bani Tamim","Uyun AlJiwa","Al Bukayriyah","Al-Hareeq","Al Khobar","Hafr Al-Batin","Jubail","Dahaban","Saihat","Khafji","Al-Omran","Al-Namas","Ras Tanura","Al-Oyoon","Qaisumah","Al Jafr","Rumailah","Bareg","King Abdullah Economic City","Al-Abwa","Al Artaweeiyah","Buq a","Dhurma","Diriyah","Duba","Dumat Al-Jandal","Dawadmi","Farasan","Gatgat","Gerrha","Al-Gwei'iyyah","Hautat Sudair","Habaala","Hajrah","Haql","Harmah","Huraymila","Jabal Umm al Ru'us","Jalajil","Jizan Economic City","Khaybar","Al-Saih","Knowledge Economic City","Al-Khutt","Layla","Lihyan","Al Lith","Mastoorah","Al Mikhwah","Al Mawain","Umluj","Qadeimah","Rabigh","Rafha","Sabt Al Alaya","Sarat Abidah","Safwa city","Shaqraa","Shaybah","As Sulayyil","Tarout","Tayma","Thadiq","Thuwal","Thuqbah","Turaif","Tabarjal","Udhailiyah","AlUla","Um Al-Sahek","Uqair","Uyayna","Wadi Al-Dawasir","Al Wajh","Az Zaimah","Zulfi"],
        
               ["Mogadishu","Hargeisa","Burco","Baydhabo","Beledweyne","Borama","Marka","Kismayo","Bosaso","Jowhar","Galkaio","Erigavo","Jilib","Bardera","Hudur","Dhuusamareeb","Las Anod","Garoowe","Garbahare"],
        
               ["Tunis","Sfax","Sousse","Ettadhamen","Kairouan","Bizerte","Gabès","Aryanah","Gafsa","El Mourouj"],
        
               ["Dubai","Abu Dhabi","Sharjah","Al Ain","Ajman","RAK City","Fujairah","Umm al-Quwain","Khor Fakkan","Kalba","Jebel Ali","Dibba Al-Fujairah","Madinat Zayed","Ruwais","Liwa Oasis","Dhaid","Ghayathi","Ar-Rams","Dibba Al-Hisn","Hatta","Al Madam","Abu al Abyad","Adhen","Al Ajban","Al Aryam","Al Awir","Al Badiyah","Al Bataeh","Al Bithnah","Al Faqa","Al Halah","Al Hamraniyah","Al Hamriyah","Al Jazirah Al Hamra","Al Jeer","Al Khawaneej","Al Lisaili","Al Manama","Al Mirfa","Al Qusaidat","Al Qor","Al Shuwaib","Al Rafaah","Al Rashidya","Al Yahar","Asimah","Dalma","Dadna","Digdaga","Falaj Al Mualla","Ghalilah","Ghub","Habshan","Huwaylat","Khatt","Khor Khwair","Lahbab","Marawah","Masafi","Masfut","Mirbah","Mleiha","Nahil","Sha'am","Sila","Sir Bani Yas","Sweihan","Wadi Shah","Zubarah"],
        
              ["Sana'a","Ta'izz","Al Hudaydah","Aden","Ibb","Dhamar","Mukalla","Seiyun","Zinjibar","Sayyan","Ash Shihr","Sahar","Zabid","Hajjah","Bajil District","Dhi as-Sufal","Rada'a","Socotra","Bait al-Faqih","al-Marawi'a","Yarim","Al Bayda'","'Amran","Lahij","Abs","Harad","Dimnat Chadir","Ataq","al-Mahabischa","Baihan","Marib","Thula","as-Saidiyya","Mudiyah","Khamir","Hais","ad-Dahi","Mocha","Al Ghaydah","Al Mahwit"]

      ]
    }
    
    
}
