apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: smtp
  namespace: ${environment_namespace}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: smtp
  maxReplicas: 1
  minReplicas: 1
  behavior:
    scaleDown:
      policies:
      - type: Pods
        value: 2
        periodSeconds: 60
      - type: Percent
        value: 50
        periodSeconds: 60
      selectPolicy: Min
      stabilizationWindowSeconds: 300
    scaleUp:
      policies:
      - type: Pods
        value: 2
        periodSeconds: 60
      - type: Percent
        value: 100
        periodSeconds: 60
      selectPolicy: Min
      stabilizationWindowSeconds: 0
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: AverageValue
        averageValue: 50m
