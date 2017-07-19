//
//  CommentModel.m
//  sampleApp
//
//  Created by Kimberly Svatos on 7/18/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel


-(instancetype)init {
    if (self = [super init]){
        
    }
    return self;
}

//returns key unique to object
- (nonnull id<NSObject>)diffIdentifier{
    return self;
}

//checks if @param and self are equal. 
- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object{
    if((id<IGListDiffable>)self == object){
        return TRUE;
    }
    return FALSE;
}

@end
