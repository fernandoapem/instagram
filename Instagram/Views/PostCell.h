//
//  PostCell.h
//  Instagram
//
//  Created by Fernando Arturo Perez on 7/8/20.
//  Copyright © 2020 Fernando Arturo Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN
@import Parse;
@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet PFImageView *postImage;
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (nonatomic) BOOL liked;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
- (IBAction)didTapLike:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@end

NS_ASSUME_NONNULL_END
