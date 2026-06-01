import Link from 'next/link';

export default function NotFound() {
	return (
		<div className='min-h-screen flex items-center justify-center p-8'>
			<div className='max-w-md w-full text-center'>
				<h1 className='text-2xl font-semibold mb-3'>Page not found</h1>
				<p className='opacity-80 mb-8'>The page you&apos;re looking for doesn&apos;t exist.</p>
				<Link
					href='/'
					className='px-4 py-2 rounded border inline-block'>
					Back home
				</Link>
			</div>
		</div>
	);
}
