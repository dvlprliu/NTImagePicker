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
    imagePicker.imagePickerDelegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (void)imagePicker:(NTImagePicker *)imagePicker didFinashSelectingPhoto:(NSArray *)photos
{
    NSLog(@"photos  delegate     00000000000    : %@",  photos);
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
