const flatten = (array) => {
  new_array = []
  for (var i = 0, len = array.length; i < len; i++) {
    if (array[i].constructor === Array) {
      new_array = new_array.concat(flatten(array[i]));
    } else {
      new_array.push(array[i])
    }
  }
  return new_array
};

module.exports = flatten;
