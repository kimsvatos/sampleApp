//
//  CommentViewCell.m
//  sampleApp
//
//  Created by Kimberly Svatos on 7/18/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import "CommentViewCell.h"
@import YogaKit;

@interface CommentViewCell ()
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UILabel* commentUserLabel;
@property (nonatomic, strong) UILabel* commentTextLabel;
@end



@implementation CommentViewCell
//declare properties this cell will have, lables, pics, etc
//declare/implement initialization method, can create all subviews
//have to expose some configuration method


-(instancetype)init {
    
    if (self = [super init]) {
        [self setupSubviews];
        self.commentUserLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.commentTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
      //  [self setupSubviews];
        self.commentUserLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.commentTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return self;
}

-(void)setUpLayout {
}


- (void)setupSubviews {
    
    [self.contentView configureLayoutWithBlock:^void(YGLayout *layout){
        layout.isEnabled = YES;
        //layout.padding = YGPointValue(15.0);
        
    }];
    
    // Comment View
    UIView *commentView = [[UIView alloc] initWithFrame:CGRectZero];
    commentView.backgroundColor = [UIColor whiteColor];
    [commentView configureLayoutWithBlock:^void(YGLayout *layout){
        layout.isEnabled = TRUE;
        layout.flexDirection = YGFlexDirectionRow;
        layout.alignContent = YGAlignCenter;
    }];
  
    // User label
    
    self.commentUserLabel.font = [UIFont boldSystemFontOfSize:11.0];
    [self.commentUserLabel configureLayoutWithBlock:^void(YGLayout *layout) {
        layout.isEnabled = TRUE;
        layout.paddingRight = YGPointValue(3.0);
    }];
    [commentView addSubview:self.commentUserLabel];
    
    // Comment Label
    
    self.commentTextLabel.font = [UIFont systemFontOfSize:11.0];
    self.commentTextLabel.numberOfLines = 3;
    [self.commentTextLabel configureLayoutWithBlock:^void(YGLayout *layout) {
        layout.isEnabled = TRUE;
        //layout.flexGrow = 1.0;
      
    }];
    [commentView addSubview:self.commentTextLabel];

    // Apply
    [self.contentView addSubview:commentView];
    [self.contentView.yoga applyLayoutPreservingOrigin:YES];
    
}

-(void) layoutSubviews{
    [super layoutSubviews];
}

-(void)setCommentUser:(NSString *)user CommentText:(NSString *)comment {
    
    self.commentTextLabel.text = comment;
    self.commentUserLabel.text = user;
    [self setupSubviews];
    
}

-(void)setComment:(NSString *)comment { //testing purposes only, TODO: Delete
   
    self.commentTextLabel.text = comment;
    self.commentUserLabel.text = comment;
    [self setupSubviews];
}

#pragma mark - Instance Methods



@end








