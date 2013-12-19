//
//  ViewController.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "ViewController.h"
#import "NTImagePicker.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *selectedPhotos;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)btnClicked:(id)sender {
    NTImagePicker *imagePicker = [[NTImagePicker alloc] init];
    imagePicker.maxSelectionCount = 9;
    imagePicker.selection = self.selectedPhotos;
    imagePicker.imagePickerDelegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (void)setPhotos:(NSArray *)photos
{
    int i = 0;
    for (id objc in self.view.subviews) {
        if ([objc isKindOfClass:[UIImageView class]]) {
            [objc removeFromSuperview];
        }
    }
    
    for (NTPhoto *photo in photos) {
        
        static int rect   = 60;
        static int offset = 10;
        
        int row = i / 3;
        int col = i % 3;
        int x   = 5 + col * (rect + offset);
        int y   = 260 + row * (rect + offset);
        
        UIImage *image = photo.thumnail;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){
            .origin.x    = x,
            .origin.y    = y,
            .size.width  = rect,
            .size.height = rect
        }];
        
        [imageView setImage:image];
        [self.view addSubview:imageView];
        
        i ++;
    }
}

- (void)imagePicker:(NTImagePicker *)imagePicker didFinashSelectingPhoto:(NSArray *)photos
{
    NSLog(@"photos  delegate     00000000000    : %@",  photos);
    
    self.selectedPhotos = [photos mutableCopy];
    [self setPhotos:self.selectedPhotos];
}

- (void)canceledPickingImageWithPicker:(NTImagePicker *)imagePicker
{
    NSLog(@"取消选择：：：；3；3；3；3； ");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
