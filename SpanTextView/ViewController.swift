//
//  ViewController.swift
//  TextView
//
//  Created by GoodDamn on 24/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @objc func actionSpan(_ sender: UITapGestureRecognizer) {
        view.backgroundColor = UIColor(red: CGFloat.random(in: 0.0..<1.0), green: CGFloat.random(in: 0.0..<1.0), blue: CGFloat.random(in: 0.0..<1.0), alpha: 1.0);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController: viewDidLoad()");
        
        let s = 15.0;
        
        let scale = view.frame.height / view.frame.width;
        
        print("ViewController: scale:",scale, UIScreen.main.scale, view.frame.size)
        
        let textView = UITextView(frame: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: view.frame.width, height: s*scale)));
        
        textView.font = UIFont.systemFont(ofSize: s);
        
        view.addSubview(textView);
        
        let to = 0;
        let from = 7;
        let txt = "Simple text with subview";
        textView.text = txt;
        
        let pos1 = textView.position(from: textView.endOfDocument, offset: to);
        let pos2 = textView.position(from: textView.endOfDocument, offset: -from);
        
        let range = textView.textRange(from: pos2!, to: pos1!);
        
        var resultPos = textView.firstRect(for: range!);
        
        let pTextView = textView.frame.origin;
        let pResult = resultPos.origin;
        
        //resultPos.origin = CGPoint(x: pResult.x+pTextView.x, y: pResult.y+pTextView.y);
        
        print("ViewController: POSITION:", resultPos);
        
        let len = txt.count;
        
        let button = UIButton(frame: resultPos);
        let start = String.Index(utf16Offset: len-from, in: txt);
        let end = String.Index(utf16Offset: len-to, in: txt);
        
        textView.text = String(txt[..<start]);
        
        button.setTitle(String(txt[start..<end]), for: .normal);
        
        button.titleLabel?.font = textView.font;
        button.backgroundColor = .blue;
        button.setTitleColor(.cyan, for: .normal);
        
        button.addTarget(self, action: #selector(actionSpan(_:)), for: .touchUpInside);
        
        textView.addSubview(button);
        
    }
}
