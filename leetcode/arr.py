def sort_k_messed_array(arr, k):
	for i in range(len(arr)):
		x = arr[i]
		j = i-1
		while j >= 0 and arr[j] > x:
			arr[j+1] = arr[j]
			j -= 1
		arr[j+1] = x
	return arr

print(sort_k_messed_array([3, 2, 4, 1], 3))
