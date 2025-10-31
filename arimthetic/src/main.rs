fn main() {
}

#[hax_lib::requires(x < 7)]
fn polynomial1(x: u8) -> u8{
    (x-1)*(x-2)*(x+3)
}

#[hax_lib::requires(x < 7)]
fn polynomial11(x: u8) -> u8{
    (x-2)*(x-1)*(x+3)
}

#[hax_lib::requires(x < 7)]
fn polynomial2(x: u8) -> u8{
    x*x*x - 7 * x + 6
}