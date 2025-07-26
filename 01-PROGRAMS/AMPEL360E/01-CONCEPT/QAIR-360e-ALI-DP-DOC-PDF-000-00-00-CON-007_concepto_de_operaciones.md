# Concepto de Operaciones – Aeronave Híbrida-Eléctrica AMPEL360e

**Identificador:** `QAIR-360e-ALI-DP-DOC-PDF-000-00-00-CON-007`
**Versión:** V0.1
*(Borrador inicial para revisión interna, sujeta a modificaciones programáticas)*

**Fecha de emisión:** 26 Julio 2025
**Preparado por:** Departamento de Ingeniería de Sistemas
**Aprobado por:** Dirección de Programa GAIA-QAO / Ingeniería Jefe
**Programa:** AMPEL360e – Aeronave Híbrida-Eléctrica de Nueva Generación para Aviación Regional Sostenible
**Clasificación de Seguridad:** INTERNO RESTRINGIDO
*(NO DISTRIBUIR SIN AUTORIZACIÓN)*

---

## Control de Documento

| Versión | Fecha       | Descripción                 | Autor/Aprobador      |
| :------ | :---------- | :-------------------------- | :------------------- |
| V0.0    | 26 Julio 2025 | Creación inicial del documento ConOps | Sist. Eng. Dept.     |
| V0.1    | 26 Julio 2025 | Borrador para revisión interna | Dir. Prog. / Ing. Jefe |

---

## Tabla de Contenidos

