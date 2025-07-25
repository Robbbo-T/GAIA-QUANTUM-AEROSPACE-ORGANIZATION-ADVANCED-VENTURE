# Requisitos de sistema nivel 0 – AMPEL360e (Versión Corregida)
**Documento:** QAIR-360e-ALI-DP-DOC-PDF-000-00-00-CON-006 (Estado: Draft v3.0)  
**Fecha de actualización:** 2025-07-25  
**Clasificación:** GAIA-QAO Confidential

La definición de requisitos de sistema nivel 0 constituye la piedra angular del desarrollo del AMPEL360e, estableciendo la base desde la cual se derivan todos los requisitos técnicos, operacionales y de certificación posteriores. Estos requisitos de más alto nivel traducen las necesidades de los stakeholders en un conjunto estructurado y trazable de especificaciones que guiarán el desarrollo de la primera aeronave comercial híbrida-eléctrica certificada bajo CS-25 con Special Conditions innovadoras.

## 1. Marco conceptual de requisitos nivel 0
### 1.1 Definición y propósito
Los requisitos nivel 0, también denominados **stakeholder requirements** en la metodología INCOSE, representan el nivel más alto de abstracción en la jerarquía de ingeniería de sistemas[1]. Para el AMPEL360e, estos requisitos incorporan una visión pragmática e innovadora que integra:
- **Propulsión híbrida-eléctrica**: Arquitectura dual optimizada para eficiencia
- **Sostenibilidad verificable**: Reducción medible de impacto ambiental
- **Digitalización avanzada**: Gemelo digital y mantenimiento predictivo
- **Viabilidad comercial**: Balance entre innovación y riesgo técnico

### 1.2 Jerarquía y trazabilidad
Conforme a ARP4754A, los requisitos nivel 0 mantienen **trazabilidad bidireccional completa** mediante herramientas ALM (Application Lifecycle Management)[2]. La descomposición jerárquica sigue el patrón establecido por MIT/NASA[3][4]:
- **Nivel 0**: Necesidades stakeholder (este documento)
- **Nivel 1**: Requisitos de sistema
- **Nivel 2**: Requisitos de subsistema  
- **Nivel 3**: Especificaciones de componente
- **Nivel 4**: Requisitos de implementación

### 1.3 Clasificación regulatoria
Bajo el marco CS-25 con Special Conditions emergentes para EHPS (Electric/Hybrid Propulsion System), los requisitos abordan[5][6][7]:
- Aeronavegabilidad tradicional (CS-25 Amendment 28)
- Propulsión híbrida-eléctrica (EASA SC-E-19, en finalización)
- Sistemas digitales avanzados (DO-178C/DO-254)
- Ciberseguridad aeronáutica (DO-326A/ED-202A)
- Preparación para autonomía futura (EASA AI Roadmap)

## 2. Arquitectura de stakeholders y análisis de necesidades
### 2.1 Matriz de stakeholders primarios
| Stakeholder | Tipo | Influencia | Necesidades clave | Criterios de éxito |
|------------|------|------------|-------------------|-------------------|
| **Aerolíneas comerciales** | Usuario final | Alta | DOC competitivo, fiabilidad, flexibilidad | -25% DOC vs. A320neo |
| **Compañías de leasing** | Financiador | Alta | Valor residual, liquidez, ESG compliance | >55% valor @ 12 años |
| **EASA/FAA** | Regulador | Crítica | Seguridad demostrable, cumplimiento | Certificación sin delays |
| **Pasajeros** | Usuario final | Media | Confort, conectividad, sostenibilidad | NPS >70 |
| **Q-AIR/GAIA-QAO** | Desarrollador | Crítica | Viabilidad técnica, ROI programa | Break-even año 7 |
| **MRO providers** | Mantenedor | Alta | Compatibilidad herramientas, training | Adopción >50 centros |
| **Aeropuertos** | Infraestructura | Media | Compatibilidad gates, servicios | Sin inversión adicional |

