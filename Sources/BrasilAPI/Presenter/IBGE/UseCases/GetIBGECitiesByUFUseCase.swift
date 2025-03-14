import Foundation

class GetIBGECitiesByUFUseCase {
    private let repository: IBGERepositoryProtocol
    
    init(repository: IBGERepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(uf: String) async throws -> [BrasilAPIIBGECityModel] {
        return try await repository.getCities(by: uf)
    }
}
