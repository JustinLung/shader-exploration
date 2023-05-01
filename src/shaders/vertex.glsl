attribute float aRandom;
uniform vec2 uFrequency;
uniform float uTime;

varying float vRandom;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.5);
    modelPosition.z += cos(modelPosition.x * uFrequency.x - uTime) * 0.02;
    modelPosition.z += cos(modelPosition.z * uFrequency.y - uTime) * 0.001;
    modelPosition.z += aRandom * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    
    gl_Position = projectedPosition;

    vRandom = aRandom;
}