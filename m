Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAB3C48BEB
	for <soc@archiver.kernel.org>; Wed, 21 Feb 2024 16:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1A3EC43390; Wed, 21 Feb 2024 16:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FF7C433C7;
	Wed, 21 Feb 2024 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708532856;
	bh=hfeE9saR/Jk9YQ0N1ETT3lLDiDHaavqfSVZ0p835jdI=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=RBKzwaTVGHM/GOFuv2DzRvOkN6EbetLECin9Hg0/LGFbtGb4bVXQTqqkEiKzzByXT
	 2WrvtXev0IzAmRLifTwE54Fp60A0x7Ij8zkh4qUlmP48FHC89nmLv1eIt1QPgCTPgv
	 Yd/oaVG0cgezrML0jgjMUqXeXkqEcnZuRmMxEOxXnIoUvl0gKhZMp8qOfruyP0rcST
	 KmMZWGr0LCLEJj0Nhyj9F4GXLZKD+NCionBsZNrLs0o4CD1Yb9vTA2rm7sW+vd0bQy
	 6xx8HKmkIvw2EYBv/2huMS0wAHFXHmnNUF4yaxtUxnbC4KTovOM0CIbrx69jrJs/x/
	 3reGbIJfCdB+Q==
Date: Wed, 21 Feb 2024 16:27:33 +0000
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Cache driver fixes for v6.8-rc6
Message-ID: <20240221-keenness-handheld-b930aaa77708@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hI9mjl3PHC4X4dzP"
Content-Disposition: inline


--hI9mjl3PHC4X4dzP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

First of a few small PRs - I'd send these as patchsets but my flow for
sending a PR is easier. I guess that says something about how poor my
patch sending flow is...

Cheers,
Conor.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-cache-fixes-for-v6.8-rc6

for you to fetch changes up to 9bd405c48b0ac4de087c0c4440fd79597201b8a7:

  cache: ax45mp_cache: Align end size to cache boundary in ax45mp_dma_cache_wback() (2024-02-21 16:24:10 +0000)

----------------------------------------------------------------
RISC-V Cache driver fixes for v6.8-rc6

A single fix for an inconsistency reported during CIP review by Pavel in
the newly added ax45mp cache driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Lad Prabhakar (1):
      cache: ax45mp_cache: Align end size to cache boundary in ax45mp_dma_cache_wback()

 drivers/cache/ax45mp_cache.c | 4 ++++
 1 file changed, 4 insertions(+)

--hI9mjl3PHC4X4dzP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdYkdQAKCRB4tDGHoIJi
0uFuAP0bFGPsw61cUXEBA5UlG87IeJTSco7JABO9W1zYJqVlcQD+IDEZQNbvLGlk
DrxVMHch5YTuycjT/qUEl4GcriztqAM=
=Pp39
-----END PGP SIGNATURE-----

--hI9mjl3PHC4X4dzP--
