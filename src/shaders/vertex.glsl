attribute float aRandom;
uniform vec2 uFrequency;
uniform float uTime;

varying float vRandom;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.5);
    modelPosition.y += sin(modelPosition.x * uFrequency.x - aRandom) * 0.02;
    modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.05;
    modelPosition.x += sin(modelPosition.z * uFrequency.y - aRandom) * 0.01;
    modelPosition.z += sin(aRandom * 0.2) * 1.0;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    
    gl_Position = projectedPosition;

    vRandom = aRandom;
}
