//
//  ProductHeaderView.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/25.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation
import UIKit

class ProductHeaderView: UIView {
    
    @IBOutlet weak var p1: UIImageView!
    @IBOutlet weak var p2: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator  = false
        scrollView.pagingEnabled = true
        scrollView.contentSize = CGSize(width: 3*320, height: 128)
    }
    
    
    class var productHeaderView:ProductHeaderView{
        get{
            return NSBundle.mainBundle().loadNibNamed("ProductHeaderView", owner: nil, options: nil).last as! ProductHeaderView
        }
    }
    
    var _scrollInfoArray: NSMutableArray!
    var scrollInfoArray: NSMutableArray{
        
        get{
            if (_scrollInfoArray == nil){
                _scrollInfoArray = NSMutableArray()
                var bundle = NSBundle.mainBundle().pathForResource("moviepics.plist", ofType: nil)!
                
                var dictArray = NSMutableArray(contentsOfFile: bundle)!
                
                for dict in dictArray {
                    var tempScrollInfo = ScrollInfo(dict: dict as! NSMutableDictionary)
                    _scrollInfoArray.addObject(tempScrollInfo)
                }
            }
            return _scrollInfoArray
        }
    
    }
    
    
}

