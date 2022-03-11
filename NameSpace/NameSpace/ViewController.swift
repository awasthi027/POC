//
//  ViewController.swift
//  NameSpace
//
//  Created by Ashish Awasthi on 3/11/22.
//

import UIKit
import MathA
import MathB

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let objA = MathA.BinaryOperation()
        let a = 1
        let b = 2
        var output = objA.add(1, 2)
        print("MathA Add: \(a), \(b): \(output)")
        output = objA.sub(1, 2)
        print("MathA Sub: \(a), \(b): \(output)")
        output = objA.mult(1, 2)
        print("MathA Mult: \(a), \(b): \(output)")
        output = objA.div(1, 2)
        print("MathA Div: \(a), \(b): \(output)")
        
        let objB = MathB.BinaryOperation()
        output = objB.add(1, 2)
        print("MathB Add: \(a), \(b): \(output)")
        output = objB.sub(1, 2)
        print("MathB Sub: \(a), \(b): \(output)")
        output = objB.mult(1, 2)
        print("MathB Mult: \(a), \(b): \(output)")
        output = objB.div(1, 2)
        print("MathB Div: \(a), \(b): \(output)")
        
        output = objB.mod(1, 2)
        print("MathB Mod: \(a), \(b): \(output)")
        
        
        // Do any additional setup after loading the view.
    }


}

