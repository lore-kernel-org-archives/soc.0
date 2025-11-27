Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A91330336
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259633; cv=none; b=JQvGWztNvzz0RyLJ/D56R3U9n6xKbkR8Q5FDr94+6b2hyLE/7Pzr1juUM+VIrmWPeyoXPq0EONcqRwskG3trIE9+lZIvVyRACPNYxo0HZ747eXoDvsm+aVnrHNJbWZliQHvb4wPf4CkXDBHEU2WZQZJkojDb5B4fdV5KNasej1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259633; c=relaxed/simple;
	bh=wPDhpQkNJJQk7R1CNhHFSFjejlF8GTL99mJgXlWw0mE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5Qmwj+pF0KMeSiqYyo3+Yt4Nr6Jti91SGv9qDuTkABimcjut57VJgEnXPgu345XjoavUziIZZqvj+0PRbiPkUSeUj+V2o+TCuluUgo7hBUrTyERifMZijGqvfrI7re3s3C2GYS+i1N7qmuvtzvaK3a28bi0h30ydjXRPBsfOAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxJ178Is; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxJ178Is"
Received: by smtp.kernel.org (Postfix)
	id 7DAB5C116C6; Thu, 27 Nov 2025 16:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5E8C4CEF8;
	Thu, 27 Nov 2025 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764259630;
	bh=wPDhpQkNJJQk7R1CNhHFSFjejlF8GTL99mJgXlWw0mE=;
	h=Date:From:To:Cc:Subject:From;
	b=dxJ178IsFIufTUkjOHktklvTY08b+K5oFjXew0fRFJqP5wMDyYBUBoLeNY1NOBcfq
	 X94RLDhdbBTq7/MQ4rM3oELG5RxTAdrO0PL22H1IboKRAFmv4EAfcJekQT259BnUQZ
	 XufwEvGvyVBUTLxS5VVrL6mUApgUKBBok2WFmSGX7NUFOXVx9KN2sZjnA0PaSmeMpX
	 +Isqf2aHRKfcMWx9ZNFLemgoFW1AM7phoLizE2BLVOH3s3ULLHc8c+CYs+TjUNdikL
	 13RNk/yelQpgT0TbihXZ0tRcReT4v6rFmaqhKQM+hyTa0IFI+2qjYIzOSBMWFDe2mU
	 zh9w56Qz+Pfyw==
Date: Thu, 27 Nov 2025 16:07:07 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V soc-drivers for v6.19
Message-ID: <20251127-wish-shining-300e8fb80599@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Lj1ZaEMcGf5EH9/"
Content-Disposition: inline


--5Lj1ZaEMcGf5EH9/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull my 6.19 soc driver changes.

Cheers,
Conor.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ soc-drivers-for-v6.19

for you to fetch changes up to 66c6ceb41ed375773491c5d024167a2cbe6fe944:

  MAINTAINERS: rename Microchip RISC-V entry (2025-11-11 16:52:30 +0000)

----------------------------------------------------------------
RISC-V soc-drivers for v6.19

Microchip:
Add bindings and mfd drivers for two syscon regions on PolarFire SoC,
needed as part of a rework of the devicetree to permit supporting,
among other things, pinctrl sanely and avoiding the "new" pic64gx SoC
ever using the original incorrect clock nodes. Fiddle with the Microchip
RISC-V MAINTAINERS entry to add these drivers and avoid branding it FPGA
only.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (4):
      dt-bindings: soc: microchip: document the simple-mfd syscon on PolarFire SoC
      soc: microchip: add mfd drivers for two syscon regions on PolarFire SoC
      MAINTAINERS: add new soc drivers to Microchip RISC-V entry
      MAINTAINERS: rename Microchip RISC-V entry

 .../microchip/microchip,mpfs-mss-top-sysreg.yaml   | 47 ++++++++++++++++++++++
 MAINTAINERS                                        |  4 +-
 drivers/soc/microchip/Kconfig                      | 12 ++++++
 drivers/soc/microchip/Makefile                     |  1 +
 drivers/soc/microchip/mpfs-control-scb.c           | 38 +++++++++++++++++
 drivers/soc/microchip/mpfs-mss-top-sysreg.c        | 44 ++++++++++++++++++++
 6 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
 create mode 100644 drivers/soc/microchip/mpfs-control-scb.c
 create mode 100644 drivers/soc/microchip/mpfs-mss-top-sysreg.c

--5Lj1ZaEMcGf5EH9/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSh3KwAKCRB4tDGHoIJi
0pt+AP9DympcOswdVPZPrJm+aekvGfrjMkCi5M34N5LnusAWmgEA3Xz5bGLoSqNv
zg4Kn55STYoEiK1Xd73sI+DcLlo0/g4=
=m0FT
-----END PGP SIGNATURE-----

--5Lj1ZaEMcGf5EH9/--
