//
//  ViewController.m
//  sampleApp
//
//  Created by Kimberly Svatos on 7/14/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import "ViewController.h"
#import "CommentLoader.h"
#import "CommentSectionController.h"
@import IGListKit;
@import YogaKit;


//TODO
//Add IGListKit managed UICollectionView to main view controller

@interface ViewController () <IGListAdapterDataSource>
@property(nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic, strong, readonly) IGListAdapter * adapter;
@property(nonatomic, strong) CommentLoader* loader;
@end

@implementation ViewController

- (instancetype)init {
    if (self = [super init]) {
        self.loader = [CommentLoader init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame: self.view.bounds
                                             collectionViewLayout: [[UICollectionViewFlowLayout alloc] init]];
    

    //self.collectionView.backgroundColor = UIColor.grayColor;
    const CGFloat topPadding = 0.0;
    const CGFloat sidePadding = 0.0;
    self.collectionView.backgroundColor = UIColor.lightGrayColor;
    [self.collectionView configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(topPadding);
        layout.marginLeft  = YGPointValue(sidePadding);
        layout.flexDirection = YGFlexDirectionRow;
       
    }];
    
    
    [self.view addSubview:self.collectionView];
    _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IGListAdapterDataSource

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

//"hey which objects do i get to use"
- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    
    //QUESTION: what are these usually? JSON? array of json? one by one (eg pic, text, user, etc?)
    //return self.loader.comments;
    NSMutableArray *items;
    //items = items + self.loader.comments as [IGListDiffable];
    //for(int i = 0; i <5; i++){
    //    [items addObject:[self.loader.comments[0].user];
    //
//}
    //return self.loader.comments;
    return @[@"My prada's at the dry cleaners", @"You dont have to study, you go to BU", @"You know whats cool? A billion dollars", @"drop the the. just facebook. cleaner that way. ", @"I didn't know you couldnt feed a chicken chicken", @"U have the minimum amount of my attention"];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    return [CommentSectionController new];
}

@end













