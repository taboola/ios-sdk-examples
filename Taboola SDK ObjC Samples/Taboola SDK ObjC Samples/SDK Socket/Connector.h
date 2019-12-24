//
//  Connector.h
//  Taboola SDK ObjC Samples
//
//  Created by Liad Elidan on 11/12/2019.
//  Copyright © 2019 Taboola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectorDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Connector : NSObject

-(void)setupNetworkCommunication;

-(void)joinConnection: (NSString*)publisherName;

-(void)stopSession;

@property (nonatomic, weak) id<ConnectorDelegate> delegate;
@property (nonatomic) TaboolaView* taboolaObject;

@end

NS_ASSUME_NONNULL_END
