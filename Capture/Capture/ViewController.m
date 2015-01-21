//
//  ViewController.m
//  Capture
//
//  Created by Bobby Towers on 1/20/15.
//  Copyright (c) 2015 Bobby Towers. All rights reserved.
//

#import "ViewController.h"
#import "FilterViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>


// 1.Add segment control for choosing front or rear camera
// 1a.add target meethod that changes the camera device (what we have to do in 1.
// Add methods to allow for video capture and stopping
// 3.Add a UICollectionView to filterBV (storyBoard) at the bottom
// 3atake inspiration from instagrams filter scroller (1 row of filters)
//Extra: find ut how to FLIP (not change but flip it) camera view when changing between front and rear (the camera view not the camera mode)

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic) UIImagePickerController * cameraPickerController;
@property (nonatomic) UIImagePickerController * libraryPickerController;

@property (weak, nonatomic) IBOutlet UIButton *openPhotoLibraryButton;
@property (weak, nonatomic) IBOutlet UIButton *takeMediaButton;
@property (weak, nonatomic) IBOutlet UIButton *stopVideoRecordingButton;

@property (weak, nonatomic) IBOutlet UIView *cameraView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *mediaChoiceButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *cameraDeviceButton;

@property (strong, nonatomic) NSURL *videoURL;
@property (strong, nonatomic) MPMoviePlayerController *videoController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.openPhotoLibraryButton addTarget:self action:@selector(openPhotoLibrary) forControlEvents:UIControlEventTouchUpInside];
    
    self.cameraPickerController = [[UIImagePickerController alloc] init];
    self.cameraPickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.cameraPickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    self.cameraPickerController.showsCameraControls = NO;
    self.cameraPickerController.delegate = self;
    
    self.cameraPickerController.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie];
    
    // gets the width and height from the origin 0,0
    // a better name for cameraView would be cameraHolderView
    self.cameraPickerController.view.frame = self.cameraView.bounds;
    
    [self.cameraView addSubview:self.cameraPickerController.view];
    
    
    //    [self.takeMediaButton addTarget:self action:@selector(takeMedia) forControlEvents:UIControlEventTouchUpInside];
    // (takePicture) showed up because it is a method on UIImagePickerController when we changed our target from self to self.cameraPickerController
    
    
    // delete that!
    [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents: UIControlEventTouchUpInside];
    
    [self.mediaChoiceButton addTarget:self action:@selector(changeMediaType) forControlEvents:UIControlEventValueChanged];
    
    [self.cameraDeviceButton addTarget:self action:@selector(changeCameraDevice) forControlEvents:UIControlEventValueChanged];
    
}

//- (void)takeMedia {
//
//    // object and method
//    [self.cameraPickerController takePicture];
//
//}


-(void) changeCameraDevice {
    //self.cameraPickerController.cameraDevice = (self.cameraDeviceButton.selectedSegmentIndex == 0)? UIImagePickerControllerCameraDeviceFront:UIImagePickerControllerCameraDeviceRear;
    
    ///
    
    if (self.cameraDeviceButton.selectedSegmentIndex == 0) {
        [UIView transitionWithView:_cameraPickerController.view duration:1.0 options:UIViewAnimationOptionAllowAnimatedContent | UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            _cameraPickerController.cameraDevice =  UIImagePickerControllerCameraDeviceFront;  } completion:NULL];
    }
    
    else {
        [UIView transitionWithView:_cameraPickerController.view duration:1.0 options:UIViewAnimationOptionAllowAnimatedContent | UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            _cameraPickerController.cameraDevice =  UIImagePickerControllerCameraDeviceRear;  } completion:NULL];
    }
    

}
-(void) changeMediaType {
    self.cameraPickerController.cameraCaptureMode = (self.mediaChoiceButton.selectedSegmentIndex == 0)?
UIImagePickerControllerCameraCaptureModePhoto:
    UIImagePickerControllerCameraCaptureModeVideo;
    
    switch(self.mediaChoiceButton.selectedSegmentIndex) {
        case 0:
          //  [self.mediaChoiceButton addTarget:self action:@selector(changeMediaType) forControlEvents:UIControlEventValueChanged];
            
   
            [self.takeMediaButton removeTarget:self.cameraPickerController action:@selector(startVideoCapture) forControlEvents:UIControlEventTouchUpInside];
            [self.stopVideoRecordingButton removeTarget:self.cameraPickerController action:@selector(stopVideoCapture) forControlEvents:UIControlEventTouchUpInside];
            [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
            
   
            
            break;
            
        case 1:
             //  [self.mediaChoiceButton addTarget:self action:@selector(changeMediaType) forControlEvents:UIControlEventValueChanged];
     
          
            
            [self.takeMediaButton removeTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
            [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(startVideoCapture) forControlEvents:UIControlEventTouchUpInside];
            [self.stopVideoRecordingButton addTarget:self.cameraPickerController action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
            
            
      
            
            break;
        default:
            break;
    }
    
}


-(void)dismiss {
    self.videoController.fullscreen = NO;
    [self.videoController.view removeFromSuperview];
   
    
}


- (void)openPhotoLibrary {
    
    // alloc inits it
    self.libraryPickerController = [[UIImagePickerController alloc] init];
    
    // if you set a delegate, we need to create a dismiss in the imagePickerController method
    self.libraryPickerController.delegate = self;
    // the delegate is so that the view controller libraryPickerController can talk to self
    
    // presents view controller
    [self presentViewController:self.libraryPickerController animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // this runs after you select the picture
    
    NSLog(@"%@", info);
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([type isEqualToString:(NSString *)kUTTypeVideo] ||
        [type isEqualToString:(NSString *)kUTTypeMovie]) { // movie != video
        self.videoURL = info[UIImagePickerControllerMediaURL];
        [picker dismissViewControllerAnimated:YES completion:NULL];
        
        self.videoController = [[MPMoviePlayerController alloc] init];
        
        [self.videoController setContentURL:self.videoURL];
        [self.videoController.view setFrame:CGRectMake (0, 0, 320, 460)];
        [self.view addSubview:self.videoController.view];
        
        [self.videoController play];
    }
    
    else {
        // info is a dictionary, but it's not accepting a string (at least, it doesn't look like it)
        // actually click option + UIImagePickerControllerOriginalImage, then go to the .h
        // it actually IS a string
        UIImage * image = info[UIImagePickerControllerOriginalImage];
        
        
        // moving this line to completion block below
        [self gotoFilterWithImage:image];
        
        // it finishes the dismiss animation, then runs the gotoFilterWithImage push method
        // the completion block just stays frozen until it is come acrossed
        [picker dismissViewControllerAnimated:YES completion:^{
            
            //        [self gotoFilterWithImage:image];
            
        }];
    }
    
}

- (void)gotoFilterWithImage:(UIImage *)image {
    // push filter view controller
    
    FilterViewController * filterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"filterVC"];
    
    filterVC.originalImage = image;
    
    NSLog(@"the image %@", image);
    
    // .filterImageView is no accessible because it is not in the .h
    //    filterVC.filterImageView;
    
    [self.navigationController pushViewController:filterVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//    self.pickerController = [[UIImagePickerController alloc] init];

// sourceType changes their functionality
// show us the photo library or the live camera view (UIImagePickerControllerSourceTypeCamera)
// photo library is the default type
//    self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

// since this is a controller, we're adding the pickerController's view
//    [self.view addSubview:self.pickerController.view];