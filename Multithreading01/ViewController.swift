//
//  ViewController.swift
//  Multithreading01
//
//  Created by macbook on 29.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pthread = pthread_t(bitPattern: 0)
        var attribute = pthread_attr_t()
        pthread_attr_init(&attribute)
        pthread_attr_set_qos_class_np(&attribute, QOS_CLASS_USER_INITIATED, 0)
        pthread_create(&pthread, &attribute, { (pointer) -> UnsafeMutableRawPointer? in
            print("test")
            pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
            return nil
            
        }, nil)
        
        let nsThread = Thread {
            print("test")
            print(qos_class_self())
        }
        nsThread.qualityOfService = .userInitiated
        nsThread.start()
        
        print(qos_class_main())
    }


}

