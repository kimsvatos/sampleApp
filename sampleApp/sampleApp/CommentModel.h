//
//  CommentModel.h
//  sampleApp
//
//  Created by Kimberly Svatos on 7/18/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import <Foundation/Foundation.h>
@import IGListKit;

@interface CommentModel : NSObject
@property(nonatomic, strong) UIFont * _Nonnull textFont;
@property(nonatomic, strong) UIFont * _Nonnull userFont;
@property(nonatomic, strong) NSString * _Nonnull user;
@property(nonatomic, strong) NSString * _Nonnull text;
@property(nonatomic, strong) NSDate * _Nullable date;
- (nonnull id<NSObject>)diffIdentifier;
- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object;
@end
