//
//  MainVC.m
//  PickerTest
//
//  Created by  on 19/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainVC.h"
#import "CustomView.h"


@implementation MainVC

@synthesize lava = _lava;
@synthesize customPickerArray = _customPickerArray;
@synthesize imgFilepath = _imgFilepath;
  

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

 
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lava = [[[UILabel alloc] initWithFrame:CGRectMake(290, 200, 200, 20)] autorelease];
    self.lava.text = @"ss9";
    [self.view addSubview:self.lava];
    
    UIPickerView *myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(200, 300, 320, 200)];
    
    customPickerDataSource = [[CustomPickerDataSource alloc]init];
    
    myPickerView.dataSource = customPickerDataSource;
    myPickerView.delegate = customPickerDataSource;
    
    //myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    [self.view addSubview:myPickerView];
    
    
    UIImageView *imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(290, 490, 100, 20)] autorelease];
//    NSString *imgFilepath = [[NSBundle mainBundle] pathForResource:@"botox2" ofType:@"png"];
    self.imgFilepath = [[NSBundle mainBundle] pathForResource:@"botox2" ofType:@"png"];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:self.imgFilepath];
    [imgView setImage:img];
    [img release];
    [self.view addSubview:imgView] ;

}
 
/*
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    NSLog(@"selecciono: %d", row);
}*/

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    //NSUInteger numRows = 5;
     //return numRows;
    return [customPickerArray count];

}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

/*
// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title;
    title = [@"" stringByAppendingFormat:@"%d",row];
    
    return title;
}*/

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    //int sectionWidth = 300;
    //return sectionWidth;
    return [CustomView viewWidth];

}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return [CustomView viewHeight];
}

#pragma mark -
#pragma mark UIPickerViewDelegate

// tell the picker which view to use for a given component and row, we have an array of views to show
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component reusingView:(UIView *)view
{
	return [customPickerArray objectAtIndex:row];
}

 
+(void) entro: (int) cuca {
    
    NSLog(@"sumbalo :%d", cuca);
             
}

- (void) dibujalo: (int) cuco {
    UIImageView *imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(290, 490, 100, 20)] autorelease];
    //    NSString *imgFilepath = [[NSBundle mainBundle] pathForResource:@"botox2" ofType:@"png"];
    self.imgFilepath = [[NSBundle mainBundle] pathForResource:@"botox2" ofType:@"png"];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:self.imgFilepath];
    [imgView setImage:img];
    [img release];
    [self.view addSubview:imgView] ;

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) dealloc {
    [_imgFilepath release];
    [_customPickerArray release];
    [_lava release];
    [super dealloc];
}

@end
