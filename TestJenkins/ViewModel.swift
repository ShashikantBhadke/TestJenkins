import Combine

final class ViewModel {
    var index = CurrentValueSubject<Int, Never>(0)
    
    func add() {
        index.value += 1
    }
    func remove() {
        index.value -= 1
    }
}
