//
//  NTPhotosViewController.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTSuperViewController.h"
#import "ImageContainerView.h"
@class ALAssetsGroup;

static NSString *const kImageContainerDidFinashSelectPhotoNotification = @"kImageContainerDidFinashSelectPhotoNotification";

@interface NTPhotosViewController : NTSuperViewController<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,ImageContainerViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray   *photos;

@property (nonatomic, strong) ALAssetsGroup *group;

@end
