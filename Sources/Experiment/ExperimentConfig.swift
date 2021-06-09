//
//  ExperimentConfig.swift
//  Experiment
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

public enum Source {
    case LocalStorage
    case InitialVariants
}

public struct ExperimentConfig {

    public private(set) var debug: Bool = ExperimentConfig.Defaults.debug
    public private(set) var fallbackVariant: Variant = ExperimentConfig.Defaults.fallbackVariant
    public private(set) var initialVariants: [String: Variant] = ExperimentConfig.Defaults.initialVariants
    public private(set) var source: Source = ExperimentConfig.Defaults.source
    public private(set) var serverUrl: String = ExperimentConfig.Defaults.serverUrl
    public private(set) var fetchTimeoutMillis: Int = ExperimentConfig.Defaults.fetchTimeoutMillis
    
    public init() {
        // Default Config
    }

    internal struct Defaults {
        static let debug: Bool = false
        static let fallbackVariant: Variant = Variant()
        static let initialVariants: [String: Variant] = [:]
        static let source: Source = Source.LocalStorage
        static let serverUrl: String = "https://api.lab.amplitude.com"
        static let fetchTimeoutMillis: Int = 10000
    }
    
    public class Builder {
        
        private var config = ExperimentConfig()
        
        public init() {
            // public init
        }
        
        public func debug(_ debug: Bool) -> Builder {
            config.debug = debug
            return self
        }
        
        public func fallbackVariant(_ fallbackVariant: Variant) -> Builder {
            config.fallbackVariant = fallbackVariant
            return self
        }
        
        public func initialVariants(_ initialVariants: [String: Variant]) -> Builder {
            config.initialVariants = initialVariants
            return self
        }
        
        public func source(_ source: Source) -> Builder {
            config.source = source
            return self
        }
        
        public func serverUrl(_ serverUrl: String) -> Builder {
            config.serverUrl = serverUrl
            return self
        }
        
        public func fetchTimeoutMillis(_ fetchTimeoutMillis: Int) -> Builder {
            config.fetchTimeoutMillis = fetchTimeoutMillis
            return self
        }
        
        public func build() -> ExperimentConfig {
            return config
        }
    }

    internal struct Constants {
        // Version string is matched in release.config.js
        // Changing this may result in breaking automated releases
        internal static let Version: String = "1.0.2"
        internal static let Library: String = "experiment-ios-client"
    }
}
