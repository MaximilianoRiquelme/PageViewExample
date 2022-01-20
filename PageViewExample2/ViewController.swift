//
//  ViewController.swift
//  PageViewExample2
//
//  Created by Maximiliano Riquelme Vera on 10/01/2022.
//

import UIKit

class ViewController: UIViewController
{
    var pageVC: UIPageViewController!
    var controllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVC.dataSource = self
        pageVC.delegate = self
        
        addChild(pageVC)
        view.addSubview(pageVC.view)
        
        applyConstraintsTo(superView: view, subView: pageVC.view)
        setPages(pageVC: pageVC)
    }
    
    private func setPages(pageVC: UIPageViewController) {
        struct Page {
            let title: String
            let text: String
        }
        
        let pages = [
            Page(title: "Page 1", text: "Page 1 - Page 1. This is Page 1, This is Page 1, This is Page 1, This is Page 1, This is Page 1."),
            Page(title: "Page 1", text: "Page 2 - Page 2. This is Page 2, This is Page 2, This is Page 2, This is Page 2, This is Page 2."),
            Page(title: "Page 1", text: "Page 3 - Page 3. This is Page 3, This is Page 3, This is Page 3, This is Page 3, This is Page 3."),
            Page(title: "Page 1", text: "Page 4 - Page 4. This is Page 4, This is Page 4, This is Page 4, This is Page 4, This is Page 4."),
            Page(title: "Page 5", text: "Page 5 - Page 5. This is Page 5, This is Page 5, This is Page 5, This is Page 5, This is Page 5.")
        ]
        
        for page in pages {
            let vc = TextViewController(title: page.title, text: page.text)
            vc.view.backgroundColor = randomColor()
            controllers.append(vc)
        }
        
        pageVC.setViewControllers([controllers[0]], direction: .forward, animated: false)
    }
    
    private func applyConstraintsTo(superView: UIView, subView: UIView) {
        var constraints = [NSLayoutConstraint]()
        
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        constraints.append(subView.leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(subView.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(subView.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor))
        constraints.append(subView.bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }

    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }

    func randomColor() -> UIColor {
        return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1)
    }
}

extension ViewController: UIPageViewControllerDelegate
{
    
}

extension ViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                return controllers[index - 1]
            } else {
                return nil
            }
        }

        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            } else {
                return nil
            }
        }

        return nil
    }
}
