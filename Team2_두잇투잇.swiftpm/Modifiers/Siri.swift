import AVKit

final class SiriModel {
    static let avSpeechSynthesizer: AVSpeechSynthesizer = .init()
    
    static func getAVSpeechUtterance(string: String) -> AVSpeechUtterance {
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.5
        return utterance
    }
    
}
