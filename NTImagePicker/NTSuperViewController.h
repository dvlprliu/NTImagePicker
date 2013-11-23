//
//  NTSuperViewController.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

typedef NS_ENUM(NSUInteger, NTNavigationBarPosition) {
    NTNavigationBarPositionLeft = 0,
    NTNavigationBarPositionRight = 1
};


@interface NTSuperViewController : UIViewController

- (void)setBarButtonItemTitle:(NSString *)title style:(UIBarButtonItemStyle)style AtPosition:(NTNavigationBarPosition)position target:(id)target action:(SEL)action;
- (void)cancelPickingImage:(id)sender;

@end
