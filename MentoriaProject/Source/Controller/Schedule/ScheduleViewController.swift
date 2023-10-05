//
//  ScheduleViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 03/10/23.
//

import Foundation
import UIKit

class ScheduleViewController: UIViewController {
    
    lazy var viewSchedule: ScheduleView = {
        let view = ScheduleView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = viewSchedule
    }
}
