//
//  DetailsViewController.h
//  Instagram
//
//  Created by Fernando Arturo Perez on 7/8/20.
//  Copyright © 2020 Fernando Arturo Perez. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : ViewController
@property (nonatomic,strong) Post *post;
@end

NS_ASSUME_NONNULL_END
