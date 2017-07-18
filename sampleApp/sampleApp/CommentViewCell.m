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
@end



@implementation CommentViewCell
//declare properties this cell will have, lables, pics, etc
//declare/implement initialization method, can create all subviews
//have to expose some configuration method


-(instancetype)init {
    
    if (self = [super init]) {
       // TODO: SET UP SUBVIEWS? vvvv
        [self setupSubviews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    self.commentLabel = [[UILabel alloc] init];
    self.commentLabel.textColor = [UIColor redColor];
    self.commentLabel.textAlignment = NSTextAlignmentLeft;
    self.commentLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.commentLabel];
}

-(void) layoutSubviews{
    [super layoutSubviews];
    CGFloat left = 8.0;
    CGRect bounds = self.contentView.bounds;
    
    //TODO: these might be funky. trying ot make it righ tinstead of left.
    self.commentLabel.frame = CGRectMake(left, 0, bounds.size.width-left*2.0, bounds.size.height);
}

-(void)setComment:(NSString *)comment {
    
     _comment = [comment copy];
    self.commentLabel.text = _comment;
}

#pragma mark - Instance Methods



@end








