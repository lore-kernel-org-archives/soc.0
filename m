Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE13C0613
	for <soc@lists.linux.dev>; Mon,  8 Jun 2026 10:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913686; cv=none; b=iNQT5hcy68LjSRLRbeAx2PwthpDHzBjKsX65I7PF9uYNaKKw9faFgWhV3FUMlUURX2hNRheTAcKsuY4aEFd4qYnR0WJv47B3iV1E9MczDkefn6l0+MJTuIigln45KGJi9GClT0PiIREd31sxNcHFDQM19hk1tLqSV2xk8w1K8+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913686; c=relaxed/simple;
	bh=jziwyAjpsen7nuygP4gis8O+XcY7KVvTyTzKjCmRCSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQARXhVAEPKIy9YBBRbyaMEK3T58FPTIqqPRd+mp68K73iUjnovJoQoyODTKXZNwIzp3B6bBsRmHvTHl2k7xpP9yxyBTPLZ1UIkkwq165ADImPJYBhPpLstR/rT7zzFORq0k7jCjd25pfaO4dd8sXYgJ+VTbYUxRGJ7O8J4zF2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apbmPii0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apbmPii0"
Received: by smtp.kernel.org (Postfix)
	id 591201F00898; Mon,  8 Jun 2026 10:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5CC1F00893;
	Mon,  8 Jun 2026 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780913685;
	bh=YQrV6yiTXhTJTiEMyFNXs8wBs1V6hB9Az82uhmiDxIE=;
	h=Date:From:To:Cc:Subject;
	b=apbmPii0hnBIMFovwfQfkWKIp+JqKWjxhSJDqota4g8FCLfrLxvPDvaDVM4EzcaXh
	 u9g2RNTT0+GL7BEg9Rtdkqd38qGtLZlWdFBg01sZCyekpW+SC46wCk0WL7TaYXGJzK
	 SZDP1iIYVCr6oRoEQP2yQ6GTO8SkAyWnEGciG2kfBETQXej0pvenkBTIcZ0yFQJSRd
	 f+AVNALBoPtVpURkFCSoAAGq5n/emLvnJRQTuWqonlPNBI9NIrjCJ2YA6TCsC9CFN3
	 W5/6ufaAogQpy5S2FomdCHiedVhLfM/4/+X6vRowvRrSRoKJ/nqJxxjhpr+DrXvaes
	 yTopcxCpe4yAQ==
Date: Mon, 8 Jun 2026 11:14:42 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Microchip RISC-V devicetrees for v7.2
Message-ID: <20260608-grumbling-gigantic-b0bb128634f2@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4x40SOgMRt7pnXoG"
Content-Disposition: inline


--4x40SOgMRt7pnXoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull my changes for 7.2, all of which are cleanup/low priority
fixes written by yours truly.

It's probable that I will have a second PR, because I am waiting for
Stephen to hopefully merge my Canaan clock driver series that is a
pre-requisite for the addition of the Canaan k230 SoC. I'd have sent
this earlier, but I was hoping that k230 support would be ready in time.

Cheers,
Conor.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v7.2

for you to fetch changes up to 3869417f8996fb076998342d0db560fdd795a3a6:

  riscv: dts: microchip: remove redudant enabling of syscontroller (2026-05-15 17:51:09 +0100)

----------------------------------------------------------------
Microchip RISC-V devicetrees for v7.2

This time around, there's nothing other than patches for Microchip
boards. All of this is low priority fixes and cleanup, centred on the
pic64gx and beaglev-fire boards. There is no new support added.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (10):
      riscv: dts: microchip: add tsu clock to macb on pic64gx
      riscv: dts: microchip: update pic64gx gpio interrupts to better match the SoC
      riscv: dts: microchip: sort pic64gx i2c nodes alphanumerically
      riscv: dts: microchip: gpio controllers on mpfs need 2 interrupt cells
      riscv: dts: microchip: remove gpio hogs from beaglev-fire
      riscv: dts: microchip: clean up beaglev-fire regulator node names
      riscv: dts: microchip: add adc interrupt on beaglev-fire
      riscv: dts: microchip: add gpio line names on beaglev-fire
      riscv: dts: microchip: fix pic64gx gpio interrupt-cells
      riscv: dts: microchip: remove redudant enabling of syscontroller

 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 37 ++++++------
 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts   |  4 --
 .../boot/dts/microchip/mpfs-icicle-kit-common.dtsi |  4 --
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts  |  4 --
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts  |  4 --
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts     |  4 --
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts     |  4 --
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |  6 +-
 .../boot/dts/microchip/pic64gx-curiosity-kit.dts   | 67 ++++++++++++----------
 arch/riscv/boot/dts/microchip/pic64gx.dtsi         | 46 +++++++++++----
 10 files changed, 95 insertions(+), 85 deletions(-)

--4x40SOgMRt7pnXoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiaWEQAKCRB4tDGHoIJi
0uiKAP90AYti2LQE3wO9hYO4xVpMawT/WiBimG6wfGNpIzArpgEAqJOL/r/LL23q
ZJrKrsiZMbyOcltRla49S8jWGM2F0Qw=
=U2AX
-----END PGP SIGNATURE-----

--4x40SOgMRt7pnXoG--
