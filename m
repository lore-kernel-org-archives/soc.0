Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DE63043B0
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 17:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758736005; cv=none; b=orxdlxqKkwOFwJ02fxVa7JtjtmpsG88YCDXMmh3BIqIRdSArLNo6tGpVs3vGR21g0/dwEpO7+bySNHCbBmO1Z6mel2G2kljOya8hCYnXrOubWxXkuhdPavsIVYbK0HmtHwtR+eGpUtU0YrYy89MNNviZQYhHSfPl3P7i7LX0f0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758736005; c=relaxed/simple;
	bh=IN+QAr5tK0RV1rS3R/0YpjGQlOE9FqGg2X6T5EcrTMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0UZU+YfVcv3qqEi0xTPN/P+3jY7pU8aCleGBFj3kXuNBNxUNb5AqRqwuwsV4oifKfkRpcl2jgFfJZankMKwzO92hwH0XJnEut7wuXacM4Wu/JjNNWIsR0a4FPsh3ZCctHNrMde2fUVfc2XQ8dInTZ8uLJsQJyEytZ8Snn+XG7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZJuIas5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZJuIas5"
Received: by smtp.kernel.org (Postfix)
	id D7D40C4CEF0; Wed, 24 Sep 2025 17:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAE5C4CEE7;
	Wed, 24 Sep 2025 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758736004;
	bh=IN+QAr5tK0RV1rS3R/0YpjGQlOE9FqGg2X6T5EcrTMI=;
	h=Date:From:To:Cc:Subject:From;
	b=uZJuIas5bw2pPmUsPmIqhPhqcFbsi1TUf4DSZRqy0r7bTPxCPeQECcXGruBTe3tbK
	 W8rsmoTHas+xQkZLKcv6JOYHmvHFrsghaqD/t+brkA+B/LpGWowHhfTN0bRFaSBmRU
	 IFzdV7yvcaI55/fsuYLzjUMqFoZCmK0BxK1QE09M3Lp6xWy224uvAMzzwqMZzdsvv7
	 VTiVTzOxvZDhQJe8hY87naKozap5VMsj8MrRdewiTUx5j/g1/9r82EjkVvG4i9reOC
	 mbo/F+jrHM2xtkyX9Vjrj/ALA8yH5yPq1e27Ky6jbLbewZy2K06EsjGqmXjP4szo0R
	 LS37hem7dV/3w==
Date: Wed, 24 Sep 2025 18:46:41 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, pjw@kernel.org
Subject: [GIT PULL] RISC-V config for v6.18
Message-ID: <20250924-unenvied-armful-5fcc80c23d19@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hQHISVyvhQW8+UH"
Content-Disposition: inline


--4hQHISVyvhQW8+UH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arnd, Paul,

Arnd: here's the soc-related config changes I have for v6.18-rc1

Paul: I meant to come to today's call and forgot, so re-mentioning the
fact that I grabbed the savedefconfig reorder. Pull this if you need to!

Cheers,
Conor.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-config-for-v6.18

for you to fetch changes up to 3df7ce0e43ad94afce24b6300e7836e2db6dc0ee:

  riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC (2025-09-14 16:34:42 +0100)

----------------------------------------------------------------
RISC-V config for v6.18

Enable the MMP_PDMA driver as a module in defconfig builds, where it is
needed by Spacemit K1 boards. This depends on a savedefconfig reorder
that it'd otherwise conflict with, so that's here too.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Guodong Xu (1):
      riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

Yixun Lan (1):
      riscv: defconfig: run savedefconfig to reorder it

 arch/riscv/configs/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--4hQHISVyvhQW8+UH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNQugQAKCRB4tDGHoIJi
0mUDAQCTjVN9vHQTzb1c6eYVg6QN3G1e9arRZtZ7q0DH88BYIwD/TbzFv763VQlb
pHORqK8dMo8mhkSzAZDc0XvVHBnfjgQ=
=UJgL
-----END PGP SIGNATURE-----

--4hQHISVyvhQW8+UH--
