//
//  ViewController.h
//  JGCustomSelection
//
//  Created by Jay on 15/12/14.
//  Copyright (c) 2014 ccc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(nonatomic, retain) NSMutableArray *selectedData;
@property (weak, nonatomic) IBOutlet UILabel *resultLbl;


- (IBAction)showViewButtonAction:(id)sender;
@end

