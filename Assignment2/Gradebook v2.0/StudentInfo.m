//
//  StudentInfo.m
//  Gradebook
//
//  Created by Zhongheng Sun on 3/4/20.
//  Copyright © 2020 nyu.edu. All rights reserved.
//

#import "StudentInfo.h"
#import <UIKit/UIKit.h>

@implementation StudentInfo
@synthesize Student, Address, MidtermGrade, FinalGrade, HW1, HW2, HW3, Image;



- (NSString *) getStudent {
    return Student;
}
- (NSString *) getAddress {
    return Address;
}
- (float) getMidtermGrade {
    return MidtermGrade;
}
- (float) getFinalGrade {
    return FinalGrade;
}
- (int) getHW1 {
    return HW1;
}
- (int) getHW2 {
    return HW2;
}
- (int) getHW3 {
    return HW3;
}
- (UIImage *) getImage {
    return Image;
}


- (void) setAddress: (NSString *) newAddress {
    Address = newAddress;
}
- (void) setMidtermGrade: (float) newMidtermGrade {
    MidtermGrade = newMidtermGrade;
}
- (void) setFinalGrade: (float) newFinalGrade {
    FinalGrade = newFinalGrade;
}
- (void) setHW1: (int) newHW1 {
    HW1 = newHW1;
}
- (void) setHW2: (int) newHW2 {
    HW2 = newHW2;
}
- (void) setHW3: (int) newHW3 {
    HW3 = newHW3;
}
- (void) setImage: (UIImage *) newImage {
    Image = newImage;
}

-(void) setStudent: (NSString *) student
                  : (NSString *) address
                  : (float) midtermGrade
                  : (float) finalGrade
                  : (int) hw1
                  : (int) hw2
                  : (int) hw3
                  : (UIImage *) image{
            self.Student = student;
            self.Address = address;
            self.MidtermGrade = midtermGrade;
            self.FinalGrade = finalGrade;
            self.HW1 = hw1;
            self.HW2 = hw2;
            self.HW3 = hw3;
            self.Image = image;
}


@end
