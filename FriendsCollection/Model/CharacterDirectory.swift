//
//  CharacterDirectory.swift
//  FriendsCollection
//
//  Created by Johan Guenaoui on 01/10/2020.
//
//  Goal: This class will manages the charcaters directory and the new characters

import Foundation
import Combine

class CharacterDirectory: ObservableObject {
    @Published private var _charactersList:[Character]
    @Published private var _maxId:Int
    
    var objectWillChange = PassthroughSubject<Void,Never>()
    
    public init() {
        _charactersList = DataConnector.loadCharacters()
        _maxId = 18
    }
    
    public func getCharacters() -> [Character]{
        return _charactersList
    }
    
    public func getNbCharacters() -> Int {
        return _charactersList.count
    }
    
    public func getNbMainCharacters() -> Int {
        return _charactersList.filter {$0._isMain}.count
    }
    
    public func getNbGuestCharacters() -> Int {
        return _charactersList.filter {!$0._isMain}.count
    }
    
    public func getMaxId() -> Int {
        return _maxId
    }

    public func filter(season:Int, main:Int) -> [Character] {
        var filteredCharacters:[Character]
        
        switch season {
        case 0: filteredCharacters = _charactersList
        case -1: filteredCharacters = _charactersList.filter {$0._isMain}
            if main == 1 {
                filteredCharacters = _charactersList.filter {$0._isMain}
            }
            if main == 2 {
                filteredCharacters = _charactersList.filter {!$0._isMain}
            }
        default: filteredCharacters = _charactersList.filter {$0._season == season}
        }
        
        return filteredCharacters
    }
    
    public func addCharacter(newCharacter:Character) {
        _charactersList.append(newCharacter)
        _maxId = _maxId + 1
        objectWillChange.send()
    }
}
