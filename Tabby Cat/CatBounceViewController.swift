//
//  CatBounceViewController.swift
//  Tabby Cat
//
//  Created by jr on 15/08/2023.
//

import UIKit
import UserNotifications

class CatBounceViewController: UIViewController {

    @IBOutlet weak var catLabel: UILabel!
    var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bounceCat()
    }
    
    func bounceCat() {
        let collisions = UICollisionBehavior(items: [catLabel])
        collisions.translatesReferenceBoundsIntoBoundary = true
        
        let dynamics = UIDynamicItemBehavior(items: [catLabel])
        dynamics.elasticity = 0.9
        dynamics.resistance = 0.05
        dynamics.friction = 0
        
        let push = UIPushBehavior(items: [catLabel], mode: . instantaneous)
        push.angle = CGFloat.random(in: 0 ..< .pi * 2)
        push.magnitude = CGFloat(3.0 + .random(in: 0..<1))
        
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(collisions)
        animator.addBehavior(dynamics)
        animator.addBehavior(push)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Bounce the cat"
        content.subtitle = "It looks bored"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
