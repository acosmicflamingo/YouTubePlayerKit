import Foundation

// MARK: - YouTubePlayer+Configuration

public extension YouTubePlayer {
    
    /// A YouTube Player Configuration
    /// - Read more: https://developers.google.com/youtube/player_parameters
    struct Configuration: Hashable {
        
        // MARK: Properties
        
        /// A Boolean value that determines whether
        /// user events are ignored and removed from the event queue.
        /// - Note: This property is excluded from encoding
        public var isUserInteractionEnabled: Bool?
        
        /// A Boolean value that indicates whether HTML5 videos can play Picture in Picture.
        /// - Note: This property is excluded from encoding
        public var allowsPictureInPictureMediaPlayback: Bool?
        
        /// This parameter specifies whether the initial video
        /// will automatically start to play when the player loads
        public var autoPlay: Bool?
        
        /// This parameter specifies the default language that the player
        /// will use to display captions. Set the parameter's value
        ///  to an ISO 639-1 two-letter language code.
        public var captionLanguage: String?
        
        /// Setting the parameter's value to true causes closed
        /// captions to be shown by default, even if the user has turned captions off
        public var captionsClosed: Bool?
        
        /// This parameter specifies the color that will be used in
        /// the player's video progress bar to highlight the amount
        /// of the video that the viewer has already see
        /// - Note: Setting the color parameter to white will disable the modestbranding option.
        public var color: Color?
        
        /// This parameter indicates whether the video player controls are displayed
        public var showControls: Bool?
        
        /// Setting the parameter's value to true causes
        /// the player to not respond to keyboard controls
        public var keyboardControlsDisabled: Bool?
        
        /// Setting the parameter's value to true enables
        /// the player to be controlled via IFrame Player API calls
        public var enableJsAPI: Bool?
        
        /// This parameter specifies the time, measured in seconds
        /// from the start of the video, when the player should stop playing the video
        public var endTime: Int?
        
        /// Setting this parameter to false prevents
        /// the fullscreen button from displaying in the player
        public var showFullscreenButton: Bool?
        
        /// Sets the player's interface language.
        /// The parameter value is an ISO 639-1 two-letter language code or a fully specified locale
        public var language: String?
        
        /// Setting the parameter's value to false causes video annotations to not be shown
        public var showAnnotations: Bool?
        
        /// In the case of a single video player, a true value causes
        /// the player to play the initial video again and again.
        /// In the case of a playlist player (or custom player),
        /// the player plays the entire playlist and then starts again at the first video.
        public var loopEnabled: Bool?
        
        /// This parameter lets you use a YouTube player that does not show a YouTube logo.
        /// Set the parameter value to true to prevent the YouTube logo from displaying in the control bar.
        public var modestBranding: Bool?
        
        /// This parameter controls whether videos play inline or fullscreen on iOS
        public var playInline: Bool?
        
        /// If the rel parameter is set to false, related videos
        /// will come from the same channel as the video that was just played.
        public var showRelatedVideos: Bool?
        
        /// This parameter causes the player to begin playing
        /// the video at the given number of seconds from the start of the video
        public var startTime: Int?
        
        /// This parameter identifies the URL where the player is embedded.
        /// This value is used in YouTube Analytics reporting when the YouTube player is embedded
        public var referrer: String?
        
        // MARK: Initializer
        
