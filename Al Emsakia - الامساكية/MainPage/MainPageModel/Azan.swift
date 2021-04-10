import Foundation

extension MainViewController {

struct Azan:Decodable {
    var data: data
    var status:String
}

struct data:Decodable {
    
    var timings:timings
    var date:date
    var meta:meta
}

struct timings:Decodable {
    
    var Fajr:String
    var Dhuhr:String
    var Asr:String
    var Maghrib:String
    var Isha:String
    
    var Sunrise:String
    var Imsak:String
    var Midnight:String
}

struct date:Decodable {
    
    var readable:String
    var gregorian:gregorian
}

struct meta:Decodable {
    
    var latitude:Double
    var longitude:Double
    var method:method
}

struct gregorian:Decodable {
    var date:String
    var day:String
    var weekday:weekday
    var month:month
    var year:String
}
struct weekday:Decodable {
    var en:String
}
struct month:Decodable {
    var number:Int
    var en:String
}
struct method:Decodable {
    var id:Int
    var name:String
}
}
