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
@property BOOL wasLastPic;
@end

@implementation ViewController

- (instancetype)init {
    if (self = [super init]) {
   //     self.loader = [CommentLoader init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.wasLastPic = NO;
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
    
    //SETUP
    [self.view addSubview:self.collectionView];
    _loader = [CommentLoader new];
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
    return (NSArray<id <IGListDiffable>> *) self.loader.comments;
    
    //TODO: add picture array here too!!!!!!
    
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    
    
//where to start:
    /*
     in objectsForListAdapter THATS where you should add the array of images to figure out whats what 
     figure out if it passes one at a time or the whole thing, the array of loader.comments
     figure out how to upload/save imagine on the viewcontroller screen---we'll reuse it? if we an. 
     or upload many times to have array of same image. 
     
     finish image cell and image section controller -- they're empty rn 
     
     ask what i should do with the date on the comment
     
     maybe ask dustin why it maxes out to four lines
     
     ask andrew maybe or dustin if i can mix/match font -- or how would i wrap it. does it matter? 
     
     
     
     
     */
    if ([object isKindOfClass:[CommentModel class]] && self.wasLastPic == TRUE){
        return [CommentSectionController new];
    }
    else if (self.wasLastPic == FALSE){
        
    }
    return [CommentSectionController new];
}

@end













