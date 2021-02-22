Return-Path: <SRS0=eGQD=HY=pascalroeleven.nl=dev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726ABC433DB
	for <soc@archiver.kernel.org>; Mon, 22 Feb 2021 10:08:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 368B064E20; Mon, 22 Feb 2021 10:08:52 +0000 (UTC)
Received: from pmg01-out1.zxcs.nl (pmg01-out1.zxcs.nl [185.104.30.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D39E3614A5
	for <soc@kernel.org>; Mon, 22 Feb 2021 10:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D39E3614A5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=pascalroeleven.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=dev@pascalroeleven.nl
Received: from pmg01.zxcs.nl (localhost.localdomain [127.0.0.1])
	by pmg01.zxcs.nl (ZXCS) with ESMTP id 1507F10588A;
	Mon, 22 Feb 2021 11:08:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id
	:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KsZvchTpxBaJoKjRefDrbL7JsiCBHcFRF62tHbfbg+M=; b=rW8nQmOyGEf23sfmBuBdWMBEqT
	kAf96AdA1k4CPrRSCaKtgM0MgKoYx9hqOLUvo/eOpo/YzGZWxBeBBwKZm2NDBjo0BJ6yOYGLn+XcR
	e9+z4UTFD+CWXodva1LfYJeQce/PGHkAsd+W9Xk7zPhf8DTDiWhcFXA43fbo8izXmjohltSFpjBxl
	JWaF1IZ7+otoAzKTJzIpJgrJS3U6wZPCu4cXNQ8Lq95WXLUXL/5dHbQa+Un8zwGeuFyudHlTIGewp
	/FaNtPgUFbqQugkOBzoqZpT67HN442/v5XblvEIqHxgUD8XZ0d2EsMRxaXrHzL9PeG48ZfRBbyaHp
	jjxp1VCw==;
From: Pascal Roeleven <dev@pascalroeleven.nl>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Corentin Labbe <clabbe@baylibre.com>,
	Martin Cerveny <m.cerveny@computer.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com,
	Pascal Roeleven <dev@pascalroeleven.nl>
Subject: [PATCH v4 0/2] Add support for Topwise A721 tablet
Date: Mon, 22 Feb 2021 11:08:24 +0100
Message-Id: <20210222100826.12478-1-dev@pascalroeleven.nl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: dev@pascalroeleven.nl

On request I'm resending the last two patches from the Topwise A721 tablet
series from a year ago as they weren't picked up. The other patches are
already merged, so I didn't resend them.

Changes from v3:
* Fix DT validation warnings
* Remove leftover labels

Changes from v2:
* Collected acked-by.

Original cover letter:

This series add support for the Topwise A721 tablet and it's display.
It is an old tablet (around 2012) but it might be useful as reference
as the devicetree is pretty complete.

Changes from v1:
* Split into multiple patches
* dt-binding: use yaml instead of txt
* dt-binding: add Topwise A721 to sunxi.yaml
* dt-binding: add Topwise to vendor-prefixes
* drm: Add bus_format, bus_flags and connector_type
* dts: Use SPDX license identifier instead of boilerplate license text
* dts: Remove pinctrl leftovers

Pascal Roeleven (2):
  dt-bindings: arm: Add Topwise A721
  ARM: dts: sun4i: Add support for Topwise A721 tablet

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts  | 242 ++++++++++++++++++
 3 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts

-- 
2.27.0


