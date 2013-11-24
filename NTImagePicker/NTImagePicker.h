//
//  NTImagePicker.h
//  NTImagePicker
//
//  Created by FFF on 13-11-23.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTNavigationController.h"
#import "NTPhoto.h"
#import "ImageContainerView.h"

@class NTImagePicker;

typedef void(^DidFinashPickingPhotoBlock)(NTImagePicker *, NSArray *);

@protocol NTImagePickerDelegate <NSObject>

- (void)imagePicker:(NTImagePicker *)imagePicker selectedPhotos:(NSArray *)photos;
- (void)canceledPickingImageWithPicker:(NTImagePicker *)imagePicker;

@end

@interface NTImagePicker : NTNavigationController<ImageContainerViewDelegate>
{

}

@property (nonatomic, weak) id<NTImagePickerDelegate>  imagePickerDelegate;
@property (nonatomic, copy) DidFinashPickingPhotoBlock finashPickingPhotoBlock;
/**
 *  最大选择照片数
 */
@property (nonatomic, assign) NSInteger         maxSelectionCount;
/**
 *  已经选择的照片
 */
@property (nonatomic, strong) NSMutableArray    *selection;

- (void)setDidFinashPickingPhotoBlock:(DidFinashPickingPhotoBlock)block;
- (void)dismiss;

@end
