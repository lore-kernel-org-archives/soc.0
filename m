Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE4C32D0D8
	for <soc@lists.linux.dev>; Mon,  6 Apr 2026 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775471718; cv=none; b=n0tU/jw1fA257FJCU+mnLs9DOM/1IbcEad+yuqbSpHjtECmbuZcz8iIuHESoPKGIyVpcm3uKaVFBs6YT8cvpY4r0/GLkHg5lqcLbF0+0tO7ERqWTqRpHHZ97e26PMGZHeub8TWJX7uc386I/qTcOlKKPrGqtvecF1DC31f7LdwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775471718; c=relaxed/simple;
	bh=fZJwWZGCMsWt5WVh+Ig6SZBzzZylN81uk6bAMko3zvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAAqle8tn8oeFbTnH/wwP2j6tJfWTqf/xvKgCMkRF53Ix6+1yizkkCDm8CRzCbD4a8SaJcqTliIM9rpZqwiWaGJYOXw/jiorhSoE7/RIwLgvZBESza3lO/YmBRBLt+YCG1V/qX8XQNT054LuTg899nVbI+PGHypJipvKM2AYw50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ne1gPalm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ne1gPalm"
Received: by smtp.kernel.org (Postfix)
	id 41CC4C2BCB6; Mon,  6 Apr 2026 10:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36965C2BCB2;
	Mon,  6 Apr 2026 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471718;
	bh=fZJwWZGCMsWt5WVh+Ig6SZBzzZylN81uk6bAMko3zvE=;
	h=Date:From:To:Cc:Subject:From;
	b=ne1gPalmg5ep1RlzXvnJU5QbXLiTd7272J88QFdPbSk6Ir2nQHzPy4QdbQpc1lSWY
	 q0f0OGDKdlJ2htuIecFGzPybRmxWa2HsOWJcoQT7QXLSsiglwT3Hf/cEvD4QWcXB6i
	 p/YJdUTgdj12SU2+qP/Odd46+TOTdP6Niv+W4VWT3kGeZKRP9Hbc2uSC2YBlGd0jpL
	 0QazIW8I2TJaXoMw24V+OteFQQLQDXyM0h82KCPn3HwAR5ZeBVOsk9F0u8DCcHu004
	 /eudnDi06XKzXtJs6nsd1I25mA1iqiCrFBU/ihU0jWMO+mF+E4+IyH/ARU3FYtd/Mj
	 qL1PM08H26Y1Q==
Date: Mon, 6 Apr 2026 11:35:15 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V soc drivers for v7.1
Message-ID: <20260406-spearmint-request-b71f627dc08c@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n3WH9EHYOiLI3q76"
Content-Disposition: inline


--n3WH9EHYOiLI3q76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull my driver updates for 7.1.

Thanks,
Conor.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-drivers-for-v7.1

for you to fetch changes up to bd34cdd6d214f815570986ce55978fd7ddd8d8ac:

  soc: microchip: add mpfs gpio interrupt mux driver (2026-03-31 14:13:14 +0100)

----------------------------------------------------------------
RISC-V soc drivers for v7.1

Microchip:
Add coverage for the pic64gx in the system controller and syscons.
Add a interrupt mux driver (akin to the one that Renesas recently added)
that fixes a problem where the platform never properly modelled gpio
interrupts. There's a gpio driver change here that Bartosz has acked
that adds the interrupt support to the GPIO driver itself.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (4):
      dt-bindings: soc: microchip: add compatible for the mss-top-sysreg on pic64gx
      gpio: mpfs: Add interrupt support
      dt-bindings: soc: microchip: document PolarFire SoC's gpio interrupt mux
      soc: microchip: add mpfs gpio interrupt mux driver

Pierre-Henry Moussay (2):
      dt-bindings: soc: microchip: mpfs-sys-controller: Add pic64gx compatibility
      soc: microchip: mpfs-sys-controller: add support for pic64gx

 .../soc/microchip/microchip,mpfs-irqmux.yaml       | 103 ++++++++++++
 .../microchip/microchip,mpfs-mss-top-sysreg.yaml   |  18 +-
 .../microchip/microchip,mpfs-sys-controller.yaml   |   4 +-
 MAINTAINERS                                        |   2 +-
 drivers/gpio/Kconfig                               |   1 +
 drivers/gpio/gpio-mpfs.c                           | 122 +++++++++++++-
 drivers/soc/microchip/Kconfig                      |  11 ++
 drivers/soc/microchip/Makefile                     |   1 +
 drivers/soc/microchip/mpfs-irqmux.c                | 181 +++++++++++++++++++++
 drivers/soc/microchip/mpfs-sys-controller.c        |  74 ++++++---
 10 files changed, 488 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
 create mode 100644 drivers/soc/microchip/mpfs-irqmux.c

--n3WH9EHYOiLI3q76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadOMYgAKCRB4tDGHoIJi
0uo8AP9PYB0GQdK6WV4VT+Dr77MlLx2xoCT0XkgFWDkruO82/QEAza6Y9CnWvi31
8654TI2+1w19rW+/0CQi3oU1qB/ajgo=
=esMu
-----END PGP SIGNATURE-----

--n3WH9EHYOiLI3q76--
