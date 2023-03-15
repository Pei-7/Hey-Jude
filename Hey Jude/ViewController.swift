//
//  ViewController.swift
//  Hey Jude
//
//  Created by 陳佩琪 on 2023/3/15.
//

import UIKit
import AVFoundation

class AudioManager {
    static let shared = AudioManager()

    private let player = AVQueuePlayer()

    func play(url: URL) {
        let playerItem = AVPlayerItem(url: url)
        player.insert(playerItem, after: nil)
        player.play()
    }

    func pause() {
        player.pause()
    }

    func stop() {
        player.removeAllItems()
    }
}

class ViewController: UIViewController {
    let url = Bundle.main.url(forResource: "Hey-Jude", withExtension: "mp3")!

    override func viewDidLoad() {
        super.viewDidLoad()

        AudioManager.shared.play(url: url)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        AudioManager.shared.pause()
        // Other preparation code for the segue
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if let navigationController = self.navigationController,
           !navigationController.viewControllers.contains(self) {
            AudioManager.shared.stop()
        }
    }
}
