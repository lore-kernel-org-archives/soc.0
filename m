Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B121D1A8F97
	for <soc@lists.linux.dev>; Sun, 29 Mar 2026 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774791970; cv=none; b=VDexIT9wr7eQyFqdrKPnDLAJ/dey1+xZDGt1jJ5c1r/GGLlROzgUgTsQ+8+XzhCMc+A3gQp6oX41HvJZmNt0B3GWkDtw0iljqbxOXOiEHY6F7XwgYfC3FoXfsMiIiATcMQEfuLRnFAtutJsJsLnpbe9YX1Damv16lRxFGdaFZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774791970; c=relaxed/simple;
	bh=st4JvI4NAoWoSh7mtrnC23ws4KEdwaq6g803oyRstdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LF3hsQR2lw/q7Vm5E1GapHw7weBHfAiDl1jgbJWyh7QjAqrA8i18AsY+GL0VykNZjOLtt/JkTMOxSs3XxY59RJ0eTTTU4LD6e9R1EfRdK0SqTTq/AeMEVRFRcF0F5OLcNjgLTwzYPMXeGVjYlCBrzaphVQ8V0yIqwjyETKqTOcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ag5a4GMW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ag5a4GMW"
Received: by smtp.kernel.org (Postfix)
	id 9B2F7C2BCB2; Sun, 29 Mar 2026 13:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3A9C116C6;
	Sun, 29 Mar 2026 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774791970;
	bh=st4JvI4NAoWoSh7mtrnC23ws4KEdwaq6g803oyRstdo=;
	h=Date:From:To:Cc:Subject:From;
	b=ag5a4GMWBmeA2iSrFzckVCCFDXMh7s+5+OaCQv/OHPNWicdoZvH3KJg/PPz+W8dvJ
	 Tf3OlWWyO8orAvlaL3kNy/Vvw1cZjoAeWABDhNQUqwosnJJepJCzvmXCN2DAHclAqe
	 UjQZfEagFlp6NcAArlgb/Vkyv4NZZLbfzMdYpr6JqBuJpR6QVXIQcpUxZI7unqntW+
	 AyTavCLVBVDOEydKmVZz50MoB3uMcYBBWa+Z3vY0Tb7tktgzgQq9qbwBaoBX/KN0Q4
	 e0RHLyMABT7VPP+wkisMFqa5Z3hO4phJCeMjFrjNeftqxNUhVABbcF3+v0Dxz6NNL2
	 nMkJiANzcmkBA==
Date: Sun, 29 Mar 2026 21:46:06 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Fixes for 7.0
Message-ID: <acktHkKlWDUbsE_a@home.wens.tw>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v5LD4MI+NTyJgjjY"
Content-Disposition: inline


--v5LD4MI+NTyJgjjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-7.0

for you to fetch changes up to 6896ca5a9d05275fbeb38640c9bbdb95698de188:

  arm64: dts: allwinner: sun55i: Fix r-spi DMA (2026-03-24 11:08:10 +0800)

----------------------------------------------------------------
Allwinner fixes for 7.0

Just one fix to make the r-spi SPI controller use the mcu-dma DMA
controller for DMA instead of the main DMA controller.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      arm64: dts: allwinner: sun55i: Fix r-spi DMA

 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--v5LD4MI+NTyJgjjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmnJLR4ACgkQOJpUIZwP
JDB/wRAAgihVyCHgeFcD+Nx91C6P5KXUh15zNXx78fDW+tHRGeKhvAKHhQpirUI+
jszpgwgOp2jAJ2oTGcJ5gPab58VbaBd0h8dSbvu5Tyd1tdN4tdcCExNVdtuIpycq
pQGpiHrgcgWB3OhoDYZ1/LJzkob2QreeL/6WdwHk4XKahjV/g9X1zPBNUjF+jS30
T7v2jHnrr0q8Caq0FBvJLrgeipYINulTfWTjP//5wg3nVHlLEdd1OMipWMcLelh7
XDqM0vFMuKC+VtzU292aV2QryrDOnkR4ekucG+99/Lm2JzWmdxsXC6MtwUy5Hb4k
6wzPV96RhRefpL4O1U1M0xGhD3dF+9aTinZNykFMXcg8dEPT0UoErVYjZUkBv3Zi
zRu7Ghp05HCgVcy4Ac+Uw2HVmDu6Y25JS/RrfHHzw6dzPLubHMCVaL0YSJOm4ziH
uTpVdnedV9r9M0RKI64rAvI6XAdHroiUwfp+FuGAWVwz80fluKLrFfEIJuDRxtb1
tWIwK2m8gFzQSv+wM6JAsUzIr7KcrtjZd6+lbVd/Q+pjjxGKKvQiPYkxWs8ydQEi
Pgza5tqGHrztfS0xGoXij/DYS6ycrDa5ql+HhDfqUIRCmBvq0WKRyQihokKCkYvY
1J7GQZWMqzEonhjQ+By3WDTm05YIs/RwouMt+JKKCt916rvbcSw=
=J1DE
-----END PGP SIGNATURE-----

--v5LD4MI+NTyJgjjY--
