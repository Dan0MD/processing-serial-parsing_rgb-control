# processing-serial-parsing_rgb-control
GUI test app based on Processing(Java), that controls an Arduino RGB led over Serial interface (2022)

My first GUI apps was written in Processing, later transitioned to .NET Framework 4.7.2 + WinForms, then .NET 8 + WPF(Windows Presentation Foundation), and finally ASP.NET Core + Blazor

MCU used: ATMega328P

Arduino Code inspired by AlexGyver: https://alexgyver.ru/lessons/

Processing Download link: https://processing.org/download

For running it you also need to install ControlP5 library: Processing -> Tools -> Manage Tools -> Libraries -> write ControlP5 in search

To run it you just need to connect your Arduino board to PC -> run the Sketch from Processing -> Select COM Port from drop-down list (note: app doesn't load COM ports dynamically)

 ![Alt Text](2022-12-27.png)