### 2.2 Necesidades convergentes validadas
El análisis de mercado y feedback de stakeholders confirma cinco pilares fundamentales:
1. **Eficiencia operacional**: Reducción DOC -25% mínimo aceptable
2. **Compatibilidad SAF**: Flexibilidad 0-100% según disponibilidad
3. **Digitalización práctica**: ROI demostrable en mantenimiento
4. **Certificación alcanzable**: Riesgo regulatorio gestionable
5. **Producción escalable**: Capacidad de respuesta a demanda

## 3. Requisitos nivel 0 – Seguridad y aeronavegabilidad
### 3.1 Seguridad fundamental
**R0-001 Probabilidad de fallo catastrófico**  
La aeronave deberá demostrar una probabilidad de fallo catastrófico <1×10⁻⁹ por hora de vuelo conforme a CS-25.1309, considerando todos los modos de operación del sistema de propulsión híbrida y transiciones entre modos.

**R0-002 Certificación de aeronavegabilidad**  
El AMPEL360e deberá obtener certificación tipo bajo CS-25 Amendment 28 con Special Conditions para:
- Propulsión híbrida-eléctrica conforme a SC-E-19 (publicación esperada Q3 2025)
- Sistemas de almacenamiento de energía de alta tensión (>600V DC)
- Gestión térmica de baterías y electrónica de potencia
- Protección contra eventos de thermal runaway

**R0-003 Seguridad de transición de modos**  
El sistema de propulsión deberá garantizar transiciones seguras y transparentes entre modos operativos (eléctrico, híbrido, solo-turbina) sin degradación de performance >5% durante la transición.

### 3.2 Resiliencia operacional
**R0-004 Capacidad de reversión segura**  
La aeronave deberá mantener capacidad de completar vuelo y aterrizaje seguros con:
- Fallo completo del sistema eléctrico: Operación solo-turbina con alcance >1,500 nm
- Fallo de una turbina: Operación monomotor + asistencia eléctrica
- Degradación de baterías: Operación con capacidad reducida sin límites de seguridad

**R0-005 Protección contra amenazas ambientales**  
El diseño deberá demostrar robustez contra:
- Impacto directo de rayo sin daño a sistemas de alta tensión
- HIRF Level 3 sin interferencia en control de potencia
- Temperaturas extremas (-40°C a +50°C) con gestión térmica activa

## 4. Requisitos nivel 0 – Performance y eficiencia
### 4.1 Performance de misión
**R0-006 Capacidad y alcance**  
La aeronave deberá transportar:
- **Configuración típica**: 180 pasajeros, 2,800 nm alcance
- **Alta densidad**: 195 pasajeros, 2,400 nm alcance
- **Modo eléctrico puro**: Hasta 250 nm para rutas regionales
- **Flexibilidad**: Reconfiguración 150-195 asientos

**R0-007 Eficiencia energética verificable**  
El sistema de propulsión híbrida deberá demostrar:
- Reducción consumo combustible >25% vs. A320neo (misión 1,000 nm)
- Eficiencia energética total >35% (well-to-wake)
- Factor de hibridación óptimo 30-40% según misión

**R0-008 Performance de campo realista**  
La aeronave deberá operar desde:
- Pista despegue (MTOW, ISA, SL): ≤2,300 m
- Pista aterrizaje (MLW, ISA, SL): ≤1,900 m
- Compatible con 95% aeropuertos comerciales categoría C

### 4.2 Envelope operacional
**R0-009 Velocidades y altitudes**  
- Velocidad crucero: Mach 0.78-0.79
- Altitud crucero óptima: FL350-390
- Techo servicio: 41,000 ft
- MMO/VMO: Mach 0.82/350 KIAS

**R0-010 Flexibilidad operacional**  
- Turnaround objetivo: 35 minutos (45 min con recarga parcial)
- Dispatch reliability: >99.0% al año 2 de operación
- Utilización diaria: >11 horas bloque
- ETOPS: Pre-provisión para ETOPS-120 (desarrollo post-EIS)

