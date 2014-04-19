//
//  ResultsCollectionViewDelegate.m
//  Skocko
//
//  Created by Marko Digital on 4/18/14.
//  Copyright (c) 2014 BeoApps. All rights reserved.
//

#import "ResultsCollectionViewDelegate.h"
#import "ResultsCollectionViewCell.h"

@implementation ResultsCollectionViewDelegate
@synthesize results;

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *cellData = [results objectAtIndex:indexPath.row];
    static NSString *cellIdentifier = @"resultsCollectionViewCell";
    ResultsCollectionViewCell *cell = (ResultsCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    NSString *imageName = [[NSString alloc] init];
    switch ([cellData integerValue]) {
        case 1:
            imageName = @"r1.png";
            break;
        case 2:
            imageName = @"r2.png";
            break;
        case 3:
            imageName = @"r3.png";
            break;
    }
    cell.resultImage.image = [UIImage imageNamed:imageName];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection: (NSInteger)section
{
    return [self.results count];
}

@end
