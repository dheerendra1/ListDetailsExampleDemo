//
//  TestMoviesList.swift
//  test
//
//  Created by Dheerendra Singh on 08/12/19.
//  Copyright © 2019 Dheerendra Singh. All rights reserved.
//
import Foundation
import SwiftyJSON

public final class TestMoviesList: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
  
       static let genre = "Genre"
       static let awards = "Awards"
       static let website = "Website "
       static let rated = "Rated"
       static let country = "Country"
       static let year = "Year"
       static let director = "Director"
       static let imdbID = "imdbID "
       static let title = "Title"
       static let plot = "Plot"
       static let language = "Language"
       static let dVD = "DVD "
       static let ratings = "Ratings "
       static let poster = "Poster "
       static let released = "Released"
       static let response = "Response "
       static let type = "Type "
       static let writer = "Writer"
       static let runtime = "Runtime"
       static let boxOffice = "BoxOffice "
       static let actors = "Actors"
       static let production = "Production "
       static let imdbRating = "imdbRating "
       static let metascore = "Metascore "
       static let imdbVotes = "imdbVotes "
    
    
    }

  // MARK: Properties
   public var genre: String?
   public var poster: String?
   public var awards: String?
   public var website: String?
   public var rated: String?
   public var country: String?
   public var year: String?
   public var director: String?
   public var imdbID: String?
   public var title: String?
   public var plot: String?
   public var language: String?
   public var dVD: String?
   public var ratings: String?
   public var released: String?
   public var response: String?
   public var type: String?
   public var writer: String?
   public var runtime: String?
   public var boxOffice: String?
   public var actors: String?
   public var production: String?
   public var imdbRating: String?
   public var metascore: String?
   public var imdbVotes: String?
  
  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    
    
     
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    genre = json[SerializationKeys.genre].string
    poster = json[SerializationKeys.poster].string
    awards = json[SerializationKeys.awards].string
    website  = json[SerializationKeys.website].string
    rated = json[SerializationKeys.rated].string
    country = json[SerializationKeys.country].string
    year = json[SerializationKeys.year].string
    director = json[SerializationKeys.director].string
    imdbID = json[SerializationKeys.imdbID].string
    title = json[SerializationKeys.title].string
    plot = json[SerializationKeys.plot].string
    
    language = json[SerializationKeys.language].string
    dVD = json[SerializationKeys.dVD].string
    ratings = json[SerializationKeys.ratings].string
    released = json[SerializationKeys.released].string
    response = json[SerializationKeys.response].string
    type = json[SerializationKeys.type].string
    writer = json[SerializationKeys.writer].string
    runtime = json[SerializationKeys.runtime].string
    boxOffice = json[SerializationKeys.boxOffice].string
    actors = json[SerializationKeys.actors].string
    production = json[SerializationKeys.production].string
    imdbRating = json[SerializationKeys.imdbRating].string
    metascore = json[SerializationKeys.metascore].string
    imdbVotes = json[SerializationKeys.imdbVotes].string

    
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
     var dictionary: [String: Any] = [:]

    if let value = genre { dictionary[SerializationKeys.genre] = value }
     if let value = poster { dictionary[SerializationKeys.poster] = value }
    if let value = awards { dictionary[SerializationKeys.awards] = value }
    if let value = website { dictionary[SerializationKeys.website] = value }
    if let value = rated { dictionary[SerializationKeys.rated] = value }
    if let value = country { dictionary[SerializationKeys.country] = value }
    if let value = year { dictionary[SerializationKeys.year] = value }
    if let value = director { dictionary[SerializationKeys.director] = value }
    if let value = imdbID { dictionary[SerializationKeys.imdbID] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = plot { dictionary[SerializationKeys.plot] = value }
    if let value = language { dictionary[SerializationKeys.language] = value }
    if let value = dVD { dictionary[SerializationKeys.dVD] = value }
    if let value = ratings { dictionary[SerializationKeys.ratings] = value }
    if let value = released { dictionary[SerializationKeys.released] = value }
    if let value =  response { dictionary[SerializationKeys.response] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = writer { dictionary[SerializationKeys.writer] = value }
    if let value = runtime { dictionary[SerializationKeys.runtime] = value }
    if let value = boxOffice { dictionary[SerializationKeys.boxOffice] = value }
    if let value = actors { dictionary[SerializationKeys.actors] = value }
    if let value = production { dictionary[SerializationKeys.production] = value }
    if let value = imdbRating { dictionary[SerializationKeys.imdbRating] = value }
    if let value = metascore { dictionary[SerializationKeys.metascore] = value }
    if let value = imdbVotes { dictionary[SerializationKeys.imdbVotes] = value }
    
    
    
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.genre = aDecoder.decodeObject(forKey: SerializationKeys.genre) as? String
    self.poster = aDecoder.decodeObject(forKey: SerializationKeys.poster) as? String
    self.awards = aDecoder.decodeObject(forKey: SerializationKeys.awards) as? String
    self.rated = aDecoder.decodeObject(forKey: SerializationKeys.rated) as? String
    self.website = aDecoder.decodeObject(forKey: SerializationKeys.website) as? String
    self.country = aDecoder.decodeObject(forKey: SerializationKeys.country) as? String
    self.year = aDecoder.decodeObject(forKey: SerializationKeys.year) as? String
    self.director = aDecoder.decodeObject(forKey: SerializationKeys.director) as? String
    self.imdbID =  aDecoder.decodeObject(forKey: SerializationKeys.imdbID) as? String
    self.title =   aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.plot =   aDecoder.decodeObject(forKey: SerializationKeys.plot) as? String
    self.language = aDecoder.decodeObject(forKey: SerializationKeys.language) as? String
    self.dVD = aDecoder.decodeObject(forKey: SerializationKeys.dVD) as? String
    self.ratings = aDecoder.decodeObject(forKey: SerializationKeys.ratings) as? String
    self.released = aDecoder.decodeObject(forKey: SerializationKeys.released) as? String
    self.response = aDecoder.decodeObject(forKey: SerializationKeys.response) as? String
    self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? String
    self.writer = aDecoder.decodeObject(forKey: SerializationKeys.writer) as? String
    self.runtime = aDecoder.decodeObject(forKey: SerializationKeys.runtime) as? String
    self.boxOffice =  aDecoder.decodeObject(forKey: SerializationKeys.boxOffice) as? String
    self.actors =   aDecoder.decodeObject(forKey: SerializationKeys.actors) as? String
    self.production =   aDecoder.decodeObject(forKey: SerializationKeys.production) as? String
    self.imdbRating =  aDecoder.decodeObject(forKey: SerializationKeys.imdbRating) as? String
    self.metascore =   aDecoder.decodeObject(forKey: SerializationKeys.metascore) as? String
    self.imdbVotes =   aDecoder.decodeObject(forKey: SerializationKeys.imdbVotes) as? String
  }

  public func encode(with aCoder: NSCoder) {

    aCoder.encode(genre, forKey: SerializationKeys.genre)
    aCoder.encode(poster, forKey: SerializationKeys.poster)
    aCoder.encode(awards, forKey: SerializationKeys.awards)
    aCoder.encode(website, forKey: SerializationKeys.website)
    aCoder.encode(rated, forKey: SerializationKeys.rated)
    aCoder.encode(country, forKey: SerializationKeys.country)
    aCoder.encode(year, forKey: SerializationKeys.year)
    aCoder.encode(director, forKey: SerializationKeys.director)
    aCoder.encode(imdbID, forKey: SerializationKeys.imdbID)
    aCoder.encode(title, forKey: SerializationKeys.title)
     aCoder.encode(plot, forKey: SerializationKeys.plot)
    
    aCoder.encode(language, forKey: SerializationKeys.language)
    aCoder.encode(dVD, forKey: SerializationKeys.dVD)
    aCoder.encode(ratings, forKey: SerializationKeys.ratings)
    aCoder.encode(released, forKey: SerializationKeys.released)
    aCoder.encode(response, forKey: SerializationKeys.response)
    aCoder.encode(type, forKey: SerializationKeys.type)
    aCoder.encode(writer, forKey: SerializationKeys.writer)
    aCoder.encode(runtime, forKey: SerializationKeys.runtime)
    aCoder.encode(boxOffice, forKey: SerializationKeys.boxOffice)
    aCoder.encode(actors, forKey: SerializationKeys.actors)
     aCoder.encode(production, forKey: SerializationKeys.production)
    
    aCoder.encode(imdbRating, forKey: SerializationKeys.imdbRating)
    aCoder.encode(metascore, forKey: SerializationKeys.metascore)
     aCoder.encode(imdbVotes, forKey: SerializationKeys.imdbVotes)
    
    
    
  }

}
