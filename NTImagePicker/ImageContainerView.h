//
//  ImageContainerView.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CONTAINER_HEIGHT    80

@class NTImageStorage;

@interface ImageContainerView : UIView

@property (nonatomic, strong) UIScrollView  *scrollView;
@property (nonatomic, strong) NTImageStorage  *imageStorage;

@end
