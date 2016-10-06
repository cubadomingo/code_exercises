const search = (array, item) => {
  let location = -1;
  let low = 0;
  let high = array.length - 1

  if (array === undefined || array.length == 0) {
    return location;
  }

  while (low <= high) {
    mid = Math.floor((high + low) / 2)

    if (array[mid] == item) {
      location = mid;
    };

    if (item < array[mid]) {
      high = mid - 1
    } else {
      low = mid + 1
    };
  }

  return location;
};

module.exports = search;
