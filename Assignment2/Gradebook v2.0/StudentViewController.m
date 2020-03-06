//
//  StudentViewController.m
//  Gradebook
//
//  Created by Zhongheng Sun on 3/4/20.
//  Copyright © 2020 nyu.edu. All rights reserved.
//

#import "StudentViewController.h"

@interface StudentViewController ()
@property (weak, nonatomic) IBOutlet UIButton *Back;
@property (strong, nonatomic) IBOutlet UITextField *StudentText;
@property (strong, nonatomic) IBOutlet UITextField *AddressText;
@property (atomic) int counter;
@end

@implementation StudentViewController

- (void)viewDidLoad {
    [self.Back setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.Back setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [self.Back setEnabled:YES];
    [super viewDidLoad];
    
    self.StudentText.text =self.Student;
    self.AddressText.text = self.Address;
    self.ImageBox.image = self.Image;
    [self.delegate StudentViewController: self
                             Student: self.StudentText.text
                             Address: self.AddressText.text
                                    Image: self.ImageBox.image];
}

- (IBAction)backClicked:(UIButton *)sender {
    [self.delegate StudentViewControllerDidCancel:self];
}

@end
