//
//  ImageContainerView.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CONTAINER_HEIGHT    80

@class ImageStorage;
@class ImageContainerView;
@class NTPhoto;

typedef void(^DidDeselectPhotoBlock)(ImageContainerView *containerView, NTPhoto *photo);

@protocol ImageContainerViewDelegate <NSObject>

- (void)imageContainerView:(ImageContainerView *)imageContainerView didDeselectPhoto:(NTPhoto *)photo;

@end

@interface ImageContainerView : UIScrollView

+ (instancetype)sharedInstance;

@property (nonatomic, strong) UIScrollView  *scrollView;
@property (nonatomic, strong) ImageStorage  *imageStorage;

@property (nonatomic, copy)   DidDeselectPhotoBlock didDeselectPhotoBlock;
@property (nonatomic, weak)   id<ImageContainerViewDelegate> containerViewDelegate;

@end
