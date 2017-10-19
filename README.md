# ZPJSONKit
iOS 数据解析库，并可去掉null数据和制表符格式的非标准格式json数据

1，解析前除掉json中的制表符（制表符使用NSLOG无法打印出，使用po命令可打印出）
     NSString *dataString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    //json数据当中没有 \n \r \t 等制表符，当后台给出有问题时，我们需要对json数据过滤
    dataString = [dataString stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
    dataString = [dataString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    dataString = [dataString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    
    NSData *utf8Data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:utf8Data options:NSJSONReadingMutableContainers error:&error];
    
    
    2，去掉数据中Value为null的数据，防止崩溃（参考AFNetWorking）
    static id CSIIJSONObjectByRemovingKeysWithNullValues(id JSONObject, NSJSONReadingOptions readingOptions) {
    if ([JSONObject isKindOfClass:[NSArray class]]) {
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:[(NSArray *)JSONObject count]];
        for (id value in (NSArray *)JSONObject) {
            [mutableArray addObject:CSIIJSONObjectByRemovingKeysWithNullValues(value, readingOptions)];
        }
        
        return (readingOptions & NSJSONReadingMutableContainers) ? mutableArray : [NSArray arrayWithArray:mutableArray];
    } else if ([JSONObject isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:JSONObject];
        for (id <NSCopying> key in [(NSDictionary *)JSONObject allKeys]) {
            id value = (NSDictionary *)JSONObject[key];
            if (!value || [value isEqual:[NSNull null]]) {
                [mutableDictionary removeObjectForKey:key];
            } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
                mutableDictionary[key] = CSIIJSONObjectByRemovingKeysWithNullValues(value, readingOptions);
            }
        }
        
        return (readingOptions & NSJSONReadingMutableContainers) ? mutableDictionary : [NSDictionary dictionaryWithDictionary:mutableDictionary];
    }
    
    return JSONObject;
}
    