        /// Creates a new instance of `YouTubePlayer.Configuration`
        public init(
            isUserInteractionEnabled: Bool? = nil,
            allowsPictureInPictureMediaPlayback: Bool? = nil,
            autoPlay: Bool? = nil,
            captionLanguage: String? = nil,
            captionsClosed: Bool? = nil,
            color: Color? = nil,
            showControls: Bool? = nil,
            keyboardControlsDisabled: Bool? = nil,
            enableJsAPI: Bool? = nil,
            endTime: Int? = nil,
            showFullscreenButton: Bool? = nil,
            language: String? = nil,
            showAnnotations: Bool? = nil,
            loopEnabled: Bool? = nil,
            modestBranding: Bool? = nil,
            playInline: Bool? = nil,
            showRelatedVideos: Bool? = nil,
            startTime: Int? = nil,
            referrer: String? = nil
        ) {
            self.isUserInteractionEnabled = isUserInteractionEnabled
            self.allowsPictureInPictureMediaPlayback = allowsPictureInPictureMediaPlayback
            self.autoPlay = autoPlay
            self.captionLanguage = captionLanguage
            self.captionsClosed = captionsClosed
            self.color = color
            self.showControls = showControls
            self.keyboardControlsDisabled = keyboardControlsDisabled
            self.enableJsAPI = enableJsAPI
            self.endTime = endTime
            self.showFullscreenButton = showFullscreenButton
            self.language = language
            self.showAnnotations = showAnnotations
            self.loopEnabled = loopEnabled
            self.modestBranding = modestBranding
            self.playInline = playInline
            self.showRelatedVideos = showRelatedVideos
            self.startTime = startTime
            self.referrer = referrer
        }
        
    }
    
}

// MARK: - Configuration+init(configure:)

public extension YouTubePlayer.Configuration {
    
    /// Creates a new instance of `YouTubePlayer.Configuration`
    /// - Parameter configure: The configure closure
    init(
        configure: (inout Self) -> Void
    ) {
        // Initialize mutable YouTubePlayer Configuration
        var playerConfiguration = Self()
        // Configure Configuration
        configure(&playerConfiguration)
        // Initialize
        self = playerConfiguration
    }
    
}


// MARK: - Encodable

extension YouTubePlayer.Configuration: Encodable {
    
    /// The CodingKeys
    enum CodingKeys: String, CodingKey {
        case autoPlay = "autoplay"
        case captionLanguage = "cc_lang_pref"
        case captionsClosed = "cc_load_policy"
        case color
        case showControls = "controls"
        case keyboardControlsDisabled = "disablekb"
        case enableJsAPI = "enablejsapi"
        case endTime = "end"
        case showFullscreenButton = "fs"
        case language = "hl"
        case showAnnotations = "iv_load_policy"
        case list
        case listType
        case loopEnabled = "loop"
        case modestBranding = "modestbranding"
        case origin
        case playInline = "playsinline"
        case showRelatedVideos = "rel"
        case startTime = "start"
        case referrer = "widget_referrer"
    }
    
    /// Encode to Encoder
    /// - Parameter encoder: The Encoder
    public func encode(
        to encoder: Encoder
    ) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.autoPlay?.bit, forKey: .autoPlay)
        try container.encodeIfPresent(self.captionLanguage, forKey: .captionLanguage)
        try container.encodeIfPresent(self.captionsClosed?.bit, forKey: .captionsClosed)
        try container.encodeIfPresent(self.color, forKey: .color)
        try container.encodeIfPresent(self.showControls?.bit, forKey: .showControls)
        try container.encodeIfPresent(self.keyboardControlsDisabled?.bit, forKey: .keyboardControlsDisabled)
        try container.encodeIfPresent(self.enableJsAPI?.bit, forKey: .enableJsAPI)
        try container.encodeIfPresent(self.endTime, forKey: .endTime)
        try container.encodeIfPresent(self.showFullscreenButton?.bit, forKey: .showFullscreenButton)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.showAnnotations.flatMap { $0 ? 1 : 3 }, forKey: .showAnnotations)
        try container.encodeIfPresent(self.loopEnabled?.bit, forKey: .loopEnabled)
        try container.encodeIfPresent(self.modestBranding?.bit, forKey: .modestBranding)
        try container.encodeIfPresent(self.playInline?.bit, forKey: .playInline)
        try container.encodeIfPresent(self.showRelatedVideos?.bit, forKey: .showRelatedVideos)
        try container.encodeIfPresent(self.startTime, forKey: .startTime)
        try container.encodeIfPresent(self.referrer, forKey: .referrer)
    }
    
}

// MARK: - Bool+bit

private extension Bool {
    
    /// The Binary Digit (bit) representation of this Bool value
    var bit: Int {
        self ? 1 : 0
    }
    
}
