function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping1(); // in block, in block

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping2(); // in block, out of block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping3(); // SyntaxError

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping4(); // in block, out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

mysteryScoping5(); // SyntaxError

// ================================

// madLib

function madLib(verb, adj, noun){
	let str = `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
	return str;
}

madLib('make', 'best', 'guac');

// ================================

// isSubstring

function isSubstring(searchString, subString){
	return searchString.includes(subString);
}

isSubstring("time to program", "time");
isSubstring("Jump for joy", "joys");

// ================================

// fizzBuzz

function fizzBuzz(array){
	let arr = [];
	for (let i = 0; i< array.length; i++){
		if ( ((array[i] % 3 === 0) || (array[i] % 5 === 0)) && !((array[i] % 3 === 0) && (array[i] % 5 === 0)) ) {
			arr.push(array[i]);
		}
	}
	return arr;
}

fizzBuzz([15,20,21,22]);

// ================================

// isPrime

function isPrime(number){
	if (number < 2){
		return false;
	}

	for (let i = 2; i < number; i++) {
		if (number % i === 0) {
			return false;
		}
	}
	
	return true;
}

isPrime(2);
isPrime(10);
isPrime(15485863);
isPrime(3548563);

// ================================

// sumOfNPrimes

// returns the sum of the first n prime numbers
function sumOfNPrimes(n){
	let sum = 0;
	let counter = 0;
	let i = 2;
	
	while(counter < n){
		if(isPrime(i)){
			sum += i;
			counter++;
		}
		i++;
	}
	
	return sum;
}

sumOfNPrimes(4);

