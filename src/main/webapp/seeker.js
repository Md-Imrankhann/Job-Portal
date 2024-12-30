// Get the skill input and list elements
   const skillInput = document.getElementById('skill-input');
   const skillList = document.getElementById('skill-list');

   // Add event listener to the skill input
   skillInput.addEventListener('keypress', function(event) {
       if (event.key === 'Enter') {
           event.preventDefault();
           const skill = skillInput.value.trim();
           if (skill !== '') {
               // Create a new skill item element
               const skillItem = document.createElement('div');
               skillItem.className = 'skill-item';

               // Create a span element for the skill text
               const skillText = document.createElement('span');
               skillText.textContent = skill;

               // Create a span element for the remove button
               const removeButton = document.createElement('span');
               removeButton.className = 'remove-button';
               removeButton.textContent = 'x';
               removeButton.addEventListener('click', function() {
                   // Remove the skill item from the list
                   skillList.removeChild(skillItem);
               });

               // Append the skill text and remove button to the skill item
               skillItem.appendChild(skillText);
               skillItem.appendChild(removeButton);

               // Append the skill item to the list
               skillList.appendChild(skillItem);

               // Clear the skill input
               skillInput.value = '';
           }
       }
   });
   function toggleExperienceInput() {
       const experiencedRadio = document.getElementById('experienced');
       const experienceDetails = document.getElementById('experience-details');

       // Check if the experienced radio button is selected
       if (experiencedRadio.checked) {
           experienceDetails.style.display = 'block'; // Show the input field
       } else {
           experienceDetails.style.display = 'none'; // Hide the input field
       }
   }
       const nextButton=document.querySelector('.btn-next');
       const prevButton=document.querySelector('.btn-prev');
       const steps=document.querySelectorAll('.step');
       const form_steps=document.querySelectorAll('.form-step');
       let active=1;

       nextButton.addEventListener('click',()=>{
           active++;
           if(active>steps.length){
               active=steps.length;
           }
           updateProgress();
       })

       prevButton.addEventListener('click',()=>{
           active--;
           if(active<1){
               active=1;
           }
           updateProgress();
       })

       const updateProgress=()=>{
           console.log('steps.length =>'+steps.length);
           console.log('acitve=> '+active);
           //toggle .active class for each list item
           steps.forEach((step,i)=>{
               if(i==(active-1)){
                   step.classList.add('active');
                   form_steps[i].classList.add('active');
                   console.log('i=>'+i);
               }else{
                   step.classList.remove('active');
                   form_steps[i].classList.remove('active');
               }
           });
           //enable or disable prev and next buttons
           if(active===1){
               prevButton.disabled=true;
           }else if(active===steps.length){
               nextButton.disabled=true;
           }else{
               prevButton.disabled=false;
               nextButton.disabled=false;
           }
       }
    // Example of a function to fetch qualifications dynamically
       const allQualifications = [
           "High School Diploma",
           "Associate Degree",
           "Bachelor's Degree",
           "Master's Degree",
           "Doctorate",
           "Professional Certification",
           "PhD",
           "Vocational Training",
           // Add more qualifications here...
       ];

       function fetchSuggestions(input) {
           const suggestions = document.getElementById('suggestions');
           suggestions.innerHTML = '';

           if (!input) {
               suggestions.style.display = 'none';
               return;
           }

           
           const filteredQualifications = allQualifications.filter(q =>
               q.toLowerCase().includes(input.toLowerCase())
           );

           if (filteredQualifications.length === 0) {
               suggestions.style.display = 'none';
               return;
           }

           filteredQualifications.forEach(q => {
               const div = document.createElement('div');
               div.textContent = q;
               div.onclick = () => selectSuggestion(q);
               suggestions.appendChild(div);
           });

           suggestions.style.display = 'block';
       }

       function selectSuggestion(value) {
           document.getElementById('highest-qualification').value = value;
           document.getElementById('suggestions').style.display = 'none';
       }

       document.addEventListener('click', function(event) {
           if (!event.target.closest('#highest-qualification')) {
               document.getElementById('suggestions').style.display = 'none';
           }
       });
       function displaySelectedImage(event, elementId) {
           const selectedImage = document.getElementById(elementId);
           const fileInput = event.target;

           if (fileInput.files && fileInput.files[0]) {
               const reader = new FileReader();

               reader.onload = function(e) {
                   selectedImage.src = e.target.result;
               };

               reader.readAsDataURL(fileInput.files[0]);
           }
       }
