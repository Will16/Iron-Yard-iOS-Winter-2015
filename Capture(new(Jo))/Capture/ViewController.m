//
//  ViewController.m
//  Capture
//
//  Created by Ebony Nyenya on 1/20/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "ViewController.h"
#import "FilterViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>


@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(nonatomic)UIImagePickerController * cameraPickerController;
@property(nonatomic)UIImagePickerController * libraryPickerController;

@property (weak, nonatomic) IBOutlet UIButton *openPhotoLibraryButton;


@property (weak, nonatomic) IBOutlet UIButton *takeMediaButton;

@property (weak, nonatomic) IBOutlet UIView *cameraView;


@property (weak, nonatomic) IBOutlet UISegmentedControl *mediaChoiceButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *frontOrRearButton;



@end

@implementation ViewController




- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.openPhotoLibraryButton addTarget:self action:@selector (openPhotoLibrary) forControlEvents:UIControlEventTouchUpInside];
    
    self.cameraPickerController = [[UIImagePickerController alloc]init];
    self.cameraPickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    //this is related to HW #1
    self.cameraPickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    
    
    self.cameraPickerController.showsCameraControls = NO;
    self.cameraPickerController.delegate = self;
    self.cameraPickerController.mediaTypes = @[(NSString *) kUTTypeImage, (NSString *) kUTTypeMovie];
    
    self.cameraPickerController.view.frame = self.cameraView.bounds;
    
    [self.cameraView addSubview: self.cameraPickerController.view];
    
    [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents: UIControlEventTouchUpInside];

    [self.mediaChoiceButton addTarget:self action:@selector(changeMediaType) forControlEvents:UIControlEventValueChanged];
    
    [self.frontOrRearButton addTarget:self action:@selector(changeFrontOrRear) forControlEvents:UIControlEventValueChanged];
    
}

//HW #1 and #4
-(void) changeFrontOrRear{
    
    self.cameraPickerController.cameraDevice = (self.frontOrRearButton.selectedSegmentIndex ==0) ?UIImagePickerControllerCameraDeviceFront: UIImagePickerControllerCameraDeviceRear;
    
    //my attempt at adding flip animation when camera view is changed from front to rear (stackoverflow code)
    [UIView transitionWithView: self.cameraPickerController.view duration:1.0 options:UIViewAnimationOptionAllowAnimatedContent | UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.cameraPickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    } completion:NULL];
    
    
}

-(void)changeMediaType {
   
    //conditional variable
    self.cameraPickerController.cameraCaptureMode = (self.mediaChoiceButton.selectedSegmentIndex ==0) ? UIImagePickerControllerCameraCaptureModePhoto: UIImagePickerControllerCameraCaptureModeVideo;
    
    switch(self.mediaChoiceButton.selectedSegmentIndex){
       
        case 0: //photo
            
            [self.mediaChoiceButton addTarget:self action:@selector(changeMediaType) forControlEvents:UIControlEventValueChanged];
            
            break;
            
        case 1: //video
            
             [self.takeMediaButton removeTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
            
            break;
            
        default:
            break;
            
    }
    
}


-(void)openPhotoLibrary {
    
    self.libraryPickerController = [[UIImagePickerController alloc] init];
    self.libraryPickerController.delegate = self;
    
    [self presentViewController:self.libraryPickerController animated:YES completion:nil];
    
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    [self gotoFilterWithImage:image];
  
    
    [picker dismissViewControllerAnimated:YES completion:^{
    
    
    }];
    
//    - (BOOL)startVideoCapture;
//    - (void)stopVideoCapture;
    
}

-(void) gotoFilterWithImage:(UIImage *)image{
    
    //push filter view controller
    
    FilterViewController *filterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"filterVC"];
    
    filterVC.originalImage = image;
    
    [self.navigationController pushViewController:filterVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
