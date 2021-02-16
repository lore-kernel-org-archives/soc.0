Return-Path: <SRS0=pZ4E=HS=pascalroeleven.nl=dev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89532C433E0
	for <soc@archiver.kernel.org>; Tue, 16 Feb 2021 17:09:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 22C3E64E2B; Tue, 16 Feb 2021 17:09:29 +0000 (UTC)
X-Greylist: delayed 535 seconds by postgrey-1.34 at mail.kernel.org; Tue, 16 Feb 2021 17:09:28 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC46664E08
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=pascalroeleven.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=dev@pascalroeleven.nl
Received: from pmg02-out2.zxcs.nl (pmg02-out2.zxcs.nl [185.104.28.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC46664E08;
	Tue, 16 Feb 2021 17:09:28 +0000 (UTC)
Received: from pmg02.zxcs.nl (localhost.localdomain [127.0.0.1])
	by pmg02.zxcs.nl (ZXCS) with ESMTP id E010F82663;
	Tue, 16 Feb 2021 18:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id
	:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CQp8a9bvhUdwKVBZ0N74gvncL9qmC+u/ZFHCgpEsS+o=; b=J50Nm06a0Q51h3t6vBefpAdhwE
	qUU6PnVO0ETMQZWrfbYifiMV+K3vdb93a/bgcoI8JZ3JS1n0EaFeqJHVZgqq1g44DdRGCSMiE3rEo
	EmY0rsoxnQslBiDKQlR25nZJCQPy++iz/NAbm0cHi3xHkDsnBDnUhGvQaEz4IHMw8YiAHnUk9ePCq
	aJDftDN39WtTpjUSLRFiivUGO/yTCe2xEM2sYqExeJzRAC0bDnpKMNajz9oMh6mwhwsOcw5szbp/4
	eUV4D77lwpxnlZuFEkxEtocsJrCNP6lKdnMQnTC1gu8qTY9gz1H3yTErRFzsgElA/tROBumk3Ovlm
	lPXF4nAQ==;
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
	Corentin Labbe <clabbe@baylibre.com>,
	Martin Cerveny <m.cerveny@computer.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com,
	Pascal Roeleven <dev@pascalroeleven.nl>
Subject: [PATCH RESEND v3 0/2] Add support for Topwise A721 tablet
Date: Tue, 16 Feb 2021 17:59:52 +0100
Message-ID: <20210216165954.43135-1-dev@pascalroeleven.nl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: dev@pascalroeleven.nl
Message-ID: <20210216165952.rzXEA_YHE1A30ZiRLXG1Hrnhgyy0kL5hFvXioTNhhd8@z>

On request I'm resending the last two patches from the Topwise A721 tablet
series from a year ago as they weren't picked up. The other patches are
already merged, so I didn't resend them. They still apply as-is, so no changes
are made.

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


