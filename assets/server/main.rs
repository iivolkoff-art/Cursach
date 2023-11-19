use std::borrow::Cow;
use std::net::{TcpListener, TcpStream};
use std::io::{Read, Write};
use std::process::Command;


fn handle_client(mut stream: TcpStream) {
    let mut buffer = [0; 1024];

    // From Client
    let _ = stream.read(&mut buffer);

    println!("Received message: {}", String::from_utf8_lossy(&buffer));

    // connecting to script
    let output = Command::new("python")
        .arg("C:/qtProjects/newCursach/Script.py")  // Укажите путь к вашему Python-скрипту
        .output()
        .expect("Не удалось выполнить скрипт");

    if !output.status.success() {
        eprintln!("Ошибка выполнения скрипта:\n{}", String::from_utf8_lossy(&output.stderr));
    } else {
        println!("Скрипт выполнен успешно:\n{}", String::from_utf8_lossy(&output.stdout));
    }

    // To client
    let _ = stream.write((String::from_utf8_lossy(&output.stdout)).as_bytes());
}

fn main() {
    let mobileWeb = String::from("192.168.43.24:55555");
    let local = String::from("127.0.0.1:55555");
    let listener = TcpListener::bind(local).unwrap();
    println!("Server listening");

    for stream in listener.incoming() {
        match stream {
            Ok(stream) => {
                std::thread::spawn(move || {
                    handle_client(stream);
                });
            }
            Err(e) => {
                eprintln!("Error: {}", e);
            }
        }
    }
}