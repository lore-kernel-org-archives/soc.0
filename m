Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D514831D
	for <soc@lists.linux.dev>; Thu, 31 Oct 2024 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730377342; cv=none; b=aDUz/+8G0m9KyoJU9EB3KSfUHvHrlJv4+VIl844ID3j6w8efy4Y628EMUulyaHotZBvO5nnTNa5OcpX/R0wM8M2hjh5XfZaGdQ0Ap/2LCtR5WMFJq+ipLtZ4OgsB2eqcMUtGkVc0LZp1hJfZ2057bSg4ebZCFGIAKJQS3cRWfFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730377342; c=relaxed/simple;
	bh=1CwaCKaAMFiIdn0h6+nFasiEDWSxxpKstil5b0DbBG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ordRn972V0GVblr+F7wGgeO3PAjD2rWyI2W1Y0WdaT6D6vc+Q19ZpUGjm67W7KI1KuB426lEZvNQjPrmo1BuH1vtw1eK282YGbSc4YlgTQihKY2Bp7TtgMhLoXxLSC57vO0NcQlXsnHLHK9EIGFUT2N6qTJURSK7Zs8orUCGm4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbYWQ5ij; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbYWQ5ij"
Received: by smtp.kernel.org (Postfix)
	id 8DA6FC4E68D; Thu, 31 Oct 2024 12:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6850C4E671;
	Thu, 31 Oct 2024 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730377341;
	bh=1CwaCKaAMFiIdn0h6+nFasiEDWSxxpKstil5b0DbBG0=;
	h=Date:From:To:Cc:Subject:From;
	b=SbYWQ5ijCpOBDSwCVkiITvxKkQy9BPXK/4/Ok2DFQKEtTrY4RIMQ+VnX77Eu7Ool+
	 Q8pjDfNwr5hfUzyNqXuXn5zqGgGwy/acP2OBXwSN+JT1SRlLZZq/bV8jLDFyModLN/
	 WFN5ZZhT1QsKpIBLmqHBzFh8oY7ycKWzfDNtLqqzDqBCUqWRCrstb+PpXY4VnR+rKO
	 yGhzRAD5HrodvlLonzWN2rzlgDiRu5ygoU5uAN20A2lEhAy3cZGQl7UGb5ZDUrK8ba
	 nL1QnugES9xpusokSTxjqtXRIct4lME5nevSxRLLK/PewucVtvwa8oXAAOqSINK9Nz
	 5SIxF25CttgPQ==
Date: Thu, 31 Oct 2024 12:22:18 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V soc fixes for v6.12-rc6
Message-ID: <20241031-colossal-cassette-617817c9bec3@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kTm0+sFzuK+Ucblh"
Content-Disposition: inline


--kTm0+sFzuK+Ucblh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some fixes that I have accumulated for this cycle.

Cheers,
Conor.

The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

  Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v6.12-rc6

for you to fetch changes up to 384f2024e1a100b9b977a697f5e7cb151b00550d:

  MAINTAINERS: invert Misc RISC-V SoC Support's pattern (2024-10-24 16:27:10 +0100)

----------------------------------------------------------------
RISC-V soc fixes for v6.12-rc6

StarFive:
Two minor dts fixes, one setting the correct eth phy delay parameters
and one disabling unused nodes that caused warnings at probe time.

Firmware:
Fix the poll_complete() implementation in the auto-update driver so that
it behaves as the framework expects.

Misc:
Update the maintainer pattern for my dts entry, so that it covers
the specific platforms listed , rather than including all riscv
platforms with the list platforms excluded.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (3):
      firmware: microchip: auto-update: fix poll_complete() to not report spurious timeout errors
      riscv: dts: starfive: disable unused csi/camss nodes
      MAINTAINERS: invert Misc RISC-V SoC Support's pattern

E Shattow (1):
      riscv: dts: starfive: Update ethernet phy0 delay parameter values for Star64

 MAINTAINERS                                        | 10 +++---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  2 --
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |  3 +-
 drivers/firmware/microchip/mpfs-auto-update.c      | 42 ++++------------------
 4 files changed, 12 insertions(+), 45 deletions(-)

--kTm0+sFzuK+Ucblh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyN2egAKCRB4tDGHoIJi
0l8BAPwM5TGTM2+fHKZL9/2adoAeE49F75k6RB4gH04AoCG9PgD/V/QzcxcfGFkI
KjoZYDFLg8MVrgoyz/hxMELOmbij4w8=
=65OL
-----END PGP SIGNATURE-----

--kTm0+sFzuK+Ucblh--
