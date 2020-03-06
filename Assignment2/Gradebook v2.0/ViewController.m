//
//  ViewController.m
//  Gradebook
//
//  Created by Zhongheng Sun on 3/4/20.
//  Copyright © 2020 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "StudentViewController.h"
#import "StudentInfo.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *StudentText;
@property (strong, nonatomic) IBOutlet UITextField *AddressText;
@property (strong, nonatomic) IBOutlet UITextField *MidtermText;
@property (strong, nonatomic) IBOutlet UITextField *FinalText;
@property (strong, nonatomic) IBOutlet UITextField *HW1Text;
@property (strong, nonatomic) IBOutlet UITextField *HW2Text;
@property (strong, nonatomic) IBOutlet UITextField *HW3Text;
@property (strong, nonatomic) IBOutlet UIButton *LeftButton;
@property (strong, nonatomic) IBOutlet UIButton *RightButton;
@property (strong, nonatomic) IBOutlet UIButton *AddNewStudentButton;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ThreeSegment;
@property (strong, atomic) NSMutableArray *students;
@property (atomic) int counter; //keeps track of array location
@end

@implementation ViewController

- (void)viewDidLoad {
    //create array
    self.students = [[NSMutableArray alloc] init];
    self.counter = 0;
    
   
    [self.RightButton setTitleColor:[UIColor colorWithRed:27.0/255.0 green:173.0/255.0 blue:248.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.RightButton setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [self.LeftButton setTitleColor:[UIColor colorWithRed:27.0/255.0 green:173.0/255.0 blue:248.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.LeftButton setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [self.RightButton setEnabled:YES];
    [self.LeftButton setEnabled:NO];
    self.AddNewStudentButton.hidden = YES;
    [self.AddNewStudentButton setEnabled:NO];
    
    self.ThreeSegment.selectedSegmentIndex = 0;
  
    UIImage *image = [UIImage imageNamed:@"richard.jpeg"];
    [self AddStudent: @"King Richard III" :@"Leicester Castle, England" : 72.0 : 45.0 : 9 : 10 : 00 : image];
    UIImage *image2 = [UIImage imageNamed:@"younghamlet.jpeg"];
    [self AddStudent: @"Prince Hamlet" :@"Elsinore Castle, Denmark" : 100.0 : 0.0 : 10 : 10 : 10 : image2];
    UIImage *image3 = [UIImage imageNamed:@"kinglear.jpg"];
    [self AddStudent: @"King Lear" :@"Leicester Castle, England" : 100.0 : 22.0 : 10 : 6 : 0 : image3];
    UIImage *image4 = [UIImage imageNamed:@"henry.jpeg"];
    [self AddStudent: @"King Henry VIII" :@"Whitehall Palace, England" : 62.0 : 60.0 : 7 : 6 : 7 : image4];
    UIImage *image5 = [UIImage imageNamed:@"eliz.jpeg"];
    [self AddStudent: @"Queen Elizabeth" :@"Richmond Palace, England" : 90.0 : 100.0 : 9 : 10 : 10 : image5];
    
    
    self.StudentText.text =[[self.students objectAtIndex:(self.counter)] Student];
    self.AddressText.text = [[self.students objectAtIndex:(self.counter)] Address];
    self.MidtermText.text = @([[self.students objectAtIndex:(self.counter)] MidtermGrade]).stringValue;
    self.FinalText.text = @([[self.students objectAtIndex:(self.counter)] FinalGrade]).stringValue;
    self.HW1Text.text = @([[self.students objectAtIndex:(self.counter)] HW1]).stringValue;
    self.HW2Text.text = @([[self.students objectAtIndex:(self.counter)] HW2]).stringValue;
    self.HW3Text.text = @([[self.students objectAtIndex:(self.counter)] HW3]).stringValue;
}

//add student using array
- (void) AddStudent: (NSString*) student
                   : (NSString*) address
                   : (float) midtermGrade
                   : (float) finalGrade
                   : (int) hw1
                   : (int) hw2
                   : (int) hw3
                   : (UIImage*) image{
    id myStudent = [[StudentInfo alloc] init];
    [myStudent setStudent
     : student
     : address
     : midtermGrade
     : finalGrade
     : hw1
     : hw2
     : hw3
     : image];
    [self.students addObject: myStudent];
}


- (IBAction)SegmentClicked:(id)sender {
    NSInteger selectedSegment  = self.ThreeSegment.selectedSegmentIndex;

    if (selectedSegment == 0 && [self allowChangeView]) {
        self.LeftButton.hidden = NO;
        self.RightButton.hidden = NO;
        self.AddNewStudentButton.hidden = YES;
        self.view.backgroundColor = [UIColor whiteColor];
        
        [self.RightButton setEnabled:NO];
        [self.LeftButton setEnabled:YES];
        [self.AddNewStudentButton setEnabled:NO];
        
        
        self.counter = (int)[self.students count]-1;
        self.StudentText.text =[[self.students objectAtIndex:(self.counter)] Student];
        self.AddressText.text = [[self.students objectAtIndex:(self.counter)] Address];
        self.MidtermText.text = @([[self.students objectAtIndex:(self.counter)] MidtermGrade]).stringValue;
        self.FinalText.text = @([[self.students objectAtIndex:(self.counter)] FinalGrade]).stringValue;
        self.HW1Text.text = @([[self.students objectAtIndex:(self.counter)] HW1]).stringValue;
        self.HW2Text.text = @([[self.students objectAtIndex:(self.counter)] HW2]).stringValue;
        self.HW3Text.text = @([[self.students objectAtIndex:(self.counter)] HW3]).stringValue;
    }
else if (selectedSegment == 1 && [self allowChangeView]){
        [self performSegueWithIdentifier:@"studentView" sender:self];
    }
    else if (selectedSegment == 2 && [self allowChangeView]) {
        _LeftButton.hidden = YES;
        _RightButton.hidden = YES;
        [self.AddNewStudentButton  setBackgroundColor:[UIColor whiteColor]];
        _AddNewStudentButton.hidden = NO;
        self.view.backgroundColor = [UIColor grayColor];
        self.AddNewStudentButton.titleLabel.text = @"Add New Student";
        
      
        self.StudentText.text = @"";
        self.AddressText.text = @"";
        self.MidtermText.text = @"";
        self.FinalText.text = @"";
        self.HW1Text.text = @"";
        self.HW2Text.text = @"";
        self.HW3Text.text = @"";
    }
}

//changing segments
- (bool) allowChangeView{
    if (self.StudentText.text.length > 0 &&
        self.AddressText.text.length > 0 &&
        self.MidtermText.text.length > 0 &&
        self.FinalText.text.length > 0 &&
        self.HW1Text.text.length > 0 &&
        self.HW2Text.text.length > 0 &&
        self.HW3Text.text.length > 0){
    
        UIImage * image = [UIImage imageNamed:@"noimage.png"];
        [self AddStudent: self.StudentText.text
                        : self.AddressText.text
                        : [self.MidtermText.text floatValue]
                        : [self.FinalText.text floatValue]
                        : [self.HW1Text.text intValue]
                        : [self.HW2Text.text intValue]
                        : [self.HW3Text.text intValue]
                        : image];
        return true;
    }
    else {
        self.AddNewStudentButton.titleLabel.text = @"invalid";
        return false;
    }
}
- (IBAction)studentNameChanged:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).Student = _StudentText.text;
    }
    
}
- (IBAction)addressChanged:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).Address = _AddressText.text;
    }
}
- (IBAction)midtermChanged:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).MidtermGrade = [self.MidtermText.text floatValue];
    }
}
- (IBAction)finalChanged:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).FinalGrade = [self.FinalText.text floatValue];
    }
}
- (IBAction)hw1Changed:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).HW1 = [self.HW1Text.text intValue];
    }
}
- (IBAction)hw2Changed:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).HW2 = [self.HW2Text.text intValue];
    }
}
- (IBAction)hw3Changed:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).HW3 = [self.HW3Text.text intValue];
    }
}


