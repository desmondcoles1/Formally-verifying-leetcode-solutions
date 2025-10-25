const MAX_SIZE: usize = 100; // maximum number of kids



#[hax_lib::ensures(|result| result.len()==MAX_SIZE)]
pub fn kids_with_candies(candies: [i32; MAX_SIZE], extra_candies: i32) -> [i32; MAX_SIZE] {
    let mut candies_max = candies[0];

    // Find the maximum candy count in vector
    for i in 0..MAX_SIZE {
        if candies[i] > candies_max {
            candies_max = candies[i];
        }
    }

    // Initialize the result array with 0s
    let mut will_have_greatest = [0; MAX_SIZE];

    // Fill the result array
    for i in 0..MAX_SIZE {
        if candies[i] + extra_candies >= candies_max {
            will_have_greatest[i] = 1;
        }
    }

    will_have_greatest
}

fn main (){
    
}
//while loops, and methods both cause issues in lean translation.

//sucessful translation requires for loops instead of while loop.
//no methods
//arrays instead of vectors
