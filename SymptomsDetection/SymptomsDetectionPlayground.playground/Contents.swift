import Foundation
//import CreateML
import CoreML
import NaturalLanguage


//let csvFile = Bundle.main.url(forResource: "sentences", withExtension: "csv")
//
//var data = try MLDataTable(contentsOf: csvFile!)
//
////print(data.description)
////data.show()
//print()
//
//let tags = Set(Array(data["Tags"])
//                .compactMap{ $0.stringValue?.components(separatedBy: ",").map{ $0.trimmingCharacters(in: .whitespaces) } }
//                .flatMap { $0 }
//                .filter { $0.count > 0 }).sorted()
//
//let tagsWords = tags.map{ $0.components(separatedBy: " ").filter{ $0 != "of" } }
//
//let wordEmbedding = NLEmbedding.wordEmbedding(for: .english)!
//let sentenceEmbedding = NLEmbedding.sentenceEmbedding(for: .english)!

//let tagsNeighbor:[[String]] = tagsWords.map{
//    var neighbors = $0
//    for w in $0 {
//        wordEmbedding.enumerateNeighbors(for: w, maximumCount: 10) { neighbor, distance in
//            print("\(w) - \(neighbor): \(distance.description)")
//            if distance >= 0.75 {
//                neighbors.append(neighbor)
//            }
//            return true
//        }
//    }
//    return neighbors
//}
//
//for i in 0..<tags.count {
//    print("\(tags[i]): \(tagsWords[i]) - \(tagsNeighbor[i])")
//}


//let tagsNeighbors = [
//    ["anxiety", "angst", "neurosis", "uneasiness", "helplessness", "sadness", "moodiness", "grief", "feeling", "despondency", "paranoia", "worry", "worried", "uneasy"],
//    ["appetite", "change", "whet", "snacking", "sate", "gorging", "hungry", "omnivorous", "taste", "tasty", "gluttonous", "shift", "drastic", "alter", "adjustment", "altering", "adapt"],
//    ["bleeding", "abscess", "abdomen", "ulcer", "hemorrhage", "bleed", "clot", "swelling", "hematoma", "sore", "cut"],
//    ["body", "pain", "burying", "grave", "sorrow", "rubble", "grief", "wreckage", "painfulness", "debris", "pyre", "dolour", "ache", "discomfort", "backache", "numbness", "excruciating", "aching", "sciatica", "spasm"],
//    ["congestion", "congested"],
//    ["cough", "sneeze", "sneezing", "wheezing", "earache", "sniffle", "runny", "cold", "whooping"],
//    ["diarrhea", "episode", "gastroenteritis", "gastrointestinal", "cholera", "typhoid"],
//    ["dilated", "pupils", "dilate", "eye", "eyelid"],
//    ["dizziness", "drowsiness", "tiredness"],
//    ["fatigue", "balaclava", "camouflage", "beret", "dizziness", "tired", "exausted"],
//    ["fever", "flulike", "hot", "temperature", "thermometer", "meningitis", "dengue"],
//    ["headache", "dizziness", "migraine", "ache", "meningitis"],
//    ["hiccups", "jitter", "annoyance", "stutter", "stuttering", "buffering", "intermittent"],
//    ["lack", "concentration", "paucity", "slowness", "distract", "distraction"],
//    ["lack", "sleep", "paucity", "lacks", "slowness", "undermining", "nap", "napping", "asleep", "doze", "awake", "snoring", "slumber", "snore", "wake", "night", "sleeplessness", "lethargy", "tiredness"],
//    ["mood", "change", "moodiness", "melancholy", "feeling", "restlessness", "temperament", "emotion", "rumination", "melancholic", "ennui"],
//    ["poor", "coordination", "uneducated", "inadequate", "woeful", "coordinating", "coordinate"],
//    ["racing", "heart", "racer", "speedway", "racetrack", "dragster", "thoroughbred", "chest", "tachycardia", "cardiomyopathy", "cardio"],
//    ["skin", "rash", "wrinkling", "leathery", "exfoliating", "plump", "wrinkle", "waxy", "flaking", "moisturizer", "cleanser", "itchiness", "irritation"],
//    ["sore", "throat", "blister", "toothache", "swelling", "redness", "bruise", "mouth", "throbbing"],
//    ["vomiting", "nausea", "dizziness", "bloating", "gastrointestinal"]
//]
//
//let tagsNeighborPhrases = tagsNeighbors.map{ $0.joined(separator: " ") }
//for i in 0..<tags.count {
//    print("\(tags[i]): \(tagsNeighborPhrases[i])")
//}
//
////let tagsNeighborEmbeddings = tagsNeighborPhrases.map{ sentenceEmbedding.vector(for: $0) }
//
//
//
//let rawString = "My fever has finally gone and now all I feel is slight fatigue"
//
//print("\n\(rawString)\n")
//
//
//for i in 0..<tags.count {
//    let distance = sentenceEmbedding.distance(between: rawString, and: tagsNeighborPhrases[i])
//    print("\(tags[i]): \(distance.description)")
//}
//
//
//
//var wordTokens = [Substring]()
//let tagger = NLTagger(tagSchemes: [.tokenType])
//tagger.string = rawString
//
//tagger.enumerateTags(in: rawString.startIndex..<rawString.endIndex,
//                     unit: .word,
//                     scheme: .tokenType,
//                     options: [.omitWhitespace]) { (_, range) -> Bool in
//    wordTokens.append(rawString[range])
//    return true
//}
//
//print(wordTokens)


var tags = [
    "anxiety",
    "appetite change",
    "bleeding",
    "body pain",
    "congestion",
    "cough",
    "diarrhea",
    "dilated",
    "dizziness",
    "fatigue",
    "fever",
    "headache",
    "hiccups",
    "lack of concentration",
    "lack of sleep",
    "mood change",
    "poor coordination",
    "racing heart",
    "skin rash",
    "sore throat",
    "vomiting"
]

var questions = [
             "what did they experience ?",
             "did they notice something ?",
             "did they sleep well ?"
            ]

for t in tags {
    questions.append("did they have \(t) ?")
}

print(questions)

//let passage = data["Sentence"][0].stringValue!
let passage = "My fever has finally gone and now all I feel is slight fatigue"

let bert = BERT()

print("S: \(passage)")
for q in questions {
    print(" Q: \(q)")
    let a = bert.findAnswer(for: q, in: passage)
    print(" A: \(a)")
}

