#!/bin/bash


cat <<EOF > custom_ingress.yml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: custom-ingress
  namespace: $RASAX_NS
  annotations:
    ingress.kubernetes.io/rewrite-target: /
    nginx.ingress.kubernetes.io/proxy-body-size: "0"
    nginx.org/client-max-body-size: "0"
    nginx.ingress.kubernetes.io/proxy-connect-timeout: "3600"
    nginx.ingress.kubernetes.io/proxy-send-timeout: "3600"
    nginx.ingress.kubernetes.io/proxy-read-timeout: "3600"
    nginx.ingress.kubernetes.io/proxy-next-upstream-timeout: "3600"
spec:
  rules:
  - http:
      paths:
        - path: /
          pathType: ImplementationSpecific
          backend:
            service:
              name: $RASAX_NS-rasa-x
              port:
                number: 5002
        - path: /core/(.*)
          pathType: ImplementationSpecific
          backend:
            service:
              name: $RASAX_NS-rasa-production
              port:
                number: 5005
        - path: /webhooks/
          pathType: ImplementationSpecific
          backend:
            service:
              name: $RASAX_NS-rasa-production
              port:
                number: 5005
        - path: /socket.io
          pathType: ImplementationSpecific
          backend:
            service:
              name: $RASAX_NS-rasa-production
              port:
                number: 5005
        - path: /webhook
          pathType: ImplementationSpecific
          backend:
            service:
              name: $RASAX_NS-app
              port:
                number: 5055
        
        
EOF