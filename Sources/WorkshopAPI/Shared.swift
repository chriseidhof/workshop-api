//

import Foundation

public struct Row<Element: Codable>: Codable, Identifiable {
    public var id: UUID
    public var data: Element

    public init(id: UUID, data: Element) {
        self.id = id
        self.data = data
    }
}

extension Row: Equatable where Element: Equatable { }

public struct Workshop: Codable, Equatable {
    public init(name: String, licenseKey: String, createdAt: Date, maxActivations: Int, state: Int) {
        self.name = name
        self.licenseKey = licenseKey
        self.createdAt = createdAt
        self.maxActivations = maxActivations
        self.state = state
    }

    public var name: String
    public var licenseKey: String
    public var createdAt: Date
    public var maxActivations: Int
    public var state: Int
}

public struct Event: Codable {
    public init(body: String, createdAt: Date) {
        self.body = body
        self.createdAt = createdAt
    }

    public var body: String
    public var createdAt: Date
}

public struct WorkshopInfo: Codable, Equatable {
    public init(workshop: Row<Workshop>, activations: Int) {
        self.workshop = workshop
        self.activations = activations
    }

    public var workshop: Row<Workshop>
    public var activations: Int
}


public struct ActivationData: Codable {
    public init(serialNumber: String, name: String, licenseKey: String, createdAt: Date, email: String? = nil, operatingSystemVersion: String? = nil) {
        self.serialNumber = serialNumber
        self.name = name
        self.licenseKey = licenseKey
        self.createdAt = createdAt
        self.email = email
        self.operatingSystemVersion = operatingSystemVersion
    }

    public var serialNumber: String
    public var name: String
    public var licenseKey: String
    public var createdAt: Date
    public var email: String?
    public var operatingSystemVersion: String?
    public var emailOrNil: String { email ?? "<null>" }
    public var operatingSystemVersionOrNil: String { operatingSystemVersion ?? "<null>" }
}

extension WorkshopInfo: Identifiable {
    public var id: some Hashable {
        workshop.id
    }
}
