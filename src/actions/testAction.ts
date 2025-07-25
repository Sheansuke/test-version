"use server"


export const testAction = async (): Promise<unknown> => {
    return await new Promise((resolve) => setTimeout(() => {
        resolve("El pepe")
    }, 1000))
}