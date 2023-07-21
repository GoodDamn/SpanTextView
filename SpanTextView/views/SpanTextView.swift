//
//  SpanTextView.swift
//  SpanTextView
//
//  Created by GoodDamn on 21/07/2023.
//

import UIKit

class SpanTextView: UITextView {
    
    private var mSpans:[UIButton] = [];
   
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer);
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    public func addSpan(from: Int,
                        to: Int,
                        action: Selector,
                        target: Any?,
                        attrs: [NSAttributedString.Key : Any]?) {
        
        guard let txt = text else {
            return;
        };
        
        let fpos = position(from: beginningOfDocument, offset: from);
        let tpos = position(from: beginningOfDocument, offset: to);
        
        let range = textRange(from: fpos!, to: tpos!);
        
        let resultPos = firstRect(for: range!);
        
        let l = txt.count;
        
        let button = UIButton(frame: resultPos);
        
        let start = String.Index(utf16Offset: from, in: txt);
        let end = String.Index(utf16Offset: to, in: txt);
                
        let spanString = String(txt[start..<end]);
        
        button.setTitle(spanString, for: .normal);
        
        let attrStr = NSAttributedString(string: spanString, attributes: attrs);
        
        button.backgroundColor = .none;
        button.setAttributedTitle(attrStr, for: .normal);
        button.titleLabel?.font = font;
    
        button.addTarget(target, action: action, for: .touchUpInside);
        
        addSubview(button);
        
        mSpans.append(button);
    }
    
}
