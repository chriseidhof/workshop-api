import Foundation

// Public API

public struct WrongStatusCode: Error {
    public init(statusCode: Int) {
        self.statusCode = statusCode
    }

    public var statusCode: Int
}


public enum PublicAPICall: Hashable, Codable {
    case messages(workshop: String)
    // todo active, info and generate should be here as well.
}

public struct WorkshopData: Codable, Hashable {
    public init(name: String, licenseKey: String, maxActivations: Int) {
        self.name = name
        self.licenseKey = licenseKey
        self.maxActivations = maxActivations
    }

    public var name: String
    public var licenseKey: String
    public var maxActivations: Int
}

public enum AuthenticatedAPICall: Hashable, Codable {
    case workshops
    case events
    case activations
    case addWorkshop(WorkshopData)
    case updateActivations(UpdateActivations)
    case updateState(UpdateState)
    case updateMetadata(UpdateMetadata)
    case addMessage(AddMessage)
    case removeMessage(RemoveMessage)
    case messages(workshop: String)
}

public struct Message: Codable, Identifiable, Hashable {
    public init(date: Date = Date(), id: UUID = UUID(), text: String, title: String? = nil) {
        self.date = date
        self.id = id
        self.text = text
        self.title = title
    }

    public var date: Date
    public var id: UUID
    public var text: String
    public var title: String?
 }

public struct AddMessage: Codable, Hashable {
    public init(workshop: String, message: Message) {
        self.workshop = workshop
        self.message = message
    }

    public var workshop: String
    public var message: Message
}

public struct RemoveMessage: Codable, Hashable {
    public init(id: UUID) {
        self.id = id
    }


    public var id: UUID
}

public struct UpdateActivations: Codable, Hashable {
    public init(id: UUID, activations: Int) {
        self.id = id
        self.activations = activations
    }

    public var id: UUID
    public var activations: Int
}

public struct UpdateState: Codable, Hashable {
    public init(id: UUID, state: Int) {
        self.id = id
        self.state = state
    }

    public var id: UUID
    public var state: Int
}

public struct UpdateMetadata: Codable, Hashable {
    public init(id: UUID, metadata: WorkshopMetadata) {
        self.id = id
        self.metadata = metadata
    }

    public var id: UUID
    public var metadata: WorkshopMetadata

}
