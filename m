Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDC5C4332F
	for <soc@archiver.kernel.org>; Wed,  1 Nov 2023 12:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D19DAC433C8; Wed,  1 Nov 2023 12:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D35EC433C7;
	Wed,  1 Nov 2023 12:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698841039;
	bh=0XiE9wAIOR0erJx7O94+qZoOgDxDOxtAfewenZYLjyg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ccCwoW7UeaoXS522nwOfhiWRYCpvw2jP75vXK/g2bDmydqNvvcr8AGNV1r2MIKmBH
	 J89pe6l9MDxDrpDLOtSA724evgXX+PIs758yjV57NW8RyhhunTnzVMFM4rXtKMPR/H
	 4p6AEX8jjUgMVAK/5D5L2lORrd9IWg33KSj63p+5LR4/4XEylwT7plJRhiBVNODsBd
	 03NpWwa14h4Ih1+Q4vvwUXModFTSVafuVrG3/1iei+3xC+HhO750mOpDEt/s5n3d67
	 nrBzERz/zUS27szwT2ynB/1HpNu8UfQDW57p4fSRMcIlhBCA/eRaSqclEoLJ+3JNSf
	 YuU7hCEYiergA==
Date: Wed, 1 Nov 2023 12:17:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Christoph Hellwig <hch@lst.de>
List-Id: <soc.lore.kernel.org>
Cc: geert+renesas@glider.be, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	soc@kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: split cache ops out of dma-noncoherent.c
Message-ID: <20231101-reseller-encourage-385ad0ef4012@spud>
References: <20231028155101.1039049-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wb77gT0vPt2mw1+g"
Content-Disposition: inline
In-Reply-To: <20231028155101.1039049-1-hch@lst.de>


--Wb77gT0vPt2mw1+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 28, 2023 at 05:51:01PM +0200, Christoph Hellwig wrote:
> The cache ops are also used by the pmem code which is unconditionally
> built into the kernel.  Move them into a separate file that is built
> based on the correct config option.
>=20
> Fixes: fd962781270e ("riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend=
 on RISCV_DMA_NONCOHERENT")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This fixes two different sets of built warnings reported by Randy.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Wb77gT0vPt2mw1+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUJBywAKCRB4tDGHoIJi
0rxSAP9lbdAnkwfEHgZV5dwAEwuLkR1+sg5y15mNNZyzxmzC1AD6A55uZ4D7wNtH
/Afv7AVITV+9NF9O/Mw6xCpOtb/s5A8=
=THGL
-----END PGP SIGNATURE-----

--Wb77gT0vPt2mw1+g--
