// instrumentation.ts
import { registerOTel } from '@vercel/otel'

export function register() {
    registerOTel({
        serviceName: 'MUSTANG - no-standalone',
    })
}
