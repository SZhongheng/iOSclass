//
//  StudentViewController.h
//  Gradebook
//
//  Created by Zhongheng Sun on 3/4/20.
//  Copyright © 2020 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StudentViewControllerDelegate;
@interface StudentViewController : UIViewController
@property (weak, nonatomic) id<StudentViewControllerDelegate> delegate;

@property(nonatomic, assign) NSString *Student, *Address;
@property(nonatomic, assign) UIImage *Image;

@property (strong, nonatomic) IBOutlet UIImageView *ImageBox;



@end

@protocol StudentViewControllerDelegate <NSObject>

- (void)StudentViewControllerDidCancel: (StudentViewController *) studentVC;
- (void) StudentViewController:(StudentViewController *)studentVC
                       Student: (NSString *) student
                       Address: (NSString *) address
                         Image: (UIImage *) image;
@end

NS_ASSUME_NONNULL_END
