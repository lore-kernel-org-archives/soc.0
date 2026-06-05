Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A5C30C145
	for <soc@lists.linux.dev>; Fri,  5 Jun 2026 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697947; cv=pass; b=utRKpZC/YSvVMi4XFME/6eSTE7mn1E24ibNiOePrzOJKDHq5KacsMh+fV9eif+9EsdKRdBJO3dieprLViLptlhaYAtaroYPwrSbRG/ufTvlYkfzXQGebVtxRwCypgeMueP4QcJDCWWnOQSXkBuVZJc1oa3wDbV8NF/LiilZpcQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697947; c=relaxed/simple;
	bh=5KZyHGLAko2ln6l6/YvlegFxQmm4BDDmuLTCEUgs0gY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nSkRoo0bcngl2Z3Zvbz7Oec8YTEUwhEveez/W9jYb/nbOQTlhg3sKBaEfzzVi/wXzpuMsBGeDHLEBiYeA6SloP8xj7zImKdE1eGfUyKhpbUIxOZz5aHWnYpISl0ouzGs01cSAHHCBneAvqff5hwXOKO8FV9dUneIR7X7vxt7NiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=loz66b8d; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="loz66b8d"
Received: by smtp.kernel.org (Postfix)
	id 1F9CE1F0089A; Fri,  5 Jun 2026 22:19:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780697944;
	b=wz60nGUiwy9aOL6gceY8qhpzpTr9I47odVMy8PJf1S8w8kadt7RR4LCLmeMrkt0wkl02
	 Cb9Sy9SOk332qBHClTmbaFu1vobDeBiOKliJar8PW72UTONLn5sP+PJHdrtOO5jpPQb/x
	 /SX2enFYhx0vFHrD4YvlNAfMIK1uBl5tMf4OecZjrYmvZAQbsOk/yR8wL8AMsiRIXVK/y
	 YYYCyOY7Xu0UbuS6/41dh/uGgLyRLLbtb5nTtRfNtKzeanTHhoOrIfyMBtQU05JPgdcXD
	 JCZzimzLhY/zlDCwhFnccc7cqEYVQVEjf+1vndJ/ASMKZalLBwFcxMsFoSY0F1YgmKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780697944;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=SyL+KhKJOkLBPVYqIVEYemJAAJqjAzpI1nf+X+CuAeI=;
	b=bJer89APGXgWnbOeOK6TLEu0SVg3stCPJn+21wJH95/INrueTlnk5Jq+jBFg55rRwF/9
	 FEhujgPQE3ghq5tbkMbhZZgnKKuxx2Df9kQyVBAsY1dyyHPJihYf8m1aikdEv148QuKWE
	 kZssGGeEFkScdvDePP+pKyWNNm/SuiOOuqqDaYEkMJMrv0pjnAf1Svcq0SeZp79ntjvNs
	 h2kJgOlvwWxPuz0ur+6lSCrhWd5RIWcIZ+c33jukYkL7mmpv6KYzaInIynKSULEqnFh3B
	 CMtKurEiiura9zOBGdpdYrE78vs+kCYD97rINl/nIs1aGMdOuICfWvzpq3d1IrcWpCA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=loz66b8d;
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A4681F00893;
	Fri,  5 Jun 2026 22:19:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=loz66b8d
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5A4681F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=SyL+KhKJOkLBPVYqIVEYemJAAJqjAzpI1nf+X+CuAeI=; b=loz66b8dq7vrC22SV6JKCgdn34
	hgTPGakmdzwdWJHUXt9X50+NVZoUo4lxK4zPXerHNV+3lgNVgXi07/g2qP+wswru4+ErYkLjRTmYO
	p4PuwoqA3RAIFR8gYelrynX0d1CifSbPci/Kba8VUI10IkHhCQhnaDhi5xFBuRWED3Q3hkrjHqdL/
	hX8hiGO9UZU1Fl1SkWBgl3SJ3zfHcJSzIFiYXmO8vD8KRedruytvxXAj7LwfTfKbdlKRThbGeBCKt
	NcqteKD0kr7CZKGlyDSNVwECPFYjF2DD61BQD0QLUNUy7BFubjlgNsEp8hjlU+JU06EYoR7nwdWe0
	QUlqP5KA==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.2 #2
Date: Sat, 06 Jun 2026 00:18:53 +0200
Message-ID: <21578066.fAMKPKieAE@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below some more Rockchip DT changes for the merge-window
for 7.2 .

The most interesting addition is of course basic camera support
on RK3588 which enables unfiltered camera capture (i.e. without
postprocessing for whitebalance etc)


Please pull.
Thanks
Heiko


The following changes since commit eb24b60553e0692cbbec2863ca31d2a56bff098d:

  arm64: dts: rockchip: Add watchdog node for RK3528 (2026-05-07 13:27:53 +=
0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v7.2-rockchip-dts64-2

for you to fetch changes up to 8545eda00fdf3d7e17933ce0f706d005b1bad42d:

  arm64: dts: rockchip: Fix vcc_sdio regulator max voltage on Pinebook Pro =
(2026-06-02 22:47:18 +0200)

=2D---------------------------------------------------------------
We've got basic camera support on RK3588!

New peripherals RK3588 vicap plus camera addition to some boards,
RK3528 USB and USB enablement on some boards, RGA3 support on RK3588.
Missing EL2 virtual timer interrupt added to RK3588.

Some more added peripherals for the Khadas Edge 2L board.

=2D---------------------------------------------------------------
Chen-Yu Tsai (2):
      arm64: dts: rockchip: Fix EEPROM compatible on rk3399-nanopi-r4s-ente=
rprise
      arm64: dts: rockchip: Disable removed devices from rk3399-nanopi-r4s

Chukun Pan (1):
      arm64: dts: rockchip: enable adc button for Radxa E25

Gray Huang (2):
      arm64: dts: rockchip: Enable USB for Khadas Edge 2L
      arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L

Hugo Osvaldo Barrera (1):
      arm64: dts: rockchip: Fix vcc_sdio regulator max voltage on Pinebook =
Pro

Jonas Karlman (5):
      arm64: dts: rockchip: Add USB nodes for RK3528
      arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
      arm64: dts: rockchip: Enable USB ports on Radxa ROCK 2A/2F
      arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
      arm64: dts: rockchip: Enable USB 2.0 ports on NanoPi Zero2

Marc Zyngier (1):
      arm64: dts: rockchip: Add EL2 virtual timer interrupt

Michael Riesch (3):
      arm64: dts: rockchip: add vicap node to rk3588
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1

Sven P=C3=BCschel (1):
      arm64: dts: rockchip: add rga3 dt nodes to rk3588

 arch/arm64/boot/dts/rockchip/Makefile              |   7 ++
 .../dts/rockchip/rk3399-nanopi-r4s-enterprise.dts  |   2 +-
 .../arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi |  68 +++++++++++
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |   2 +-
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts      |  25 ++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      |  29 +++++
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |  60 +++++++++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi    |  17 +++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts    |  11 ++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts    |  12 ++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  80 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts  |  14 +++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   3 +-
 .../boot/dts/rockchip/rk3576-khadas-edge-2l.dts    |  82 +++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 135 +++++++++++++++++=
++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |  99 +++++++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |  99 +++++++++++++++
 17 files changed, 742 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-=
cam4k-cam0.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-=
cam4k-cam1.dtso



