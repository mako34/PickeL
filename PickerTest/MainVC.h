//
//  MainVC.h
//  PickerTest
//
//  Created by  on 19/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPickerDataSource.h"


@interface MainVC : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    
    UILabel *_lava;
    
    NSArray	*customPickerArray;
    CustomPickerDataSource *customPickerDataSource;

    NSString *_imgFilepath;
    
     
}

@property (nonatomic, retain)  UILabel *lava;

@property (nonatomic, retain) NSArray *customPickerArray;

@property (nonatomic, retain)   NSString *imgFilepath;

 
 
+(void) entro: (int) cuca ;
- (void) dibujalo: (int) cuco;

@end
