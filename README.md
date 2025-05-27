# Dreamhouse

**Dreamhouse** es un proyecto desarrollado en Salesforce que permite gestionar propiedades y viviendas. Utiliza componentes Lightning y clases Apex para proporcionar una experiencia de usuario interactiva y eficiente.

## Características

- Gestión de propiedades inmobiliarias.
- Visualización de detalles de casas y propiedades.
- Integración con la plataforma Salesforce para una gestión eficiente.
- Implementación de componentes Lightning Web Components (LWC) para mejorar la experiencia del usuario.

## Tecnologías utilizadas

- **Salesforce Apex**: Para la creación de lógica de negocio.
- **Lightning Web Components (LWC)**: Para la creación de componentes personalizados.
- **Salesforce Platform**: Para la integración con la base de datos y las funcionalidades de Salesforce.

## Instalación

1. Clona este repositorio:
    ```bash
    git clone https://github.com/JhonGmez24/Dreamhouse.git
    ```

2. Configura tu proyecto en Salesforce utilizando Salesforce CLI:
    - Asegúrate de tener Salesforce CLI instalado.
    - Conecta tu organización Salesforce con el comando:
      ```bash
      sfdx force:auth:web:login -a MyOrg
      ```

3. Despliega las clases y componentes a tu organización Salesforce:
    ```bash
    sfdx force:source:deploy -p force-app/main/default/classes/HouseService.cls
    sfdx force:source:deploy -p force-app/main/default/lwc/housingMap
    ```

## Uso

1. Abre la aplicación en Salesforce.
2. En la **página de inicio**, agrega el componente **housingMap** desde el **App Builder** de Salesforce.
3. Guarda y activa la página para hacerla predeterminada en tu organización.

## Contribuciones

Si deseas contribuir al proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama para tu característica:
    ```bash
    git checkout -b feature/nueva-caracteristica
    ```
3. Realiza tus cambios y haz commit:
    ```bash
    git commit -m 'Agrega nueva característica'
    ```
4. Envía un pull request.

## Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.

## Autor

- **Jhon Gómez** - Desarrollo de este proyecto en Salesforce.