## 5. Requisitos nivel 0 – Sistema de propulsión híbrida
### 5.1 Arquitectura de propulsión
**R0-011 Configuración híbrida paralela**  
El sistema deberá integrar:
- 2× turbofan nueva generación, empuje 120-130 kN cada uno
- 2× motor-generadores 1.5 MW continuous, 2.0 MW peak
- Distribución eléctrica 800V DC con redundancia
- Power Management Unit (PMU) con lógica de optimización

**R0-012 Almacenamiento de energía realista**  
Sistema de baterías con especificaciones alcanzables:
- Tecnología: Li-ion de alta densidad (NMC o similar probada)
- Densidad energética: >300 Wh/kg nivel pack (mínimo viable)
- Capacidad total: 2-3 MWh según configuración
- Vida útil: >6,000 ciclos @ 80% DoD
- Carga rápida: 20-80% SOC en 45 minutos
- Certificación: Cumplimiento DO-311A/ED-311

**R0-013 Gestión inteligente de energía**  
PMU con capacidades de:
- Optimización continua basada en fase vuelo y condiciones
- Predicción de demanda con horizonte 30 minutos
- Gestión térmica predictiva de baterías
- Modo de emergencia con priorización automática

### 5.2 Combustible sostenible
**R0-014 Compatibilidad SAF flexible**  
Sistema de combustible diseñado para:
- Operación eficiente con 0-100% mezcla SAF
- Detección automática de propiedades combustible
- Ajuste de parámetros motor según tipo SAF
- Sin restricciones operacionales por tipo combustible

**R0-015 Capacidad y distribución**  
- Capacidad total: 18,000-20,000 litros
- Tanques centrales y ala con transferencia automática
- Sistema de medición precisa ±0.5%
- Compatibilidad con repostaje hidratante estándar

## 6. Requisitos nivel 0 – Sistemas digitales y aviónicos
### 6.1 Arquitectura aviónica
**R0-016 Plataforma digital integrada**  
Avionica basada en:
- Arquitectura IMA (ARINC 653) escalable
- Procesamiento distribuido con redundancia
- Interfaces ARINC 664 (AFDX) para datos críticos
- Capacidad de actualización modular

**R0-017 Digital twin operacional**  
Sistema de gemelo digital con:
- Modelado de degradación de componentes principales
- Precisión predictiva >85% a 500 FH
- Transmisión automática de datos cada vuelo
- Dashboard para operadores y MRO

**R0-018 Conectividad moderna**  
- Satcom Ka-band para cobertura global
- WiFi 6E para pasajeros (>50 Mbps/dispositivo)
- 4G/5G en tierra para data offload
- Interfaces IoT para sensores distribuidos

### 6.2 Ciberseguridad y actualizaciones
**R0-019 Arquitectura de seguridad**  
- Cumplimiento DO-326A/ED-202A integral
- Segregación física redes críticas/no-críticas
- Detección de intrusiones en tiempo real
- Forensics y logging completo

**R0-020 Capacidad de actualización**  
- OTA updates para sistemas no-críticos
- Procedimiento seguro para sistemas críticos
- Rollback automático ante fallos
- Gestión de configuración trazable

## 7. Requisitos nivel 0 – Cabina y experiencia
### 7.1 Cabina de pasajeros
**R0-021 Ambiente de cabina optimizado**  
- Nivel ruido: <68 dBA crucero (objetivo <65 dBA)
- Presurización: 6,500 ft equivalente
- Humedad: 20-25% mantenida
- Iluminación: LED con perfiles circadianos
- Ventilación: HEPA + renovación cada 3 min

**R0-022 Flexibilidad y eficiencia**  
- Configuración modular 150-195 asientos
- Pitch mínimo: 29" ultra-high density, 31" típico
- Bins: Capacidad para roller bags verticales
- Galleys/Lavs: Modulares y relocalizables

