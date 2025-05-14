# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    # key insight: it is sorted, so duplicates will b next to each other
    # need to start from the beginning
    # iterate through each item in the array
    # do not advance write index until the next value of the read index is different
    # when the write index is diff
    write_index = 0
    nums.each_with_index do |num, read_index|
        if nums[write_index] == num 
            if write_index == read_index
                ##i.e. index 0. just want to move on
                write_index += 1
                write_index
            end
        else 
            nums[write_index] = num
            write_index += 1

        end
    end
end