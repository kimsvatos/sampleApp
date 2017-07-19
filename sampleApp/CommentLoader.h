//
//  CommentLoader.h
//  sampleApp
//
//  Created by Kimberly Svatos on 7/18/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentModel.h"

@interface CommentLoader : NSObject

@property(nonatomic, strong) NSArray<CommentModel *> *comments;

@end
