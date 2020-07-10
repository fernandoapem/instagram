//
//  PostCell.m
//  Instagram
//
//  Created by Fernando Arturo Perez on 7/8/20.
//  Copyright © 2020 Fernando Arturo Perez. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
#import "NSDate+DateTools.h"
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
    self.usernameLabel.text = post.author.username;
    self.likeLabel.text = [NSString stringWithFormat:@"%@", post[@"likeCount"]];
    self.captionLabel.text = post[@"caption"];
    self.dateLabel.text = [self.post.createdAt timeAgoSinceNow];
    [self.postImage loadInBackground];
    [self.likeButton setSelected:self.post.liked];
}

- (IBAction)didTapLike:(id)sender {
    if(!self.post.liked)
    {
        self.post.liked = YES;
    
        int value = [self.post.likeCount intValue];
        self.post.likeCount = [NSNumber numberWithInt:value + 1];
        [self.post saveInBackground];
        [self setPost:self.post];
    }
    else
    {
        self.post.liked = NO;
        int value = [self.post.likeCount intValue];
        self.post.likeCount = [NSNumber numberWithInt:value - 1];
        [self.post saveInBackground];
        [self setPost:self.post];
     
        
    }
    
}
@end
