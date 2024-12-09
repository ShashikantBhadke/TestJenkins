import UIKit
import Combine

final class ViewController: UIViewController {
    // MARK: - Variables
    private let vStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private let hStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private let displayLable: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(" + ", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let removeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(" - ", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let viewModel = ViewModel()
    private var disposeBag = Set<AnyCancellable>()
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayoutToView()
        setLabelData()
        setActionsToView()
    }
    // MARK: - Custom Methods
    private func addView() {
        view.addSubview(vStackView)
        vStackView.addArrangedSubview(hStackView)
        hStackView.addArrangedSubview(addButton)
        hStackView.addArrangedSubview(displayLable)
        hStackView.addArrangedSubview(removeButton)
    }
    private func setLayoutToView() {
        let viewLayout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            vStackView.leadingAnchor.constraint(equalTo: viewLayout.leadingAnchor),
            vStackView.trailingAnchor.constraint(equalTo: viewLayout.trailingAnchor),
            vStackView.topAnchor.constraint(equalTo: viewLayout.topAnchor),
            vStackView.bottomAnchor.constraint(equalTo: viewLayout.bottomAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            displayLable.heightAnchor.constraint(equalToConstant: 50),
            removeButton.widthAnchor.constraint(equalToConstant: 50),
            removeButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    private func setLabelData() {
        viewModel.index.subscribe(on: DispatchQueue.main)
            .map { "\($0)" }
            .assign(to: \.text, on: displayLable)
            .store(in: &disposeBag)
    }
    private func setActionsToView() {
        addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
        removeButton.addTarget(self, action: #selector(remove), for: .touchUpInside)
    }
    // MARK: - Action Methods
    @objc func add() {
        viewModel.add()
    }
    @objc func remove() {
        viewModel.remove()
    }
    // MARK: - Deinit
    deinit {
        print(Self.self, " Removed from memory.")
    }
}

