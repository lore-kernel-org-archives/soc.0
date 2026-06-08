Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B63C346766
	for <soc@lists.linux.dev>; Mon,  8 Jun 2026 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917384; cv=none; b=NbxHBz9rIIi1Popxek6VNZg7f8q2hOAuIj2ZJhhHRkgF4oYaSfdBCdIY+A1yDnNNDcanD3I5EAMpNsN/5Ja31v7+IyICDDVCFbcgUI9MNNeuLO0pPFiYfmxprULToPirz8lFr3kFwUF2Da8MDrbum3bncC0ji69EqGwPtCfUkW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917384; c=relaxed/simple;
	bh=XDMQacNyfx4n3g7/PgUe72vk2eAA6Klx6aepKG3gQXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbsqRbkHZuW0XPJtLKRtTF5SbAC9rj4EIsPxoPatzNTJ7tX/+p/xMFk0Gu/xF+PY1rP0jsaUn1pM+VSUQy+qcwY/G7gvb/Ckk3PW5ruNXPkRNz1x4uCbgXVgvdHizKYcvisM3F/9Lii2sI4SzG5Kyczrx0bGMaCelcsb7Ss0rWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IU6Ph3/w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IU6Ph3/w"
Received: by smtp.kernel.org (Postfix)
	id 19D591F00898; Mon,  8 Jun 2026 11:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CD21F00893;
	Mon,  8 Jun 2026 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917383;
	bh=SWeNawLNhjULISRTxxyiDbsmHwEMxRPRgtI7FlyYxgg=;
	h=Date:From:To:Cc:Subject;
	b=IU6Ph3/wOHLQkTZo5izOY5o7O28nPZD9bznAMBRPPuPaPQASjs0wSiz+fZ/J3qA0o
	 Jqqq91JDDzEFpDzwjgiMGTvhJYZnWj3iuqubW9UpmA3BubNW1V682GgEFbaGtdTHie
	 YQrKh8FPf8ssd3B6h/R/i7iUt63uEnpTElDj1UrzlfD4u+HbsTpya7/8NLalw9bAoC
	 K3wEkQOGQxX3rxOGefDs0k2XPrh8A6ICfGfvZg8ZICvk8dEfSNNdxURUR8Pei6Fqke
	 7P24dL0+E9vwZF7rzdvZCagnRDr5QWa6VL6LE29Bq2JuU+nxMWitB7KBoTKdDH/dkg
	 sjQdk74n2MOaA==
Date: Mon, 8 Jun 2026 12:16:19 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] Microchip RISC-V soc drivers for v7.2
Message-ID: <20260608-vacant-slit-9499ba5eb8f2@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/r+1Y7YsIXScGctB"
Content-Disposition: inline


--/r+1Y7YsIXScGctB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Another single patch PR here, this time with a binding change.

Cheers,
Conor.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-drivers-for-v7.2

for you to fetch changes up to 17d9064987ca4e0b05b670da48ca93edb0796810:

  dt-bindings: soc: microchip: document irqmux on pic64gx (2026-05-21 11:00:05 +0100)

----------------------------------------------------------------
Microchip RISC-V soc drivers for v7.2

A single dt-binding compatible addition for the irqmux on pic64gx.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      dt-bindings: soc: microchip: document irqmux on pic64gx

 .../devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--/r+1Y7YsIXScGctB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiakgwAKCRB4tDGHoIJi
0kcrAP9cpEQRIO74ZkX+A/x/04CoXO+GBWKwUdefvC+Ua09nfAEA6hBz7rT9hqoo
LVcmf1tBYT8JUivr1+Hwq00c3bRIqgE=
=gA5l
-----END PGP SIGNATURE-----

--/r+1Y7YsIXScGctB--
