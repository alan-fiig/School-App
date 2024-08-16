document.addEventListener("turbo:load", () => {
  const toggleThemeButton = document.getElementById("toggle-theme");
  const htmlElement = document.documentElement;

  // Verificar si el modo oscuro está habilitado en `localStorage`
  const darkModeEnabled = localStorage.getItem("darkMode") === "true";

  // Función para cambiar el ícono del botón según el tema actual
  function toggleIcon() {
    const lightModeIcon = toggleThemeButton.querySelector(".light-mode");
    const darkModeIcon = toggleThemeButton.querySelector(".dark-mode");

    if (htmlElement.classList.contains("dark")) {
      lightModeIcon.style.display = "none";
      darkModeIcon.style.display = "inline";
    } else {
      lightModeIcon.style.display = "inline";
      darkModeIcon.style.display = "none";
    }
  }

  // Aplicar el modo oscuro si está habilitado
  if (darkModeEnabled) {
    htmlElement.classList.add("dark");
  }

  // Cambiar el ícono al cargar la página
  toggleIcon();

  // Agregar evento de clic al botón de cambio de tema
  if (toggleThemeButton) {
    toggleThemeButton.addEventListener("click", () => {
      htmlElement.classList.toggle("dark");

      // Actualizar el estado de modo oscuro en `localStorage`
      const isDarkMode = htmlElement.classList.contains("dark");
      localStorage.setItem("darkMode", isDarkMode.toString());

      // Cambiar el ícono después de cambiar el tema
      toggleIcon();
    });
  }
});
