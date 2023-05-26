# dependency-injection-manager
Dependency Injection Manager PoC

This is a PoC for a homegrown dependency injection manager that contains just basic features such as dependency registration and resolution, assemblies and singleton scope support.

## Usage

Simple registration and resolution
```
DIManager.register((any GetPersonaTask).self) { _ in
  return GetPersonaTaskImpl()
}

// PersonaStore registered as a singleton
DIManager.register((any PersonaStore).self) { _ in
  return PersonaStoreImpl()
}.singleton()

DIManager.register(PersonaRepository.self) { r in
  return PersonaRepositoryImpl(
    getPersonaTask: r.resolve((any GetPersonaTask).self),
    personaStore: r.resolve((any PersonaStore).self)
  )
}

let personaRepository = DIManager.resolve(PersonaRepository.self)
_ = personaRepository.getPersona(id: "1234")
```

Modularized registration using assemblies
```
final class PersonaAssembly: DIAssembly {
  func assemble(container: DIContainer) {
    DIManager.register((any PersonaStore).self) { _ in
      return PersonaStoreImpl()
    }.singleton()
    
    DIManager.register(PersonaRepository.self) { r in
      return PersonaRepositoryImpl(
        getPersonaTask: r.resolve((any GetPersonaTask).self),
        personaStore: r.resolve((any PersonaStore).self)
      )
    }
  }
}

...

DIManager.assemble(assemblies: [
  PersonaAssembly(),
  ...
])

...

let personaRepository = DIManager.resolve(PersonaRepository.self)
_ = personaRepository.getPersona(id: "1234")
```
