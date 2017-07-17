//
//  SetValueFormatter.h
//  Charts_Test
//
//  Created by ljm on 2017/7/14.
//  Copyright © 2017年 ljm. All rights reserved.
//

#import <Foundation/Foundation.h>

@import Charts;

@interface SetValueFormatter : NSObject<IChartValueFormatter>

-(id)initWithArr:(NSArray *)arr;

@end
