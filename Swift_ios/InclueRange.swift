//
//  InclueRange.swift
//  Swift_ios
//
//  Created by RHCT on 16/1/27.
//  Copyright © 2016年 ZL. All rights reserved.
//

import UIKit

typealias Position = CGPoint
typealias Distance = CGFloat

let minimumDistance: Distance = 2.0

typealias Region = Position -> Bool
func circle(radius: Distance) -> Region {
    return { p in sqrt(p.x * p.x + p.y + p.y) <= radius }
}

func invert(region: Region) -> Region {
    return {
        point in !region(point)
    }
}

func shift(offset: Position, region: Region) -> Region {
    return {
        point in
        let shiftedPoint = Position(x: point.x + offset.x, y: point.y + offset.y)
        return region(shiftedPoint)
    }
}

func intersection(region: Region, region2: Region) -> Region {
    return {
        point in region(point) && region(point)
    }
}

func union(region: Region, region2: Region) -> Region {
    return {
        point in region(point) || region(point)
    }
}

func difference(region: Region, minusRegion: Region) -> Region {
    return intersection(region, region2: invert(minusRegion))
}


