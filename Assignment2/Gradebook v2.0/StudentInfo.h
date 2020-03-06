//
//  StudentInfo.h
//  Gradebook
//
//  Created by Zhongheng Sun on 3/4/20.
//  Copyright © 2020 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface StudentInfo : NSObject
@property(nonatomic) NSString *Student, *Address;
@property(nonatomic) float MidtermGrade, FinalGrade;
@property(nonatomic) int HW1, HW2, HW3;
@property(nonatomic) UIImage *Image;

//Getters
- (NSString *) getStudent;
- (NSString *) getAddress;
- (float) getMidtermGrade;
- (float) getFinalGrade;
- (int) getHW1;
- (int) getHW2;
- (int) getHW3;
- (UIImage *) getImage;

//Setters
- (void) setAddress: (NSString *) newAddress;
- (void) setMidtermGrade: (float) newMidtermGrade;
- (void) setFinalGrade: (float) newFinalGrade;
- (void) setHW1: (int) newHW1;
- (void) setHW2: (int) newHW2;
- (void) setHW3: (int) newHW3;
- (void) setImage: (UIImage *) newImage;

//main student function
-(void) setStudent: (NSString *) student
                  : (NSString *) address
                  : (float) midtermGrade
                  : (float) finalGrade
                  : (int) hw1
                  : (int) hw2
                  : (int) hw3
                  : (UIImage *) image;

@end

NS_ASSUME_NONNULL_END
