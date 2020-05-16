//
//  MSDRealm.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/16.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyUserDefaults

class MSDRealm {
    static let shared = MSDRealm()
    private var realm:Realm = try! Realm()
    
    //MARK: 数据库配置、版本升级
    static func initLib(_ ver: UInt64) {
        let dbVersion : UInt64 = ver
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
        let dbPath = docPath.appending("/msd_db.realm")
        let config = Realm.Configuration(fileURL: URL.init(string: dbPath), schemaVersion: dbVersion, migrationBlock: { migration, oldSchemaVersion in //数据库低于设置版本时进入
            
            /* 数据库更新后字段需要重新计算时，进行操作
            // enumerateObjects(ofType:_:) 方法遍历了存储在 Realm 文件中的每一个“Person”对象
            migration.enumerateObjects(ofType: Person.className()) { oldObject, newObject in
              // 将名字进行合并，存放在 fullName 域中
              let firstName = oldObject!["firstName"] as! String
              let lastName = oldObject!["lastName"] as! String
              newObject!["fullName"] = "\(firstName) \(lastName)"
            }
            */
            Defaults[\.db_v] = Int(ver)
        }, deleteRealmIfMigrationNeeded: false, shouldCompactOnLaunch: nil, objectTypes: nil)
        Realm.Configuration.defaultConfiguration = config
        
        shared.realm = try! Realm()
    }
    
    func get() -> Realm {return realm}
    
    //MARK: 添加对象
    func add<T: Object>(object:T) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    //MARK: 添加多个对象
    func add<T: Object>(objects:Array<T>) {
        try! realm.write {
            realm.add(objects)
        }
    }
    
    //MARK: 删除对象
    func delete<T: Object>(object:T) {
        try! realm.write {
            realm.delete(object)
        }
    }
    
    //MARK: 删除多个对象
    func delete<T: Object>(objects:Array<T>) {
        try! realm.write {
            realm.delete(objects)
        }
    }
    
    //MARK: 条件删除 MSDRealm.shared.delete(
    func delete<T: Object>(object:T.Type, predicate:NSPredicate) {
        
        let results:Results<T> = self.query(object: object, predicate: predicate)
        if results.count > 0 {
            try! realm.write {
                realm.delete(results)
            }
        }
    }
    
    //MARK: 删除类
    func deleteAll<T: Object>(object:T.Type) {
        let objListResults = self.query(object: object)
        if objListResults.count > 0 {
            try! realm.write {
                realm.delete(objListResults)
            }
        }
    }
    
    //MARK: 删除所有
    func realmDeleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    //MARK: 更新对象
    func update<T: Object>(object:T) {
        try! realm.write {
            realm.add(object, update: .all)
        }
    }
    
    //MARK: 更新多个对象
    func update<T: Object>(objects:Array<T>) {
        try! realm.write {
            realm.add(objects, update: .all)
        }
    }
    
    //MARK: query
    func query<T: Object>(object:T.Type) -> Results<T> {
        let results = self.realm.objects(object)
        return results
    }
    
    //MARK: 条件查询
    func query<T: Object>(object:T.Type, predicate:NSPredicate) -> Results<T> {
        let results = self.query(object: object).filter(predicate)
        return results
    }
    
    //MARK: 分页查询
    func query<T: Object>(object:T.Type, from:Int, size:Int) -> Array<T> {
        
        let results = self.query(object: object)
        var resultsArray = Array<T>()
        if results.count <= size*(from - 1) || from <= 0 {
            return resultsArray
        }
        if results.count > 0 {
            for i in size*(from - 1)...from*size-1{
                resultsArray.append(results[i])
            }
        }
        return resultsArray
    }
    
    //MARK: 条件排序查询
    private func query<T: Object>(object:T.Type, predicate:NSPredicate, key:String, asc:Bool) -> Results<T> {
        return realm.objects(object).filter(predicate).sorted(byKeyPath: key, ascending: asc)
    }
    
    //MARK: 分页条件排序查询
    func query<T: Object>(object: T.Type,
               predicate: NSPredicate,
               sortedKey: String,
               isAssending: Bool,
               from: Int,
               size: Int)
        -> Array<Object> {
        
        let results = self.query(object: object, predicate: predicate, key: sortedKey, asc: isAssending)
        var resultsArray = Array<Object>()
        
        if results.count <= size*(from - 1) || from <= 0 {
            return resultsArray
        }
        if results.count > 0 {
            for i in size*(from - 1)...from*size-1{
                resultsArray.append(results[i])
            }
        }
        return resultsArray
    }
}
