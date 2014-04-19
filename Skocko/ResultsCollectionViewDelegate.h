//
//  ResultsCollectionViewDelegate.h
//  Skocko
//
//  Created by Marko Digital on 4/18/14.
//  Copyright (c) 2014 BeoApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ResultsCollectionViewDelegate : NSObject  <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) NSArray *results;

@end
