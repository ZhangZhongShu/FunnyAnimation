//
//  ViewController.m
//  ZQLWaterAnimation
//
//  Created by 臧其龙 on 15/12/9.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "ViewController.h"
#import "ButtonAnimationView.h"
#import "UIColor+HexColor.h"
#import "WaveView.h"
#import "DateCollectionViewCell.h"
#import "CustomLayout.h"
#import "ScrollLabelView.h"

@interface ViewController ()<ButtonAnimationViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>
{
    WaveView *_waveView;
    NSArray *dataArray;
    
    int randomCount;
    int lastCount;
    
    ScrollLabelView *leftLabelView;
    ScrollLabelView *rightLabelView;
    
}
@property (weak, nonatomic) IBOutlet UICollectionView *mCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = @[@"09:11", @"10:12", @"11:11", @"12:00",@"13:43", @"14:52", @"13:09", @"15:19",@"18:00", @"19:30"];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#1E384C" alpha:1];
    
    _waveView = [[WaveView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 0)];
   _waveView.waveSpeed = 6.0f;
    _waveView.waveAmplitude = 16.0f;
   // _waveView.backgroundColor = [UIColor colorWithHexString:@"#32BAFA" alpha:1];
    [self.view addSubview:_waveView];
    [_waveView wave];
    
    ButtonAnimationView *buttonView = [[ButtonAnimationView alloc] initWithFrame:CGRectMake(100, 200, 200, 60)];
    buttonView.delegate = self;
    buttonView.center = CGPointMake(self.view.center.x, self.view.center.y + 200);
    [self.view addSubview:buttonView];
    
    [self.view bringSubviewToFront:_mCollectionView];
    
    CustomLayout *layout = (CustomLayout *)_mCollectionView.collectionViewLayout;
    layout.customDelegate = self;
    
    leftLabelView = [[ScrollLabelView alloc] initWithFrame:CGRectMake(0, 0, 200, 100) withType:SingleDigitType];
    rightLabelView =[[ScrollLabelView alloc] initWithFrame:CGRectMake(0, 0, 200, 100) withType:SingleDigitType];
    UILabel *signLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 80)];
    signLabel.text = @"%";
    signLabel.textAlignment = NSTextAlignmentCenter;
    signLabel.textColor = [UIColor colorWithHexString:@"C4F8FB" alpha:1];
    signLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:60];
    [self.view addSubview:leftLabelView];
    [self.view addSubview:rightLabelView];
    [self.view addSubview:signLabel];
    
    rightLabelView.center = CGPointMake(self.view.center.x, self.view.center.y - 20);
    leftLabelView.center = CGPointMake(rightLabelView.center.x -60, self.view.center.y - 20);
    signLabel.center = CGPointMake(rightLabelView.center.x+60, self.view.center.y -20);
    
    lastCount = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonDidClick
{
    randomCount = arc4random() % (dataArray.count);
    
    if (randomCount >= dataArray.count -3) {
        randomCount = dataArray.count - 3;
    }
    
    int randomNum = arc4random() % (10);
    int randomNum2 = arc4random() % (10);
    [rightLabelView scollToNum:randomNum];
    [leftLabelView scollToNum:randomNum2];
    
    if (lastCount != randomCount) {
        DateCollectionViewCell *cell = (DateCollectionViewCell *)[_mCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:lastCount+2 inSection:0]];
        cell.timeLabel.textColor = [UIColor colorWithHexString:@"#6590A2" alpha:1];
    }
    lastCount = randomCount;
    [_mCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:randomCount inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
   
}

#pragma mark - CollectionView DataSource && Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.view.bounds), 40);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kDateCell" forIndexPath:indexPath];
    cell.timeLabel.text = dataArray[indexPath.row];
    return cell;
}

#pragma mark - CustomLayout

- (void)labelShouldChangeColor:(BOOL)isChange withCellIndex:(NSIndexPath *)indexPath
{
    if (isChange) {
        DateCollectionViewCell *cell = (DateCollectionViewCell *)[_mCollectionView cellForItemAtIndexPath:indexPath];
        cell.timeLabel.textColor = [UIColor colorWithHexString:@"#84DBF9" alpha:1];
    }else
    {
        DateCollectionViewCell *cell = (DateCollectionViewCell *)[_mCollectionView cellForItemAtIndexPath:indexPath];
        cell.timeLabel.textColor = [UIColor colorWithHexString:@"#6590A2" alpha:1];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    DateCollectionViewCell *cell = (DateCollectionViewCell *)[_mCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:randomCount+2 inSection:0]];
    cell.timeLabel.textColor = [UIColor colorWithHexString:@"#84DBF9" alpha:1];
}

@end
