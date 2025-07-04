@startuml

namespace pex {
  class "pex" <<namespace>> {
    +copy_to_clipboard(string): void
    +get_config_dir(string appname): string
    +get_home_directory(): string
    +get_os() : string
    +get_session_type(): string
    +has_extension(string filename, string extension)
    +read_directory(string): map<string,string> 
    ' Add other utility functions here
  }
}

class PexClippy {
  + PexClippy() : ctor
  + menu() : void
  + readDirectory(): map<string,string>
  -~PexClippy() : dtor  
  - contains(string,string): bool
  ' Add other public methods here
}

' Indicate that Clippy uses pex utilities
PexClippy ..> "pex" : " uses"

' Main method (not a class, but can be noted)
note right of PexClippy
  main(int argv, char ** argv)
end note

@enduml
