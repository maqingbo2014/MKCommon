//
//  UIResponder+TraverseViewController.h
//  MJExtension
//
//  Created by Apple on 2018/11/13.
//

#import <UIKit/UIKit.h>

@interface UIResponder (TraverseViewController)
/**
 可响应的第一ViewController
 
 @return UIViewController
 */
- (UIViewController *)firstAvailableUIViewController;
- (id)traverseResponderChainForUIViewController;
@end
