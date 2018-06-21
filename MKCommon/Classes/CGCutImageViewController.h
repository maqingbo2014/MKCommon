//
//  CGCutImageViewController.h
//  DogsPlanet
//
//  Created by 马庆波 on 16/6/20.
//  Copyright © 2016年 mixi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGCutImageMaskView;
typedef void(^Comeplete)(UIImage*image);
@interface CGCutImageViewController : UIViewController
{
    CGCutImageMaskView*MaskView;
}
//要裁减的图片的宽高比例
@property (nonatomic,assign) float proportion;
//要裁减的图片
@property (nonatomic,retain) UIImage *cutImage;

@property (nonatomic,copy) Comeplete comeplete;
@end

@interface CGCutImageMaskView : UIView {
@private
    CGRect  ShowRect;//截图框的大小
}
- (void)setShowRect:(CGSize)size;
- (CGSize)ShowRect;
@end
