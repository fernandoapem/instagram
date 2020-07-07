//
//  ComposeViewController.h
//  Instagram
//
//  Created by Fernando Arturo Perez on 7/7/20.
//  Copyright © 2020 Fernando Arturo Perez. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info;
@end

NS_ASSUME_NONNULL_END
