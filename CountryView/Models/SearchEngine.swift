//
//  SearchEngine.swift
//  CountryView
//
//  Created by Matthew Popov on 19.07.2021.
//

import Foundation


final class SearchEngine {
    
    static func search(needle: String, haystack: String) -> Bool {
        
        guard needle.count <= haystack.count else {
            return false
        }
        
        if needle == haystack {
            return true
        }
        
        var needleIdx = needle.startIndex
        var haystackIdx = haystack.startIndex
        
        while needleIdx != needle.endIndex {
            
            if haystackIdx == haystack.endIndex {
                return false
            }
            
            if needle[needleIdx] == haystack[haystackIdx] {
                needleIdx = needle.index(after: needleIdx)
            }
            
            haystackIdx = haystack.index(after: haystackIdx)
        }
        
        return true
      }
}
