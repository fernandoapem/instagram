//
//  UserProfileCell.m
//  Instagram
//
//  Created by Fernando Arturo Perez on 7/10/20.
//  Copyright © 2020 Fernando Arturo Perez. All rights reserved.
//

#import "UserProfileCell.h"
#import "Post.h"
#import "NSDate+DateTools.h"

@implementation UserProfileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setPost:(Post *)post {
    _post = post;
    self.postPicture.file = post[@"image"];
    self.likeLabel.text = [NSString stringWithFormat:@"%@", post[@"likeCount"]];
    self.captionLabel.text = post[@"caption"];
    self.timeLabel.text = [self.post.createdAt timeAgoSinceNow];
    [self.postPicture loadInBackground];
}


@end
