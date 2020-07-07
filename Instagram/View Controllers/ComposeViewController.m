//
//  ComposeViewController.m
//  Instagram
//
//  Created by Fernando Arturo Perez on 7/7/20.
//  Copyright © 2020 Fernando Arturo Perez. All rights reserved.
//

#import "ComposeViewController.h"
#import "Post.h"

@interface ComposeViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UITextView *captionTextView;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
     if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
         imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
     }
     else {
         NSLog(@"Camera 🚫 available so we will use photo library instead");
         imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
     }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
    

    UITapGestureRecognizer *photoTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPhotoTap:)];
    [self.postImage addGestureRecognizer:photoTapRecognizer];
    [self.postImage setUserInteractionEnabled:YES];

}
-(void)onPhotoTap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
     if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
         imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
     }
     else {
         NSLog(@"Camera 🚫 available so we will use photo library instead");
         imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
     }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
   
}
- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (IBAction)onCancelTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onShareTap:(id)sender {
    UIImage *resized = [self resizeImage:self.postImage.image withSize:CGSizeMake(100.0, 100.0)];
    [Post postUserImage:resized withCaption:self.captionTextView.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if(succeeded){
            NSLog(@"Post Success!");
        }
        else
        {
            NSLog(@"%@",error.localizedRecoverySuggestion);
        }
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    self.postImage.image = editedImage;
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
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
