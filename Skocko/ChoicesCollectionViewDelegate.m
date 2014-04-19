//
//  ChoicesCollectionViewDelegate.m
//  Skocko
//
//  Created by Marko Digital on 4/16/14.
//  Copyright (c) 2014 BeoApps. All rights reserved.
//

#import "ChoicesCollectionViewDelegate.h"
#import "ChoicesCollectionViewCell.h"

@implementation ChoicesCollectionViewDelegate
@synthesize choices;

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *cellData = [choices objectAtIndex:indexPath.row];
    static NSString *cellIdentifier = @"choicesCollectionViewCell";
    ChoicesCollectionViewCell *cell = (ChoicesCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    NSString *imageName = [[NSString alloc] init];
    switch ([cellData integerValue]) {
        case 1:
            imageName = @"s1.png";
            break;
        case 2:
            imageName = @"s2.png";
            break;
        case 3:
            imageName = @"s3.png";
            break;
        case 4:
            imageName = @"s4.png";
            break;
        case 5:
            imageName = @"s5.png";
            break;
        case 6:
            imageName = @"s6.png";
            break;
    }
    cell.choiceImage.image = [UIImage imageNamed:imageName];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection: (NSInteger)section
{
    return [self.choices count];
}

@end
