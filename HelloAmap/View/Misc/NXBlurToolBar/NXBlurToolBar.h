//
//  NXBlurToolBar.h
//  NingXia
//
//  Created by ningxia on 15/5/4.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import "FXBlurView.h"
#import "NXBlurToolBarButtonModel.h"

@interface NXBlurToolBar : FXBlurView
-(void) showButtonsByConfigs:(NSArray *) configs;
-(void) viewWillAppear;
-(void) viewWillDisAppear;
@end