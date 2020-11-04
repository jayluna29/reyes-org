({
	myAction : function(component, event, helper) {
		
	},
     grabAddress: function(component, event, helper){
        // Set input values to attributes
        var streetInput = component.find("leadFieldStreet").get("v.value");
        var cityInput = component.find("leadFieldCity").get("v.value");
        var stateInput = component.find("leadFieldState").get("v.value");
        var zipInput = component.find("leadFieldZip").get("v.value");
        var countryInput = component.find("leadFieldCountry").get("v.value");
        
        /*
        console.log(streetInput);
        console.log(cityInput);
        console.log(stateInput);
        console.log(zipInput);
        console.log(countryInput);*/
        
        component.set("v.mapMarkers", "");
        
        // Create a local variable that stores grabbed values
        component.set("v.mapMarkers", [
            {
                location: {
                    Street: streetInput,
                    City: cityInput,
                    State: stateInput,
                    Zip: zipInput,
                    Country: countryInput
                },
                title: 'Pinned Address'
                
            }
        ]);
        component.set('v.zoomLevel', 16);
        
    },
})