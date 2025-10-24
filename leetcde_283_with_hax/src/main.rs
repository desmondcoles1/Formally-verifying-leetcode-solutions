const MAX_SIZE: usize = 100; // maximum number of kids

pub fn kids_with_candies(candies: [i32; MAX_SIZE], extra_candies: i32, l: usize) -> [i32; MAX_SIZE] {
    let mut candies_max = candies[0];

    // Find the maximum candy count
    for i in 0..l {
        if candies[i] > candies_max {
            candies_max = candies[i];
        }
    }

    // Initialize the result array with 0s
    let mut will_have_greatest = [0; MAX_SIZE];

    // Fill the result array
    for i in 0..l {
        if candies[i] + extra_candies >= candies_max {
            will_have_greatest[i] = 1;
        }
    }

    will_have_greatest
}

fn main() {

}

//while loops, and methods both cause issues in lean translation.