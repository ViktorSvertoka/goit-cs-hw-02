function checkHealth() {

    fetch('/healthchecker')
        .then(response => {
                if (!response.ok) {
                    // Коли статус відповіді вказує на помилку
                    return response.json().then(errorData => {
                        throw new Error(errorData.detail || 'Невідома помилка');
                    });
                }
                return response.json()
            }
        )
        .then(data => {
            console.log(data);
            let responseDiv = document.getElementById('response');
            responseDiv.innerHTML = data.message;
            responseDiv.className = 'response success';
        })
        .catch(error => {
            let errorMessage = error.message;
            // Вилучення тексту після "Error: "
            if (errorMessage.startsWith('Error: ')) {
                errorMessage = errorMessage.substring(7);
            }
            document.getElementById('response').innerHTML = 'Помилка запиту: ' + errorMessage;
            document.getElementById('response').className = 'response error';
        });
}