- (IBAction)textInputDone:(id)sender {
    [self.StudentText resignFirstResponder];
    [self.AddressText resignFirstResponder];
    [self.MidtermText resignFirstResponder];
    [self.FinalText resignFirstResponder];
    [self.HW1Text resignFirstResponder];
    [self.HW2Text resignFirstResponder];
    [self.HW3Text resignFirstResponder];
}

-(IBAction)unwindToViewController:(UIStoryboardSegue *)sender {
    self.ThreeSegment.selectedSegmentIndex = 0;
}

- (IBAction)LeftButtonClicked:(id)sender {
    self.StudentText.text =[[self.students objectAtIndex:(self.counter-1)] Student];
    self.AddressText.text = [[self.students objectAtIndex:(self.counter-1)] Address];
    self.MidtermText.text = @([[self.students objectAtIndex:(self.counter-1)] MidtermGrade]).stringValue;
    self.FinalText.text = @([[self.students objectAtIndex:(self.counter-1)] FinalGrade]).stringValue;
    self.HW1Text.text = @([[self.students objectAtIndex:(self.counter-1)] HW1]).stringValue;
    self.HW2Text.text = @([[self.students objectAtIndex:(self.counter-1)] HW2]).stringValue;
    self.HW3Text.text = @([[self.students objectAtIndex:(self.counter-1)] HW3]).stringValue;
    self.counter = self.counter -1;
    if (self.counter ==0) {
        [self.LeftButton setEnabled:NO];
    }
    else {
        [self.LeftButton setEnabled:YES];
    }
    [self.RightButton setEnabled:YES];
}
- (IBAction)RightButtonClicked:(id)sender {
    self.StudentText.text =[[self.students objectAtIndex:(self.counter+1)] Student];
    self.AddressText.text = [[self.students objectAtIndex:(self.counter+1)] Address];
    self.MidtermText.text = @([[self.students objectAtIndex:(self.counter+1)] MidtermGrade]).stringValue;
    self.FinalText.text = @([[self.students objectAtIndex:(self.counter+1)] FinalGrade]).stringValue;
    self.HW1Text.text = @([[self.students objectAtIndex:(self.counter+1)] HW1]).stringValue;
    self.HW2Text.text = @([[self.students objectAtIndex:(self.counter+1)] HW2]).stringValue;
    self.HW3Text.text = @([[self.students objectAtIndex:(self.counter+1)] HW3]).stringValue;
    self.counter = self.counter +1;
    if (self.counter == [self.students count]-1) {
        [self.RightButton setEnabled:NO];
    }
    else {
        [self.RightButton setEnabled:YES];
    }
    [self.LeftButton setEnabled:YES];
}

