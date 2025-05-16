Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B5A1FFC77
	for <soc@lists.linux.dev>; Fri, 16 May 2025 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747392011; cv=none; b=ecarM3gRqmMKACDO9OfPmvskBAPKWte21hP4uhn4o4rNkHdk7JBL9jvG3KPLeuOeQaqPtw4GrjOP9UUvhSw2e6UBefEmCHQuvfra7QC6aztfn9RoMqbPXXc4S6j3nOmbyprpN3Q2VqCKsCcR24c7zQ2SYqY48HJvsRptiW0tzZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747392011; c=relaxed/simple;
	bh=AN9xNiEnuC0FAC3J8l6YjMN0qAtQk2YK6ewah96dz2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DK0UIn5DEFflwfs3832t+WVhyY6ALkZ/6jcK2Ui0G1vDWK4zZ3uO1D7c/rZhmI3jiYdHPGRCdSkBqpSNJX7iXc5WjFyQKOt6o11hAdusRvokUEOTaQE7R56gkEgxo7jFVGIuDgLZhOjL9DQFEL9txD5UFFShgVLcUC1hhofRYIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8bUiSyG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8bUiSyG"
Received: by smtp.kernel.org (Postfix)
	id 2BEFCC4CEED; Fri, 16 May 2025 10:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA43C4CEE4;
	Fri, 16 May 2025 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747392011;
	bh=AN9xNiEnuC0FAC3J8l6YjMN0qAtQk2YK6ewah96dz2g=;
	h=Date:From:To:Cc:Subject:From;
	b=L8bUiSyG6GvRKqWhDELVSFXljMFjk8Au70t4Rr9WfOzDwFEfjj6kYNlIVnm3xb2q6
	 CiY3aVPXwQAHuB2397ZFevuL2TTQusER2gaNieYuWg4XBLNne5Ap1KwEUM+QOjQRTr
	 T+FHsiRDM9eBbKC+OUKuZRIXrOMWIZUUIYX+QMjL+HE4sd8LRsWqqYvYSER4VOX2Jk
	 qc+MP2ZDHJlBCkyCdf6Ecrary7V2b6ZW2qDe4ibUEEAiNd0C6iWXO9DEaH0NmQQjJr
	 vMsQ2i3E75rUcfHUayAnGWzqKteNtyP/9OkWNwgdEGZy13KMJzYPzfbCRkVREvZLil
	 yAtHfsAkzjUsQ==
Date: Fri, 16 May 2025 11:40:07 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL 2/3] RISC-V cache drivers for v6.16
Message-ID: <20250516-liability-facility-667fc14a2a85@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yQbHU6bp1wkj9V7M"
Content-Disposition: inline


--yQbHU6bp1wkj9V7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some cache driver/binding updates for 6.16.

Thanks,
Conor.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-cache-for-v6.16

for you to fetch changes up to 51b081cdb92377d7f923912d589cab414db600c4:

  dt-bindings: cache: add QiLai compatible to ax45mp (2025-05-14 16:53:02 +0100)

----------------------------------------------------------------
RISC-V cache drivers for v6.16

SiFive:
Add support for the Eswin EIC7700 SoC, which needs to make sure of the
non-standard cache-ops provided by the ccache driver.

Bindings:
Conversions for two Marvell bindings to yaml, and additions of two
soc-specific compatibles to the axm45mp bindings.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Ben Zong-You Xie (1):
      dt-bindings: cache: add QiLai compatible to ax45mp

Conor Dooley (1):
      dt-bindings: cache: add specific RZ/Five compatible to ax45mp

Pinkesh Vaghela (1):
      cache: sifive_ccache: Add ESWIN EIC7700 support

Pritesh Patel (1):
      dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC compatibility

Rob Herring (Arm) (2):
      dt-bindings: cache: Convert marvell,{feroceon,kirkwood}-cache to DT schema
      dt-bindings: cache: Convert marvell,tauros2-cache to DT schema

 .../bindings/cache/andestech,ax45mp-cache.yaml     | 20 +++++++++-
 .../bindings/cache/marvell,feroceon-cache.txt      | 16 --------
 .../bindings/cache/marvell,kirkwood-cache.yaml     | 45 ++++++++++++++++++++++
 .../bindings/cache/marvell,tauros2-cache.txt       | 17 --------
 .../bindings/cache/marvell,tauros2-cache.yaml      | 39 +++++++++++++++++++
 .../devicetree/bindings/cache/sifive,ccache0.yaml  | 44 +++++++++++++++++++--
 drivers/cache/sifive_ccache.c                      |  2 +
 7 files changed, 146 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/cache/marvell,feroceon-cache.txt
 create mode 100644 Documentation/devicetree/bindings/cache/marvell,kirkwood-cache.yaml
 delete mode 100644 Documentation/devicetree/bindings/cache/marvell,tauros2-cache.txt
 create mode 100644 Documentation/devicetree/bindings/cache/marvell,tauros2-cache.yaml

--yQbHU6bp1wkj9V7M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCcWBwAKCRB4tDGHoIJi
0l9ZAPoCtIGmy+PQcgeGHkS482NPxx4bcFU7korBJhPd9yQwfgD/Ydim5vnMnlf3
To/tMf8xPASZv5bue+dWWDzUAaQiEwE=
=sdE2
-----END PGP SIGNATURE-----

--yQbHU6bp1wkj9V7M--
