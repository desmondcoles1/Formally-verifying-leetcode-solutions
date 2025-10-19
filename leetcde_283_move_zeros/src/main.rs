//Given an integer array nums, move all 0's to the end of it 
//while maintaining the relative order of the non-zero elements.
//Note that you must do this in-place without making a copy of the array.
pub fn move_zeroes(nums: &mut Vec<i32>) {
    let n = nums.len();
    for i in (0..n-1).rev(){
        if nums[i] == 0 {
            for j in i..n-1 {
                nums[j]= nums[j+1]
            }
            nums[n-1] = 0;
        } 
    }
}

///test

fn main() {
    let mut nums = [0,0,0,1,0,0,0,0,2,0,1,1,1,0,2,20,1,0,0,0].to_vec();
    move_zeroes(&mut nums);
    //println!("{:?}", move_zeroes(&mut nums))
}


//my solution is not so good, this is better:

pub fn move_zeroes_better(nums: &mut Vec<i32>) {
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


