//Given an integer array nums, move all 0's to the end of it 
//while maintaining the relative order of the non-zero elements.
//Note that you must do this in-place without making a copy of the array.
fn main() {

}


//here is a solution that doesn't translate well

pub fn move_zeroes(nums: &mut Vec<i32>) {
    let mut insert_pos = 0;

    // Move all non-zero elements forward
    for i in 0..nums.len() {
        if nums[i] != 0 {
            nums[insert_pos] = nums[i];
            insert_pos += 1;
        }
    }

    // Fill the rest with zeros
    for i in insert_pos..nums.len() {
        nums[i] = 0;
    }
}


// here's another possible solution

pub fn move_zeroes_alt(nums: Vec<i32>) -> Vec<i32> {
    let mut result = vec![];
    let mut zeros = 0;

    for &x in &nums {
        if x != 0 {
            result.push(x);
        } else {
            zeros += 1;
        }
    }

    result.extend(vec![0; zeros]);
    result
}