### 7.2 Cabina de vuelo
**R0-023 Flight deck avanzado**  
- Displays: 4× 15" landscape + 2× HUD opcionales
- Gestión híbrida: Sinóptico dedicado energía
- Interfaces: Touch + físico para funciones críticas
- Reducción workload: >20% vs generación actual

**R0-024 Asistencia y automatización**  
- FMS con optimización trayectoria híbrida
- Alertas predictivas basadas en digital twin
- Preparación single pilot ops (no activado EIS)
- Voice commands para funciones no-críticas

## 8. Requisitos nivel 0 – Sostenibilidad y medio ambiente
### 8.1 Emisiones y huella ambiental
**R0-025 Reducción de emisiones verificable**  
- CO₂: -35% vs A320neo en misión 1,000 nm (SAF 30%)
- NOₓ: <40% límite CAEP/8
- Material particulado: -50% vs motores actuales
- Lifecycle carbon: -40% vs generación actual

**R0-026 Diseño para circularidad**  
- Reciclabilidad: >85% por peso
- Materiales bio-based: >15% estructura secundaria
- Baterías: Programa second-life obligatorio
- Documentación: Material passport digital

### 8.2 Ruido e impacto local
**R0-027 Footprint acústico reducido**  
- Certificación: Chapter 14 -15 dB margen acumulado
- Objetivo: Cumplir futuro Chapter 16 (2030+)
- Operaciones: Aproximaciones de baja potencia
- Taxi: Silencioso con propulsión eléctrica

**R0-028 Operaciones aeropuerto limpias**  
- Taxi: 100% eléctrico (cero emisiones locales)
- GPU: Mínimo uso por eficiencia sistemas
- APU: Alternativa pila combustible H₂ (opcional)
- Turnaround: Optimizado para mínimo equipo GSE

## 9. Requisitos nivel 0 – Soporte y mantenimiento
### 9.1 Mantenibilidad y fiabilidad
**R0-029 Mantenimiento optimizado**  
- MSG-3 intervals: +30% vs generación actual
- Predictivo: >80% fallos anticipados
- No-fault-found: <5% de reportes
- MTBUR: >3,000 FH componentes principales
- Accesibilidad: 95% LRUs sin plataformas

**R0-030 Diagnóstico y troubleshooting**  
- BITE coverage: >90% sistemas
- Fault isolation: <15 minutos promedio
- Wireless data offload: Automático post-vuelo
- Documentación: IETP interactivo con AR

### 9.2 Red de soporte global
**R0-031 Infraestructura día 1**  
Pre-EIS establecer:
- AOG support: 24/7 en 3 continentes
- Spares: 10 ship-sets distribuidos
- Training: 500+ técnicos certificados
- Remote support: Capacidad AR/VR
- Response time: <4 horas regiones principales

**R0-032 Gestión de obsolescencia**  
- Horizon scanning: 10 años componentes electrónicos
- Dual sourcing: >80% componentes críticos
- Upgrade path: Definido para sistemas principales
- Stock estratégico: Last-time-buy planning

## 10. Requisitos nivel 0 – Económicos y programa
### 10.1 Viabilidad financiera
**R0-033 Precio y competitividad**  
- List price: US$115-125M (comparable A321neo)
- Premium híbrido: <10% justificado por DOC
- Launch incentives: Competitivos con incumbentes
- Financiación: Green bonds elegible

**R0-034 Business case operadores**  
- DOC saving: -25% garantizado vs A320neo
- Fuel cost hedge: Menor exposición volatilidad
- Carbon credits: Valorización incluida
- Residual value: >55% @ 12 años garantizado

### 10.2 Valor residual y remarketing
**R0-035 Factores de valor**  
- Cumplimiento regulatorio futuro asegurado
- Actualizable para nuevas normativas
- Demanda secundaria por perfil green
- Conversión cargo prevista en diseño

**R0-036 Soporte manufacturer**  
- Garantías: Extendidas disponibles
- Buy-back: Programa opcional
- Remarketing: Asistencia activa
- Upgrades: Path definido y costeado

