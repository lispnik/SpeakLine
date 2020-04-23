//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by Matthew Kennedy on 4/22/20.
//  Copyright © 2020 Matthew Kennedy. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet var textField: NSTextField!
    
    @IBAction func buttonPressed(_ sender: NSButton) {
        started = true
        speechSynthesizer.startSpeaking(textField.stringValue)
    }
    
    @IBAction func stopButtonPressed(_ sender: NSButton) {
        started = false
        speechSynthesizer.stopSpeaking()
    }
    
    @IBAction func voiceSelected(_ sender: NSPopUpButtonCell) {
    }
    
    @IBOutlet var speakButton: NSButton!
    @IBOutlet var stopButton: NSButton!
    @IBOutlet var voicesDropdown: NSPopUpButton!

    let speechSynthesizer: NSSpeechSynthesizer = NSSpeechSynthesizer()

    var started: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    var voices = [NSSpeechSynthesizer.VoiceName]()
    
    func updateUI() {
        speakButton.isEnabled = !started
        stopButton.isEnabled = started
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        speechSynthesizer.delegate = self
        voices = NSSpeechSynthesizer.availableVoices
        voicesDropdown.addItems(withTitles: voices.map {voice in voice.rawValue })
        updateUI()
    }
    
    override var windowNibName: NSNib.Name? {
        "MainWindowController"
    }
}

extension MainWindowController: NSSpeechSynthesizerDelegate {

    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        started = false
    }
}
