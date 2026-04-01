Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB43F3F99EF
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775045596; cv=none; b=UCImHpmmp5iUDmAxvOYlQN8USyM5jPjCCX4ZwDjWHLT6FKPVk+3WOaGHnJh+4VDC8TcT9L2/wO5wNiz7PCjbwcN/V7q9HwcfCeuaW8l3F+OPUS5p5AQ0oOCZyyaD361iiN1dvUsqiNRirnKFTJVhlAwWXlmh7vSrL3pWxK65LjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775045596; c=relaxed/simple;
	bh=6br/MLePdMI3AkPJbIOmW9UoWVIoX/scxBnPpD+TQBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mH0nyhFvz5UPba5DhQzL9IJ1USApIXwhy+4RnpxY7E48mgvQa0TDw9l/i51y01QLnh6V2TQ9QrM7yWArp5A7ROOQN65sNhRYQ2W/i9sWshoFfeIsTovScqz5Ukr1zkAF/1nPjHkrsmV05IyjpPufgXeqB5JXDZEc0rySwUq+zOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9Q/Yehy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9Q/Yehy"
Received: by smtp.kernel.org (Postfix)
	id 96F48C2BCB0; Wed,  1 Apr 2026 12:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A39CC4CEF7;
	Wed,  1 Apr 2026 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775045596;
	bh=6br/MLePdMI3AkPJbIOmW9UoWVIoX/scxBnPpD+TQBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9Q/Yehy+MCwQqApK5wqRTtUjb7sPykHR74PeUlkOjbo6qRI9wnfELafl/3pUOb1h
	 p73wYJWDVCGDuIPlCg8r4nkwNdTkcUJhmz0Dk7IrOAHiylMFeSK5qmD3OOffCuQec6
	 lkzc0+nT2C2Q/VOZ2KGztDlkwj1zOvhnrXeWfaBSU7M4Jh+/J0zFMi/03EtLUu1f6X
	 4inBTo7hKwG9+A+Y/ryQWaJ/FhVOnKS5Tgp2t2aFdYdXxw2kIdPGcEjmJ0JqiKmma6
	 K4w2QbCahPetqz6EkRTkvbj46EJoPnHflFLmTIuh9ScGKaV4GYULn4V1YpLtGjvQEN
	 h/1Z+crOOGdWg==
Date: Wed, 1 Apr 2026 13:13:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ~RISC-V~Microchip soc fixes for v7.0-rc6
Message-ID: <20260401-proving-recede-80a274af26f7@spud>
References: <20260326-vertebrae-relatable-adfa3baabfd6@spud>
 <20260401-bold-positive-flounder-6e7b0d@quoll>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pT0cUuiUhHUhFJ/x"
Content-Disposition: inline
In-Reply-To: <20260401-bold-positive-flounder-6e7b0d@quoll>


--pT0cUuiUhHUhFJ/x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2026 at 01:44:04PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 11:21:39AM +0000, Conor Dooley wrote:
> > Hey folks,
> >=20
> > Another small PR here, worth pointing out that the exact contents has
> > been in linux-next but not as these commit hashes yet, I squashed a
> > fixup patch just now that I hadn't realised got pushed without being
> > squashed. Might be worth letting it marinate for a few days if that's
> > a concern.
> >=20
> > Cheers,
> > Conor.
> >=20
> > The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81=
304a:
> >=20
> >   cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() =
(2026-02-06 19:54:40 +0000)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags=
/riscv-soc-fixes-for-v7.0-rc6
> >=20
> > for you to fetch changes up to c7596f9001e2b83293e3658e4e1addde69bb335d:
> >=20
> >   firmware: microchip: fail auto-update probe if no flash found (2026-0=
3-26 11:14:11 +0000)
>=20
> Thanks, applied
>=20
> Probably better if the fixes branch would move to v7.0-rc1, not
> continuing the v6.19.

Yeah, I probably could have moved it to a -rc, cos there was some
fiddling about when my week2 merge window fixes PR got merged I opted to
leave my branch on top of that tag, lest there are conflicts caused by
later fixes patches. Ordinarily, I fast forward to -rc1.

Thanks,
Conor.

--pT0cUuiUhHUhFJ/x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCac0L1AAKCRB4tDGHoIJi
0j/5AQCWgbbodhrF2m/5RCiOWgYx4FeqAmURWJ5fRsnGdvRshgEAoODMTonwPO9k
5q9LlitJftSma4GUt8JDxbtcNpwEKgk=
=nKh7
-----END PGP SIGNATURE-----

--pT0cUuiUhHUhFJ/x--
