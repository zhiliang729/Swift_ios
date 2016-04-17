//
//  BattleShip.swift
//  Swift_ios
//
//  Created by zhangliang on 16/2/16.
//  Copyright © 2016年 ZL. All rights reserved.
//

import UIKit

typealias Position = CGPoint
typealias Distance = CGFloat

typealias Region = Position -> Bool

/// 最小距离
let minimumDistance: Distance = 2.0

/**
 *  是否在原点的某个范围内
 */
func circle(redius: Distance) -> Region {
    return { point in
        sqrt(point.x * point.x + point.y * point.y) <= redius
    }
}

/**
 *  是否在某个点的范围内
 */
func circle2(radius: Distance, center: Position) -> Region {
    return { point in
        let shifedPoint = Position(x: point.x - center.x, y: point.y - center.y)
        return sqrt(shifedPoint.x * shifedPoint.x + shifedPoint.y * shifedPoint.y) <= radius
        
    }
//    return shift(Position(x: 0, y: 0), region: circle(radius))
}

func shift(offset: Position, region: Region) -> Region {
    return { point in
        let shiftedPoint = Position(x: point.x - offset.x, y: point.y - offset.y)
        return region(shiftedPoint)
    }
}

/**
 反转region区域
 
 - parameter region: 某个region
 
 - returns: 反转改region
 */
func invert(region: Region) -> Region {
    return { point in
        !region(point)
    }
}

/**
 region1 和 region2 交集
 
 - parameter region1: region1
 - parameter region2: region2
 
 - returns: 交集
 */
func invertsection(region1: Region, region2: Region) -> Region {
    return { point in
        region1(point) && region2(point)
    }
}

/**
    并集
 */
func union1(region1: Region, region2: Region) -> Region {
    return { point in
        region1(point) || region2(point)
    }
}

/**
 所有在第一个region 而不在第二个minusRegion的集合
 
 - parameter region:     region
 - parameter minusRegion: minusRegion
 
 - returns: 集合
 */
func difference(region: Region, minusRegion: Region) -> Region {
    return invertsection(region, region2: invert(minusRegion))
}

func inRange(ownPosition: Position, target: Position, friendly: Position, range: Distance) -> Bool {
    let rangeRegion = difference(circle(range), minusRegion: circle(minimumDistance))
    let targetRegion = shift(ownPosition, region: rangeRegion)
    let friendRegion = shift(friendly, region: circle(minimumDistance))
    let resultRegion = difference(targetRegion, minusRegion: friendRegion)
    return resultRegion(target)
}


