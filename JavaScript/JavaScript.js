function isMunchausenNumber(num) {
  const digits = String(num).split('').map(Number);
  const poweredSum = digits.reduce((sum, digit) => sum + Math.pow(digit, digit), 0);
  return poweredSum === num;
}

for (let num = 1; num <= 200000; num++) {
  if (isMunchausenNumber(num)) {
      console.log(num);
  }
}