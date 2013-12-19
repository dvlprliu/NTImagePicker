//
//  NTImagePicker.m
//  NTImagePicker
//
//  Created by FFF on 13-11-23.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTImagePicker.h"
#import "ImageStorage.h"
#import "NTAlbumViewController.h"
#import "ImageContainerView.h"
#import "NTPhotosViewController.h"

@interface NTImagePicker ()

@end

@implementation NTImagePicker

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NTAlbumViewController *album = [[NTAlbumViewController alloc] init];
        [self setViewControllers:@[album]];
    }
    return self;
}

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    // Do any additional setup after loading the view.
}

- (void)photosHasBeenSelected:(NSArray *)selectedPhotos
{
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([_imagePickerDelegate respondsToSelector:@selector(imagePicker:didFinashSelectingPhoto:)]) {
        [_imagePickerDelegate imagePicker:self didFinashSelectingPhoto:selectedPhotos];
    }
}

- (void)cancelSelectingPhoto
{
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([_imagePickerDelegate respondsToSelector:@selector(canceledPickingImageWithPicker:)]) {
        [_imagePickerDelegate canceledPickingImageWithPicker:self];
    }
}

- (void)setDidFinashPickingPhotoBlock:(DidFinashPickingPhotoBlock)block
{
    _finashPickingPhotoBlock = [block copy];
}

- (void)setSelection:(NSMutableArray *)selection
{
    [ImageStorage sharedStorage].storedPhotos = selection;
}

- (void)setMaxSelectionCount:(NSInteger )maxSelectionCount
{
    [ImageStorage sharedStorage].maxCount = maxSelectionCount;
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
