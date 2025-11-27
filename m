Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19032DECB0
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263415; cv=none; b=l6XgkAoE7YHPQwvtF/IQEdZanKpD0XkAJeH7YoNk5SKNN4RVfiMCqkhbd/N0O4a1UT5pYaftf8QyNSKhp46QsqbWv/o2vO9orjYLzeqoKTaKpBvv4ursMbrV+MaGxuqI1lUHI8lnnRqG1a8ggwY2TFpPsiE1qZOcjcHEbYFtaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263415; c=relaxed/simple;
	bh=APMrvtSXM/H86MqQD8Gjn4Wda8FEWOLElWIHtNrbXc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGaZon+sz7oKaagExN0jNw48PYItCxuFd7/31DtH7T9bCGRrjwA1AVjryxHqbLnnJqTQYxP8Cfb3dGzhXMxRVymrvQkzqq7OFmcmacvNi5XM8edXr6RQ2rC8DTP0WhBIjn/zumcrPwL5Ef3DS4uoCRpLTzsgDq0FNFMU4GuvRxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic9q3scE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic9q3scE"
Received: by smtp.kernel.org (Postfix)
	id A0390C116D0; Thu, 27 Nov 2025 17:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DB5C4CEF8;
	Thu, 27 Nov 2025 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764263414;
	bh=APMrvtSXM/H86MqQD8Gjn4Wda8FEWOLElWIHtNrbXc8=;
	h=Date:From:To:Cc:Subject:From;
	b=Ic9q3scEq1fxcXMHIG76lLOd+EoUtA7XtWNnQrG2iELrgpiykK75tZQ1KBjyuPvdF
	 T65pKwQ8yrSF8G974tZqDIBjKwtlPAOBDd1/Fd5P3qbB4zCAcDTDAsgIVNBDEPcvdy
	 s1hxbFFGGRdVbZikI8thXdus8gkgzeYeIXNsYxq5sqSk3ZfO3NtZvCDd+bhpWxmzQH
	 Wq3cS+GsEKEfnGClAic9xKSi7SeURnfeMF7erfineQIqn/bRwjzaxalseaNDk+uwWh
	 pRdiXkrDxzEVY0h1nSjWCzMPewdkphqPIkPg+ACc0HgJMxpfw2LpeAxhZlUtTKLu3J
	 sQl26syu4+cMg==
Date: Thu, 27 Nov 2025 17:10:11 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, jonathan.cameron@huawei.com, soc@kernel.org
Subject: [GIT PULL] standalone cache drivers for v6.19
Message-ID: <20251127-facelift-revisable-772b117a799b@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WSRjwrTseeO6xcTQ"
Content-Disposition: inline


--WSRjwrTseeO6xcTQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull my standalone cache driver 6.19 update.
The base here is a wee bit odd, I forgot to fast-forward this cycle and
didn't want to do a last-minute rebase when I noticed this today.

Cheers,
Conor.

The following changes since commit 941327ca5ddd45cfc4dd960cbbabed9e2b5cb1b0:

  cache: sifive_ccache: Optimize cache flushes (2025-09-11 19:13:21 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ cache-for-v6.19

for you to fetch changes up to 055bcc552b5181da208038c1de9437e9cca69380:

  MAINTAINERS: refer to intended file in STANDALONE CACHE CONTROLLER DRIVERS (2025-11-21 18:42:02 +0000)

----------------------------------------------------------------
standalone cache drivers for v6.19

ccache:
Add a compatible for the pic64gx SoC. No driver change needed, as it
falls back to the PolarFire SoC.

hisi hha/generic cpu cache maintenance:
Add support for a non-architectural mechanism for invalidating memory
regions, needed for some cxl implementations on arm64 (and probably
elsewhere in the future). The HiSilicon Hydra Home Agent is the first
driver to provide this support.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Jonathan Cameron (4):
      memregion: Drop unused IORES_DESC_* parameter from cpu_cache_invalidate_memregion()
      arm64: Select GENERIC_CPU_CACHE_MAINTENANCE
      MAINTAINERS: Add Jonathan Cameron to drivers/cache and add lib/cache_maint.c + header
      cache: Make top level Kconfig menu a boolean dependent on RISCV

Lukas Bulwahn (1):
      MAINTAINERS: refer to intended file in STANDALONE CACHE CONTROLLER DRIVERS

Pierre-Henry Moussay (1):
      dt-bindings: cache: sifive,ccache0: add a pic64gx compatible

Yicong Yang (2):
      memregion: Support fine grained invalidate by cpu_cache_invalidate_memregion()
      lib: Support ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION

Yushan Wang (1):
      cache: Support cache maintenance for HiSilicon SoC Hydra Home Agent

 .../devicetree/bindings/cache/sifive,ccache0.yaml  |   5 +
 MAINTAINERS                                        |   3 +
 arch/arm64/Kconfig                                 |   2 +
 arch/x86/mm/pat/set_memory.c                       |   2 +-
 drivers/cache/Kconfig                              |  37 +++-
 drivers/cache/Makefile                             |   2 +
 drivers/cache/hisi_soc_hha.c                       | 194 +++++++++++++++++++++
 drivers/cxl/core/region.c                          |   5 +-
 drivers/nvdimm/region.c                            |   2 +-
 drivers/nvdimm/region_devs.c                       |   2 +-
 include/linux/cache_coherency.h                    |  61 +++++++
 include/linux/memregion.h                          |  16 +-
 lib/Kconfig                                        |   3 +
 lib/Makefile                                       |   2 +
 lib/cache_maint.c                                  | 138 +++++++++++++++
 15 files changed, 462 insertions(+), 12 deletions(-)
 create mode 100644 drivers/cache/hisi_soc_hha.c
 create mode 100644 include/linux/cache_coherency.h
 create mode 100644 lib/cache_maint.c

--WSRjwrTseeO6xcTQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSiF8wAKCRB4tDGHoIJi
0n/6AP9hcctjfzFUpuTs8DhM12oHXeDiZkKt/ro8iiZdjrsVSwEA5jfGvZyvBH6y
D0xRvhMHkrS9zFNseKpxmKhY5ddizQA=
=YAAk
-----END PGP SIGNATURE-----

--WSRjwrTseeO6xcTQ--
