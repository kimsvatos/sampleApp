//
//  CommentViewCell.h
//  sampleApp
//
//  Created by Kimberly Svatos on 7/18/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface CommentViewCell : UICollectionViewCell
//@property (nonatomic, copy) NSString* commentUser;
//@property (nonatomic, copy) NSString* commentText;
-(void)setCommentUser:(NSString *)user CommentText:(NSString *)comment;
-(void)setComment:(CommentModel *)comment;

//what you can see, can define properties, methods (instance and class)
//public api

@end
