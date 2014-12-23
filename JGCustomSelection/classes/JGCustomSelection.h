//
//  SelectDeveloper.h
//  AhmedabadProperty
//
//  Created by Jay on 15/12/14.
//  Copyright (c) 2014 Jay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListCell.h"
#import "SelectedCell.h"

@protocol JGCustomSelectionDelegate <NSObject>
@required
-(void)JGCustomSelectionSelectedValues:(NSArray *)selectedValues;

@end // end of delegate protocol


@interface JGCustomSelection : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *contentTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *selectedCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *selectedCollectionHeightConstrain;
@property (retain, nonatomic) NSMutableArray *selectedValues;
@property (retain, nonatomic) NSMutableArray *tableViewDataArray;
@property (nonatomic, weak) id<JGCustomSelectionDelegate> delegate;


- (IBAction)doneButtonAction:(id)sender;
@end
