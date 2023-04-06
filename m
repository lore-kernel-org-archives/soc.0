Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A8AC76196
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 17:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB4BFC4339B; Thu,  6 Apr 2023 17:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A387FC433A1;
	Thu,  6 Apr 2023 17:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680802619;
	bh=o0IjLSZZfFQ9RGYy0Tq46qzeu7Il62Mml5r+70PT5+s=;
	h=Date:From:To:List-Id:Cc:Subject:From;
	b=Vh+zdVchiBtW10KtTDERairK6oZvGKzvNBfkuYpeLtCvmxr2gajQPzRn0iUMUEZ4r
	 mWq8g4YWHgOgs9ESG7JQgKTcJL0ilOBbhWDZFbDemYrq+W2Gu+MNurmANyzfG88FJx
	 2JwcWGHDU1XAC6vhd2dYJoS9LNWvtW9OkOd1F/smLLwbTAD+Z5KvotKbSEa9ij7LKi
	 L/j8cjOAl5gyv0i79OvlYXFIkAfm+UPm5ezW8dj9Y90BbeJTbCVLOVzlQdKaplWUK5
	 IwEFuCLrP+MaUH7V9IExB+bS3gM8QVtpTL2238w21DeokabzFwRNZv+rQJ3n0cbFVX
	 56rF0AoDMmayQ==
Date: Thu, 6 Apr 2023 18:36:56 +0100
From: Conor Dooley <conor@kernel.org>
To: arnd@arndb.de
List-Id: <soc.lore.kernel.org>
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.3-final
Message-ID: <20230406-negate-octagon-0fc2e47dbde5@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qet3MONiiEbbE/SP"
Content-Disposition: inline


--Qet3MONiiEbbE/SP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a single fix, it's been a quiet window on the fixes front!
I don't have any urgent fixes on the soc side either, only fixes for
behaviour that cannot be triggered with an upstream kernel that I've
put in for-next.

Thanks,
Conor.

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v6.3-final

for you to fetch changes up to 8056dc043d7f74d7675d413cb3dc4fa290609922:

  riscv: dts: canaan: drop invalid spi-max-frequency (2023-03-26 23:58:27 +0100)

----------------------------------------------------------------
RISC-V Devicetree fixes for v6.3-final

A solitary fix here from Krzysztof for an invalid property that
should've probably been removed months ago, but was missed due to it
being in a dtb that doesn't build w/ defconfig.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      riscv: dts: canaan: drop invalid spi-max-frequency

 arch/riscv/boot/dts/canaan/k210.dtsi | 1 -
 1 file changed, 1 deletion(-)

--Qet3MONiiEbbE/SP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC8DOAAKCRB4tDGHoIJi
0u3UAPwN7hF9kNXZBtGCINhx1e0Li3ok6JNeFQCv73oY1T3IAAEApFViwu9/4Jay
LS0dKxYkk1FI6k7XEhNl9ozqycpIgwk=
=h7tw
-----END PGP SIGNATURE-----

--Qet3MONiiEbbE/SP--
