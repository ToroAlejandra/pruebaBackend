const endPoint = "https://swapi.dev/api/people/";

const getData = async (url, accumulator=[]) => {
  let response = await fetch(url);
  let data = await response.json();
  let newData = accumulator;

  let tallest = data.results.filter((e) => e.height > 100);
  tallest = tallest.map((e) => {
    return {"name":e.name, "height":e.height}
  });
  if (data.next !== null) {
    newData=[...newData, ...tallest];
    return getData(data.next, newData);
  }
  //console.log( data.results.filter((e) => e.height > 100));
  return newData;
};

getData(endPoint).then((res) => {
    console.log(res);
    let addData = '';
    res.forEach((element,i) => {
        addData += `<tr>
          <td>${i+1}</td>
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
