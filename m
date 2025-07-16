Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D662F5C3C
	for <soc@lists.linux.dev>; Wed, 16 Jul 2025 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752686112; cv=none; b=WggeePyzfkjjjbOpB/noprRwqvrfBjVbmfueFbmuh6osAO6xkYAYHPPiyk0Mhp9fAvtNpsVNcAcPekxfmgbX9zoVqWhb9xepzPyjKyGd8kIMto3IRbGucQN/Nl49bd1kgX+SG2LSYDBT0OW4SsbQ63Fh0vhtS3fT4QQvm8VY8Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752686112; c=relaxed/simple;
	bh=irLzSsCSYV5e8jDywzJqBUzqNoElbnVbaUSxvmy/N6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tpKlDBKTrI6PPHyUxLDF4rR7nKa4RcgTE9/en6Z/msvh6H02e1QXC0HlT6SkVyhfVkn1RaqZFuytSY80/D5xxgt0AFgxOjNNleWHYt9wCSI5nE5+uEQ9cmDKP1y03g6We3CsTc9p6RJInLGarAHUUtUBj037dp+wyNN/Mtq8IJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9neS086; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9neS086"
Received: by smtp.kernel.org (Postfix)
	id 9C5CEC4CEF5; Wed, 16 Jul 2025 17:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1DEC4CEE7;
	Wed, 16 Jul 2025 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752686110;
	bh=irLzSsCSYV5e8jDywzJqBUzqNoElbnVbaUSxvmy/N6w=;
	h=Date:From:To:Cc:Subject:From;
	b=e9neS086GERdBhjjHyTrxKGkQJt08A+Y+Xr8QpxOWWjaCbS3Q70D/8M3jjOnvCn/+
	 cvM+mutAi9N39HnOI/EGOxNW2ij6kMMgUwc/Dk5pqdPwzIYd8tmgUIOL+TD5Lhs59G
	 jFRHOKz6rVQ9i6CAtk8cK7176H71BMo34dlD8j/8AGAAa0vGCwYWyxt8ofUIEcAxd/
	 w+ZDCwu2FDLm2pRxLP/hY2EawHqymZhOTHEV/W14LVudalrnFv8Pkpssnhi+a80pJU
	 dYFJ88I/2gKQ4rjawHCaSnxRPqptgSCEYJhmMr+GB3qP3ErHUOrzFo88yx+JCf4+5D
	 S50WDPqeTfe6A==
Date: Wed, 16 Jul 2025 18:15:07 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC defconfig for v6.17
Message-ID: <20250716-defrost-regime-20a55ed925ad@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jp5PSx/13vPMpdjr"
Content-Disposition: inline


--jp5PSx/13vPMpdjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a small defconfig pr. I may have some dts changes in a
later PR if Linus doesn't tag v6.16 this weekend, but if he does then
this is all I have for the v6.17 merge window.

Cheers,
Conor.

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-config-for-v6.17

for you to fetch changes up to bd4d5d3faadcdf5d65377f14dcbaa4dbb27ee637:

  riscv: defconfig: spacemit: enable sdhci driver for K1 SoC (2025-07-09 17:13:24 +0100)

----------------------------------------------------------------
RISC-V soc defconfig for v6.17

spacemit:
Enable sdhci and pwm drivers for the k1 soc in defconfig, the former as
a builtin and the latter a module.

starfive:
Remove a no-longer required config for the starfive sound driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Geert Uytterhoeven (1):
      riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m

Guodong Xu (1):
      riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

Yixun Lan (1):
      riscv: defconfig: spacemit: enable sdhci driver for K1 SoC

 arch/riscv/configs/defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--jp5PSx/13vPMpdjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaHfeGwAKCRB4tDGHoIJi
0pHRAQDMikO0BJTDhSxNIrTIXDf1DuNCkxOwSPqW7Ya/OuNRzQEAgXP6jhBo2kdb
K+8FiBu1owP9PUQ2yUF9JK0QwwNs2gs=
=Qodv
-----END PGP SIGNATURE-----

--jp5PSx/13vPMpdjr--