## 11. Requisitos nivel 0 – Certificación y cronograma
### 11.1 Plan de certificación realista
**R0-037 Hitos principales programa**  
Cronograma ajustado post-validación técnica:
- Preliminary Design Review (PDR): Q2 2027
- Technology Demonstrator First Flight: Q4 2028
- Critical Design Review (CDR): Q4 2029
- Manufacturing Readiness Review: Q2 2030
- First Prototype Assembly Start: Q4 2030
- First Flight: Q2 2032
- Type Certification: Q4 2033
- Entry Into Service (EIS): Q2 2034

**R0-038 Estrategia certificación**  
- Involvement temprano autoridades (ongoing)
- Special Conditions: Co-desarrollo activo
- Simulación credit: Máximo permitido
- Flight test: 4 prototipos + 2 fatiga

### 11.2 Industrialización y producción
**R0-039 Ramp-up conservador**  
Capacidad de producción gradual:
- Año 1 (2034): 2 ac/mes
- Año 2 (2035): 5 ac/mes
- Año 3 (2036): 10 ac/mes
- Año 5 (2038): 20 ac/mes
- Capacidad máxima: 30 ac/mes

**R0-040 Calidad y aprendizaje**  
- First article: Inspección 100%
- Learning curve: 85% asumida
- Automatización: Progresiva post año 2
- Calidad objetivo: <50 defectos/ac año 5

## 12. Matriz de verificación y gestión
### 12.1 Métodos de verificación
| Requisito | Método primario | Método secundario | Criterio éxito |
|-----------|-----------------|-------------------|----------------|
| Performance | Flight test | CFD/Simulación | ±2% objetivo |
| Seguridad | Test + análisis | Demostración | Cumple CS-25 |
| Eficiencia | Medición banco | Flight test | Meet or exceed |
| Mantenimiento | In-service data | Lab testing | >95% confianza |
| Económicos | Modelo validado | Airline feedback | NPV positivo |

### 12.2 Gestión de requisitos y trazabilidad
- **Herramienta**: IBM DOORS o equivalente
- **Estructura**: Completa trazabilidad L0→L4
- **Change control**: CCB con representación completa
- **Reviews**: Gates formales cada fase
- **Métricas**: Madurez, volatilidad, cumplimiento

### 12.3 Gestión de riesgos top 5
| Riesgo | Probabilidad | Impacto | Mitigación principal |
|--------|--------------|---------|---------------------|
| Retraso SC-E-19 | Media | Alto | Participación activa regulador |
| Densidad batería | Media | Alto | Dual sourcing + fallback |
| Precio SAF | Alta | Medio | Diseño flex 0-100% |
| Supply chain | Media | Alto | Desarrollo temprano proveedores |
| Aceptación mercado | Baja | Crítico | Launch customers engagement |

## Conclusión
Los requisitos nivel 0 del AMPEL360e v3.0 establecen un marco ambicioso pero técnicamente alcanzable para el desarrollo de la primera aeronave comercial híbrida-eléctrica certificada bajo CS-25. Los ajustes realizados tras la validación técnica independiente aseguran:

- **Viabilidad técnica**: Objetivos alineados con TRL actual
- **Cronograma realista**: Buffer adecuado para innovación
- **Flexibilidad operacional**: Adaptable a incertidumbres mercado
- **Riesgo gestionable**: Identificado y con mitigaciones

El éxito del programa dependerá de la ejecución disciplinada, colaboración estrecha con reguladores y stakeholders, y capacidad de adaptación a la evolución tecnológica y de mercado durante los próximos 9 años hasta EIS.

---
**Control de documento:**
- Versión: 3.0 (Post-validación técnica)
- Estado: Draft para aprobación
- Fecha: 2025-07-25
- Próxima revisión: Post-PDR (Q2 2027)
- Clasificación: GAIA-QAO Confidential

[Referencias 1-100 según documentos originales]
