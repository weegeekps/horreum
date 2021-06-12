#[macro_use]
extern crate rocket;
#[macro_use]
extern crate diesel;

#[get("/health")]
fn health_check() -> &'static str {
    "ok"
}

// Not using launch here because of a warning I can't suppress in CLion. This code is equivalent.
#[rocket::main]
async fn main() {
    let r = rocket::build()
        .mount("/", routes![health_check]);

    let _ = r.launch().await;
}
