//
//  UserProfileCell.h
//  Instagram
//
//  Created by Fernando Arturo Perez on 7/10/20.
//  Copyright © 2020 Fernando Arturo Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <Parse.h>

NS_ASSUME_NONNULL_BEGIN
@import Parse;

@interface UserProfileCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet PFImageView *postPicture;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
- (IBAction)didTapLike:(id)sender;

@end

NS_ASSUME_NONNULL_END
