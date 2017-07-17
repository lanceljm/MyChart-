//
//  ViewController.m
//  Charts_Test
//
//  Created by ljm on 2017/7/14.
//  Copyright © 2017年 ljm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<ChartViewDelegate>

{
    /** 自定义画图区域 **/
    LineChartView *_coordinateView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = RGB(255, 255, 255);
    
    
    [self setupUI];
    

}


#pragma mark -- setupUI
- (void) setupUI
{
    _coordinateView = [[LineChartView alloc] initWithFrame:CGRectMake(
                                                                      borderView_WIDTH,
                                                                      borderView_WIDTH > 64 ? borderView_WIDTH + 10 : 74,
                                                                      SCREENWIDTH - borderView_WIDTH * 2,
                                                                      SCREENWIDTH - borderView_WIDTH * 2)];
    _coordinateView.delegate = self;
    _coordinateView.backgroundColor = RGB(233, 243, 252);
    [self.view addSubview:_coordinateView];
    
    /** 画 X 轴 **/
    ChartXAxis *xaxis = _coordinateView.xAxis;
    xaxis.axisLineWidth = 1.f;
    xaxis.axisLineColor = [UIColor blueColor];
    /** X轴的显示位置，默认显示在上边 **/
    xaxis.labelPosition = XAxisLabelPositionBottom;
    
    
    /** 画 Y 轴 **/
    ChartYAxis *yaxis = _coordinateView.leftAxis;
    yaxis.axisLineColor = [UIColor greenColor];
    yaxis.axisLineWidth = 1.f;
    
    yaxis.gridAntialiasEnabled = YES;

    _coordinateView.data = [self setData];
    
}

- (LineChartData *)setData
{
    NSInteger xVals_count = 12;//X轴上要显示多少条数据
    //X轴上面需要显示的数据
    NSMutableArray *xVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < xVals_count; i++) {
        [xVals addObject:[NSString stringWithFormat:@"%d月", i+1]];
    }
    _coordinateView.xAxis.valueFormatter = [[DateValueFormatter alloc]initWithArr:xVals];
    //对应Y轴上面需要显示的数据
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    for (int i = 0; i < xVals_count; i++) {
        int a = arc4random() % 600;
        if (a < 100) {
            a += 100;
        }
        ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:i y:a];
        [yVals addObject:entry];
    }
    
    LineChartDataSet *set1 = nil;
    if (_coordinateView.data.dataSetCount > 0) {
        LineChartData *data = (LineChartData *)_coordinateView.data;
        set1 = (LineChartDataSet *)data.dataSets[0];
        set1.values = yVals;
        set1.valueFormatter = [[SetValueFormatter alloc] initWithArr:yVals];

        return data;
    }else{
        //创建LineChartDataSet对象
        set1 = [[LineChartDataSet alloc]initWithValues:yVals label:nil];
        //设置折线的样式
        set1.lineWidth = 2.0/[UIScreen mainScreen].scale;//折线宽度
        
        set1.drawValuesEnabled = YES;//是否在拐点处显示数据
        set1.valueFormatter = [[SetValueFormatter alloc]initWithArr:yVals];
        
        set1.valueColors = @[[UIColor brownColor]];//折线拐点处显示数据的颜色
        
        [set1 setColor:[UIColor brownColor]];//折线颜色
        set1.highlightColor = [UIColor lightGrayColor];
        //        set1.drawCirclesEnabled = YES;
        set1.drawSteppedEnabled = NO;//是否开启绘制阶梯样式的折线图
        //折线拐点样式
        set1.drawCirclesEnabled = NO;//是否绘制拐点
        set1.mode = LineChartModeCubicBezier;
        
        set1.drawFilledEnabled = YES;//是否填充颜色
        NSArray *gradientColors = @[(id)[ChartColorTemplates colorFromString:@"#8BC6E8"].CGColor,
                                    (id)[ChartColorTemplates colorFromString:@"#F7FBFE"].CGColor];
        CGGradientRef gradientRef = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        set1.fillAlpha = 0.3f;//透明度
        set1.fill = [ChartFill fillWithLinearGradient:gradientRef angle:90.0f];//赋值填充颜色对象
        CGGradientRelease(gradientRef);//释放gradientRef
        //点击选中拐点的交互样式
        set1.highlightEnabled = YES;//选中拐点,是否开启高亮效果(显示十字线)
        set1.highlightColor = [UIColor redColor];//点击选中拐点的十字线的颜色
        set1.highlightLineWidth = 1.0/[UIScreen mainScreen].scale;//十字线宽度
        set1.highlightLineDashLengths = @[@5, @5];//十字线的虚线样式
        //将 LineChartDataSet 对象放入数组中
        
        
        //将 LineChartDataSet 对象放入数组中
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        LineChartData *data = [[LineChartData alloc]initWithDataSets:dataSets];
        
        [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];//文字字体
        //        [data setValueTextColor:[UIColor blackColor]];//文字颜色
        [data setValueTextColor:[UIColor clearColor]];//文字颜色
        
        return data;
    }
    

}


#pragma mark - ChartViewDelegate
- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}

@end
