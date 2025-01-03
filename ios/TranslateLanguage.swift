import Foundation
import MLKitTranslate

func TranslateLanguage(from language: String) -> TranslateLanguage? {
    switch language.lowercased() {
    case "af":
        return .afrikaans
    case "sq":
        return .albanian
    case "ar":
        return .arabic
    case "be":
        return .belarusian
    case "bg":
        return .bengali
    case "bn":
        return .bulgarian
    case "ca":
        return .catalan
    case "zh":
        return .chinese
    case "cs":
        return .czech
    case "da":
        return .danish
    case "nl":
        return .dutch
    case "en":
        return .english
    case "eo":
        return .eperanto
    case "et":
        return .estonian
    case "fi":
        return .finnish
    case "fr":
        return .french
    case "gl":
        return .galician
    case "ka":
        return .georgian
    case "de":
        return .german
    case "el":
        return .greek
    case "gu":
        return .gujarati
    case "ht":
        return .haitianCreole
    case "he":
        return .hebrew
    case "hi":
        return .hindi
    case "hu":
        return .hungarian
    case "is":
        return .icelandic
    case "id":
        return .indonesian
    case "ga":
        return .irish
    case "it":
        return .italian
    case "ja":
        return .japanese
    case "kn":
        return .kannada
    case "ko":
        return .korean
    case "lv":
        return .latvian
    case "lt":
        return .lithuanian
    case "mk":
        return .macedonian
    case "ms":
        return .malay
    case "mt":
        return .maltese
    case "mr":
        return .marathi
    case "no":
        return .norwegian
    case "fa":
        return .persian
    case "pl":
        return .polish
    case "pt":
        return .portuguese
    case "ro":
        return .romanian
    case "ru":
        return .russian
    case "sk":
        return .slovak
    case "sl":
        return .slovenian
    case "es":
        return .spanish
    case "sw":
        return .swahili
    case "tl":
        return .tagalog
    case "ta":
        return .tamil
    case "te":
        return .telugu
    case "th":
        return .thai
    case "tr":
        return .turkish
    case "uk":
        return .ukrainian
    case "ur":
        return .urdu
    case "vi":
        return .vietnamese
    case "cy":
        return .welsh
    default:
        return nil
    }
}
