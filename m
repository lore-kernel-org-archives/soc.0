Return-Path: <SRS0=EKYy=B7=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66554C7EE23
	for <soc@archiver.kernel.org>; Sun, 11 Jun 2023 21:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D2F0C4339C; Sun, 11 Jun 2023 21:09:40 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 031A7C433D2;
	Sun, 11 Jun 2023 21:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 031A7C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b22.versanet.de ([83.135.91.34] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q8SJb-0005rv-OP; Sun, 11 Jun 2023 23:09:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.4
Date: Sun, 11 Jun 2023 23:09:34 +0200
Message-ID: <2885657.e9J7NaK4W3@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find a below a collection of fixes for the current release 6.4
cycle.

Please pull

Thanks
Heiko

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.4-rockchip-dtsfixes1

for you to fetch changes up to 568a67e742dfa90b19a23305317164c5c350b71e:

  arm64: dts: rockchip: Fix rk356x PCIe register and range mappings (2023-06-06 18:22:49 +0200)

----------------------------------------------------------------
Fixes for the reset pin on nanopi r5c, a reset line on SOQuartz, a duplicate
usb regulator on rock64 and PCIe register mappings on rk356x.
Also some missing cache properties.

----------------------------------------------------------------
Andrew Powers-Holmes (1):
      arm64: dts: rockchip: Fix rk356x PCIe register and range mappings

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: add missing cache properties

Lorenz Brun (1):
      arm64: dts: rockchip: fix USB regulator on ROCK64

Nicolas Frattaroli (1):
      arm64: dts: rockchip: fix nEXTRST on SOQuartz

Tianling Shen (1):
      arm64: dts: rockchip: fix button reset pin for nanopi r5c

 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |  1 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     | 14 ++---------
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  1 +
 .../boot/dts/rockchip/rk3566-soquartz-cm4.dts      | 18 ++++++++------
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi  | 29 ++++++++++------------
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts |  1 -
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           | 14 ++++++-----
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  7 +++---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          |  9 +++++++
 10 files changed, 50 insertions(+), 46 deletions(-)



