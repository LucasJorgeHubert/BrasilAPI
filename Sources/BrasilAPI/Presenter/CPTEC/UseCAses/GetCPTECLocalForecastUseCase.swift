import Foundation

class GetCPTECLocalForecastUseCase {
    private let repository: CPTECRepositoryProtocol
    
    init(repository: CPTECRepositoryProtocol = CPTECRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(cityCode: Int, days: Int) async throws -> BrasilAPICPTECForecastModel {
        return try await repository.getForecast(cityCode: cityCode, days: days)
    }
}
