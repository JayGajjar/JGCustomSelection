//
//  DeveloperCellCollectionViewCell.h
//  AhmedabadProperty
//
//  Created by Jay on 15/12/14.
//  Copyright (c) 2014 Jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@property (weak, nonatomic) IBOutlet UIImageView *devIcon;
@property (weak, nonatomic) IBOutlet UILabel *devName;
@end
