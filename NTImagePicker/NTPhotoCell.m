//
//  NTPhotoCell.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTPhotoCell.h"

@interface NTPhotoCell ()

@property (nonatomic, strong) UIView *coverView;
@end

@implementation NTPhotoCell

- (id)init
{
    self = [super init];
    if (self) {
        _checked = NO;
        
    }
    return self;
}


- (void)setChecked:(BOOL)checked
{
    [self setupCoverView];
    _checked = checked;
    
    if (_checked) {
        _coverView.alpha = 0.3;
    } else {
        _coverView.alpha = 0;
    }
    
}

- (void)setupCoverView
{
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:self.bounds];
        _coverView.backgroundColor = [UIColor redColor];
        _coverView.userInteractionEnabled = NO;
        _coverView.alpha = 0;
        [self addSubview:_coverView];
        
    }
}

@end
