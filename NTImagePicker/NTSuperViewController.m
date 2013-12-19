//
//  NTSuperViewController.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTSuperViewController.h"
#import "ImageStorage.h"
#import "ImageContainerView.h"
@class  NTImagePicker;


@implementation NTSuperViewController

- (void)setBarButtonItemTitle:(NSString *)title style:(UIBarButtonItemStyle)style AtPosition:(NTNavigationBarPosition)position target:(id)target action:(SEL)action
{
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:title style:style target:target action:action];
    if (position == NTNavigationBarPositionLeft)
    {
        self.navigationItem.leftBarButtonItem = btnItem;
    }
    else if (position == NTNavigationBarPositionRight)
    {
        self.navigationItem.rightBarButtonItem = btnItem;
    }
}


- (void)cancelPickingImage:(id)sender
{
    [[ImageStorage sharedStorage].tempSelectedPhoto removeAllObjects];
    [self.navigationController performSelector:@selector(cancelSelectingPhoto)];
}

@end
