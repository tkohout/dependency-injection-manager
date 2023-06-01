# dependency-injection-manager
Dependency Injection Manager PoC

This is a PoC for a homegrown dependency injection manager that contains just basic features such as:
- Dependency registration and resolution
- Resolution always returns an instance or else it crashes
- Modularized registration through assemblies
- Singleton scope support
- Automatic synchronized resolution for singleton scoped instances when accessed outside of the main thread

## Usage

Simple registration and resolution
```
DIManager.register((any GetDataTask).self) { _ in
  return GetDataTaskImpl()
}

// DataStore registered as a singleton
DIManager.register((any DataStore).self) { _ in
  return DataStoreImpl()
}.singleton()

DIManager.register(DataRepository.self) { r in
  return DataRepositoryImpl(
    getDataTask: r.resolve((any GetDataTask).self),
    dataStore: r.resolve((any DataStore).self)
  )
}

let dataRepository = DIManager.resolve(DataRepository.self)
_ = dataRepository.getData(id: "1234")
```

Modularized registration using assemblies
```
final class DataAssembly: DIAssembly {
  func assemble(container: DIContainer) {
    DIManager.register((any DataStore).self) { _ in
      return DataStoreImpl()
    }.singleton()
    
    DIManager.register(DataRepository.self) { r in
      return DataRepositoryImpl(
        getDataTask: r.resolve((any GetDataTask).self),
        dataStore: r.resolve((any DataStore).self)
      )
    }
  }
}

...

DIManager.assemble(assemblies: [
  DataAssembly(),
  ...
])

...

let dataRepository = DIManager.resolve(DataRepository.self)
_ = dataRepository.getData(id: "1234")
```
