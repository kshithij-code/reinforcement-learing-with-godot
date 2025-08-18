import asyncio
import websockets

async def handle_connection(websocket):
    try:
        async for message in websocket:
            try:
                x, y= map(float, message.strip().split())            
                x += 0.1
                await websocket.send(f"{x} {y}")
            except ValueError:
                print(f"Invalid message format: {message}")
    except ConnectionError:
        print("closed")

async def main():
    async with websockets.serve(handle_connection, "localhost", 8765):
        print("Python server running on ws://localhost:8765")
        await asyncio.Future()

if __name__ == "__main__":
    asyncio.run(main())
