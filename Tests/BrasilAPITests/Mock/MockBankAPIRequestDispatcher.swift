import Foundation
import BrasilAPI

class MockBankAPIRequestDispatcher: APIRequestDispatcherProtocol {
    
    func request<T: Codable>(apiRouter: APIRouterProtocol) async throws -> T {
        let jsonFileName = resolveMockFileName(for: apiRouter)
        
        guard let jsonData = loadMockJSON(named: jsonFileName) else {
            throw BrasilAPIRequestError.badUrl
        }
        
        return try JSONDecoder().decode(T.self, from: jsonData)
    }
    
    private func resolveMockFileName(for apiRouter: APIRouterProtocol) -> String {
        switch apiRouter {
        case is BankAPIRouter:
            return APIResolver.Bank.resolve(for: apiRouter)
        case is ExchangeAPIRouter:
            return APIResolver.Exchange.resolve(for: apiRouter)
        case is ZipCodeAPIRouter:
            return APIResolver.ZipCode.resolve(for: apiRouter)
        case is CNPJAPIRouter:
            return APIResolver.CNPJ.resolve(for: apiRouter)
        case is BrokerAPIRouter:
            return APIResolver.Broker.resolve(for: apiRouter)
        case is CPTECAPIRouter:
            return APIResolver.CPTEC.resolve(for: apiRouter)
        case is DDDAPIRouter:
            return APIResolver.DDD.resolve(for: apiRouter)
        case is HolidaysAPIRouter:
            return APIResolver.Holidays.resolve(for: apiRouter)
        case is FIPEAPIRouter:
            return APIResolver.FIPE.resolve(for: apiRouter)
        case is IBGEAPIRouter:
            return APIResolver.IBGE.resolve(for: apiRouter)
        case is DataSource.ISBN.APIRouter:
            return APIResolver.ISBN.resolve(for: apiRouter)
        default:
            return "default_mock"
        }
    }
    
    private func loadMockJSON(named fileName: String) -> Data? {
        guard let url = Bundle.module.url(forResource: fileName, withExtension: "json") else {
            print("❌ JSON \(fileName).json not found")
            return nil
        }
        
        return try? Data(contentsOf: url)
    }
}

