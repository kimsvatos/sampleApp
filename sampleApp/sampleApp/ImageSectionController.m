//
//  ImageSectionController.m
//  sampleApp
//
//  Created by Kimberly Svatos on 7/19/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import "ImageSectionController.h"
#import "CommentModel.h"
#import "ImageCell.h"

@interface ImageSectionController ()
@property (nonatomic, copy)NSString *commentText;
@property (nonatomic, strong) NSMutableArray<CommentModel *> *commentArray;
@end

@implementation ImageSectionController

- (instancetype)init {
    if (self = [super init]) {
    
    }
    return self;
}

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems { return 1.0; } // user and comment passed together -> one comment as a whole is one item }

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGSize containerSize = self.collectionContext.containerSize;
    //size of entire stripes in comment
    
    
    
    CommentModel *model = self.commentArray[index];
    NSDictionary *attributes = @{ NSFontAttributeName: model.textFont};
    CGRect rect = [model.text boundingRectWithSize:CGSizeMake(containerSize.width, CGFLOAT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:attributes
                                           context:nil];
    CGFloat height = rect.size.height;
    CGFloat minHeight = 50.0;
    //CGFloat realHeight = ;
    // TODO : make this a square, for insta pictures --maybe big grep a "post" in the IG list kit place
    return CGSizeMake(containerSize.width, MAX(height, minHeight));
}


-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    ImageCell *temp = [ImageCell new];
    return temp;
}

//data model
- (void)didUpdateToObject:(id)object {
    [self.commentArray addObject:(object)];
}

- (void)didSelectItemAtIndex:(NSInteger)index {}


@end
