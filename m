Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B20C4345F
	for <soc@archiver.kernel.org>; Sat, 27 Apr 2024 11:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5FC92C116B1; Sat, 27 Apr 2024 11:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E0AC113CE;
	Sat, 27 Apr 2024 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714215816;
	bh=t7WJCJ2IOLzIiafVQuwBdJHvmvR0DL9iSenJjWaZspA=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=TaoOq6q/dg23xROmntFTGgmZ/6dArvuHP5LD/CrKEcKDy/97PYNSgupNYLXpYNPAq
	 ehwFVPw1BynbZhC74hJFB8Hch10DqJuYfJBvYnUQMAZIY1yS5+TpD3ofWXBXdb15kH
	 cMfA9TixuEcxUkQpmoOR9FoHM8gSFxa+YkplBgtgTCvCifbwz2zlorXv0RE4QUskis
	 w/d/ZuXTHFO/DofTnLL6bjHbPuGHXC92OXUqE0bGdWHMnBI4++AccVCjceSY6gl65M
	 FlNL1K8aaNWwJVOsZYLg2PGXmgaWvxD+/N189c0wwcr5amidAoEfQPUKWG4zPGYWWr
	 EcuOthGYF0/Sg==
Date: Sat, 27 Apr 2024 12:03:33 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC driver fixes for v6.9-rc6
Message-ID: <20240427-unflawed-humorless-690472f9c5a0@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6+0j8s9u3CcYEjQq"
Content-Disposition: inline


--6+0j8s9u3CcYEjQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some minor fixes for some of the drivers under my remit.

Thanks,
Conor.

The following changes since commit c90847bcbfb65d0f1c48fcc73a2b3a2d4ceac6a1:

  cache: sifive_ccache: Partially convert to a platform driver (2024-03-28 22:40:56 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v6.9-rc6

for you to fetch changes up to 3aa20d1f7bcb19a79b8062e49153eb3b16a88adb:

  firmware: microchip: clarify that sizes and addresses are in hex (2024-04-24 22:02:20 +0100)

----------------------------------------------------------------
RISC-V SoC driver fixes for v6.9-rc6

firmware:
Two changes for misleading printouts from the auto update driver, one
for an erroneous success message and the other to make it clear
addresses are in hex.

cache:
Samuel's fix for the ccache driver left an unused variable, so he
sent a follow up patch to silence that complaint.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      firmware: microchip: don't unconditionally print validation success
      firmware: microchip: clarify that sizes and addresses are in hex

Samuel Holland (1):
      cache: sifive_ccache: Silence unused variable warning

 drivers/cache/sifive_ccache.c                 | 2 +-
 drivers/firmware/microchip/mpfs-auto-update.c | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

--6+0j8s9u3CcYEjQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZizbhQAKCRB4tDGHoIJi
0rSqAQD9Oxni1oYISoNG3eDcofmwhzGaogsC0pvlTD2vT+MIIwD/R2S7OwcbiRa6
t/ETcobl0yefgtfZhkneIzPa+w1D9Qo=
=YNaL
-----END PGP SIGNATURE-----

--6+0j8s9u3CcYEjQq--
