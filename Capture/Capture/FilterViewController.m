//
//  FilterViewController.m
//  Capture
//
//  Created by Bobby Towers on 1/20/15.
//  Copyright (c) 2015 Bobby Towers. All rights reserved.
//

#import "FilterViewController.h"


// 1.Add segment control for choosing front or read camera
// 1a.add target meethod that changes the camera device (what we have to do in 1.
// Add methods to allow for video capture and stopping
// 3.Add a UICollectionView to filterBV (storyBoard) at the bottom
// 3atake inspiration from instagrams filter scroller (1 row of filters)
//Extra: find ut how to flip camera view when changing between front and rear (the camera view not the camera mode)



@interface FilterViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *filterViewCollection;

@end

@implementation FilterViewController {
    NSArray * filters;
    
    NSMutableDictionary * filteredByKey;
}

- (void)setOriginalImage:(UIImage *)originalImage {
    
    // test code to see if filter image view is null
    NSLog(@"filter image view %@", self.filterImageView);
    
    //self.filterImageView.image = originalImage;
    
    _originalImage = originalImage;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
   return filters.count;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    filteredByKey = [@{} mutableCopy];
    
    filters = @[
                //                    @"CIColorCrossPolynomial",
                //                    @"CIColorCube",
                //                    @"CIColorCubeWithColorSpace",
                @"CIColorInvert",
                //                    @"CIColorMap",
                @"CIColorMonochrome",
                //                    @"CIColorPosterize",
                //                    @"CIFalseColor",
                //                    @"CIMaskToAlpha",
                //                    @"CIMaximumComponent",
                //                    @"CIMinimumComponent",
                //                    @"CIPhotoEffectChrome",
                //                    @"CIPhotoEffectFade",
                //                    @"CIPhotoEffectInstant",
                //                    @"CIPhotoEffectMono",
                //                    @"CIPhotoEffectNoir",
                //                    @"CIPhotoEffectProcess",
                //                    @"CIPhotoEffectTonal",
                //                    @"CIPhotoEffectTransfer",
                @"CISepiaTone",
                @"CIVignette",
                @"CIVignetteEffect"
                ];

    
    
    _filterViewCollection.dataSource = self;
    _filterViewCollection.delegate = self;
    _filterViewCollection.backgroundColor = [UIColor whiteColor];
    
    
    
    
    self.filterImageView.image = self.originalImage;
    
    
}



- (UIImage *)filterImageWithFilterName:(NSString *)filterName
{
    // turn uiimage into ciimage
    CIImage * ciImage = [CIImage imageWithCGImage:self.originalImage.CGImage];
    
    // create cifilter with filterName
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    // add ciimage to the filter
    [filter setValue:ciImage forKeyPath:kCIInputImageKey];
    
    // get filtered image from filter
    CIImage * ciResult = [filter outputImage];
    
    // setup context to turn ciimage into cgimage
    CIContext * ciContext = [CIContext contextWithOptions:nil];
    
    // init uiimage with cgimage
    
    // extent: Returns a rectangle that specifies the extent of the image.
    return [UIImage imageWithCGImage:[ciContext createCGImage:ciResult fromRect:[ciResult extent]]];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString * filterName = filters[indexPath.item];
    
    UIImageView * filterView = [[UIImageView alloc] initWithFrame:cell.bounds];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        // filter our image for the filter image view
        UIImage * filterImage = [self filterImageWithFilterName:filterName];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            filterView.image = filterImage;
            
            // add our image to the key of the filter
            filteredByKey[filterName] = filterImage;
            
        });
        
        
    });
    
    //    filterView.image = [self filterImageWithFilterName:filterName];
    
    // our image filtered with the right filter (using filterImageWithFilterName
    [cell addSubview:filterView];
    
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    UIImageView * bigView = [[UIImageView alloc] initWithFrame:imagePicker.view.frame];
    
    NSString * filterName = filters[indexPath.item];
    UIImage * filterImage = [self filterImageWithFilterName:filterName];
    self.originalImage = filterImage;
    self.filterImageView.image = self.originalImage;
    
    // filteredByKey[filterName] returns an UIImage (only one object for every key (each key is a filter) (value is image, filter is the filate for image))
//    [self chooseFilterWithImage:filteredByKey[filterName]];
}

/*
- (void)chooseFilterWithImage:(UIImage *)image
{
    IWAChosenViewController * filterVC = [[IWAChosenViewController alloc] init];
    
    filterVC.filteredImage = image;
    
    [self.navigationController pushViewController:filterVC animated:YES];
}
*/
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
