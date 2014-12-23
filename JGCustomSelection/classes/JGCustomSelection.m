//
//  SelectDeveloper.m
//  AhmedabadProperty
//
//  Created by Jay on 15/12/14.
//  Copyright (c) 2014 Jay. All rights reserved.
//

#import "JGCustomSelection.h"

@interface JGCustomSelection (){
}

@end

@implementation JGCustomSelection
@synthesize selectedValues,tableViewDataArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    selectedValues = [@[] mutableCopy];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    self.selectedCollectionHeightConstrain.constant = 0;
    if (selectedValues.count > 0) {
        [self animateSelectedCollectionView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


#pragma mark - TableView Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableViewDataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListCell *cell = (ListCell *)[tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    NSDictionary *developer = [tableViewDataArray objectAtIndex:indexPath.row];
    cell.devName.text = developer[@"name"];
    cell.devSubName.text = developer[@"company"];
    [cell layoutIfNeeded];
    NSInteger height = cell.cellHeightGuider.frame.origin.y+1;
    /*
    if (height < 60) {
        //return  60;
    }else{
        return height;
    }
    */
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = (ListCell *)[tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    NSDictionary *developer = [tableViewDataArray objectAtIndex:indexPath.row];
    cell.devName.text = developer[@"name"];
    cell.devSubName.text = developer[@"company"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![selectedValues containsObject:[tableViewDataArray objectAtIndex:indexPath.row]]) {
        [self.selectedCollectionView performBatchUpdates:^{
            [selectedValues addObject:[tableViewDataArray objectAtIndex:indexPath.row]];
            [self.selectedCollectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:selectedValues.count-1 inSection:0]]];
        } completion:^(BOOL finished) {
            [self.selectedCollectionView reloadData];
        }];

    }
    //[tableViewDataArray removeObjectAtIndex:indexPath.row];
    //[self.contentTableView reloadData];
    NSInteger index = [selectedValues indexOfObject:[tableViewDataArray objectAtIndex:indexPath.row]];
    if (index!= NSIntegerMax) {
        
    }else{
        index = selectedValues.count-1;
    }
    [self.selectedCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    [self animateSelectedCollectionView];
}

#pragma mark - UICollectionview DataSource & Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  selectedValues.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *developer = [selectedValues objectAtIndex:indexPath.row];
    SelectedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SelectedCell" forIndexPath:indexPath];
    cell.devName.text = developer[@"name"];
    cell.removeButton.tag = 10000+indexPath.row;
    [cell.removeButton addTarget:self action:@selector(cellRemoveButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - UISearchBar Delegates
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length >0 ) {
        //tableViewDataArray = [[DatabaseHelper Developer_masterFetchByName:searchText] mutableCopy];
    }else{
        //tableViewDataArray = [[DatabaseHelper Developer_masterFetchAllDeveloper] mutableCopy];
    }
    [self.contentTableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

#pragma mark - Animations
-(void)animateSelectedCollectionView{
    if (selectedValues.count > 0) {
        self.selectedCollectionHeightConstrain.constant = 140;
    }else{
        self.selectedCollectionHeightConstrain.constant = 0;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - CellButton Action
-(IBAction)cellRemoveButtonAction:(id)sender{
    UIButton *button = (UIButton *)sender;
    NSInteger index = button.tag-10000;
    [self.selectedCollectionView performBatchUpdates:^{
        [selectedValues removeObjectAtIndex:index];
        [self.selectedCollectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:index inSection:0]]];
    } completion:^(BOOL finished) {
        [self.selectedCollectionView reloadData];
        [self animateSelectedCollectionView];
    }];
}

- (IBAction)doneButtonAction:(id)sender {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(JGCustomSelectionSelectedValues:)]){
        [[self delegate] JGCustomSelectionSelectedValues:selectedValues];
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
