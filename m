Return-Path: <SRS0=CIhG=LP=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23692C4743C
	for <soc@archiver.kernel.org>; Mon, 21 Jun 2021 23:06:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 07DDB61001; Mon, 21 Jun 2021 23:06:51 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F4E61042;
	Mon, 21 Jun 2021 23:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64F4E61042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=heiko@sntech.de
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1lvT0D-0000T9-0o; Tue, 22 Jun 2021 01:06:49 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.14 - #2
Date: Tue, 22 Jun 2021 01:06:48 +0200
Message-ID: <4611716.rnzMqkiUVr@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

the relevant driver changes landed in the media-tree a short while ago,
so if time still allows please also consider this 2nd pull request for rockchip
dts32 changes for 5.14 containing the nodes for the hantro-based
video-codec on these socs.

This pull would go on top of the one I sent yesterday ;-)

Thanks
Heiko

The following changes since commit 623ba75a5d6b8e196a21f3ed36d26a5f6db459ce:

  ARM: dts: rockchip: add power controller for RK322x (2021-06-13 18:25:07 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.14-rockchip-dts32-2

for you to fetch changes up to 36e9534dfcb5b09b919d2831d6a19aa3856b95a1:

  ARM: dts: rockchip: add vpu and vdec node for RK322x (2021-06-22 00:21:27 +0200)

----------------------------------------------------------------
Nodes for the Hantro-based video codecs on
rk3036, rk3066, rk3188 and rk322x.

----------------------------------------------------------------
Alex Bee (3):
      ARM: dts: rockchip: add vpu node for RK3036
      ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
      ARM: dts: rockchip: add vpu and vdec node for RK322x

 arch/arm/boot/dts/rk3036.dtsi  | 21 +++++++++++++++++++++
 arch/arm/boot/dts/rk3066a.dtsi |  4 ++++
 arch/arm/boot/dts/rk3188.dtsi  |  5 +++++
 arch/arm/boot/dts/rk322x.dtsi  | 27 +++++++++++++++++++++++++--
 arch/arm/boot/dts/rk3xxx.dtsi  | 12 ++++++++++++
 5 files changed, 67 insertions(+), 2 deletions(-)