1.  [Introducción](#1-introducción)
    1.1 [Propósito del documento](#11-propósito-del-documento)
    1.2 [Alcance del sistema y sus operaciones](#12-alcance-del-sistema-y-sus-operaciones)
    1.3 [Audiencia prevista](#13-audiencia-prevista)
    1.4 [Contexto del programa GAIA-QAO / AMPEL360e](#14-contexto-del-programa-gaia-qao--ampel360e)
2.  [Descripción General del Sistema AMPEL360e](#2-descripción-general-del-sistema-ampel360e)
    2.1 [Visión y misión operacional](#21-visión-y-misión-operacional)
    2.2 [Capacidades de alto nivel](#22-capacidades-de-alto-nivel)
    2.3 [Componentes principales y su rol operacional](#23-componentes-principales-y-su-rol-operacional)
    2.4 [Entorno operacional](#24-entorno-operacional)
3.  [Usuarios y Partes Interesadas](#3-usuarios-y-partes-interesadas)
    3.1 [Clases de usuarios e interacción](#31-clases-de-usuarios-e-interacción)
    3.2 [Roles y responsabilidades](#32-roles-y-responsabilidades)
    3.3 [Partes interesadas adicionales](#33-partes-interesadas-adicionales)
4.  [Escenarios Operacionales](#4-escenarios-operacionales)
    4.1 [Narrativa general de operación típica (Gate-to-Gate)](#41-narrativa-general-de-operación-típica-gate-to-gate)
    4.2 [Modos de operación del sistema híbrido (Funcionalidad del EMS)](#42-modos-de-operación-del-sistema-híbrido-funcionalidad-del-ems)
    4.3 [Escenarios detallados de misión específicos](#43-escenarios-detallados-de-misión-específicos)
5.  [Características y Atributos Operacionales Clave (Requisitos de Alto Nivel Derivados)](#5-características-y-atributos-operacionales-clave-requisitos-de-alto-nivel-derivados)
    5.1 [Rendimiento Operacional](#51-rendimiento-operacional)
    5.2 [Fiabilidad y Disponibilidad](#52-fiabilidad-y-disponibilidad)
    5.3 [Seguridad y Ciberprotección](#53-seguridad-y-ciberprotección)
    5.4 [Sostenibilidad y Medio Ambiente](#54-sostenibilidad-y-medio-ambiente)
    5.5 [Interoperabilidad](#55-interoperabilidad)
6.  [Restricciones, Suposiciones y Riesgos Iniciales](#6-restricciones-suposiciones-y-riesgos-iniciales)
    6.1 [Restricciones (Técnicas, Regulatorias, Económicas, Temporales)](#61-restricciones-técnicas-regulatorias-económicas-temporales)
    6.2 [Suposiciones (críticas para el éxito del programa, que necesitan verificación y seguimiento)](#62-suposiciones-críticas-para-el-éxito-del-programa-que-necesitan-verificación-y-seguimiento)
    6.3 [Riesgos iniciales (identificación, impacto potencial, mitigación preliminar)](#63-riesgos-iniciales-identificación-impacto-potencial-mitigación-preliminar)
7.  [Glosario de Términos y Acrónimos](#7-glosario-de-términos-y-acrónimos)
8.  [Referencias Normativas y Técnicas](#8-referencias-normativas-y-técnicas)
9.  [Apéndices Técnicos (Descripción de Contenido Esperado)](#9-apéndices-técnicos-descripción-de-contenido-esperado)
    A. [Diagramas de Arquitectura de Alto Nivel del Sistema de Propulsión Híbrido](#a-diagramas-de-arquitectura-de-alto-nivel-del-sistema-de-propulsión-híbrido)
    B. [Perfiles de Misión Tipo](#b-perfiles-de-misión-tipo)
    C. [Esquemas de Flujo de Energía (Energy Flow Diagrams)](#c-esquemas-de-flujo-de-energía-energy-flow-diagrams)
    D. [Análisis Preliminar de Conceptos Operacionales (CONOPS Analysis)](#d-análisis-preliminar-de-conceptos-operacionales-conops-analysis)
[Conclusión](#conclusión)

### Lista de Figuras
*   Figura A-1: Arquitectura de Propulsión Híbrida
*   Figura B-1: Perfil de Misión Típico Regional
*   Figura C-1: Flujo de Energía - Modo Despegue Asistido

### Lista de Tablas
*   Tabla Control de Documento
*   Tabla 6-1: Riesgos Iniciales y Mitigaciones

---

## 1. Introducción

### 1.1 Propósito del documento
Este documento tiene como propósito establecer un entendimiento común y riguroso sobre cómo la aeronave híbrido-eléctrica AMPEL360e operará en un entorno comercial real, desde la perspectiva del usuario y del sistema. Servirá como la base fundacional para la especificación de requisitos detallados (SRS) y la arquitectura de diseño del sistema, siendo crucial para la validación de concepto, la mitigación de riesgos tempranos y el inicio del diálogo de certificación con las autoridades.

Se enfatiza su rol como documento puente entre la visión estratégica del programa GAIA-QAO y la implementación técnica, esencial para la trazabilidad de requisitos operacionales. Es un documento "vivo" en las fases iniciales, sujeto a refinamiento iterativo y actualizaciones programáticas para reflejar el progreso del diseño y los acuerdos con las partes interesadas.

### 1.2 Alcance del sistema y sus operaciones
El sistema AMPEL360e contempla las operaciones de vuelo (gate-to-gate) de una aeronave de transporte regional híbrido-eléctrica de nueva generación, abarcando todas las fases del vuelo: pre-vuelo, taxi, despegue, ascenso, crucero, descenso, aterrizaje y post-vuelo. Los tipos de misión primarios son vuelos de pasajeros regionales de corta y media distancia.

Las interfaces clave del sistema incluyen: la tripulación de vuelo (pilotos), el control de tráfico aéreo (ATC), el personal de tierra (ground crew), los sistemas aeroportuarios (ej., gestión de puertas, sistemas de combustible/carga), las operaciones de mantenimiento y reparación (MRO), y la infraestructura de carga/repostaje. Se excluyen explícitamente operaciones no contempladas en esta fase inicial, como operaciones de carga aérea dedicada, misiones especiales (ej., vigilancia militar, evacuación médica), operación en pistas no pavimentadas, o operación totalmente autónoma.

### 1.3 Audiencia prevista
Este ConOps está dirigido a diversas partes interesadas, con intereses específicos:
*   **Equipo de Ingeniería de Sistemas:** Para la derivación y descomposición de requisitos funcionales, de rendimiento, de interfaz, de seguridad operacional, de ciberseguridad, de mantenibilidad y operacionales del sistema.
*   **Autoridades de Certificación (EASA, FAA, ANACs):** Para comprender el marco de cumplimiento propuesto, la estrategia de certificación de nuevos paradigmas de propulsión y los medios de cumplimiento aceptables. Es un punto de partida para las discusiones de bases de certificación (Certification Basis).
*   **Operadores Aéreos (Aerolíneas de Lanzamiento):** Para la planificación operacional y logística, evaluación económica (TCO), integración en flotas existentes, planificación de requisitos de entrenamiento de tripulaciones y procedimientos operativos estándar (SOPs).
*   **Equipo de Desarrollo de Negocio y Marketing:** Para el posicionamiento de mercado, la articulación del valor diferenciador y los beneficios económicos/medioambientales del AMPEL360e.
*   **Equipo de Mantenimiento y Soporte:** Para la definición de procedimientos de mantenimiento (incluyendo mantenimiento preventivo y predictivo), desarrollo de equipos de soporte en tierra (GSE), requisitos de logística de piezas y gestión del ciclo de vida del producto.
*   **Personal de Tierra (Aeropuertos):** Para la comprensión de procedimientos de turnaround, repostaje/recarga (eléctrica y SAF), y asistencia en la plataforma, con énfasis en la seguridad de sistemas de alta tensión.
*   **Proveedores de Subsistemas/Tecnología Clave:** Para alinear sus desarrollos y la integración de sus componentes con la visión operacional global del sistema AMPEL360e.

### 1.4 Contexto del programa GAIA-QAO / AMPEL360e
El programa GAIA-QAO representa la iniciativa paraguas de sostenibilidad y descarbonización en el ámbito aeroespacial. El AMPEL360e se posiciona como un habilitador clave para esta estrategia, mejorando la eficiencia operativa en la aviación regional.

Destaca por su innovación tecnológica (propulsión híbrida-eléctrica de nueva generación), su propuesta de valor única (reducción significativa del coste operativo, minimización de la huella ambiental y sonora), y su respuesta proactiva a las necesidades de un mercado en evolución con crecientes presiones regulatorias y sociales hacia la sostenibilidad. El programa apunta a una certificación inicial en 2034 y una entrada en servicio (EIS) en 2035.

---

## 2. Descripción General del Sistema AMPEL360e

### 2.1 Visión y misión operacional
**Visión:** Ser el líder indiscutible en aviación regional sostenible y silenciosa, redefiniendo la eficiencia operativa y la conectividad regional.
**Misión:** Proporcionar transporte aéreo eficiente, seguro y de bajo impacto ambiental con un Nivel de Madurez Tecnológica (TRL) validado para vuelos regionales, optimizando el rendimiento, el coste total de propiedad (TCO) y la experiencia del pasajero.

La descarbonización profunda, la eficiencia operativa sobresaliente, la reducción drástica de ruido en las comunidades aeroportuarias y una estrategia de certificación temprana son pilares centrales que diferencian al programa.

### 2.2 Capacidades de alto nivel
El AMPEL360e presenta una arquitectura de propulsión híbrida paralela (motor térmico principal optimizado para crucero, motores eléctricos de asistencia y regeneración de energía) que ofrece beneficios operacionales distintivos, como el "peak power shaving" en despegue y taxi eléctrico.

La configuración aerodinámica de ala-tubo optimizada con flujo laminar pasivo y activo mejora la eficiencia aerodinámica y facilita la integración de la propulsión. Definido para 180–220 pasajeros y una autonomía objetivo de ~3.500 km con reservas reglamentarias y carga útil completa.

Tiene capacidad inherente para operar en la infraestructura aeroportuaria existente (aeropuertos ICAO Código C/D) con mínimas adaptaciones. Contribuye a la reducción de emisiones de CO2 (ej. 30% vs. aeronaves convencionales), NOx y ruido (-X EPNdB) como capacidades clave y diferenciadoras.

### 2.3 Componentes principales y su rol operacional
Cada componente contribuye a la operación híbrida, enfatizando la interoperabilidad y el control centralizado:
*   **Motor térmico (Turbofán de Alta Derivación):** Fuente principal de empuje para el crucero y generación de energía eléctrica para recarga, optimizado para máxima eficiencia en vuelo de crucero y con capacidad de operación con un 100% de Combustible de Aviación Sostenible (SAF).
*   **Generador eléctrico de alta potencia:** Acoplado al motor térmico, convierte eficientemente la energía mecánica en eléctrica para alimentar los motores eléctricos y recargar las baterías.
*   **Batería de soporte de alto voltaje (Li-Ion de alta densidad energética y potencia):** Almacenamiento primario de energía para picos de potencia (despegue, ascenso), taxi eléctrico, soporte de sistemas auxiliares críticos y respaldo de emergencia. Incluye gestión térmica activa y sistema de seguridad.
*   **Motores eléctricos de tracción:** Para propulsión asistida (peak power shaving en despegue y ascenso), reversa eléctrica y capacidad de regeneración de energía durante el descenso.
*   **Sistema de Gestión de Energía (EMS):** El "cerebro" central con algoritmos avanzados de IA para la optimización y control inteligente y dinámico del flujo de energía, priorizando eficiencia (consumo de combustible y energía), seguridad operacional, rendimiento de misión y reducción de emisiones/ruido en tiempo real.
*   **Aviónica digital integrada de próxima generación:** Arquitectura "open-architecture" con sistemas Fly-by-Wire/Light, FMS con gestión de energía optimizada, sistemas de diagnóstico y salud predictiva (PHM) avanzados para motor y batería, y sistemas de seguridad de vuelo mejorados, incluyendo capacidades de asistencia al piloto o autonomía limitada para situaciones de emergencia.
*   **Interfaz Hombre-Máquina (HMI) de la tripulación de vuelo:** Diseño intuitivo de pantallas de cabina y controles ergonómicos para la monitorización y gestión del complejo sistema híbrido, incluyendo indicadores claros del estado de carga de la batería, flujo de energía, modos de propulsión y alarmas/procedimientos. Incorpora realidad aumentada (AR) en el HUD.

### 2.4 Entorno operacional
*   **Aeropuertos comerciales:** Operación fluida en aeropuertos con infraestructura estándar existente (pistas asfaltadas, terminales, servicios de combustible, sistemas de deshielo). Se proyectará la futura integración con infraestructura de recarga eléctrica rápida en puerta o en stand y sistemas de gestión de batería en tierra.
*   **Espacio aéreo:** Cumplimiento total con las regulaciones de EASA y OACI, compatible con procedimientos de ATC/ATM actuales (ej. SESAR, NextGen) y capacidad de integración transparente con futuras evoluciones de gestión de tráfico aéreo para aeronaves de nueva generación (ej., trayectorias optimizadas en 4D para eficiencia energética).
*   **Rutas típicas:** Rutas regionales de corta y media distancia (ej. 500-1500 km), con alta frecuencia de ciclos de vuelo. La optimización de rutas maximizará los beneficios del sistema de propulsión híbrida (ej. mayor porcentaje de vuelo en modo eléctrico asistido, optimización de descenso regenerativo).
*   **Condiciones ambientales:** Operación certificada en el rango completo de temperaturas (tropical a polar), altitudes de aeropuerto y condiciones meteorológicas adversas típicas para aviación comercial (ej. icing, turbulencia severa, tormentas, fuertes vientos, crosswind), con especial atención al rendimiento y gestión térmica del sistema híbrido-eléctrico en condiciones extremas.
*   **Normativa aplicable:** Marco regulatorio de EASA CS-25 (Certification Specifications for Large Aeroplanes) y sus enmiendas específicas para propulsión híbrido-eléctrica y sistemas de alta tensión (ej. EASA Special Conditions para aeronaves innovadoras), ICAO Annexes relevantes (especialmente Annex 6 – Operation of Aircraft, Annex 8 – Airworthiness of Aircraft, Annex 14 – Aerodromes, Annex 16 – Environmental Protection).

---

## 3. Usuarios y Partes Interesadas

### 3.1 Clases de usuarios e interacción
Se describe la interacción de cada clase de usuario con el sistema AMPEL360e, destacando cómo la tecnología híbrida modifica o introduce nuevos paradigmas de interacción y la necesidad de nuevas capacidades/formación y factores humanos:
*   **Pilotos:** Gestión activa y dinámica del sistema de propulsión híbrido (selección de modos, optimización de energía), procedimientos de contingencia para fallos parciales o degradados del sistema híbrido (ej. operación solo térmica, operación eléctrica limitada), y gestión de perfiles de vuelo optimizados para la eficiencia energética y la reducción de ruido. Necesidad de nueva habilitación de tipo y formación específica en sistemas de alta tensión y gestión de energía.
*   **Operadores de aerolíneas:** Planificación de vuelos y redes optimizadas por consumo energético y disponibilidad de infraestructura de carga, gestión de flota híbrida, optimización de rutas considerando puntos de recarga y capacidades de turnaround, así como la integración de datos de rendimiento y mantenimiento para la gestión operativa.
*   **Personal de mantenimiento (Técnicos de Línea y Base):** Diagnóstico y reparación de sistemas de alta tensión con procedimientos de seguridad estrictos (lockout/tagout), gestión avanzada de baterías (monitorización de salud, reemplazo modular, reciclaje al final de vida útil), y mantenimiento predictivo habilitado por los datos de PHM. Requieren formación especializada en sistemas eléctricos de aeronaves y seguridad de alta tensión.
*   **Operadores de flota (Centro de Operaciones de Aerolíneas):** Monitorización remota del rendimiento de la aeronave en tiempo real, eficiencia operativa de la flota, análisis de datos de vuelo y mantenimiento para optimización continua, y gestión de la disponibilidad de la aeronave.
*   **Lessors y entidades financieras:** Evaluación del activo aeronáutico, valor residual proyectado, consideraciones de mantenimiento a largo plazo, obsolescencia tecnológica de componentes clave (especialmente baterías), y cumplimiento de criterios ESG.
*   **Personal de tierra (handling):** Asistencia en el turnaround (pushback, carga/descarga), procedimientos de recarga/repostaje seguros y eficientes, remolque eléctrico (si aplica), y gestión de residuos (incluyendo la logística de baterías al final de su vida útil). Necesitan formación en seguridad eléctrica.

### 3.2 Roles y responsabilidades
Se definirán los roles clave y sus responsabilidades específicas en la operación y mantenimiento del AMPEL360e. Se destacarán las posibles nuevas responsabilidades o modificaciones de roles existentes debido a la tecnología híbrida. Se enfatiza la necesidad crítica de programas de formación específicos (ej. Type Rating, cursos de alta tensión) para la nueva tecnología y los aspectos de factores humanos asociados a la interfaz de la cabina y los procedimientos operacionales.

### 3.3 Partes interesadas adicionales
*   **Autoridades reguladoras (EASA, ICAO, ANACs nacionales):** Proceso de certificación, establecimiento y evolución de normativas para la propulsión avanzada, y definición de Means of Compliance (MoC).
*   **Proveedores clave de tecnología (OEMs de sistemas):** Colaboración estrecha en el desarrollo conjunto, integración, cualificación y certificación de componentes críticos.
*   **Inversores ESG (Environmental, Social, and Governance):** Interés en el impacto ambiental y social positivo del programa, su contribución a los objetivos de descarbonización de la aviación, y su viabilidad financiera a largo plazo.
*   **Autoridades de Tráfico Aéreo (ATC/ATM):** Integración segura y eficiente de la aeronave en el espacio aéreo, gestión de nuevos perfiles de vuelo o capacidades (ej. aproximaciones más silenciosas), y colaboración para la optimización de trayectorias.
*   **Comunidades locales adyacentes a aeropuertos:** Gestión del impacto de ruido y emisiones ultrabajas en las cercanías de los aeropuertos como un factor clave de aceptación social y operativa.
*   **Proveedores de Combustible de Aviación Sostenible (SAF) y de infraestructura de recarga eléctrica:** Colaboración para asegurar la disponibilidad, estandarización y escalabilidad de la infraestructura necesaria.

---

## 4. Escenarios Operacionales

Se requiere una descripción detallada y estructurada para cada escenario, incluyendo:
*   **Pre-condiciones:** Estado inicial del sistema y del entorno (ej. SOC de la batería, condiciones meteorológicas, carga útil, estado de la aeronave).
*   **Disparador:** Evento o comando que inicia el escenario (ej. inicio de pushback, "Cleared for Take-off").
*   **Secuencia de Eventos:** Descripción paso a paso de las interacciones (entre el sistema AMPEL360e, el piloto, ATC, personal de tierra) y el comportamiento esperado del sistema híbrido.
*   **Comportamiento del Sistema Híbrido:** Cómo los componentes específicos (motor térmico, generador, batería, motores eléctricos, EMS) interactúan, cómo se gestiona el flujo de energía de manera dinámica, y las estrategias de control del EMS.
*   **Decisiones Clave:** Puntos de decisión para el piloto o el sistema automático del EMS, y sus implicaciones.
*   **Resultados y Post-condiciones:** Estado final del sistema y del entorno al finalizar el escenario.
*   **Métricas de Rendimiento:** Impacto cuantificable en el consumo de energía (kWh, kg SAF), tiempos (ej. taxi time, turnaround time), emisiones (CO2, NOx, partículas), y ruido (EPNdB).
*   **Consideraciones de Seguridad/Riesgo:** Identificación de riesgos específicos inherentes al escenario (ej. thermal runaway, fallos de alta tensión, pérdida de propulsión) y mitigaciones operacionales o de diseño.

### 4.1 Narrativa general de operación típica (Gate-to-Gate)
Se describe un ciclo de vuelo comercial completo y optimizado para la propulsión híbrida-eléctrica:
*   **Planificación pre-vuelo:** Incluyendo gestión de energía y combustible, selección de perfil de vuelo óptimo y estrategia de recarga.
*   **Taxi-out:** Modo eléctrico, silencioso, cero emisiones.
*   **Despegue:** Híbrido asistido con potencia combinada para "peak power shaving" y reducción de ruido.
*   **Ascenso:** Híbrido/térmico priorizando rendimiento o eficiencia.
*   **Crucero:** Óptimo híbrido con gestión inteligente de la energía por el EMS para maximizar eficiencia y autonomía.
*   **Descenso:** Modo regenerativo, recargando baterías activamente.
*   **Aproximación y aterrizaje:** Gestión de la potencia residual, reversa eléctrica.
*   **Post-vuelo:** Taxi-in eléctrico, recarga/repostaje en puerta, inspección rápida, descarga/embarque y preparación para el siguiente segmento.

### 4.2 Modos de operación del sistema híbrido (Funcionalidad del EMS)
Se describen en detalle los modos operativos clave del sistema híbrido, sus disparadores, los beneficios operacionales y las implicaciones:
*   **Modo Eléctrico Puro (EV):** Principalmente para operaciones en tierra (taxi, pushback) y operaciones auxiliares en plataforma. Enfatizar la significativa reducción de ruido, cero emisiones locales y ahorro de combustible.
*   **Modo Despegue Asistido (Híbrido - Potencia Máxima):** Motores térmicos y eléctricos combinados para la máxima potencia disponible. Detallar los beneficios en performance de campo (distancias de despegue más cortas), reducción de ruido en la comunidad aeroportuaria, y menor estrés en los motores térmicos.
*   **Modo Crucero Eficiente (Híbrido - Optimizado):** Optimización dinámica de la distribución de potencia entre el motor térmico y los motores eléctricos por el EMS para el mejor balance entre consumo de combustible/energía, velocidad, autonomía y huella ambiental. Puede incluir pequeños ciclos de carga/descarga de batería en vuelo.
*   **Modo Regenerativo (Descenso/Aproximación):** Los motores eléctricos actúan como generadores durante el descenso y la aproximación, recuperando energía cinética y potencial para recargar las baterías, lo que reduce el consumo de combustible global para el siguiente ciclo de vuelo.
*   **Modo de Contingencia (Degradado/Fail-Operational):** Operación ante fallos parciales del sistema híbrido (ej. fallo de uno o más motores eléctricos, fallo de una unidad de batería, pérdida parcial del EMS). Describir las implicaciones operacionales (reducción de alcance, velocidad, aumento de consumo), los procedimientos de la tripulación, el rendimiento degradado y las opciones de aterrizaje seguro en aeropuertos alternativos. Diseñado bajo principios de "graceful degradation".
*   **Modo de Carga/Mantenimiento en Tierra:** Conexión a infraestructura de carga eléctrica externa, procedimientos seguros de monitorización, balanceo de celdas y mantenimiento predictivo/correctivo de la batería y el sistema híbrido.

### 4.3 Escenarios detallados de misión específicos
*   **Vuelo regional estándar con turnaround corto:** Enfatizar cómo la tecnología híbrida contribuye a la eficiencia en tierra, los tiempos de recarga/repostaje optimizados, y los procedimientos de embarque/desembarque rápidos para maximizar la utilización de la aeronave. Incluir la gestión de la carga térmica de la batería durante el turnaround rápido.
*   **Vuelo con contingencia eléctrica parcial (ej. fallo de una unidad de batería o un motor eléctrico):** Describir las implicaciones operacionales inmediatas, los procedimientos de la tripulación (checklists), el rendimiento degradado restante (autonomía y velocidad), y las estrategias de mitigación (ej. diversificación a un aeropuerto con mejor infraestructura).
*   **Vuelo de demostración/certificación con perfil de emisiones/ruido reducido:** Detallar cómo se demuestran los objetivos de sostenibilidad (ruido, CO2, NOx) ante las autoridades. Especificar los puntos de prueba clave, la instrumentación necesaria y los procedimientos específicos para la validación.
*   **Vuelo con falla de motor térmico principal:** Procedimientos de operación con potencia reducida o solo eléctrica (modo "limp home"), rendimiento remanente (ej. velocidad y altitud máximas), capacidad de alcanzar un aeropuerto alternativo de manera segura y cumplimiento de los requisitos ETOPS.
*   **Operación en condiciones meteorológicas adversas (ej. icing severo, altas temperaturas):** Impacto en el rendimiento del sistema híbrido (especialmente degradación de la eficiencia de baterías y motores eléctricos, incremento de la carga de sistemas antihielo) y procedimientos operacionales para asegurar la seguridad y el rendimiento, incluyendo el uso de energía adicional para deshielo.
*   **Escenario de Mantenimiento Correctivo con activación de PHM:** Un fallo o una anomalía detectada por el sistema de Prognostics and Health Management (PHM) que dispara una alerta de mantenimiento predictivo, indicando la necesidad de reemplazo de un componente antes de que falle. Mostrar la capacidad de diagnóstico remoto, la modularidad de diseño para el reemplazo rápido de componentes clave (ej. módulo de batería, motor eléctrico), y la minimización del Aircraft On Ground (AOG) time.

---

## 5. Características y Atributos Operacionales Clave (Requisitos de Alto Nivel Derivados)
Estos atributos representan los requisitos de alto nivel que el diseño del sistema debe satisfacer para cumplir con la visión operacional del AMPEL360e.

### 5.1 Rendimiento Operacional
*   **Eficiencia Energética:** Métricas clave de eficiencia (ej. kWh/PAX-km, kg SAF/PAX-km, o equivalente), y la optimización dinámica del consumo de SAF y energía eléctrica para el perfil de misión.
*   **Tiempo de Turnaround:** Objetivo ambicioso para maximizar la utilización de la aeronave (~30-45 min), incluyendo tiempos de recarga eléctrica rápida y repostaje de SAF.
*   **Alcance:** Alcance nominal con reservas para rutas regionales, y variaciones esperadas en función de los modos de operación (ej. con operación degradada).
*   **Velocidad:** Velocidad de crucero óptima en modos híbridos y solo térmico, y techo de servicio operativo.
*   **Performance de Campo:** Distancias de despegue y aterrizaje (Take-Off Run, Landing Roll) en diferentes condiciones de peso, altitud y temperatura, destacando la contribución significativa de la propulsión híbrida a la reducción de estas distancias.
*   **Reducción de Huella Sonora:** Cuantificación del objetivo de reducción en despegue y aterrizaje (ej. -X EPNdB comparado con aeronaves de categoría similar).

### 5.2 Fiabilidad y Disponibilidad
*   **Objetivos Clave:** Objetivo de Dispatch Reliability (DR > 99.x%) y Dispatch On-Time Performance (DOTP > 95.x%) comparable a las mejores prácticas de la industria.
*   **Resiliencia del Sistema:** Estrategias de redundancia (ej. N+1 para componentes críticos de propulsión y energía) para asegurar la tolerancia a fallos, la operación degradada segura (graceful degradation) y la resiliencia ante fallos de componentes híbridos.
*   **Mantenimiento Inteligente:** Integración de Prognostics and Health Management (PHM) para un mantenimiento predictivo y basado en condición, modularidad de componentes para facilitar el reemplazo rápido y reducir el Mean Time To Repair (MTTR).
*   **Vida Útil:** Vida útil esperada de componentes clave, especialmente la batería (número de ciclos de carga/descarga, retención de capacidad).

### 5.3 Seguridad y Ciberprotección
*   **Cumplimiento Normativo:** Adherencia estricta a los estándares de seguridad y certificación: SAE ARP4754A (Guidelines for Development of Civil Aircraft and Systems), RTCA DO-178C (Software Considerations), RTCA DO-254 (Electronic Hardware), y RTCA DO-326A (Airworthiness Security).
*   **Gestión de Riesgos Específicos:** Gestión de riesgos asociados a sistemas de alta tensión (aislamiento, protección contra descargas, gestión térmica de baterías y componentes electrónicos de potencia), software complejo para la gestión de energía, y la interacción entre subsistemas nuevos y heredados.
*   **Ciberseguridad por Diseño:** Definición de una arquitectura de ciberseguridad robusta e integrada desde la fase de diseño, protección contra ataques cibernéticos a los sistemas de control de vuelo, propulsión y datos críticos, incluyendo la seguridad de la cadena de suministro de software y hardware.
*   **Estrategias de Contención:** Estrategias de contención robustas para eventos de seguridad críticos (ej. propagación de thermal runaway de baterías, fallos de motores eléctricos o EMS).

### 5.4 Sostenibilidad y Medio Ambiente
*   **Reducción de Emisiones:** Objetivos cuantificables de reducción de emisiones de CO2 (ej. 30% en vuelo con propulsión híbrida, hasta 80% con 100% SAF), NOx, y partículas en todas las fases del vuelo.
*   **Reducción de Ruido:** Reducción significativa de la huella sonora en despegue y aterrizaje (objetivo de -X EPNdB en comparación con aeronaves de tamaño similar).
*   **Uso de SAF:** Capacidad nativa para operar con un 100% de Combustible de Aviación Sostenible (SAF) sin modificaciones, y análisis de su impacto en la huella de carbono total del ciclo de vida.
*   **Ciclo de Vida del Producto:** Consideración de la reciclabilidad de componentes clave (especialmente baterías y materiales compuestos avanzados) y aplicación de principios de la economía circular y Análisis del Ciclo de Vida (LCA) desde el diseño.
*   **Gestión de Residuos:** Minimización del impacto ambiental en todas las fases, incluyendo la gestión segura y sostenible de residuos electrónicos y de baterías.

### 5.5 Interoperabilidad
*   **Integración ATC/ATM:** Integración perfecta y transparente con sistemas de Control de Tráfico Aéreo (ATC) y Gestión de Tráfico Aéreo (ATM) existentes y futuros (NextGen/SESAR).
*   **Compatibilidad Operacional:** Compatibilidad con sistemas de planificación de vuelos y sistemas de gestión de MRO de aerolíneas (ej. AMOS, TRAX).
*   **Infraestructura Aeroportuaria:** Integración con la infraestructura aeroportuaria actual (sistemas de repostaje de combustible, GSE) y preparación para estándares emergentes de infraestructura de recarga eléctrica rápida para aeronaves.
*   **Flexibilidad de Combustible:** Adaptabilidad a diferentes tipos y proveedores de SAF.

---

## 6. Restricciones, Suposiciones y Riesgos Iniciales

### 6.1 Restricciones (Técnicas, Regulatorias, Económicas, Temporales)
*   **Técnicas:** Limitaciones de peso, volumen y densidad energética de las baterías (ej. densidad energética actual de las baterías de grado aeronáutico no supera X Wh/kg para esta fase del programa), y su impacto en la carga útil y autonomía de la aeronave. TRL mínimos para componentes críticos de seguridad (ej. TRL > 4 al inicio de Fase 0).
*   **Regulatorias:** Cumplimiento estricto con el marco regulatorio actual de CS-25 y sus enmiendas específicas para propulsión híbrida/eléctrica, sin depender de cambios fundamentales en la regulación para la certificación inicial (se priorizan Special Conditions y Means of Compliance existentes o adaptables).
*   **Económicas:** Presupuesto de desarrollo del programa AMPEL360e definido y limitado hasta la certificación tipo. Objetivo de TCO (Total Cost of Ownership) competitivo en el mercado regional.
*   **Temporales:** Fecha de entrada en servicio (EIS) target en 2035, que impone un ciclo de desarrollo agresivo y requiere una optimización de la secuencia de certificación.
*   **Infraestructura:** Requisitos de infraestructura terrestre para recarga y mantenimiento deben ser compatibles con las capacidades existentes en aeropuertos principales con adaptaciones mínimas.

### 6.2 Suposiciones (críticas para el éxito del programa, que necesitan verificación y seguimiento)
*   **Disponibilidad de SAF:** Disponibilidad comercial, escalable y a precios competitivos de Combustible de Aviación Sostenible (SAF) en los mercados clave.
*   **Precios Energéticos:** Estabilidad de precios energéticos (electricidad y SAF) que asegure un modelo de negocio atractivo y un TCO competitivo frente a aeronaves convencionales.
*   **Aceptación de Mercado:** Aceptación por parte de aerolíneas y pasajeros de las nuevas tecnologías y modelos de operación (ej. vuelos con propulsión híbrida, menores niveles de ruido).
*   **Madurez Tecnológica:** Madurez tecnológica de componentes clave (baterías de alta densidad energética y potencia, motores eléctricos de alta eficiencia, EMS avanzado) para alcanzar TRL > 6 al inicio de la fase de diseño detallado.
*   **Apoyo Regulatorio:** Apoyo gubernamental y regulatorio continuo para la aviación sostenible y el desarrollo de sus infraestructuras asociadas (ej. subvenciones, incentivos).
*   **Comunicaciones:** Suficiencia de ancho de banda y latencia para las comunicaciones de la aeronave (ej. para transmisión de datos de PHM, actualizaciones de software seguras).

### 6.3 Riesgos iniciales (identificación, impacto potencial, mitigación preliminar)

| Riesgo | Impacto Potencial | Mitigación Preliminar |
| :--- | :---------------- | :-------------------- |
| **Riesgo Tecnológico - Baterías:** Dificultad en la certificación de las baterías para cumplir con los requisitos aeronáuticos de seguridad (ej. thermal runaway no propagante, crashworthiness, integridad estructural), fiabilidad (ej. ciclos de carga/descarga, degradación de capacidad) y vida útil. | Retrasos significativos en el programa, aumento de costes de desarrollo y operación, no cumplimiento de objetivos de rendimiento. | Investigación y desarrollo intensivo en gestión térmica y diseño de celdas y packs seguros, redundancia y aislamiento de módulos de baterías, pruebas exhaustivas en entornos simulados y reales, colaboración temprana con expertos y fabricantes líderes en baterías. |
| **Riesgo Regulatorio:** Retrasos o cambios inesperados en la regulación específica para aeronaves híbrido-eléctricas, o dificultades en la interpretación de los medios de cumplimiento con las autoridades. | Retrasos en la certificación tipo, necesidad de rediseños costosos, limitaciones operacionales. | Compromiso temprano y continuo con EASA/FAA (Joint Authorities Technical Meeting - JATM), participación activa en grupos de trabajo de estándares, desarrollo de medios de cumplimiento (MOC) propuestos y justificación detallada de los mismos. |
| **Riesgo de Integración de Sistemas:** Dificultad o retraso en la integración de sistemas complejos avanzados (ej. EMS, software de PHM con IA) de múltiples proveedores, resultando en problemas de interoperabilidad o fallos inesperados. | Retrasos en el calendario de desarrollo, aumento de costes de integración, fallos de sistema durante pruebas. | Estrategia de integración de sistemas robusta y bien definida (Model-Based Systems Engineering - MBSE), uso de arquitecturas modulares y interfaces estandarizadas y bien definidas, pruebas de integración tempranas y rigurosas (Hardware-in-the-Loop - HIL). |
| **Riesgo de Cadena de Suministro:** Disrupciones en la cadena de suministro de componentes críticos y especializados (ej. celdas de batería de alta potencia, semiconductores de potencia para inversores), especialmente aquellos específicos para sistemas híbridos. | Retrasos en la producción de prototipos y aeronaves certificables, dependencia de un único proveedor, aumento de costes. | Diversificación de proveedores clave, acuerdos de suministro a largo plazo con cláusulas de contingencia, gestión proactiva de inventarios y buffer stocks, evaluación de la resiliencia de la cadena de suministro. |
| **Riesgo de Ciberseguridad:** Emergencia de nuevas vulnerabilidades o amenazas cibernéticas para los sistemas de alta conectividad de la aeronave (ej. FMS, PHM, sistemas de recarga en tierra), comprometiendo la seguridad operacional o la integridad de los datos. | Comprometimiento de la seguridad operacional (ej. manipulación de controles), pérdida de datos sensibles, daño a la reputación. | Diseño de arquitectura de ciberseguridad robusta por diseño (security-by-design), cumplimiento con DO-326A y ED-202A, pruebas de penetración (penetration testing), auditorías de seguridad continuas y un plan de respuesta a incidentes cibernéticos. |
| **Riesgo de Infraestructura de Recarga:** Desarrollo más lento de la infraestructura aeroportuaria de recarga rápida y segura de lo previsto, limitando la eficiencia operacional de la aeronave. | Limitación de rutas operacionales, mayor tiempo de turnaround, reducción de la ventaja competitiva. | Diseño de la aeronave flexible para diferentes capacidades de carga (lenta/rápida), colaboración activa con operadores aeroportuarios y proveedores de energía, desarrollo de soluciones provisionales (ej. cargadores móviles). |

---

## 7. Glosario de Términos y Acrónimos
*   **ConOps:** Concepto de Operaciones. Documento que describe las características operacionales de un sistema desde la perspectiva del usuario.
*   **EASA:** Agencia Europea de Seguridad Aérea (European Union Aviation Safety Agency).
*   **FAA:** Administración Federal de Aviación (Federal Aviation Administration) de EE. UU.
*   **ANAC:** Agencias Nacionales de Aviación Civil.
*   **CS-25:** Especificaciones de Certificación para Grandes Aviones (Certification Specifications for Large Aeroplanes) de EASA.
*   **SAF:** Combustible de Aviación Sostenible (Sustainable Aviation Fuel).
*   **PHM:** Prognóstico y Gestión de la Salud (Prognostics and Health Management).
*   **EMS:** Sistema de Gestión de Energía (Energy Management System).
*   **TRL:** Nivel de Madurez Tecnológica (Technology Readiness Level).
*   **HMI:** Interfaz Hombre-Máquina (Human-Machine Interface).
*   **ATC:** Control de Tráfico Aéreo (Air Traffic Control).
*   **ATM:** Gestión del Tráfico Aéreo (Air Traffic Management).
*   **DO-178C:** Guía para la Certificación de Software en Sistemas y Equipos Aerotransportados (Software Considerations in Airborne Systems and Equipment Certification).
*   **DO-254:** Guía de Garantía de Diseño para Hardware Electrónico Aerotransportado (Design Assurance Guidance for Airborne Electronic Hardware).
*   **DO-326A:** Especificación del Proceso de Seguridad de Aeronavegabilidad (Airworthiness Security Process Specification).
*   **ARP4754A:** Directrices para el Desarrollo de Aeronaves Civiles y Sistemas (Guidelines for Development of Civil Aircraft and Systems).
*   **DOC:** Documento (Document).
*   **MRO:** Mantenimiento, Reparación y Operaciones (Maintenance, Repair, and Overhaul).
*   **PAX-km:** Pasajeros-kilómetro (Passenger-kilometer). Unidad de medida de la actividad de transporte de pasajeros.
*   **TCO:** Costo Total de Propiedad (Total Cost of Ownership).
*   **DR:** Fiabilidad de Despacho (Dispatch Reliability).
*   **DOTP:** Rendimiento de Puntualidad en el Despacho (Dispatch On-Time Performance).
*   **MTTR:** Tiempo Medio de Reparación (Mean Time To Repair).
*   **ESG:** Ambiental, Social y Gobernanza (Environmental, Social, and Governance).
*   **FMS:** Sistema de Gestión de Vuelo (Flight Management System).
*   **APU:** Unidad de Potencia Auxiliar (Auxiliary Power Unit).
*   **GSE:** Equipo de Soporte en Tierra (Ground Support Equipment).
*   **API:** Interfaz de Programación de Aplicaciones (Application Programming Interface).
*   **LCA:** Análisis del Ciclo de Vida (Life Cycle Assessment).
*   **SOC:** Estado de Carga (State Of Charge) de una batería.
*   **DOD:** Profundidad de Descarga (Depth Of Discharge) de una batería.
*   **Li-Ion:** Ión-Litio (Lithium-Ion). Tipo de batería.
*   **EPNdB:** Decibelios Efectivos Percibidos de Ruido (Effective Perceived Noise Decibels).
*   **MEA:** Aeronave Más Eléctrica (More Electric Aircraft).
*   **AOG:** Aeronave en Tierra (Aircraft On Ground).

---

## 8. Referencias Normativas y Técnicas
*   EASA CS-25 (Certification Specifications for Large Aeroplanes) y sus Enmiendas aplicables, incluyendo Special Conditions para propulsión híbrida/eléctrica.
*   EASA ED Decision (o documentos similares) para Acceptable Means of Compliance y Guidance Material específicos para la certificación de propulsión eléctrica/híbrida y sistemas de alta tensión.
*   RTCA DO-178C (Software Considerations in Airborne Systems and Equipment Certification).
*   RTCA DO-254 (Design Assurance Guidance for Airborne Electronic Hardware).
*   SAE ARP4754A (Guidelines for Development of Civil Aircraft and Systems).
*   RTCA DO-326A y ED-202A (Airworthiness Security Process Specification / Aeronautical Systems Security).
*   ICAO Annexes (especialmente Annex 6 – Operation of Aircraft, Annex 8 – Airworthiness of Aircraft, Annex 14 – Aerodromes, Annex 16 – Environmental Protection).
*   Documentos internos del programa AMPEL360e/GAIA-QAO (ej. Visión del Programa AMPEL360e, Requisitos de Misión Preliminares, Análisis de Mercado).
*   Estándares de la industria relevantes para componentes clave (ej. para baterías aeronáuticas, interfaces de carga eléctrica, sistemas de gestión de energía).

---

## 9. Apéndices Técnicos (Descripción de Contenido Esperado)

### A. Diagramas de Arquitectura de Alto Nivel del Sistema de Propulsión Híbrido
Descripción textual de esquemas que ilustran la interconexión de los componentes clave de la propulsión híbrida (motor térmico, generador, batería, motores eléctricos, EMS), enfatizando los flujos de energía (eléctrica y mecánica) y las interfaces con otros sistemas de la aeronave (ej. sistemas de combustible, eléctrico, aviónica, de control de vuelo, hidráulico).

### B. Perfiles de Misión Tipo
Descripción textual de perfiles de vuelo gráficos (ej. altitud/velocidad vs. tiempo) para misiones típicas de pasajeros, mostrando los diferentes modos de operación del sistema híbrido en cada fase del vuelo (taxi eléctrico, despegue asistido, crucero optimizado, descenso regenerativo) y los puntos clave de gestión de energía (ej. recarga de batería en vuelo, descarga máxima).

### C. Esquemas de Flujo de Energía (Energy Flow Diagrams)
Descripción textual de diagramas que visualicen el flujo de energía entre los componentes del sistema de propulsión híbrida para los modos de operación clave (ej. despegue, crucero, descenso regenerativo), indicando la dirección y magnitud relativa de la potencia y la energía.

### D. Análisis Preliminar de Conceptos Operacionales (CONOPS Analysis)
Descripción de un análisis de trade-offs de alto nivel que justifique las decisiones de diseño operacionales y los modos de operación seleccionados, en relación con los objetivos de rendimiento, seguridad y sostenibilidad del programa.

---

## Conclusión

El Concepto de Operaciones (ConOps) para la aeronave híbrido-eléctrica AMPEL360e establece una base sólida y consensuada para la ingeniería de requisitos y la estrategia de certificación temprana. Este documento es fundamental para alinear la visión operacional entre todas las partes interesadas, sirviendo como un "common operational picture" esencial que facilita la validación de concepto, la mitigación de riesgos tempranos y el inicio del diálogo con las autoridades de certificación.

Se reafirma la viabilidad operacional y ambiental del AMPEL360e como un habilitador clave para la descarbonización de la aviación regional. Los logros esperados en reducción de emisiones (CO2, NOx, ruido) y la eficiencia operativa sobresaliente demuestran el compromiso del programa con las metas de aviación climáticamente neutra.

La compatibilidad con la infraestructura aeroportuaria existente, junto con la preparación para futuras adaptaciones de recarga eléctrica, asegura una integración fluida en el ecosistema de la aviación. Con la entrada en servicio prevista para 2035, el AMPEL360e se posiciona como una solución de vanguardia que redefinirá la eficiencia y sostenibilidad en el transporte aéreo regional.
```