- (IBAction)AddressShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.StudentText.text]) {
            [[self.students objectAtIndex:i] setAddress : self.AddressText.text];
            break;
        }
    }
}
//adding student text input, probably able to condense to 1 method
- (IBAction)MidtermShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.MidtermText.text]) {
            [[self.students objectAtIndex:i] setMidtermGrade: [self.MidtermText.text floatValue]];
            break;
        }
    }
}

- (IBAction)FinalShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.FinalText.text]) {
            [[self.students objectAtIndex:i] setFinalGrade: [self.FinalText.text floatValue]];
            break;
        }
    }
}

- (IBAction)HW1ShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.HW1Text.text]) {
            [[self.students objectAtIndex:i] setHW1: [self.HW1Text.text intValue]];
            break;
        }
    }
}

- (IBAction)HW2ShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.HW2Text.text]) {
            [[self.students objectAtIndex:i] setHW2: [self.HW2Text.text intValue]];
            break;
        }
    }
}

- (IBAction)HW3ShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.HW3Text.text]) {
            [[self.students objectAtIndex:i] setHW3: [self.HW3Text.text intValue]];
            break;
        }
    }
}

- (IBAction)sliderChange:(id)sender {
    UISlider *slider = (UISlider *) sender;
    slider.maximumValue = [self.students count];
    self.counter = slider.value;
    self.StudentText.text =[[self.students objectAtIndex:(self.counter)] Student];
    self.AddressText.text = [[self.students objectAtIndex:(self.counter)] Address];
    self.MidtermText.text = @([[self.students objectAtIndex:(self.counter)] MidtermGrade]).stringValue;
    self.FinalText.text = @([[self.students objectAtIndex:(self.counter)] FinalGrade]).stringValue;
    self.HW1Text.text = @([[self.students objectAtIndex:(self.counter)] HW1]).stringValue;
    self.HW2Text.text = @([[self.students objectAtIndex:(self.counter)] HW2]).stringValue;
    self.HW3Text.text = @([[self.students objectAtIndex:(self.counter)] HW3]).stringValue;
    if (self.counter ==0) {
        [self.LeftButton setEnabled:NO];
    }
    if (self.counter == slider.maximumValue){
        [self.RightButton setEnabled:NO];
    }
}
    



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"studentView"]){
        StudentViewController * controller = (StudentViewController *)segue.destinationViewController;
        controller.Student = [[self.students objectAtIndex:self.counter] Student];
        controller.Address = [[self.students objectAtIndex:self.counter] Address];
        controller.Image = [[self.students objectAtIndex:self.counter] Image];
    }
}

@end
