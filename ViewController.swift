//
//  ViewController.swift
//  QuiziOSApp
//
//  Created by Abhishek Sansanwal on 26/09/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

@available(iOS 12.0, *)
class ViewController: UIViewController {
    
    var effect:UIVisualEffect!
    var decision = false

    @IBAction func dismissLoginPopUp(_ sender: Any) {
        decision=true
        animateOut()
    }
    
    
   
    
    
    func animateOut(){
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.loginView.alpha = 0
            
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "registrationScreen")
            newViewcontroller.modalTransitionStyle = .crossDissolve
            self.present(newViewcontroller, animated: true, completion: nil)
            //self.dismiss(animated: true, completion: nil)
        }, completion: nil)
    }
    
    
    
    
    @IBAction func popUpLogin(_ sender: Any) {
        
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
       
        view.addSubview(blurEffectView)
            animateIn()
        blurEffectView.isUserInteractionEnabled = true
        let tapRecogizer = UITapGestureRecognizer(target: self, action: #selector(blurTapped))
        blurEffectView.addGestureRecognizer(tapRecogizer)
        
       
    }
    var optionsState = false
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelC: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelD: UILabel!
    
    @IBOutlet weak var helperlabel: UILabel!
    @IBAction func option1Pressed(_ sender: Any) {
        
    
        shake(viewScreen: option1)
        optionA.backgroundColor = UIColor(rgb: 0xC60000)
        option1.layer.borderColor = UIColor(rgb: 0xC60000).cgColor
        optionC.backgroundColor = UIColor(rgb: 0x00A100)
        option3.layer.borderColor = UIColor(rgb: 0x00A100).cgColor
        optionsState = true
        
    }
    
    @IBOutlet weak var yesButton: UIButton!
    @objc func blurTapped(){
        animateOut()
    }

    @IBOutlet var loginView: UIView!
    @IBOutlet var viewHelp: UIView!
    @IBOutlet weak var backgroundImageLogin: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var languagesView: UIView!
    @IBAction func swiftPressed(_ sender: Any) {	
        print("hello!!!")
    }
    
    
    
    func animateIn(){
        self.view.addSubview(loginView)
        loginView.center = self.view.center
        popUpLoginButton.backgroundColor = UIColor.gray.withAlphaComponent(0.65)
        
        popUpLoginButton.layer.cornerRadius = 25
        loginView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        loginView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            
            self.loginView.alpha = 0.85
            self.loginView.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        
    }
    @IBOutlet weak var questionTag: UILabel!
    @IBOutlet weak var questionTextArea: UITextView!
    @IBOutlet weak var popUpLoginButton: UIButton!
    
    func nextquestion(){
        bulbOff.setImage(UIImage(named: "bulbOff"), for: .normal)
        questionTextArea.fadeTransition2(0.8)
        questionTextArea.text = "We’re trying to grab the LG Labs in MSIT building, so tentatively, that’s where the contest will take place?"
        if optionsState == true {
            optionA.backgroundColor = UIColor.lightGray
            option1.layer.borderColor = UIColor.lightGray.cgColor
            optionC.backgroundColor = UIColor.lightGray
            option3.layer.borderColor = UIColor.lightGray.cgColor
            optionsState = false
        }
        questionTag.text = "2/20"
        labelA.fadeTransition(0.5)
        labelB.fadeTransition(0.5)
        labelC.fadeTransition(0.5)
        labelD.fadeTransition(0.5)
        labelA.text = "I'm excited!!!"
        labelB.text = "Heeya, let's go"
        labelC.text = "Duh"
        labelD.text = "I don't feel nothing"
        
        //buttonAimate()
        
    }
    
    @IBOutlet weak var star: UIButton!
    @IBAction func starPressed(_ sender: Any) {
        if star.currentImage == UIImage(named: "star") {
            star.setImage(UIImage(named: "star2"), for: .normal)
            
            // If anyone wants do get an internship at a startup, PM me. P.S. Good stipend will be given, and contact only if you're well experienced in Mern-stack Development and have a hang of React.
        }
        else {
            star.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
    func bulbYelloOptions(helper:Int) {
        if helper == 1 {
        optionB.backgroundColor = UIColor(rgb: 0xFFD900)
        option2.layer.borderColor = UIColor(rgb: 0xFFD900).cgColor
       
            optionsState = true
        }
        else {
            optionB.backgroundColor = UIColor.lightGray
            option2.layer.borderColor = UIColor.lightGray.cgColor
            
            optionsState = false
        }
    }
    
    @IBAction func bulbPressed(_ sender: Any) {
        bulbOff.fadeTransition(0.4)
        if bulbOff.currentImage == UIImage(named: "bulbOff") {
        bulbOff.setImage(UIImage(named: "bulbOn"), for: .normal)
            bulbYelloOptions(helper: 1)
            
        }
        else {
             bulbOff.setImage(UIImage(named: "bulbOff"), for: .normal)
            bulbYelloOptions(helper: 0)
            
            
        }
        
        
    }
    @IBOutlet weak var bulbOff: UIButton!
    @IBAction func option2Pressed(_ sender: Any) {
        optionB.backgroundColor = UIColor(rgb: 0x00A100)
        option2.layer.borderColor = UIColor(rgb: 0x00A100).cgColor
        optionsState = true
    }
    func prevquestion(){
        bulbOff.setImage(UIImage(named: "bulbOff"), for: .normal)
        questionTextArea.fadeTransition3(0.8)
        questionTextArea.text = "The Coding Contest is just a warm up for MSIT students to bring back the hackathons culture in the college, true?"
        if optionsState == true {
            optionB.backgroundColor = UIColor.lightGray
            option2.layer.borderColor = UIColor.lightGray.cgColor
        }
        questionTag.text = "1/20"
        labelA.fadeTransition(0.5)
        labelB.fadeTransition(0.5)
        labelC.fadeTransition(0.5)
        labelD.fadeTransition(0.5)
        labelA.text = "Yes"
        labelB.text = "Oh, yup!!"
        labelC.text = "Nah"
        labelD.text = "I don't care!"
        
        
    }
    
    @IBOutlet weak var option1: UIView!
    @objc func swipeAction(swipe:UISwipeGestureRecognizer){
        print(swipe.direction.rawValue)
        switch swipe.direction.rawValue {
        case 1:
            prevquestion()
        case 2:
            nextquestion()
        case 4: //bulb
            bulbOff.fadeTransition(0.4)
            
                bulbOff.setImage(UIImage(named: "bulbOn"), for: .normal)
                bulbYelloOptions(helper: 1)
                
        
        case 8:
            bulbOff.fadeTransition(0.4)
       
            bulbOff.setImage(UIImage(named: "bulbOff"), for: .normal)
            bulbYelloOptions(helper: 0)
            
        default:
            break
        }
    }
    
    
    
    @IBOutlet weak var option4: UIView!
    @IBOutlet weak var option3: UIView!
    @IBOutlet weak var option2: UIView!
    func magicview(view:UIView){
        view.backgroundColor = UIColor.white.withAlphaComponent(0.65)
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
    }
    
  
    @IBOutlet weak var dashboardButton: UIButton!
    
    @IBOutlet weak var optionA: UILabel!
    @IBOutlet weak var optionB: UILabel!
    @IBOutlet weak var optionC: UILabel!
    @IBOutlet weak var optionD: UILabel!
    
    override func viewDidLoad() {
        
        optionA.roundCorners([.topLeft, .bottomLeft], radius: 4)
        optionB.roundCorners([.topLeft, .bottomLeft], radius: 4)
        optionC.roundCorners([.topLeft, .bottomLeft], radius: 4)
        optionD.roundCorners([.topLeft, .bottomLeft], radius: 4)
    
        dashboardButton.tintColor = UIColor.blue.withAlphaComponent(0.7)
        magicview(view: option1)
        magicview(view: option2)
        magicview(view: option3)
        magicview(view: option4)
        let directions: [UISwipeGestureRecognizerDirection] = [.right, .left, .up, .down]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
            gesture.direction = direction
            self.view.addGestureRecognizer(gesture)
        }
        //yesButton.backgroundColor = UIColor.gray
        //yesButton.layer.cornerRadius = 5
        
       // loginView.layer.cornerRadius = 8
        
        //print(viewHelp.frame.size.height)
       
       // backgroundImageLogin.alpha = 0.99
        UIView.animate(withDuration: 1.0, delay: 0.5, options: UIViewAnimationOptions.curveLinear, animations: {
            self.backgroundImage = self.backgroundImage
        })
       
      //  createAccountButton.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
       // createAccountButton.layer.cornerRadius = 25
      //  languagesView.layer.cornerRadius = 10
     
     //   languagesView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
       // languagesView.layer.borderWidth = 1
      /*  UIView.animate(withDuration: 1.0, delay: 0.5, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.swiftButton.frame.origin.y = self.swiftLabel.frame.origin.y - self.swiftButton.frame.size.width
            self.swiftButton.frame.origin.x = self.swiftLabel.frame.origin.x
        })*/
        
      /*  applyRoundCorners(roundDemoView)
        applyRoundCorners(roundDemoViewLeft)
        applyRoundCorners(roundDemoViewRight)
        */
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @available(iOS 12.0, *)
    func applyRoundCorners(_ object:AnyObject) {
        if #available(iOS 12.0, *) {
            object.layer.cornerRadius = object.frame.size.width/2
        } else {
            // Fallback on earlier versions
        }
        object.layer.masksToBounds = true
        
    }
    
    func shake(viewScreen: UIView) {
        viewScreen.transform = CGAffineTransform(translationX: 20, y: 0)
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            viewScreen.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    @IBOutlet weak var swiftLabel: UILabel!
    @IBOutlet weak var swiftButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var roundDemoViewLeft: UIView!
    @IBOutlet weak var roundDemoViewRight: UIView!
    @IBOutlet weak var roundDemoView: UIView!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

// For making the login button look cool.
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        
        set {
            
            layer.borderWidth = newValue
            
        }
        
        get {
            
            return layer.borderWidth
            
        }
        
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            
            layer.cornerRadius = newValue
            
        }
        
        get {
            
            return layer.cornerRadius
            
        }
        
    }
    
    @IBInspectable var borderColor: UIColor? {
        
        set {
            
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
            
        }
        
        get {
            
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
            
        }
        
    }
    
}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionFade)
    }
    func fadeTransition2(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionReveal
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionReveal)
    }
    func fadeTransition3(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionMoveIn
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionMoveIn)
    }
    
   
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
