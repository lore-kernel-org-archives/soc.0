Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C51E0B93
	for <soc@lists.linux.dev>; Tue, 29 Oct 2024 06:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730183614; cv=none; b=sJtlrgRNDtihviOKpWM8d22Yo25UI63B4aaQaCtYH4w3TYC77YC0qTeU5gL2zskdkz74lvVSBOU3G5Vvn8587ixOLI/EiAK4Se4zf4zk69n0vdDp+X4TfFfIVRJrzmQSHPR/JKTE7iaYdJjOkHrVAmieK97mMBPo8dYGwKxghv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730183614; c=relaxed/simple;
	bh=/vU+fecnsFx1R9ei1lgVyF/N4MpfM7Eq103LDN4FcXE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XSMNGPf4JWe6eSIaMJdDTprkb3ZD4J15ieamC8eS0gxRiPlBO+plafH0ZtVQSwxt0Z1E8m+zHxt4KdjvP8mALid/Eah5dgROY2ccZtlFcumx0cH2QxWbm+5Fgfa4YSZ1NWIux5HpS+yc/g9ufCf36xX1X+uAXtMswPR7W36BmTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V9rW61aB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V9rW61aB"
Received: by smtp.kernel.org (Postfix)
	id 5A15BC4CEE6; Tue, 29 Oct 2024 06:33:34 +0000 (UTC)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7431C4CECD;
	Tue, 29 Oct 2024 06:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7431C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730183603;
	bh=zgE1TepM4I8qI5iM6MPNjagJKzk9n61MhWwvQT+o3Ms=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V9rW61aBSIYBDIWCZu06hig6ixUiDGZTi58QTUfedJBtNQgjW5V7Uby7YIG9y5ZXT
	 XbFaipTgkYKKfeYOLXzvsWmpg47xiCwu6BH1vyJqZ6w1YfydDrCldVSeJ7QD5C2xgB
	 719jY5Jxjr2gkTrgbC/lUR8qtZyEw5BFQypq25dauf5lNphqlF/Yx5NyXDH7RC3aQ0
	 s5zXVRf+tVpSpg21obUj+6EJDJJJyVWk0ER2h4xVgIdaXNhYBl/Q9mS8bhJ1d0lLjV
	 md5Z5JjK1lzqIlr+PvrL/aDQ82oWJYyFYUZmoMuqjzV/RBfEnkQkEK3iLUkmfVN2LW
	 0g8pMYnISkS0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xd0nZ6zWgz4wbR;
	Tue, 29 Oct 2024 17:33:22 +1100 (AEDT)
Date: Tue, 29 Oct 2024 17:33:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Conor Dooley
 <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Jesse Taube
 <mr.bossman075@gmail.com>, soc@kernel.org
Subject: Re: Include in next: spacemit/linux
Message-ID: <20241029173322.4d879601@canb.auug.org.au>
In-Reply-To: <20241029045326-GYA331364@gentoo>
References: <20241029045326-GYA331364@gentoo>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u48fEIVrJYoGnu+8olsXUD8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/u48fEIVrJYoGnu+8olsXUD8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 29 Oct 2024 12:53:26 +0800 Yixun Lan <dlan@gentoo.org> wrote:
>
> Please kindly include spacemit/linux tree into the linux-next:
>=20
> https://github.com/spacemit-com/linux
>=20
> branch for master: for-next
>=20
> branch for pending-fixes: fixes
>=20
> Repo will be use for collecting patches for SpacemiT's SoC
> which recently I took over:
>=20
> https://lore.kernel.org/r/20241028-00-k1-maintainer-v2-1-272c9834220d@gen=
too.org
>=20
> The patches in the tree will be sent to Arnd Bergmann and soc@kernel.org.

Added from tomorrow.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/u48fEIVrJYoGnu+8olsXUD8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcggbMACgkQAVBC80lX
0GwYNgf9ECX3oupxHVZA7ABl8cdd7T3nQkHSN7e9KiM5j9ftfr4IfcCUjDcEXshl
C5gQ6BZhgqPw2SOJdpH8uMXzZa60FOJ5CdzcQGpEwlSBNXIiYPHKfzn3q6EA5aHG
4tRgce5CLlWo+GbcvaX6kjnDCN2Hc/zOZmowExv0PBypknB6pI/+zFZfgj7drdYp
zWiDhBq+h+c+HmnRlbLRwarHogBjlhGB5uCDJLCEppYiKiloJQH4NYrox+O0lQyA
uaAL/HtutbOLpueiW04pydCCw2Q4ksM9JmbQQX6GlhJNY+3uQjFHwZVTUMtnHs2E
kTeKIq7XPWukud7/Qs8+eRTZGAftrQ==
=TQ0v
-----END PGP SIGNATURE-----

--Sig_/u48fEIVrJYoGnu+8olsXUD8--
