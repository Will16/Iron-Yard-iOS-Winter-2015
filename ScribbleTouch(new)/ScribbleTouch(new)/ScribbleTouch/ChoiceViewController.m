//
//  ChoiceViewController.m
//  ScribbleTouch
//
//  Created by William McDuff on 2015-01-15.
//  Copyright (c) 2015 Jo Albright. All rights reserved.
//


// When we click on changeBlendMode

// In storyboard we don't chose width for picker and button, because we want the frame of screen to vary the width based on left-right constrains
#import "ChoiceViewController.h"


// HOW TO MAKE THIS CURRENT VIEW WITH A TRANSPARENT BLACK ON TOP OF THE PREVIOUS VC: MAKE VC VIEW CLEAR COLOR, PUT VC TO OVER CURRENT CONTEXT IN PRESENTATION (OVER THE PREVIOUS VC) CREATE A BLACK VC (BLUR EFFECT VC) AND ADJUST THE ALPHA TO BE LESS THAN 1)
@interface ChoiceViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation ChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.backgroundView.alpha = 0;
    
    

}


-(void)viewWillAppear:(BOOL)animated {
    
    [UIView animateWithDuration:0.4 animations:^ {
        self.backgroundView.alpha = 0.8;
    }];
}
// COLUMNS!!! SO 2 COLUMNS IN PICKERVIEW
-(NSInteger)numberOfComponentsInPickerView: (UIPickerView*)pickerView{
    return 1;
}

// 10 ROWS
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger) component {
    return self.choices.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.choices[row];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// when we click on the choose button after selecting blendmode or shapetype
- (IBAction)dismiss:(id)sender {
    
    // take the appropriate row in column at index 0 (only one column)
    NSString *choice = self.choices[[self.pickerView selectedRowInComponent:0]];
    [self.delegate choice:choice forGroup:self.group];
    

    [UIView animateWithDuration:0.4 animations:^{
        self.backgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
