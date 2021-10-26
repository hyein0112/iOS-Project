//
//  ViewController.swift
//  firebaseTest
//
//  Created by GSM02 on 2021/10/26.
//

import UIKit
import Then
import SnapKit
import Firebase

class ViewController: UIViewController {
    
    var idLabel = UILabel().then {
        $0.text = "아이디"
    }
    
    var idText = UITextField().then {
        $0.tintColor = .black
        $0.backgroundColor = .white
        $0.placeholder = "아이디를 입력하세요"
        $0.layer.cornerRadius = 10
    }
    
    var pwLabel = UILabel().then {
        $0.text = "비밀번호"
    }
    
    var pwText = UITextField().then {
        $0.tintColor = .black
        $0.backgroundColor = .white
        $0.placeholder = "비밀번호를 입력하세요"
        $0.layer.cornerRadius = 10
    }

    var loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(touchedLoginBtn), for: .touchUpInside)
    }
    
    var SignUpButton = UIButton().then{
        $0.setTitle("회원가입", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(touchedSignUpBtn), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = Auth.auth().currentUser {

            idText.placeholder = "이미 로그인 된 상태입니다."

            pwText.placeholder = "이미 로그인 된 상태입니다."

            loginButton.setTitle("이미 로그인 된 상태입니다.", for: .normal)
          
        }

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 223/255, green: 253/255, blue: 240/255, alpha: 1)
        
        self.view.addSubview(idLabel)
        self.view.addSubview(idText)
        self.view.addSubview(pwLabel)
        self.view.addSubview(pwText)
        self.view.addSubview(loginButton)
        self.view.addSubview(SignUpButton)

        idLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(60)
            make.top.equalToSuperview().offset(280)
        }
        
        idText.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.8)
            make.height.equalToSuperview().dividedBy(28)
            make.left.equalTo(idLabel.snp.right).offset(23)
            make.centerY.equalTo(idLabel)
        }
        
        pwLabel.snp.makeConstraints { make in
            make.left.equalTo(idLabel)
            make.top.equalTo(idLabel.snp.bottom).offset(50)
        }
        
        pwText.snp.makeConstraints { make in
            make.width.height.equalTo(idText)
            make.left.equalTo(idText)
            make.centerY.equalTo(pwLabel)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(26)
            make.width.equalToSuperview().dividedBy(2)
            make.center.equalToSuperview()
        }
        
        SignUpButton.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(26)
            make.width.equalToSuperview().dividedBy(2)
            make.centerX.equalTo(loginButton)
            make.centerY.equalTo(loginButton.snp.bottom).offset(30)
        }
    }

    @objc func touchedLoginBtn() {
        Auth.auth().signIn(withEmail: idText.text!, password: pwText.text!) { [self] (user, error) in
            if user != nil{
                print("login success")
            }
            else{
                print("login fail")
            }
            idText.text = ""
            pwText.text = ""
      }
    }
    
    @objc func touchedSignUpBtn() {
        Auth.auth().createUser(withEmail: idText.text!, password: pwText.text!) { [self](user, error) in
            idText.text = ""
            pwText.text = ""
        }
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

