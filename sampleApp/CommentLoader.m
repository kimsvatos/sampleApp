//
//  CommentLoader.m
//  sampleApp
//
//  Created by Kimberly Svatos on 7/18/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import "CommentLoader.h"
#import "CommentModel.h"

@implementation CommentLoader
//
////"hey which objects do i get to use"
//- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
//    
//    //QUESTION: what are these usually? JSON? array of json? one by one (eg pic, text, user, etc?)
//    return @[@"What time is it? Summertime, its our vacation", @"Coming out of my cage and i been feeling just fine", @"all the small things, truth cares, truth brings", @"So baby hold me closer in the backseat of your rover that I know you can't afford", @"lemme take a selfie #live", @"Hakuna Matata, What a wonderful phrase"];
//}

-(instancetype)init {
    
    self = [super init];
    CommentModel* comm1, *comm2, *comm3, *comm4, *comm5;
    comm1.user = @"hodor";
    comm1.text = @"hodor";
    comm2.user = @"kimsvatos";
    comm2.text = @"It's my first week at FB";
    comm3.user = @"jonsnow";
    comm3.text = @"you know nothing";
    comm4.user = @"aryastark";
    comm4.text = @"gonna go kill the queen brb";
    comm5.user = @"cersei";
    comm5.text = @"h8 u all";
    
    self.comments = @[comm1, comm2, comm3, comm4, comm5];
    return self;
}

@end
