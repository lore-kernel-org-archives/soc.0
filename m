Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D28E2FBE05
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758736218; cv=none; b=ld1aN5dDBkzOH7X+JHUcIYsr6yUca00/vSkOGplzHUJW49qP0aHsewt79CEydKyGC8TmJjA06cYLI6iczTws5pMz2EuyzX3EC4s28+Q38Wa08T1yOR2DseOfED0EayKegg4DV7H41ttMTa5TeB1r2ncfKUFY+CZArtYA/5bPBiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758736218; c=relaxed/simple;
	bh=74KN9oh1byEWmXXX9aM096GB/KOeCB7XK8MCfkCFyrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iv/m9pFuewfNTi+qZoE7zbCJUZevO+4v6wh4b08bU3BatX/niPXoF8QUip2IxcYWEya7/nPp8kiyXQ+zcDcW7HssuaJ9jzf+ba8DkeUaDwk/EToOeQkrOObSofq+6pLlJTaO6Fq+i/GtmP1Ldcwp8OVAuvYYaYnRuoi7g6pUKFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/ifURfT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/ifURfT"
Received: by smtp.kernel.org (Postfix)
	id 046C5C4CEF0; Wed, 24 Sep 2025 17:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2139DC4CEE7;
	Wed, 24 Sep 2025 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758736217;
	bh=74KN9oh1byEWmXXX9aM096GB/KOeCB7XK8MCfkCFyrI=;
	h=Date:From:To:Cc:Subject:From;
	b=A/ifURfTClGY1c+oC0O1OZnLh/WyrNAJZ3byA4Ba4oy0S1gDfG9ZGUvqtIEcytymB
	 opreyiPg8eO7dXCHrpSR0CL7voY7WE+liGbw6TrUNCPhIEx0CiG3lwhjEuNQXyXBHC
	 Pqin/wN6gBNQ0R0/ynZq+vnKWuJAGntfbHyiABZrFR2sU7IpXrGfDD4l5R9yRUxNb/
	 Py19Mrm26PyMlya4XhmV4Jvrbs8TH21JLu62DItjTgRWY6Pb7eMXA8VGZyA3JLWAf9
	 0WlgE3Top6fLH+nGoSCkW1XGeQ92pxyqJtCl5on3L8PhQsaAxlt1JUI370gcrhkTRp
	 mxi05Sy0Z7OTQ==
Date: Wed, 24 Sep 2025 18:50:14 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V cache drivers for v6.18
Message-ID: <20250924-relenting-aqua-a4a93b89809e@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HYjhK9UizMWbDT15"
Content-Disposition: inline


--HYjhK9UizMWbDT15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Wee PR here with just two changes, for the standalone cache drivers that I
look after.

Cheers,
Conor.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-cache-for-v6.18

for you to fetch changes up to 941327ca5ddd45cfc4dd960cbbabed9e2b5cb1b0:

  cache: sifive_ccache: Optimize cache flushes (2025-09-11 19:13:21 +0100)

----------------------------------------------------------------
RISC-V cache drivers for v6.18

sifive:
Reduce the number of fences issued while flushing. Samuel reports that
this is approximately a 15peed-up.

ax45mp:
Fix the binding so that it permits the cache-sets setting used by the
recently added QiLai SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      dt-bindings: cache: ax45mp: add 2048 as a supported cache-sets value

Samuel Holland (1):
      cache: sifive_ccache: Optimize cache flushes

 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml         | 6 +++++-
 drivers/cache/sifive_ccache.c                                     | 8 ++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

--HYjhK9UizMWbDT15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNQvVgAKCRB4tDGHoIJi
0tFTAQDkNSfkghj3zWo4zEHYMGIvZajP2CI9t7HsHZku1aHfTgD/UQjcnHnPzOwZ
cUJgR9ea40cJtMMcB3zNiViHjX3vdQk=
=8Nuq
-----END PGP SIGNATURE-----

--HYjhK9UizMWbDT15--
