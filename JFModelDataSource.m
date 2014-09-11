//
//  JFModelDataSource.m
//  Picks
//
//  Created by Joe on 10/2/13.
//  Copyright (c) 2013 mergesort. All rights reserved.
//

#import "JFModelDataSource.h"


@implementation JFModelDataSource

- (id)init
{
    if ([self class] == [JFModelDataSource class])
    {
        NSAssert(NO, @"You cannot init this class directly. Instead, use a subclass.");
        return nil;
    }
    else
    {
        self = [super init];
        
        if (self)
        {
            [self setup];
        }
    }
    
    return self;
}

- (id)initInProtectedScope
{
    self = [super init];
    
    if (self)
    {
        [self setup];
    }
    
    return self;
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup

- (void)setup
{
    self.items = [NSArray array];
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Populate DataSource

+ (instancetype)populateDataSourceFromJSON:(id)JSONToParse withParserBlock:(void (^)(JFModelDataSource *dataSource, id JSON))JSONPopulator fromSender:(id)sender
{
    if ([self class] == [JFModelDataSource class] || [[sender class] isSubclassOfClass:[JFModelDataSource class]])
    {
        id dataSource = [[JFModelDataSource alloc] initInProtectedScope];
        
        if (JSONPopulator)
        {
            JSONPopulator(dataSource, JSONToParse);
        }
        else
        {
            return nil;
        }
        
        return dataSource;
    }
    else
    {
        NSAssert(NO, @"You cannot call this method directly outside of JFModelDataSource.");
        return nil;
    }
}

+ (instancetype)populateDataSourceFromJSON:(id)JSON
{
    NSAssert(NO, @"This method must be implemented in a subclass.");
    return nil;
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods

- (void)setItemsFromDataSource:(JFModelDataSource *)dataSource
{
    self.items = [dataSource.items copy];
}

- (void)addItemsFromDataSource:(JFModelDataSource *)dataSource
{
    self.items = [self.items arrayByAddingObjectsFromArray:[dataSource.items copy]];
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Object At Index Subscript

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return (self.items.count > idx) ? self.items[idx] : nil;
}

@end
