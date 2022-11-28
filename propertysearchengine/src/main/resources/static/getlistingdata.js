var mls = sessionStorage.getItem("mls")
var hasData = true;

var viewall_api_url = "http://localhost:8080/api/v1/property/viewalisting?mls=" + mls;

async function getAPI(url){
    const response = await fetch(url);
    var data = await response.json();
    console.log(data);
    if (data.error != null) {
        hasData = false;
    }
    console.log(hasData);
    show(data, hasData);
}


getAPI(viewall_api_url);

function show(data, hasData){
    var title = document.getElementsByClassName('title')
    if (hasData) {
        title[0].textContent = "Details for property #" + mls
        let tab = 
            `<tr> 
                <th>MLS</th>
                <th>Price</th>
                <th>Address</th>
                <th>Property Type</th>
                <th>Bed</th>
                <th>Bath</th>
                <th>Year Built</th>
                <th>Seller Email</th>
            </tr>`;

        tab += `
            <tr>
                <td>${data.mls}</td>
                <td>${data.price}</td>
                <td>${data.address}</td>
                <td>${data.propertyType}</td>
                <td>${data.bedrooms}</td>
                <td>${data.bathrooms}</td>
                <td>${data.yearBuilt}</td>
                <td>${data.listingUserID}</td>
            </tr>`;

        document.getElementById("listings").innerHTML = tab;
    }
    else{
        title[0].textContent = "This property does not exist!";
    }
}

