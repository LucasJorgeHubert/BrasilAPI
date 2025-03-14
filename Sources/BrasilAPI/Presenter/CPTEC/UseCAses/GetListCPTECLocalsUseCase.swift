import Foundation

class GetListCPTECLocalsUseCase {
    private let repository: CPTECRepositoryProtocol
    
    init(repository: CPTECRepositoryProtocol = CPTECRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> [BrasilAPICPTECLocalModel] {
        return try await repository.listLocals()
    }
}
