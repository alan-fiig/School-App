document.addEventListener("turbo:load", () => {
  const fileField = document.querySelector('input[type="file"]');
  const previewContainer = document.getElementById("image-preview");

  if (fileField && previewContainer) {
    fileField.addEventListener("change", (event) => {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
          previewContainer.innerHTML = `<img src="${e.target.result}" class="w-full h-full object-cover rounded-full"/>`;
        };
        reader.readAsDataURL(file);
      }
    });
  }
});
