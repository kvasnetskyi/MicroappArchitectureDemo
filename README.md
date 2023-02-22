# Microapp Architecture Demo
The application provides an example of a Microapp architecture implementation using the Swift Package Manager.

More theory can be found below. Also, you can find more information in a [presentation](https://www.icloud.com/keynote/05djyPSMLk4tcXk1bA6WmiJCQ#Microapp_Report) and [video](https://chiswdevelopment-my.sharepoint.com/:v:/g/personal/oksana_fedoseeva_chisw_com/EVRrMBkI919Jj4nUdbaUeGMBcFZ90btRZKk6IxDofLPwZQ).

1. [Problem](#problem)
2. [Modular Architecture](#modular-architecture)
3. [Methods of implementing modularity](#methods-of-implementing-modularity)
4. [Microapps architecture](#microapps-architecture)

# Problem

In projects with a large code base, it can be painful to build and launch projects. It's time-consuming during development and testing. This is especially noticeable when working with SwiftUI Canvas, which is impossible to work with in Legacy projects.

In addition, when working in a large development team very often we have to solve merge conflicts related to the project file, which also becomes routine. The applications we are used to seeing consisting of a single project file and containing all the above mentioned problems are called monolith. But sometimes a part of the application is complex and large enough to be treated as a separate product, maybe even reused in other applications.

This is where modularity comes in and is the key to creating software that can be scaled up and maintained over time, forgetting the issues mentioned above.

# Modular Architecture

**Modular architecture** is a software design method that emphasizes the separation of program functionality into independent interchangeable modules. The application runs modules, the modules can depend on each other without cyclic dependencies, and on external dependencies.

This is an abstract pattern. It does not work like MVC or MVVM. Within each module, you can use the desired architecture, which will vary depending on the specific functions of the application. For example, you may have modules written in UIKit with MVP architecture, and SwiftUI modules written in MVVM.

The advantages of this approach are:
- **Build time**

Changing one functional module will not affect other modules. And the application will compile faster by recompiling only the changed module.

- **Isolation of Change**

When developing in modules, there is clear responsibility for an area of code in the project, and when doing merge-requests it is easy to see which module is affected.

- **Fast testing**

Tests are run only under a specific module.

# Methods of implementing modularity

You can implement modularity in IOS in different ways, for example, you can put individual modules in:
- [Framework](#framework)
- [Git Submodule](#git-submodule)
- [Subproject](#subproject)
- Cocoapods/SPM

In this implementation you will see an example with SPM.

## Framework

You can create a separate framework using Xcode to store your modules.

You can create a module by going to:

*File -> New -> Project -> Framework -> Place Framework in the folder with workspace and select Add To Workspace*.

To import modules:

*Target -> General -> Frameworks, Libraries, and Embedded Content -> Add button -> Select Module*

A more detailed implementation of the modular architecture with this approach can be found at the [link](https://medium.com/tokopedia-engineering/getting-started-with-ios-app-modularization-an-introduction-e1ee1b3ead6a).

## Git Submodule

You can configure your git to work with Git submodules.

Submodules allow you to save a Git repository as a subdirectory of another Git repository. This allows you to clone another repository into your project and keep your commits separate. This approach works well with the previous one. For example, if you are going to reuse the Xcode Framework in multiple projects, or if you simply want to work with different Git repositories for the convenience of a large team.

To add a submodule, type the commands via the terminal:
```sh
cd pathToProject
git submodule add yourLinkToSomeRepo
git submodule update --init --recursive
```

More information about the sub-modules can be found [here](https://github.blog/2016-02-01-working-with-submodules/).

## Subproject

Your subproject is a normal Xcode project with a Static Library, through which you will connect the module.

1. Create a Static Library target in your subproject:

*Project > Add target > Static Library*

2. Share the files from the project target with the Static Library target.

3. Drag the project file of your module into the main project. After that – specify **Header search path** in Build Settings. Basically, this is just the path to the folder with your modules. If you have more than one module, select the recursive option.

4. Link binary:

*Build Phase > Link Binary With Libraries > select your Static Library > mark as Required.*

5. Add your library to **Target Dependencies**:

*Build Phase > Target Dependencies > select your Static Library*

More information can be found [here](https://www.cocoanetics.com/2011/12/sub-projects-in-xcode/).

# Microapps architecture
One approach to modularity. This approach differs from the others in that it uses applications for specific modules, called micro-applications. They are used as a tool for fast development and testing.

![photo_2023-02-22_14 43 23-removebg-preview](https://user-images.githubusercontent.com/67891065/220623797-65cd1a67-0b35-4ddd-9480-556878166e4c.png)

Conventionally, the modules in this architecture can be divided into:
- **Utility**

Contains logic that will hardly ever be changed. The most common ones are extensions, helpers, formatters, protocols, base classes and more.

- **Foundation**

Contains business and low-level logic. This includes network, local databases and other managers/services.

- **UI**

Contains reusable UI and resources. This may include View, ViewControllers, Assets, Localizations, etc.

- **Feature**

Contains the features of the application. It also contains the UI and resources that will not be reused. Each feature module can have one or more specialized micro-applications that the teams work on to get quick feedback on the development and testing changes.

Developed By
------------

* Kvasnetskyi Artem, Kosyi Vlad, CHI Software

License
--------

Copyright 2023 CHI Software.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
