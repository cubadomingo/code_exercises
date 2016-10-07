const sort = (array) => {
  if (array.length <= 1){
    return array;
  };

  let mid_index = Math.floor((array.length - 1) / 2)
  let mid = array[mid_index], under = [], over = [];
  array.splice(mid_index, 1);

  for (var i = 0, len = array.length; i < len; i++) {
    if (array[i] < mid) {
      under.push(array[i])
    } else {
      over.push(array[i])
    }
  }

  return sort(under).concat([mid]).concat(sort(over))
}

module.exports = sort;

console.log(sort([5,1,2,4,3]))
