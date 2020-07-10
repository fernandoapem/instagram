//
//  ProfileViewController.m
//  Instagram
//
//  Created by Fernando Arturo Perez on 7/10/20.
//  Copyright © 2020 Fernando Arturo Perez. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "Post.h"
#import "UserProfileCell.h"

@interface ProfileViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *posts;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    PFUser *user = [PFUser currentUser];
    self.usernameLabel.text = user.username;
    [self fetchPosts];
    
}
-(void) fetchPosts
{
    PFUser *user = [PFUser currentUser];
    self.usernameLabel.text = user.username;
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    [postQuery whereKey:@"author" equalTo:user];
    
    postQuery.limit = 20;
    
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
            self.posts = posts.mutableCopy;
            [self.tableView reloadData];
        }
        else {
            // handle error
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UserProfileCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"UserProfileCell"];
    cell.post = self.posts[indexPath.row];
    [cell setPost:cell.post];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}


@end
