//
//  DetailsViewController.m
//  Instagram
//
//  Created by Fernando Arturo Perez on 7/8/20.
//  Copyright © 2020 Fernando Arturo Perez. All rights reserved.
//

#import "DetailsViewController.h"
#import "Post.h"
#import <Parse.h>
#import "NSDate+DateTools.h"
@import Parse;
@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet PFImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.usernameLabel.text = self.post.author.username;
    self.captionLabel.text = [NSString stringWithFormat:@"%@: %@" ,self.post.author.username, self.post.caption ];
    self.postImage.file = self.post.image;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@", self.post.likeCount];
    self.timeLabel.text = [self.post.createdAt timeAgoSinceNow];
    [self.likeButton setSelected:self.post.liked];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
