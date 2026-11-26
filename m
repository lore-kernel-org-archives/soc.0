Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705772;
	b=Ksn/cgGx6dt19FtVAf8f8QY1G+5QJBaSjEbT35KkPEDVXxJxcig5945oFxOqlRPU96wp
	 jyUMpT2Njop0tIvkm0wDWrbuZV6DHXmFonsu+z5ImqS20Nv9Rgiz5AzHbOaPb5Wv10c89
	 ZM+iUaAqJd6FkO+sF2JSgWdFGqmcX48WnmGCoU46kfpybDu61dVoOmtzLGYnGjBDKhsDj
	 dtpway/dO7DgnrPBwnUe5dQUr8UnEbOACldvBbBSTn83mBc2MebEP8tO8eDL7zEffvxtN
	 ApmHxIcEc/afC4pwlRBEsEW766VehooCTOA3RcyZH/PAsjTx+BPdU1dJBkCY5oUe8gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705772;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=tevfoylWtYF7C7Prot9sptU8s0C8xEil2IMdlqbonY4=;
	b=lSRYJXP/xB55Z0oy9f7/XAM51lJH/rw/rvGq1vgxntvX9x1Sm1ZRceS4CVy6wsSFG4aw
	 JsrPwlLzz5aS9CMeqfDOorWwb9lOturdJQMPoBLbjD1ckojRyr1G3Yp2ow4yK5pCOkorn
	 HtWV7sg9Ny6/zv6ZG+defT+h/PiJELLreOYLUtbz2mN9aLJg/St5KTjV54Nqa3WaDlCTC
	 WywztJEu/8vNqKm3CsU6s8Tdhw4Q3fZCe/rlHIGKTXFGrbnDchxSJPn12NXzdVghqe86c
	 EAzhHgN1grM5ma4q/uhs+htIEj+/VvYFEtzhZMCRRbigdNw2bVrKxgWHEElkph+CEJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYHNBbvE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F31606A31C;
	Thu, 26 Nov 2026 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYHNBbvE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114B81F000F0;
	Thu, 26 Nov 2026 15:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705772;
	bh=tevfoylWtYF7C7Prot9sptU8s0C8xEil2IMdlqbonY4=;
	h=Date:From:To:Cc:Subject;
	b=TYHNBbvE/jSFgAgKdK4TdSEvHdHbch8bWrlLSv0Ealu58SZRjCYf30LSc5/C209AW
	 TZT+VHqQYN7EdaHDhlHQyOb5ZCZhRazydVVv63BVXsUNbbn4fXE/n3b3nEgJaw4gRs
	 qJ4sqQlV1Mx1oZz5VG7nbUgknw+NG9BgCIFMwzO1DHofrOMzv38A7Bd+QL9M+/196n
	 Yfxq3gTYDasYyJ0PeYV3SH9d8G4O7ePF+DJrgjRBfTm5FuIjDnfyDxV+cYOVhQs/zs
	 B/2VpIHhJJz4ARDDvPScxlg9fC0Rnk4N03xcVHnIjrcrlpavczF0BohGY/7gfsky+L
	 ntsuNpfpV0Htw==
Date: Thu, 26 Nov 2026 15:09:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	soc@lists.linux.dev
Subject: linux-next: manual merge of the input tree with the arm-soc tree
Message-ID: <awhLqBzAoKzKtaht@sirena.org.uk>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0PNQWWRqPo86OjzX"
Content-Disposition: inline


--0PNQWWRqPo86OjzX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the input tree got a conflict in:

  arch/arm/mach-pxa/spitz.c

between commit:

  71a0ba7b39ad4 ("ARM: remove legacy pxa board files")

=66rom the arm-soc tree and commit:

  20050ace6d153 ("Input: ads7846 - drop platform data support")

=66rom the input tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Deleted the file]

--0PNQWWRqPo86OjzX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIS6cACgkQJNaLcl1U
h9BYoAf/RHAef+PzYrqeCKMvrlrtI7Y/P9jNDe9nCLhKcfD3Lh2dKlyIQo2/qiy3
BOWFit3Y8GQpJJ9RJqQZNIrEpfeiI1HpOTx/dVN20dT3ttiukxj2AynTHXzhSgwI
mg+dN78ZSx7cbCYxauxiQgdO+bUkJ4VbBYmhxSODTCyqn9IKADg9Mli5zY9hCvBL
K3qPvui452/WiBondmRsBOuP+7bEU4baie/+Stgk8jpYLZre017dhM+eAgCBcUcA
dgGcWKDCdYPj2XTKVYrWM0Gvz1n7srGuE7SVdkQYVFixfcyyemBC/Wbm26iUkPf8
1eeht+ldzJMT4538ymQRXHKhEIJ5+A==
=ygZ1
-----END PGP SIGNATURE-----

--0PNQWWRqPo86OjzX--
