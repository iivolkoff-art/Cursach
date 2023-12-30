use std::io::{self, Read, Write};
use std::net::{TcpListener, TcpStream};
use std::path::Path;
use std::process::Command;
use std::fs::File;

fn handle_client(mut stream: TcpStream) -> io::Result<()> {
    let mut buffer = [0; 1024];

    let bytes_read = stream.read(&mut buffer)?;
    let message = String::from_utf8_lossy(&buffer[..bytes_read]);

    println!("Received message: {}", message);

    if message.trim() == "File" { 
        let file_path = Path::new("E:/uni/Cursach/assets/files/TestsPartOneCPlus.json");

        if let Ok(mut file) = File::open(file_path) {
            let metadata = file.metadata()?;
            let file_size = metadata.len() as u64;
			println!("{}", file_size);
			stream.write_all(&file_size.to_le_bytes())?;
			
            io::copy(&mut file, &mut stream)?;

            println!("Файл успешно отправлен клиенту.");
        } else {
            eprintln!("Ошибка при открытии файла");
        }
    } else { 
        let output = Command::new("python")
            .arg("E:/uni/Cursach/assets/files/Script.py") 
            .output()
            .expect("Не удалось выполнить скрипт");

        if !output.status.success() {
            eprintln!("Ошибка выполнения скрипта:\n{}", String::from_utf8_lossy(&output.stderr));
        } else {
            println!("Скрипт выполнен успешно:\n{}", String::from_utf8_lossy(&output.stdout));
        }

        let _ = stream.write_all(&output.stdout);
    }
    Ok(())
}

fn main() -> io::Result<()> {
    let local = "127.0.0.1:55555";

    let listener = TcpListener::bind(local)?;
    println!("Сервер слушает");

    for stream in listener.incoming() {
        match stream {
            Ok(stream) => {
                std::thread::spawn(move || {
                    if let Err(err) = handle_client(stream) {
                        eprintln!("Ошибка при обработке клиента: {}", err);
                    }
                });
            }
            Err(e) => {
                eprintln!("Ошибка: {}", e);
            }
        }
    }

    Ok(())
}
