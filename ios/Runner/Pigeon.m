// Autogenerated from Pigeon (v1.0.12), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "Pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ? error.code : [NSNull null]),
        @"message": (error.message ? error.message : [NSNull null]),
        @"details": (error.details ? error.details : [NSNull null]),
        };
  }
  return @{
      @"result": (result ? result : [NSNull null]),
      @"error": errorDict,
      };
}

@interface FLTVersion ()
+ (FLTVersion *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation FLTVersion
+ (FLTVersion *)fromMap:(NSDictionary *)dict {
  FLTVersion *result = [[FLTVersion alloc] init];
  result.string = dict[@"string"];
  if ((NSNull *)result.string == [NSNull null]) {
    result.string = nil;
  }
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.string ? self.string : [NSNull null]), @"string", nil];
}
@end

@interface FLTApiCodecReader : FlutterStandardReader
@end
@implementation FLTApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [FLTVersion fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface FLTApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[FLTVersion class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface FLTApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FLTApiGetCodec() {
  static dispatch_once_t s_pred = 0;
  static FlutterStandardMessageCodec *s_sharedObject = nil;
  dispatch_once(&s_pred, ^{
    FLTApiCodecReaderWriter *readerWriter = [[FLTApiCodecReaderWriter alloc] init];
    s_sharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return s_sharedObject;
}


void FLTApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.Api.getPlatformVersion"
        binaryMessenger:binaryMessenger
        codec:FLTApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getPlatformVersionWithError:)], @"FLTApi api (%@) doesn't respond to @selector(getPlatformVersionWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        FLTVersion *output = [api getPlatformVersionWithError:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
