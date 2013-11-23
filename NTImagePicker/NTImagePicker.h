//
//  NTImagePicker.h
//  NTImagePicker
//
//  Created by FFF on 13-11-23.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTNavigationController.h"
#import "NTPhoto.h"

@interface NTImagePicker : NTNavigationController

/**
 *  最大选择照片数
 */
@property (nonatomic, assign) NSInteger         maxSelectionCount;
/**
 *  已经选择的照片
 */
@property (nonatomic, strong) NSMutableArray    *selection;

@end
