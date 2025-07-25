import {testAction} from "@/actions/testAction";

export default async function Home() {
    await testAction()
    return (<>
            <h1>Hola</h1>
            <h1>Hola</h1>
            <h1>Hola</h1>
            <h1>Hola</h1>
            <h1>Hola</h1>
            <h1>Hola</h1>
            <h1>Hola</h1>
        </>
    );
}
