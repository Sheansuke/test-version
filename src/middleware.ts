// This function can be marked `async` if using `await` inside

export async function middleware() {



    await new Promise((resolve) => setTimeout(resolve, 1000))
}

// See "Matching Paths" below to learn more
export const config = {
    matcher: '/'
}

export const runtime = 'nodejs'