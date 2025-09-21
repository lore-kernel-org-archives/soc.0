Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413124BBFD
	for <soc@lists.linux.dev>; Sun, 21 Sep 2025 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758488467; cv=none; b=tSL4b9wt5EgwAG7+PjpsHxvjHvJFOhBtLhP8wNKFILQbs3fXkCOxMSSupj2M9QJe44c5mrE95m9rll+DgD4LGtmsI+3lhbbZViNpFqJbtdBa/8t5QxGmxarwrIdkD6PON9rJX3fnuBkewnHmQQ8h+S3hFORRly4Krc4rrNm9m4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758488467; c=relaxed/simple;
	bh=6ehdH/B3XOBQRQvYkHTdbMbuST/Lx8QaRMXZ/sHFAcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=etEvhQ4HJlCNklb3q8pFonQz9Z1eaJvs1C6Bxf/3yYaArHslA5k0dLG3XuowzTT+mw9rEHyBIw+n9CaVdrT8oWT/iNZwWUPYbS7Gg28cZ/5g14xr+feLHRU6vbKh60LsKwYLFpZFc4mV1WFjEsi0AfozUPqDYwC9J1ZdOHDfyLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CUR9LEIG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CUR9LEIG"
Received: by smtp.kernel.org (Postfix)
	id 9DBADC116B1; Sun, 21 Sep 2025 21:01:06 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5447AC4CEE7;
	Sun, 21 Sep 2025 21:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5447AC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=nA7SF2fzw7JbesVTWtaZYM0KNv+9N0bkcTooj4MuXe8=; b=CUR9LEIGOG5od/Ii444xVrA7u0
	f5lSMkYd3dXrhiznr8uzinPBWt0ke7O1cY0AK9gRC/sbruo36Zrg+F3zyYcvqg8QqeQtUH0esrgzT
	hFG8Jt3b8kOUEDCYI5ZR8gZsrBkw8dXsmrSucpJJYWL7vtlx+zk8YsCIBR0nSHv60VbdNh8vO59nu
	ZDM3Jfpje+8zdEx2refJdcKO0G+QY9Z53o5vaCZESb8Q4yQ8IoNj5Dlz6I7E/9w5kut1kUzrOvwjD
	toEQOEgQ5avYGiFelmL2tsklgXV4fMIFPctBAYSlA9v7L2U+qoUL5B16z6eT3HnADM1emq7GVRxbr
	ypLznwHw==;
Received: from i53875add.versanet.de ([83.135.90.221] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v0RB9-0007dH-7u; Sun, 21 Sep 2025 23:01:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.18 #2
Date: Sun, 21 Sep 2025 23:01:02 +0200
Message-ID: <2079092.kXSN5OTJKJ@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below some more Rockchip 64bit dt changes for for 6.18 .
To go on top of the first set.


Please pull.
Thanks
Heiko


The following changes since commit 07c53a9e970712b1a479dd0ec4adfe184482c22f:

  arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX (2025-09-02 08:32:26 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-dts64-2

for you to fetch changes up to 93781211e9ad9578787355147c2f28b7289a8ec6:

  arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT (2025-09-18 20:59:59 +0200)

----------------------------------------------------------------
One new board the ROC-RK3588-RT, gpu improvements for RK3328, frequency
scaling for the RK3528 and the very first small steps for camera
support on the RK3588 - with the CSI-DPHY support, with more hopefully
to come soon'ish :-) .

And apart from those bigger points, some more individual peripheral work
on some boards.

----------------------------------------------------------------
Alex Bee (2):
      arm64: dts: rockchip: add GPU powerdomain, opps, and cooling to rk3328
      arm64: dts: rockchip: enable the Mali GPU on RK3328 boards

Chris Morgan (1):
      arm64: dts: rockchip: Add USB and charger to Gameforce Ace

Chukun Pan (3):
      arm64: dts: rockchip: Add rk3528 CPU frequency scaling support
      arm64: dts: rockchip: remove vcc_3v3_pmu regulator for Radxa E52C
      arm64: dts: rockchip: update pinctrl names for Radxa E52C

Kaison Deng (2):
      dt-bindings: arm: rockchip: Add Firefly ROC-RK3588-RT
      arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT

Marcin Juszkiewicz (1):
      arm64: dts: rockchip: enable HDMI Receiver on NanoPC T6

Michael Riesch (2):
      dt-bindings: soc: rockchip: add rk3588 csidphy grf syscon
      arm64: dts: rockchip: add mipi csi-2 dphy nodes to rk3588

Sebastian Reichel (1):
      arm64: dts: rockchip: Fix network on rk3576 evb1 board

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    1 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts     |    4 -
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi       |    4 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |    4 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   40 +-
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |   39 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |   38 +-
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts |   26 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   34 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   17 +
 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts     | 1132 ++++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |  122 +++
 14 files changed, 1434 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts



