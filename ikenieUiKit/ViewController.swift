//
//  ViewController.swift
//  ikenieUiKit
//
//  Created by 塩見陵介 on 2025/02/11.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    
    private var selectphotoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createSelectPhotoButton()
        view.addSubview(selectphotoButton)
    }
    
    func createSelectPhotoButton() {
        selectphotoButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        selectphotoButton.backgroundColor = .systemBlue
        selectphotoButton.tintColor = .black
        selectphotoButton.setTitle("Select Photo", for: .normal)
        selectphotoButton.addTarget(self, action: #selector(selectPhoto), for: .touchUpInside)
    }
        
    
    @objc func selectPhoto() {
        let config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
}

// MARK: - PHPickerViewControllerDelegate
extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        print("results: \(results)")
        for result in results {
            let identifier = result.assetIdentifier
            print("identifier: \(identifier!)")
        }
    }

}

