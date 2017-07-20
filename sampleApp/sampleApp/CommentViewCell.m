//
//  CommentViewCell.m
//  sampleApp
//
//  Created by Kimberly Svatos on 7/18/17.
//  Copyright © 2017 Kimberly Svatos. All rights reserved.
//

#import "CommentViewCell.h"
#import "CommentModel.h"
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
        self.commentUserLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.commentTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
       
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
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
        //layout.paddingTop = YGPointValue(30.0);
    }];
    
    // Comment View -> row   -> prof pic | commentAndDateView | heartView
    
    UIView *commentView = [[UIView alloc] initWithFrame:CGRectZero];
    commentView.backgroundColor = [UIColor whiteColor];
    [commentView configureLayoutWithBlock:^void(YGLayout *layout){
        layout.isEnabled = TRUE;
        layout.flexDirection = YGFlexDirectionRow;
        layout.flexGrow = 1.0;
        layout.paddingLeft = YGPointValue(5.0);
        layout.paddingRight = YGPointValue(3.0);
        layout.paddingTop = YGPointValue(3.0);
        layout.paddingBottom = YGPointValue(3.0);
    }];
  
    // Profile Picture View/Image
    
    UIImageView *profPicView = [[UIImageView alloc] initWithFrame:CGRectZero];
    profPicView.backgroundColor = [UIColor blackColor];
    [profPicView configureLayoutWithBlock:^void(YGLayout *layout) {
        layout.isEnabled = TRUE;
        layout.padding = YGPointValue(5.0);
        layout.width = YGPointValue(20.0);
        layout.height = YGPointValue(20.0);
        layout.justifyContent = YGJustifyFlexEnd;
        layout.paddingRight = YGPointValue(5.0);
        layout.paddingTop = YGPointValue(2.0);
        layout.flexShrink = 1.0;
    }];

    [commentView addSubview:profPicView];
    
    
    // CommentAndDate View -> Column
    
    UIView *commentAndDateView = [[UIView alloc] initWithFrame:CGRectZero];
    [commentAndDateView configureLayoutWithBlock:^void(YGLayout *layout){
        layout.isEnabled = TRUE;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.alignItems = YGAlignFlexStart;
        layout.flexShrink = 1.0;
        layout.flexGrow = 1.0;
        layout.paddingLeft = YGPointValue(3.0);
    }];
    
    [commentView addSubview:commentAndDateView];
    
    // usercomment Label
    
    self.commentTextLabel.numberOfLines = 4;
    [self.commentTextLabel configureLayoutWithBlock:^void(YGLayout *layout) {
        layout.isEnabled = TRUE;
        layout.flexShrink = 1.0;
        layout.alignItems = YGAlignFlexStart;
        layout.paddingBottom = YGPointValue(2.0);
    }];
   
    [commentAndDateView addSubview:self.commentTextLabel];
    
    // date label
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [dateLabel configureLayoutWithBlock:^void(YGLayout *layout) {
        layout.isEnabled = TRUE;
        layout.paddingTop = YGPointValue(2.0);
        layout.paddingLeft = YGPointValue(3.0);
    }];
    NSString *dString = @"3 hr";
    
    UIColor *gray = [UIColor grayColor];
    NSDictionary *dateAttribs = @{NSFontAttributeName: [UIFont systemFontOfSize:7],
                                  NSForegroundColorAttributeName:gray};
    NSMutableAttributedString *dateString = [[NSMutableAttributedString alloc] initWithString:dString
                                             attributes:dateAttribs];
    dateLabel.attributedText = dateString;
    
    [commentAndDateView addSubview:dateLabel];
    
    // HEART picture
    
    UIImageView *heartView = [[UIImageView alloc] initWithFrame:CGRectZero];
    UIImage *heartImage = [[UIImage alloc] initWithContentsOfFile:@"got.jpp"];
    heartView.image = heartImage;
    heartView.backgroundColor = [UIColor blueColor];
    [heartView configureLayoutWithBlock:^void(YGLayout *layout) {
        layout.isEnabled = TRUE;
        layout.width = YGPointValue(20.0);
        layout.height = YGPointValue(20.0);
        layout.justifyContent = YGJustifyFlexEnd;
    }];
    
    [commentView addSubview:heartView];
    
    
    // Apply
    [self.contentView addSubview:commentView];
    [self.contentView.yoga applyLayoutPreservingOrigin:YES];
    
}

-(void) layoutSubviews{
    [super layoutSubviews];
}

-(void)setCommentUser:(NSAttributedString *)user CommentText:(NSAttributedString *)comment {
    NSString *commentWithSpace = [[NSString alloc] initWithFormat:@" %@", comment];
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:commentWithSpace];
    
    
    NSMutableAttributedString *commentUser = [[NSMutableAttributedString alloc] initWithString:user];
    
    //NSDictionary *userAttribs = @{
     //                         NSFontAttributeName: .font
      //                        };
    [commentUser appendAttributedString:commentString];
    
    
    self.commentTextLabel.attributedText = commentUser;
    
    //self.commentUserLabel.text = user;
    [self setupSubviews];
    
}

-(void)setComment:(CommentModel *)comment { //testing purposes only, TODO: Delete
    
    NSDictionary *textAttribs = @{NSFontAttributeName: comment.textFont};
    NSDictionary *userAttribs = @{NSFontAttributeName: comment.userFont
                                  };
    NSString *commentString = [[NSString alloc]
                               initWithFormat:@"%@ %@", comment.user, comment.text];
    NSMutableAttributedString *commentAttributedString = [[NSMutableAttributedString alloc]
                                                          initWithString:commentString
                                                          attributes:textAttribs];
    
    NSRange userRange = NSMakeRange(0, comment.user.length);
    [commentAttributedString setAttributes:userAttribs range:userRange];
    
    self.commentTextLabel.attributedText = commentAttributedString;
    //self.commentUserLabel.text = @"picture";
   
    [self setupSubviews];
}

#pragma mark - Instance Methods



@end








