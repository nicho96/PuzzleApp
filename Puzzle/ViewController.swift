//
//  ViewController.swift
//  Puzzle
//
//  Created by Nicholas Mercier on 2017-03-02.
//  Copyright © 2017 Nicholas Mercier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container_V: UIView!
    
    let p = Puzzle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        p.shuffle()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateView()
    }
    
    func updateView(){
        for view in container_V.subviews {
            view.removeFromSuperview()
        }
        let width = self.view.frame.width / CGFloat(p.dim)
        for i in 0 ... p.dim * p.dim - 1 {
            let slide = SlideView(frame: CGRect(x:CGFloat(i % p.dim) * width, y:CGFloat(i / p.dim) * width, width: width, height:width), index: p.puzzle[i])
            container_V.addSubview(slide)
            slide.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(slidePressed)))
        }
    }
    
    func slidePressed(sender:UITapGestureRecognizer){
        let slide = sender.view! as! SlideView
        let ind:Int = slide.index
        p.performMove(ind: p.getPiecePosition(value:ind))
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

