//
//  ImageContainerView.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CONTAINER_HEIGHT    70
#define CONTAINER_WIDTH     [UIScreen mainScreen].bounds.size.width
@class ImageStorage;
@class ImageContainerView;
@class NTPhoto;

typedef void(^DidDeselectPhotoBlock)(ImageContainerView *containerView, NTPhoto *photo);

@protocol ImageContainerViewDelegate <NSObject>
@optional
- (void)imageContainerView:(ImageContainerView *)imageContainerView didDeselectPhoto:(NTPhoto *)photo;
- (void)imageContainerView:(ImageContainerView *)imageCOntainerVIew didSelectionPhoto:(NSArray *)photos;

@end

@interface ImageContainerView : UIView

+ (instancetype)sharedInstance;

@property (nonatomic, strong, readonly) UIScrollView  *scrollView;
@property (nonatomic, strong) ImageStorage  *imageStorage;

@property (nonatomic, weak) id<ImageContainerViewDelegate> delegate;

@property (nonatomic, copy)   DidDeselectPhotoBlock didDeselectPhotoBlock;
@property (nonatomic, weak)   id<ImageContainerViewDelegate> containerViewDelegate;

@end
