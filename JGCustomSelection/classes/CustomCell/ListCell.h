//
//  DeveloperCellCollectionViewCell.h
//  AhmedabadProperty
//
//  Created by Jay on 15/12/14.
//  Copyright (c) 2014 Jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *devIcon;
@property (weak, nonatomic) IBOutlet UILabel *devName;
@property (weak, nonatomic) IBOutlet UILabel *devSubName;
@property (weak, nonatomic) IBOutlet UIView *cellHeightGuider;
@end
