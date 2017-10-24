extern crate libnotify;


use std::io::prelude::*;
use std::fs::File;
use std::env;


const PATH: &'static str = "/sys/class/power_supply/BAT";
const POWER: &'static str = "power_now";
const ENERGY: &'static str = "energy_now";
const CAP: &'static str = "capacity";
const STAT: &'static str = "status";

// colors
const GREEN: &'static str = "#75DD00";
const YELLOW: &'static str = "#B58900";
const ORANGE: &'static str = "#CB4B16";
const RED: &'static str = "#DC322F";
const CYAN: &'static str = "#2AA198";

/// one function to do all the things
fn main() {
    //let args: Vec<_> = env::args().collect();
    let bat: String = env::args().last().unwrap();

    // open the files we need
    let mut f_cap = File::open(format!("{}{}/{}", PATH, bat, CAP)).unwrap();
    let mut f_pow = File::open(format!("{}{}/{}", PATH, bat, POWER)).unwrap();
    let mut f_en = File::open(format!("{}{}/{}", PATH, bat, ENERGY)).unwrap();
    let mut f_stat = File::open(format!("{}{}/{}", PATH, bat, STAT)).unwrap();

    // create some Strings to contain our information
    let mut capacity = String::new();
    let mut power = String::new();
    let mut energy = String::new();
    let mut status = String::new();

    f_cap.read_to_string(&mut capacity);
    f_pow.read_to_string(&mut power);
    f_en.read_to_string(&mut energy);
    f_stat.read_to_string(&mut status);

    // remove '\n' at the end of the Strings
    capacity.pop();
    power.pop();
    energy.pop();
    status.pop();

    let watts = power.parse::<f32>().unwrap();
    let watt_hours = energy.parse::<f32>().unwrap();
    let mut time_rem: f32 = 0f32;

    if watts != 0f32 {
        time_rem = watt_hours / watts;
    }

    let hours_rem: i32 = time_rem as i32;
    let minutes_rem: i32 = (60f32 * (time_rem - hours_rem as f32)) as i32;

    // build status String
    if status.as_str() == "Charging" {
        println!("⚡{} {}% (chr)", bat, capacity);
        println!("⚡{} {}% (chr)", bat, capacity);
    } else if watts > 0f32 && time_rem > 0f32 {
        println!("⚡{} {}% ({}:{:02})", bat, capacity, hours_rem, minutes_rem);
        println!("⚡{} {}% ({}:{:02})", bat, capacity, hours_rem, minutes_rem);
    } else {
        println!("⚡{} {}%", bat, capacity);
        println!("⚡{} {}%", bat, capacity);
    }

    let real_cap = capacity.parse::<i32>().unwrap();
    if watts as i32 == 0 {
        println!("{}", CYAN);
    } else if real_cap < 10 {
        println!("{}", RED);
        // libnotify::init("batstat").unwrap();
        // let n = libnotify::Notification::new("Battery low!", None, None);
        // n.set_urgency(libnotify::Urgency::Critical);
        // n.show().unwrap();
        // libnotify::uninit();
    } else if real_cap < 25 {
        println!("{}", ORANGE);
    } else if real_cap < 70 {
        println!("{}", YELLOW);
    } else if watts > 0f32 {
        println!("{}", GREEN);
    } else {
        println!("{}", CYAN);
    }
}
