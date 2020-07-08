//
//  PostCell.m
//  Instagram
//
//  Created by Fernando Arturo Perez on 7/8/20.
//  Copyright © 2020 Fernando Arturo Perez. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"

@implementation PostCell

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
    self.postImage.file = post[@"image"];
    self.likeLabel.text = [NSString stringWithFormat:@"%@", post[@"likeCount"]];
    self.captionLabel.text = post[@"caption"];
    [self.postImage loadInBackground];
}

@end
