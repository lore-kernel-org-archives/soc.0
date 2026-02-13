Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53C134D4E6
	for <soc@lists.linux.dev>; Fri, 13 Feb 2026 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770985220; cv=none; b=SeNXu3QjFdyZbxVVjz3lHtEa8j5MeHVvUOlzbaKyjh4d+t2L7OI5sYjN4avdzYXtxavu57pLjbSrejwYBklqjdQXXvC4SrysEU70hCR48lIfPczab/9PgzSXjvY5lcq7S9rZCWIKYAdGGBLTgogo60eFn3xTyogzbxzFntPbxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770985220; c=relaxed/simple;
	bh=mRj5YS/dbQQfv6rmffWCjJcONP8Aig83NSsn4JexlVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pc7Nxcp7HZpIZkXWNpwt9yM7qiKVE6rvK5O4CfICxQVZL+dUO64tXfuEH6curK8Co8e0eB5HRW8L+DUtcqRV28PEO1mKqkM2nBNkj3QFqt4NklUEkqutJrp73l4N8HFaZWY4C4PAIpvTDncJccYQxA6u2CYIJ/9zvoPCk4HTK40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m37q9ytr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m37q9ytr"
Received: by smtp.kernel.org (Postfix)
	id 8788EC16AAE; Fri, 13 Feb 2026 12:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B2DC116C6;
	Fri, 13 Feb 2026 12:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770985220;
	bh=mRj5YS/dbQQfv6rmffWCjJcONP8Aig83NSsn4JexlVA=;
	h=Date:From:To:Cc:Subject:From;
	b=m37q9ytrj7hRF7yZqySYYxgA7Nnsk+Tg1N4OY6jYBbUcRVIpnjr3Awih6iGQLkY0r
	 yf8ZPDs4x/r/ysMwkvc3euJr6sepFJRTpK7I4uMElqomSc3Cr5HIAMPl+yb8GLFBxb
	 RA4tF2ke9mNQDbohTKPcwnPje5mMPQ28CsnX85MluwzMz1sSz+MXvXBXic4X26Mlhe
	 hU2oYAAqpFMzfPUdcl+oEFg9rQD7QvXE7Wr08tvz0FyurDazx1hSW7WvnMqXTrEjey
	 PvFarKGdV/2pCho4pZd0haQO9KsmOQoLKmcp5AOqVrd0LA+dXeP4cUbKUQLItN95u3
	 s1KbahlkU0U8g==
Date: Fri, 13 Feb 2026 12:20:16 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, jonathan.cameron@huawei.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V soc fixes for v7.0-rc1
Message-ID: <20260213-stole-economist-d5b0ac711d42@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1bHQZNbPCAIvSPgV"
Content-Disposition: inline


--1bHQZNbPCAIvSPgV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Nothing super urgent here, but figured I'd send before -rc1 in case
there's a second new content PR this window and you can squeeze them
in. Otherwise, of course this can just go into whatever regular fixes
PR occurs later in the cycle.

Cheers,
Conor.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v7.0-rc1

for you to fetch changes up to 0528a348b04b327a4611e29589beb4c9ae81304a:

  cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)

----------------------------------------------------------------
RISC-V soc fixes for v7.0-rc1

drivers:
Fix leaks in probe/init function teardown code in three drivers.

microchip:
Fix a warning introduced by a recent binding change, that made resets
required on Polarfire SoC's CAN IP.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: add can resets to mpfs

Felix Gu (2):
      cache: starfive: fix device node leak in starlink_cache_init()
      cache: ax45mp: Fix device node reference leak in ax45mp_cache_init()

Zilin Guan (1):
      soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_probe()

 arch/riscv/boot/dts/microchip/mpfs.dtsi     |  2 ++
 drivers/cache/ax45mp_cache.c                |  4 ++--
 drivers/cache/starfive_starlink_cache.c     |  4 ++--
 drivers/soc/microchip/mpfs-sys-controller.c | 13 +++++++++----
 4 files changed, 15 insertions(+), 8 deletions(-)

--1bHQZNbPCAIvSPgV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaY8XAAAKCRB4tDGHoIJi
0ukwAP9U3k8dWwMY8LV6dorfZ+gwYjZ3OeZNfxsaz2YoLhGpTwD/Q0v3VCZ2EbNu
Crx4v2DxOQw4BBRKUu8BC+DgwTuz2Aw=
=MF+S
-----END PGP SIGNATURE-----

--1bHQZNbPCAIvSPgV--
