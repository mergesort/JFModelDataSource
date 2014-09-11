//
//  JFModelDataSource.h
//  Picks
//
//  Created by Joe on 10/2/13.
//  Copyright (c) 2013 mergesort. All rights reserved.
//

#import <Foundation/Foundation.h>


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface JFModelDataSource : NSObject

@property (nonatomic) NSArray *items;

/**
 *  A method which populates a data source by providing JSON, which contains an array of objects
 *  to parse, and a block which executes the parsing. Only call this directly in subclasess.
 *
 *  @param JSONToParse      The JSON containing an array of objects to parse
 *  @param JSONPopulator    The mechanism for parsing all the objects
 *
 *  @return A JFModelDataSource object, containing objects which are parsed
 */
+ (instancetype)populateDataSourceFromJSON:(id)JSONToParse withParserBlock:(void (^)(JFModelDataSource *dataSource, id JSON))JSONPopulator fromSender:(id)sender;

/**
 *  A method which populates a data source by providing JSON
 *
 *  @param JSON The JSON containing an array of objects to parse
 *
 *  @return A JFModelDataSource object, containing objects which are parsed
 */
+ (instancetype)populateDataSourceFromJSON:(id)JSON;

- (void)setItemsFromDataSource:(JFModelDataSource *)dataSource;
- (void)addItemsFromDataSource:(JFModelDataSource *)dataSource;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;

@end
