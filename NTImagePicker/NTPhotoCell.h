//
//  NTPhotoCell.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_IDENTIFER      @"CELL_IDENTIFER"

@interface NTPhotoCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *PhotoImageView;

@property (assign, nonatomic) BOOL checked;

@end
