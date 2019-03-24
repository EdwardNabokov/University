'use strict';

function multiply(a, b) {
  return a * b;
}

function add(a, b) {
  return a + b;
}

function divide(a, b) {
  if (b != 0)
    return a / b;
  else
    return "Dividing by zero!!!";
}

console.log('Answer of multiplying: ' + multiply(3, 4));
console.log('Answer of addition: ' + add(3, 4));
console.log('Answer of dividing: ' + divide(3, 0));

//class definition

console.log(Math.random());

var Person = function(firstname) {
  this.firstname = firstname;
};

Person.prototype.walk = function(){
  console.log("I am walking!");
}

Person.prototype.sayHello = function(){
  console.log("Hello, I'm " + this.firstname);
}

function Student(firstname, subject){
  Person.call(this, firstname);

  this.subject = subject;
}

Student.prototype = Object.create(Person.prototype);
Student.prototype.constructor = Student;

Student.prototype.sayHello = function(){
  console.log("Hello, I'm " + this.firstname + ". I'm studying " + this.subject + ".");
}

Student.prototype.sayGoodBye = function(){
  console.log("Goodbye!");
}

var person1 = new Person("Bred");
var person2 = new Person("Mary");

var person1hello = person1.sayHello;

person1.sayHello();
person2.sayHello();

person1hello.call(person1);

console.log(person1hello === person1.sayHello);
console.log(person1hello === Person.prototype.sayHello);

var student1 = new Student("Janet", "Applied Physics");
student1.sayHello();
student1.walk();
student1.sayGoodBye();

function createObject(photo){
  function ctor() { }
  ctor.prototype = photo;
  return new ctor();
}

Student.prototype = createObject(Person.prototype);

var foo = function() {};

console.log('foo is a Function: ' + (foo instanceof Function));
console.log('foo.prototype is an Object: ' + (foo.prototype instanceof Object));

console.log('***************************************************');

//NUMBERS ****************

console.log(0.1 + 0.2 == 0.30000000000000004);

console.log(Math.sin(3.5));

console.log(parseInt('123', 10));
console.log(parseInt('0010', 2));
console.log(parseInt('11', 2));
console.log(-1/0); //str -> number
var a =  "hello";
let b = "!";
console.log(19 > 18 ? "yes" : "no");
console.log("hello, hellooo!".replace("hello", "Goodbye"));
console.log("hello".toUpperCase());
let temp = {
  name : "Edward",
  surname: "Nabokov",
  "birthday" : {
    day : 27,
    month: 5,
    year: 1998
  }
};


console.log(temp);
console.log(temp.name);
console.log(temp.surname);
console.log(temp.birthday);
console.log(temp["birthday"]);
console.log(temp["birthday"].month);

let temp2 = ["dog", "cat", "hen"];
temp2.push('hehe');
temp2[100] = "fox";
console.log(temp2);
