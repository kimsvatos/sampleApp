//
//  CommentSectionController.m
//  sampleApp
//
//  Created by Kimberly Svatos on 7/18/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import "CommentSectionController.h"
#import "CommentModel.h"
#import "CommentViewCell.h"
@import IGListKit;

@interface CommentSectionController ()
@property (nonatomic, copy)NSString *commentText;
@property (nonatomic, strong) NSMutableArray<CommentModel *> *commentArray;
@end

@implementation CommentSectionController

- (instancetype)init {
    if (self = [super init]) {
        self.inset = UIEdgeInsetsMake(15, 0, 0, 0);
        self.commentArray = [NSMutableArray<CommentModel *> new];
    }
    return self;
}

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems
{
    return 2.0; // user: comment
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    CGSize containerSize = self.collectionContext.containerSize;
    return CGSizeMake(containerSize.width, 25.0);
}

//now that i know size, whats the cell?
//configure cell here
-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    
    //TODO: THIS IS WHERE WE DETERMINED WHAT TYPE OF ITEM IT IS:
    //need to ask collection view to give us cell
    //IGListKit ask adapter for the cell
    //we'll have an index 0 and 1, 0 is user, 1 is comment text
    
    //Class cellClass = index==0? CommentViewCell: CommentViewCell;
    
    CommentViewCell *commentCell = [self.collectionContext dequeueReusableCellOfClass:CommentViewCell.class forSectionController:self atIndex:index];
    
    NSInteger zero = 0;
    if (index == zero){ //USER
        [commentCell setComment:self.commentArray[0].user];
        commentCell.contentView.backgroundColor = [UIColor grayColor];
        
        return commentCell;
    }
    else { //COMMENT TEXT

        [commentCell setComment:self.commentArray[0].text];
        commentCell.contentView.backgroundColor = [UIColor whiteColor];
    
        return commentCell;
    }
}

//data model
- (void)didUpdateToObject:(id)object
{
   
    
    [self.commentArray addObject:(object)];
    
}

- (void)didSelectItemAtIndex:(NSInteger)index
{
    //TODO: ?
   
    
}

@end
