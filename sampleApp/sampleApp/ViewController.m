//
//  ViewController.m
//  sampleApp
//
//  Created by Kimberly Svatos on 7/14/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import "ViewController.h"
#import "CommentSectionController.h"
@import IGListKit;
@import YogaKit;


//TODO
//Add IGListKit managed UICollectionView to main view controller

@interface ViewController () <IGListAdapterDataSource>
@property(nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic, strong, readonly) IGListAdapter * adapter;
// instance of this owns, piece of info
// method is telingsomething to do somethign
@end

@implementation ViewController

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame: self.view.bounds
                                             collectionViewLayout: [[UICollectionViewFlowLayout alloc] init]];
    
    //TODO: changed background color to see?
    self.collectionView.backgroundColor = UIColor.grayColor;
    
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
    return @[@"What time is it? Summertime, its our vacation", @"Coming out of my cage and i been feeling just fine", @"all the small things, truth cares, truth brings", @"So baby hold me closer in the backseat of your rover that I know you can't afford", @"lemme take a selfie #live", @"Hakuna Matata, What a wonderful phrase"];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    return [CommentSectionController new];
}

@end













