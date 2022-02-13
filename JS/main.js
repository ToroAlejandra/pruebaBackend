const endPoint = "https://swapi.dev/api/people/";

const getData = async (url) => {
  let response = await fetch(url);
  let data = await response.json();

  if (data.next !== null) {
    getData(data.next);
  }
  let tallest = data.results.filter((e) => e.height > 100);
  tallest = tallest.map((e) => {
      return {"name":e.name, "height":e.height}
  });
  return tallest;//data.results.filter((e) => e.height > 100);
};

getData(endPoint).then((res) => {
    console.log(res);
    let addData = '';
    res.forEach(element => {
        addData += `<tr>
          <td>${element.name}</td>
          <td>${element.height}</td>
        </tr>`;
    });
    document.getElementById("show_data").innerHTML = addData;
});

/* const getData = async (url) =>{
    let response = await fetch(url);
    let data = await response.json();
    
    if (data.next !== null) {
        getData(data.next);
    } 
    console.log( data.results.filter(e => e.height > 100));
};

getData(endPoint)
  .then(res => console.log(res)) */
