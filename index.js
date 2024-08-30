console.log('async/await');

async function test1() {
    const pr = Promise.reject(12); // Створюємо проміс, який відразу відхиляється зі значенням 12
    return pr; // Повертаємо цей проміс
}

const t1 = test1(); // Викликаємо функцію test1 і отримуємо проміс
console.log(t1); // Виводимо проміс у консоль

t1
    .then((response) => console.log(response)) // Якщо проміс виконається, ми виведемо значення response
    .catch((error)=> console.log(error)); // Якщо проміс буде відхилений, ми виведемо помилку

const load1 = () => fetch('https://randomuser.me/api/')
    .then((response) => response.json()) // Отримуємо відповідь і перетворюємо її у формат JSON
    .then((data) => console.log(data)); // Виводимо отримані дані у 
 
async function load2() {
    try {
         const res = await fetch('https://randomuser.me/api/');// Очікуємо на відповідь від сервера (await блокує виконання, поки проміс не завершиться)
        const data = await res.json();
        return data;
    } catch (error) {
       console.log('error1');
    }
}
//func load1 === func load2, we use async/await 

async function showData(params) {
    try {
        const data = await load2();
        console.log(data.results.at(0).email);
    } catch (error) {
       console.log('error2');
    }
}
showData();

/* async function name(params) {
    try {
        
    } catch (error) {
        
    }
}
    
const testArrow = async (params) => {
        try {
            
        } catch (error) {
            
        }
    }
*/













