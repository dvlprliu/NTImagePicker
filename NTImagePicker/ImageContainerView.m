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

@interface ImageContainerView ()
{
    UIButton *_confirmButton;
}

@end

@implementation ImageContainerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

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
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CONTAINER_WIDTH-70, CONTAINER_HEIGHT)];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
    }
}

- (void)setupConfirButton
{
    if (!_confirmButton) {
        
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.frame = CGRectMake(CONTAINER_WIDTH - 60, 10, 50, 50);
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        _confirmButton.backgroundColor = [UIColor redColor];
        [_confirmButton addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_confirmButton];
    }
}

- (void)confirm:(id)sender
{
    NSArray *arr = [ImageStorage sharedStorage].storedPhotos;
    if ([_delegate respondsToSelector:@selector(imageContainerView:didDeselectPhoto:)]) {
        [_delegate imageContainerView:self didSelectionPhoto:arr];
    }
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self setupScrollView];
    [self setupConfirButton];
    
    NSLog(@"subViews : %@", [self subviews]);
}

- (void)setImageStorage:(ImageStorage *)imageStorage
{
    
    for (UIImageView *image in _scrollView.subviews) {
        if ([image isKindOfClass:[UIImageView class]]) {
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
        [_scrollView addSubview:imageView];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deselectPhoto:)];
        [imageView addGestureRecognizer:tapGesture];
    }
    
    _scrollView.contentSize = CGSizeMake(storedPhoto.count * 63, self.frame.size.height);
    CGFloat offsetX = _scrollView.contentSize.width - _scrollView.frame.size.width;
    offsetX < 0 ? offsetX = 0 : offsetX;
    __weak UIScrollView *wScrollView = _scrollView;
    [UIView animateWithDuration:0.1 animations:^{
        wScrollView.contentOffset = CGPointMake(offsetX, 0);
    }];
    
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
