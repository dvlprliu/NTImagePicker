//
//  ImageContainerView.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "ImageContainerView.h"
#import "ImageStorage.h"
#import "NTPhoto.h"

@implementation ImageContainerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupScrollView];
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static ImageContainerView *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
        
    });
    
    return _sharedInstance;
}

- (void)setupScrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){
            .origin.x = 0,
            .origin.y = 0,
            .size.width  = self.frame.size.width - 80,
            .size.height = self.frame.size.height
        }];
        _scrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_scrollView];
    }
}

- (void)setImageStorage:(ImageStorage *)imageStorage
{
    [self setupScrollView];
    
    for (UIImageView *image in self.subviews) {
        if (image) {
            [image removeFromSuperview];
        }
    }
    
    static int rect = 60;
    
    _imageStorage = imageStorage;
    NSMutableArray *storedPhoto = _imageStorage.storedPhotos;
    
    for (int i = 0; i < storedPhoto.count; i++) {
        static int offset = 3;
        
        int x = 5 + i * (rect + offset);
        int y = 3;
        
        NTPhoto *photo = storedPhoto[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, rect, rect)];
        imageView.userInteractionEnabled = YES;
        imageView.tag = 100 + i;
        imageView.image = photo.thumnail;
        [self addSubview:imageView];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deselectPhoto:)];
        [imageView addGestureRecognizer:tapGesture];
    }
    
    self.contentSize = CGSizeMake(storedPhoto.count * 63, self.frame.size.height);
    
}

- (void)deselectPhoto:(UIGestureRecognizer *)gesture
{
    UIImageView *imageView = (UIImageView *)[gesture view];
    NSInteger index = imageView.tag - 100;
    NTPhoto *photo = _imageStorage.storedPhotos[index];
    [_imageStorage.storedPhotos removeObjectAtIndex:index];
    [self setImageStorage:_imageStorage];
    NSLog(@"kkk : %@", _imageStorage.storedPhotos);
    
    if (_didDeselectPhotoBlock) {
        _didDeselectPhotoBlock(self, photo);
    }
    
    if ([_containerViewDelegate respondsToSelector:@selector(imageContainerView:didDeselectPhoto:)]) {
        [_containerViewDelegate imageContainerView:self didDeselectPhoto:photo];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
