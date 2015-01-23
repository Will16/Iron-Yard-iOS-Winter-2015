//
//  FilterViewController.m
//  Capture
//
//  Created by Ebony Nyenya on 1/20/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterCell.h"
#import "SickSlider.h"

//Homework 1/20/15:
//1)Add segment control for choosing front or rear camera (add target method that changes the camera device) - Doneish
//2)Add methods to allow for video capture and stopping (delegate method - finishedpickingmedia)
//3)Add a UICollectionView to filterVC (storyboard) at the bottom (take inspiration from instagram's filter scroller (1 row of square filters)
//4)Extra: find out how to flip camera view when changing between front and rear instead of no animation (can find code on stackoverflow) - Doneish

@interface FilterViewController () <UICollectionViewDelegate, UICollectionViewDataSource, SickSliderDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;

@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;

@property (weak, nonatomic) IBOutlet SickSlider *slider1;

@property (nonatomic) NSArray *filters;

@end

@implementation FilterViewController

-(void)setOriginalImage:(UIImage *)originalImage{
    
    self.filterImageView.image = originalImage;
    _originalImage = originalImage;
    
}

-(void)sliderDidFinishUpdatingWithValue:(float)value {
    NSLog(@"slider is %f", value);
}

// the image to resize and the size we want to resize it (to be sure to divide the square size width and height by the smallest of the two values, so we can scale it bigger)
-(UIImage *)resizeImage:(UIImage *) originalImage withSize: (CGSize)size {
    
    // resize using the smaller of the height and width of the original image
    float scale = (originalImage.size.height > originalImage.size.width) ?  size.width / originalImage.size.width : size.height / originalImage.size.height;
    
    CGSize ratioSize = CGSizeMake(originalImage.size.width * scale, originalImage.size.height * scale);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [originalImage drawInRect:CGRectMake(0, 0, ratioSize.width, ratioSize.height)];
    
    // WE CAN CREATE A NEW IMAGE BY DRAWING IF WE TKE THE IMAGE FROM CURRENT CONTEXWWT
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
    
}


-(UIImage *) filterImage:(UIImage *) originalImage withFilterName: (NSString *)filterName {
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    //CIImage *inputImage = originalImage.CIImage;
    CIImage *inputImage = [[CIImage alloc] initWithCGImage:originalImage.CGImage];
    
   // NSLog(@"%@", inputImage);
    
    CIFilter *filter = [CIFilter filterWithName:filterName];
    
    [filter setValue:inputImage forKey:kCIInputImageKey];
    
//    [filter setValue:@80 forKey:kCIInputScaleKey];
    
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGRect rect = [result extent];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:rect];
    
   // return [UIImage imageWithCGImage:cgImage];
    
   return [UIImage imageWithCGImage:cgImage scale:originalImage.scale orientation:originalImage.imageOrientation];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.filterImageView.image = self.originalImage;
    
    self.filters = [CIFilter filterNamesInCategory:kCICategoryColorEffect];
    
    NSLog(@"%@", self.filters);
    
    self.filterCollectionView.delegate = self;
    self.filterCollectionView.dataSource = self;
    
   // self.filters = [CIFilter filterNamesInCategory:kCICategoryStylize];
    self.filterImageView.image = [self filterImage:self.originalImage withFilterName: self.filters[0]];
    
    self.slider1.delegate = self;
    
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.filters.count;
    
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FilterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"filterCell" forIndexPath:indexPath];
    
    NSString *filterName = self.filters[indexPath.item];
    
    //get side thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        
        // FOR EVERY FILTER IMAGE MAKE SURE TO RESIZE THE IMAGE TO THE SIZE OF THE CEL BEFORE APPLYING FILTER
        UIImage *resizedImage = [self resizeImage:self.originalImage withSize:cell.imageView.frame.size];
        
        UIImage *filterImage = [self filterImage:resizedImage withFilterName:filterName];
        
        //get main thread
        dispatch_async(dispatch_get_main_queue(), ^{
             cell.imageView.image = filterImage;
        });
        
       
    });
    
    

    
    NSLog(@"%@", filterName);
    
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *filterName = self.filters[indexPath.item];
    
    // BEFORE FILTERING RESIZE THE IMAGE FROM FILTER TO THE MAIN DISPLAY IMAGE
    
    UIImage *resizedImage = [self resizeImage:self.originalImage withSize: self.filterImageView.frame.size];
    
    
    UIImage *filterImage = [self filterImage:resizedImage withFilterName:filterName];
    
    self.filterImageView.image = filterImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
