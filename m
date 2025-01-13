Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F871C549F
	for <soc@lists.linux.dev>; Mon, 13 Jan 2025 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736797169; cv=none; b=WdZ/tU8K1qd8yJO8+v54+0NVM0Bytg+qOZaartIl+/8kQqfAPlI01aoXmg+wAP62d3ylO7FQtaudAhsxK9IJ+O+zQ5snF6qBMoBUzviahQgSDWczv+PewIzS1kjb1HqL+HVZtmg8EiKSZEPAhffdSWLj2KSxmp6Fgt3qa0SL/o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736797169; c=relaxed/simple;
	bh=EnQ6EzFguWB0qc0KuTyJ0DL23I/BuZggKv030ouBGe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j5dvk60KFggbKvbIudYD0Uz3jDG1RaXLkam9HJO5t7fkCXAfl9HzsDCNgwgcE4+FetxcipWHomIA+8RjxQT/QcJKGe7T3Ozqpl2UTx5p9ZiAthzGDqbnr9bst728EQDawSCOB7FxoYQWY+YgSkxUYXB6ikdwWYOTPoSouDsOWIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP9Nvslk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP9Nvslk"
Received: by smtp.kernel.org (Postfix)
	id CCE37C4CEE2; Mon, 13 Jan 2025 19:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA907C4CEE1;
	Mon, 13 Jan 2025 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736797168;
	bh=EnQ6EzFguWB0qc0KuTyJ0DL23I/BuZggKv030ouBGe4=;
	h=Date:From:To:Cc:Subject:From;
	b=VP9NvslkGRGcW0vnVNIM848dvk5Eo9+lbMGS/3QOUI+jNNBUj1vRF2yuDFSR/Hnbx
	 4I9vNLvl+Qdl04wcMheXkthG5vtcICdvTXY5hAji59NXjP9GfG+kbal7iaNX36ekbY
	 nDwJ13JCmVzJ5suoLwUPXd25J1KtZ4GOagoW3+7Mvbr0mTRITuOfUAdI+IieDQtxpf
	 4UFKYcDkCkRupwmiL/SOVJwvrb9BRpm5HyeHXqKp+laH1mXEnfOlVxEzEy1lyFNlQy
	 3aK1a3nN6ryVlDvAVl8kRPPoDKrXRtZq1cxvMn5kG/YlG/RJpP6CFx2NazyApZ3Hi4
	 0qXFBtJmKsG6A==
Date: Mon, 13 Jan 2025 19:39:25 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V config for v6.14
Message-ID: <20250113-colt-retired-6f95df3dc197@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DdzWTcn2EEeSzs1a"
Content-Disposition: inline


--DdzWTcn2EEeSzs1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Another small one here, just a single patch.

Cheers,
Conor.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-config-for-v6.14

for you to fetch changes up to e7177ecdd2b73de4e19a02794d29e6c5f06728ab:

  riscv: defconfig: enable pinctrl and dwmac support for TH1520 (2024-12-16 09:39:10 +0000)

----------------------------------------------------------------
RISC-V config for v6.14

One patch, from Drew, enabling drivers in defconfig for the th1520.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Drew Fustini (1):
      riscv: defconfig: enable pinctrl and dwmac support for TH1520

 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

--DdzWTcn2EEeSzs1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4Vr7QAKCRB4tDGHoIJi
0jsXAPoDThgU02kgzlmj+aSswxThrEgeB7UrSdrrGW5O/T63awEA4YlMjz7bIZ5d
VW1Dq3cDo3KAkfouofmYlVeHtuh9Ewc=
=KE7m
-----END PGP SIGNATURE-----

--DdzWTcn2EEeSzs1a--
