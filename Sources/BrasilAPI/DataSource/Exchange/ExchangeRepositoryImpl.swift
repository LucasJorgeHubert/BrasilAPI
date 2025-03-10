import Foundation

public class ExchangeRepositoryImpl: ExchangeRepositoryProtocol {
    
    private let apiDispatcher: APIRequestDispatcherProtocol

    public init(
        apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    public func listCoins() async throws -> [BrasilAPIExchangeCoinModel] {
        return try await apiDispatcher.request(apiRouter: ExchangeAPIRouter.getCoins)
    }
    
    public func getQuotation(coin: String, date: String) async throws -> BrasilAPIExchangeQuotationModel {
        return try await apiDispatcher.request(apiRouter: ExchangeAPIRouter.getQuotation(coin: coin, date: date))
    }
}
