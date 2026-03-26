Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59453876AB
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523625; cv=none; b=kbmcFwMS+dto+AF6D3q5aqSswLU0t2mKd7wh0X7Dvu+Fmw138Z2ntf1vnxtyn5D0t8+siWavczI7Q1Jb9r5oGgHGpJJaKsJoe/SPUj5p8QOFdeAI7rHH+T1InzvwYNFhdaod5UZ4xHaN/KmGpbBfJPZwuSiM5hQ+8fAHXSfT+q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523625; c=relaxed/simple;
	bh=IwGS7scWtDYJHHjUFe2o0klWiLuIEDxH1PZg+1+e2sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mM9a412Udl0bLKf7G7zg5O+TmmyQT69oS7DqqsAHf8E0v/dBfvsxwDYKZAxcOise7nqPwzHydoQaRzk4BOt6o+dGbcutkLKvcny+d2z1ELucTumTGRYGeo2gk0LMA3skZSkEZ0aPaGbeYxMmoVEWkpmki6ZxRF2AVqn2nqRkfZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCSAoKxg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCSAoKxg"
Received: by smtp.kernel.org (Postfix)
	id B2C39C2BC87; Thu, 26 Mar 2026 11:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D81C116C6;
	Thu, 26 Mar 2026 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774523624;
	bh=IwGS7scWtDYJHHjUFe2o0klWiLuIEDxH1PZg+1+e2sk=;
	h=Date:From:To:Cc:Subject:From;
	b=nCSAoKxgY8n5hX+Uz3VEPy9mbROEixyuBWn4Plz21Sn0dODnZ7IEpYtA2OpN7mhXY
	 T9IqBiLX3Gn9cnwbh+hkkgTCN7v3grl3V+JozXa9jrGRJU4Ufcccikt+fWywoVx4pK
	 uV/L2Pm41Q7Vti1/sddkryyqMZKiHKfCZsxLFyJRtU9CZ5JKm+hdrxdhgHygOZTP/h
	 JBx9cNEcKZMvlqnDNhG8YEJ7zgbueL4IrPg/GhJpi0R60l6DWmaIVbNuOh5RfrkxB1
	 uQGlFMObP/exitw7I/89Q0MgznIzVSZWyoigHm+5MKrmRZGT0bwQxplad85T3+w7xG
	 SUB7AR3zsxHzQ==
Date: Thu, 26 Mar 2026 11:13:40 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
Message-ID: <20260326-astrology-rephrase-836ec663228b@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jOVA/8ZDBYynMp1D"
Content-Disposition: inline


--jOVA/8ZDBYynMp1D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull a small fixes PR.

Cheers,
Conor.

The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81304a:

  cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v7.0-rc6

for you to fetch changes up to 305f2865bd034146b2eebc77c27fc50d8d79778d:

  riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card. (2026-03-19 16:00:13 +0000)

----------------------------------------------------------------
RISC-V devicetrees fixes for v7.0-rc6

Starfive:
Two fixes for the SD cards on the Mars CM Lite.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Heinrich Schuchardt (1):
      riscv: dts: starfive: Milk-V Mars CM Lite broken-cd

Ilya Sorochan (1):
      riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.

 arch/riscv/boot/dts/starfive/jh7110-common.dtsi           | 1 +
 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

--jOVA/8ZDBYynMp1D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacUU5AAKCRB4tDGHoIJi
0t+KAP9HVGkJX8FC4N8a4WE1UvLQLpZrF1Kmxuixb0BDyKB5awEA3quQTryt9l5W
VRD7jvpDTuxAQFfucN2Xu7HumY2U6wU=
=ElcV
-----END PGP SIGNATURE-----

--jOVA/8ZDBYynMp1D--
