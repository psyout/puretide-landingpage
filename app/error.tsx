'use client';

import { useEffect } from 'react';
import Link from 'next/link';

export default function Error({ error, reset }: { error: Error & { digest?: string }; reset: () => void }) {
	useEffect(() => {
		console.error('Page error:', error);
	}, [error]);

	return (
		<div className='min-h-screen flex items-center justify-center p-8'>
			<div className='max-w-md w-full text-center'>
				<h1 className='text-2xl font-semibold mb-3'>Something went wrong</h1>
				<p className='opacity-80 mb-8'>We couldn&apos;t load this page. You can try again or go back home.</p>
				<div className='flex flex-col sm:flex-row gap-3 justify-center'>
					<button
						type='button'
						onClick={reset}
						className='px-4 py-2 rounded border'>
						Try again
					</button>
					<Link
						href='/'
						className='px-4 py-2 rounded border inline-block'>
						Back home
					</Link>
				</div>
			</div>
		</div>
	);
}
