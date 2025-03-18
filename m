Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC36D3FC2
	for <soc@lists.linux.dev>; Tue, 18 Mar 2025 11:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742299055; cv=none; b=o82BK8TkriXVAEkkOlleUCF7MsQdiETFFfmgujKmlAUAES1zxGfkzt53SpkpJHfXO0ilNuvLVdE5xxfMTeg/MFxHse3XtUihUScFA/QvS44GJNc3BSYbmcGwXgy/sj6cqEbEjQmG4muwiQYRAp8hFQ9v0163rnFgNLdhawoBSc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742299055; c=relaxed/simple;
	bh=rmLMUpUg9TKlv0t12MsX0VOhIQD3OdV+vDBtl6zVpao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RaRcEWdiQ1F5VR8Vv/iOTajWesLUY9lCu7vEu6qq9L54AZFV8UPGKL5acTprntzgIV0Y1KKb3nXdTqyD29N4kHDXSOEva4WYTyKf/mvo8WmWpyYNuDamtx3F9DCmcr/d99m/5AWWxCb7+aARKJ6ImHVVrMHzPYf2zEi8xTNb2BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCuGMsfM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCuGMsfM"
Received: by smtp.kernel.org (Postfix)
	id 797FAC4CEDD; Tue, 18 Mar 2025 11:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979B4C4CEE3;
	Tue, 18 Mar 2025 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742299054;
	bh=rmLMUpUg9TKlv0t12MsX0VOhIQD3OdV+vDBtl6zVpao=;
	h=Date:From:To:Cc:Subject:From;
	b=vCuGMsfMlLcLCFGPlZUXvf9LR7aFshQKJcZiZQehD5UgXl0/o6pb9iuGMQMDdNzj6
	 J5ZsJWfUNnV/YSu2kkpWd/COk11ZCXSq+n0o5Cow58rQl7UhK1m1EgiUcMPpySN0kf
	 voZ5eFSLwqfU+zwPo2dahiemJACj3UUSMws4fwBqKKSwm5RAgTkHIXL1U4NFcq49C4
	 mlLyBL6dRfSl+PTgp30GTZzX19y3BqXThX2nM+xambHFcbRCEb7tiNrZlTfvTR/YcP
	 RTNs7i5yFGQsanK+p9APHWkM/HoGwT58k/NecvGjOSoHAxg1XNQLvwa14JcmB1AEGo
	 wvXnf4FwZiAVw==
Date: Tue, 18 Mar 2025 11:57:31 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.15
Message-ID: <20250318-favorite-presuming-bf2fcf55bf6a@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zkv9McmXFIblZL5Z"
Content-Disposition: inline


--Zkv9McmXFIblZL5Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Not too much this window, was hoping to get the k230 (canaan soc) this
time around, but the clock side of things was not ready.

Cheers,
Conor.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.15

for you to fetch changes up to 38818f7c9c179351334b1faffc4d40bd28cc9c72:

  riscv: dts: starfive: jh7110-pine64-star64: enable USB 3.0 port (2025-02-18 16:32:25 +0000)

----------------------------------------------------------------
RISC-V Devicetrees for v6.15

Starfive:
All changes for jh7110-based boards including the removal of a dac
that does not exist and the addition of usb3 support on the star64 board
and pcie on the framework mainboard.

Microchip:
Update pcie reg properties to fix a mistake originally describing them.
Here rather than in fixes, since the driver maintains support for the
old format.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      riscv: dts: microchip: update pcie reg properties to new format
      riscv: dts: starfive: remove non-existent dac from jh7110

E Shattow (2):
      riscv: dts: starfive: jh7110: pciephy0 USB 3.0 configuration registers
      riscv: dts: starfive: jh7110-pine64-star64: enable USB 3.0 port

Sandie Cao (1):
      riscv: dts: starfive: fml13v01: enable pcie1

Shengyu Qu (1):
      riscv: dts: starfive: Unify regulator naming scheme

 .../boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi |  5 ++--
 .../boot/dts/microchip/mpfs-m100pfs-fabric.dtsi    |  5 ++--
 .../boot/dts/microchip/mpfs-polarberry-fabric.dtsi |  5 ++--
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  8 +----
 .../dts/starfive/jh7110-deepcomputing-fml13v01.dts | 34 ++++++++++++++++++++++
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |  5 ++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |  2 ++
 7 files changed, 51 insertions(+), 13 deletions(-)

--Zkv9McmXFIblZL5Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9lfqwAKCRB4tDGHoIJi
0gCiAPsE2utscwOvp0WzwLA3spcR3+1jORwrts/LiBGNrYQ06QD+KoBcIlha6JL2
WQMSCRpVANtjmtODfKlmlbH8BH24owY=
=0nHQ
-----END PGP SIGNATURE-----

--Zkv9McmXFIblZL5Z--
