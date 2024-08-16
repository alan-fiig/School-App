document.addEventListener("turbo:load", () => {
  const selectAllCheckbox = document.getElementById("select_all");
  const checkboxes = document.querySelectorAll(
    'input[name="subject[group][]"]'
  );
  const errorDiv = document.getElementById("group-error");
  const form = document.getElementById("subject_form");

  // Manejar el evento de cambio en el checkbox de seleccionar/deseleccionar todo
  if (selectAllCheckbox) {
    selectAllCheckbox.addEventListener("change", (event) => {
      const isChecked = event.target.checked;
      checkboxes.forEach((checkbox) => {
        checkbox.checked = isChecked;
      });
    });
  }

  // Manejar la validación al enviar el formulario
  if (form) {
    form.addEventListener("submit", function (event) {
      let checkedOne = Array.prototype.slice
        .call(checkboxes)
        .some((x) => x.checked);

      if (!checkedOne) {
        event.preventDefault(); // Prevent form submission
        errorDiv.style.display = "block";
      } else {
        errorDiv.style.display = "none";
      }
    });
  }
});
