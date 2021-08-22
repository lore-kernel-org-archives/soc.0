Return-Path: <SRS0=RQuT=NN=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC1FC4338F
	for <soc@archiver.kernel.org>; Sun, 22 Aug 2021 10:15:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B9C9561283; Sun, 22 Aug 2021 10:15:46 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD1DB61214;
	Sun, 22 Aug 2021 10:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD1DB61214
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from p5b3b3c9d.dip0.t-ipconnect.de ([91.59.60.157] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1mHkW0-0003pW-HP; Sun, 22 Aug 2021 12:15:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 5.15
Date: Sun, 22 Aug 2021 12:15:43 +0200
Message-ID: <9718620.EvYhyI6sBW@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below (and in the next mails) changes for
Rockchip platforms for 5.15.

Please pull

Thanks
Heiko


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-driver1

for you to fetch changes up to 9e5747c57807ad8a04c356340190cfdd0bd54111:

  soc: rockchip: io-domain: Remove unneeded semicolon (2021-08-19 23:56:38 +0200)

----------------------------------------------------------------
Yaml conversion of io-domain bindings and addition of
rk3568 io domains.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: rockchip: ROCKCHIP_GRF should not default to y, unconditionally

Jianqun Xu (1):
      soc: rockchip: io-domain: add rk3568 support

Jiapeng Chong (1):
      soc: rockchip: io-domain: Remove unneeded semicolon

Johan Jonker (2):
      dt-bindings: power: convert rockchip-io-domain.txt to YAML
      dt-bindings: soc: rockchip: add rockchip-io-domain.yaml object to grf.yaml

Michael Riesch (1):
      dt-bindings: power: add rk3568-pmu-io-domain support

 .../bindings/power/rockchip-io-domain.txt          | 135 --------
 .../bindings/power/rockchip-io-domain.yaml         | 360 +++++++++++++++++++++
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  19 +-
 drivers/soc/rockchip/Kconfig                       |   4 +-
 drivers/soc/rockchip/io-domain.c                   |  88 ++++-
 5 files changed, 455 insertions(+), 151 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/rockchip-io-domain.txt
 create mode 100644 Documentation/devicetree/bindings/power/rockchip-io-domain.yaml



