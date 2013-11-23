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

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setSelection:(NSMutableArray *)selection
{
    [ImageStorage sharedStorage].storedPhotos = selection;
}

- (void)setMaxSelectionCount:(NSInteger )maxSelectionCount
{
    [ImageStorage sharedStorage].maxCount = maxSelectionCount;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
