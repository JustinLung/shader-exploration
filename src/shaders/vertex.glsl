attribute float aRandom;
uniform vec2 uFrequency;
uniform float uTime;

varying float vRandom;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.5);
    modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.03;
    modelPosition.z += sin(modelPosition.z * uFrequency.x - uTime) * 0.0075;
    modelPosition.z += sin(modelPosition.z * uFrequency.y - uTime) * 0.001;
    modelPosition.z += aRandom * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    
    gl_Position = projectedPosition;

    vRandom = aRandom;
}