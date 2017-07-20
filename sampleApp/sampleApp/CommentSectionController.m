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
        //self.inset = UIEdgeInsetsMake(8, 0, 0, 0);
        self.commentArray = [NSMutableArray<CommentModel *> new];
    }
    return self;
}

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems { return 1.0; } // user and comment passed together -> one comment as a whole is one item }

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGSize containerSize = self.collectionContext.containerSize;
    //size of entire stripes in comment
    
    
    // NSAttribtedString -- to mix and match within string
    CommentModel *model = self.commentArray[index];
    NSDictionary *attributes = @{ NSFontAttributeName: model.textFont};
    CGFloat widthForMath = (containerSize.width  - 50.0);
    CGRect rect = [model.text boundingRectWithSize:CGSizeMake(widthForMath, CGFLOAT_MAX)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:attributes
                                              context:nil];
    CGFloat paddingForLongComment = 10.0;
    CGFloat height = rect.size.height + paddingForLongComment;
    CGFloat minHeight = 36.0;
    
    //CGFloat realHeight = ;
    // TODO : make this a square, for insta pictures --maybe big grep a "post" in the IG list kit place
    return CGSizeMake(containerSize.width, MAX(height, minHeight));
    //return CGSizeMake(containerSize.width, height);
}


-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    CommentViewCell *commentCell = [self.collectionContext dequeueReusableCellOfClass:CommentViewCell.class
                                                                 forSectionController:self atIndex:index];
    
    commentCell.backgroundColor = index % 2 == 0 ? [UIColor redColor] : [UIColor blueColor];
    // ^^line for debugging spacing issue
    // tell the comment cell what its user and commenttext are
    
    [commentCell setComment:self.commentArray[index]];
    
    return commentCell;

}

//data model
- (void)didUpdateToObject:(id)object {
    [self.commentArray addObject:(object)];
}

- (void)didSelectItemAtIndex:(NSInteger)index {}


@end
