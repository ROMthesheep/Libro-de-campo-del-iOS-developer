//: [Previous](@previous)

import Foundation

/**
 El patrón Command es un patrón de diseño conductual que encapsula una acción y se utiliza para definir acciones de comando concretas. Estos comandos concretos se utilizan para la ejecución diferida o para agregar comportamiento dinámico al invocador. Los tipos de comandos facilitan mucho la construcción de componentes genéricos que delegan o ejecutan llamadas a métodos de manera dinámica, dependiendo de implementaciones concretas que se asignan al invocador a través de la agregación.

 El patrón Command se implementa usando varios bloques de construcción: protocolo de comando, tipos de comando concreto, invocador y llamador. Desglosemos cada componente uno por uno:

    - El Command es un protocolo que define las acciones que se van a ejecutar.
    - Los Concrete command types son tipos que se ajustan al protocolo de Command.
    - El Invoker es un tipo que está conectado con el protocolo de Command a través de la agregación - recibe los comandos que serán ejecutados por el llamador.
    - El Caller es un tipo que actúa como una fuente que inicia acciones y posiblemente necesita obtener algunos resultados de vuelta.
 
 Hemos creado varios reproductores y un control remoto con el dispositivo asignado. Luego podemos manipular ese dispositivo utilizando la interfaz, como resumir y pausar la música. El código que desencadena las acciones y gestiona qué puerta está adjunta al control remoto es el bloque de construcción llamador del patrón de diseño.

 Como puedes ver, podemos cambiar fácilmente el tipo de comando concreto y cambiar la acción resultante del receptor durante el tiempo de ejecución.
 Usamos agregación como una forma de composición porque los dispositivos pueden sobrevivir al control remoto, lo que significa que el control remoto no es propietario del reproductor con el que está comunicando. Esta es una distinción importante con otra forma de composición llamada asociación, sin embargo, no siempre es el caso: la agregación es simplemente más adecuada para este ejemplo en particular.
 
 El patrón de diseño Command es muy beneficioso cuando se requiere que un objeto realice varias acciones sin almacenar todas las acciones posibles dentro de un solo objeto. Este patrón separa las acciones en tipos concretos a través de la conformidad con un protocolo, utilizando un tipo invoker para mantener un objeto de comando responsable de ejecutar acciones específicas. Los objetos de comando concreto contienen acciones que pueden ejecutarse más tarde según los requisitos.
 */

protocol PlayMusicCommand {
    func play()
}

protocol PauseMusicCommand {
    func pause()
}

protocol NextTrackMusicCommand {
    func nextTrack()
}

protocol PreviousTrackMusicCommand {
    func previousTrack()
}

struct SimpleMusicPlayer: PlayMusicCommand,
                          PauseMusicCommand,
                          NextTrackMusicCommand,
                          PreviousTrackMusicCommand  {
    func play() {
        print("Reproductor simple  -> " + #function)
    }
    
    func pause() {
        print("Reproductor simple  -> " + #function)
    }
    
    func nextTrack() {
        print("Reproductor simple -> " + #function)
    }
    
    func previousTrack() {
        print("Reproductor simple -> " + #function)
    }
    
}

struct StandardMusicPlayer: PlayMusicCommand,
                            PauseMusicCommand,
                            NextTrackMusicCommand,
                            PreviousTrackMusicCommand {
    func play() {
        print("Reproductor estandard -> " + #function)
    }
    
    func pause() {
        print("Reproductor estandard -> " + #function)
    }
    
    func nextTrack() {
        print("Reproductor estandard -> " + #function)
    }
    
    func previousTrack() {
        print("Reproductor estandard -> " + #function)
    }
    
    
}

struct SpotifyMusicPlayer: PlayMusicCommand,
                        PauseMusicCommand,
                        NextTrackMusicCommand,
                        PreviousTrackMusicCommand {
    func play() {
        print("Spotify -> " + #function)
    }
    
    func pause() {
        print("Spotify -> " + #function)
    }
    
    func nextTrack() {
        print("Spotify -> " + #function)
    }
    
    func previousTrack() {
        print("Spotify -> " + #function)
    }
}

struct MusicPlayerControl {
    var player: PlayMusicCommand & PauseMusicCommand & NextTrackMusicCommand & PreviousTrackMusicCommand
    
    init(player: PlayMusicCommand & PauseMusicCommand & NextTrackMusicCommand & PreviousTrackMusicCommand) {
        self.player = player
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
}

let simpleMusicPlayer = SimpleMusicPlayer()
let standardMusicPlayer = StandardMusicPlayer()
let spotifyMusicPlayer = SpotifyMusicPlayer()

var controller = MusicPlayerControl(player: simpleMusicPlayer)
controller.play()
controller.pause()

controller.player = standardMusicPlayer
controller.play()
controller.pause()

controller.player = spotifyMusicPlayer
controller.play()
controller.pause()

//: [Next](@next)
