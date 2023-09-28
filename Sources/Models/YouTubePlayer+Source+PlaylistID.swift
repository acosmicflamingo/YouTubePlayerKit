import Foundation

// MARK: - YouTubePlayer+Source+PlaylistID

public extension YouTubePlayer.Source {
    
    /// A playlist identifier.
    enum PlaylistID: Hashable {
        /// Playlist identifier.
        case playlist(String)
        /// An array of video identifiers.
        case videos([String])
    }
    
}

// MARK: - PlaylistID+init(playlist:)

public extension YouTubePlayer.Source.PlaylistID {
    
    /// Creates a new instance of `YouTubePlayer.Source.PlaylistID`
    /// - Parameter playlist: The playlist identifier
    init(
        _ playlist: String
    ) {
        if case let videoIds = playlist.components(separatedBy: ","), videoIds.count > 1 {
            self.init(videoIds)
        } else {
            self = .playlist(playlist)
        }
    }
    
}

// MARK: - PlaylistID+init(videos:)

public extension YouTubePlayer.Source.PlaylistID {
    
    /// Creates a new instance of `YouTubePlayer.Source.PlaylistID`
    /// - Parameter videos: An array of video identifiers
    init(
        _ videos: [String]
    ) {
        self = .videos(videos)
    }
    
}

// MARK: - ExpressibleByStringLiteral

extension YouTubePlayer.Source.PlaylistID: ExpressibleByStringLiteral {
    
    /// Creates a new instance of `YouTubePlayer.Source.PlaylistID`
    /// - Parameter playlist: The playlist identifier
    public init(
        stringLiteral playlist: String
    ) {
        self.init(playlist)
    }
    
}

// MARK: - ExpressibleByArrayLiteral

extension YouTubePlayer.Source.PlaylistID: ExpressibleByArrayLiteral {
    
    /// Creates a new instance of `YouTubePlayer.Source.PlaylistID`
    /// - Parameter videos: An array of video identifiers
    public init(
        arrayLiteral videos: String...
    ) {
        self.init(videos)
    }
    
}

// MARK: - Encodable

extension YouTubePlayer.Source.PlaylistID: Encodable {
    
    /// Encode
    /// - Parameter encoder: The encoder
    public func encode(
        to encoder: Encoder
    ) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .playlist(let playlist):
            try container.encode(playlist)
        case .videos(let videos):
            try container.encode(videos)
        }
    }
    
}

// MARK: - Identifiable

extension YouTubePlayer.Source.PlaylistID: Identifiable {
    
    /// The identifier.
    public var id: String {
        switch self {
        case .playlist(let playlist):
            return playlist
        case .videos(let videos):
            return videos.joined(separator: ",")
        }
    }
    
}
