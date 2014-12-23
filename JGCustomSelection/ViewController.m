//
//  ViewController.m
//  JGCustomSelection
//
//  Created by Jay on 15/12/14.
//  Copyright (c) 2014 ccc. All rights reserved.
//

#import "ViewController.h"
#import "JGCustomSelection.h"

@interface ViewController ()<JGCustomSelectionDelegate>{
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)generateDataSource{
    NSMutableArray *array = [@[] mutableCopy];
    [array addObject:@{@"name":@"Jay",@"company":@"ccc"}];
    [array addObject:@{@"name":@"Sam",@"company":@"Microsoft"}];
    [array addObject:@{@"name":@"Tony",@"company":@"Maven"}];
    [array addObject:@{@"name":@"Mark",@"company":@"Apple"}];
    [array addObject:@{@"name":@"Antony",@"company":@"Microsoft"}];
    [array addObject:@{@"name":@"Jane",@"company":@"Maven"}];
    [array addObject:@{@"name":@"Maria",@"company":@"Apple"}];
    [array addObject:@{@"name":@"Sheena",@"company":@"Google"}];
    [array addObject:@{@"name":@"Ajay",@"company":@"RionTech"}];
    [array addObject:@{@"name":@"Andrew",@"company":@"RionTech"}];
    [array addObject:@{@"name":@"Kat",@"company":@"Apple"}];
    [array addObject:@{@"name":@"Leyshon",@"company":@"MouseTec"}];
    [array addObject:@{@"name":@"Cody",@"company":@"Ultrasonic"}];
    [array addObject:@{@"name":@"Jenifer",@"company":@"Ultrasoni"}];
    [array addObject:@{@"name":@"Kate",@"company":@"Samsung"}];
    [array addObject:@{@"name":@"Rita",@"company":@"xiaomi"}];
    [array addObject:@{@"name":@"Sparkel",@"company":@"xiaomi"}];
    return array;
}
- (IBAction)showViewButtonAction:(id)sender {
    JGCustomSelection *customSelection = [self.storyboard instantiateViewControllerWithIdentifier:@"JGCustomSelection"];
    customSelection.tableViewDataArray = [[self generateDataSource] mutableCopy];
    customSelection.delegate = self;
    [self presentViewController:customSelection animated:YES completion:^{
        
    }];
}

#pragma mark - JGCustomSelectionDelegate
-(void)JGCustomSelectionSelectedValues:(NSArray *)selectedValues{
    self.resultLbl.text = [NSString stringWithFormat:@"%lu developers selected",(unsigned long)selectedValues.count];
}

@end
