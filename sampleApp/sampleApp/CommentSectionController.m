//
//  CommentSectionController.m
//  sampleApp
//
//  Created by Kimberly Svatos on 7/18/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import "CommentSectionController.h"
#import "CommentViewCell.h"
@import IGListKit;

@interface CommentSectionController ()
@property (nonatomic, copy)NSString *commentText;
@end

@implementation CommentSectionController

- (instancetype)init {
    if (self = [super init]) {
        self.inset = UIEdgeInsetsMake(15, 0, 0, 0);
    }
    return self;
}

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems
{
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    CGSize containerSize = self.collectionContext.containerSize;
    
    //TODO: change height to something real
    
    return CGSizeMake(containerSize.width, 25.0);
}

//now that i know size, whats the cell?
//configure cell here
-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    
    //TODO: ask if this works
    //need to ask collection view to give us cell
    //IGListKit ask adapter for the cell
    //
    CommentViewCell *commentCell = [self.collectionContext dequeueReusableCellOfClass:CommentViewCell.class forSectionController:self atIndex:index];
    [commentCell setComment:self.commentText];
    commentCell.contentView.backgroundColor = [UIColor whiteColor];
    //commentCell.text = @"hello";
    return commentCell;
}

//data model
//
- (void)didUpdateToObject:(id)object
{
    //TODO: what do i do with object
    self.commentText = object;
    
}

- (void)didSelectItemAtIndex:(NSInteger)index
{
    //TODO: ?
   
    
}

@end
