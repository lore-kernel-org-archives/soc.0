Return-Path: <SRS0=nhTP=P7=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B0AC54FC6
	for <soc@archiver.kernel.org>; Sun,  1 Sep 2024 22:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39B60C4CEC6; Sun,  1 Sep 2024 22:12:10 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22281C4CEC3;
	Sun,  1 Sep 2024 22:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22281C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=En7lqAj3vsMOX67XHj3kouTnwszC8SPDX3RQFxwtRmc=; b=PJKhBNofZ4oQSJG9OxIi8DFHp7
	RqFFkwaVRnhlw9NKf11yOglDWKr3vBV1d4rXp9UmaQmawPh7CypnJVaLFKWo8IpwpSTPbq+jhVMq0
	vLrKckoFIUWGQ5BfcPul8reyYyiMR1nU9WGNuNVUufxrDchEbB+3dSguvBz8wSgfrdHVSOrCGxLU+
	D+Zqcz5wo8w+zSTKct2UyalUKOAPt39CxZHv/c8iwPiyDSunPPo6PwhdNtHuHq+r2ZDT0NaKSiaXP
	qp5ikGX+yIer0wFSbxT0NT5OPHU/XEeZ8CppKBz/1AmKAXScLmhqm6+buPczT6bTDjWd6RN5kXIFZ
	pv4VyuWw==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sksnm-0006hp-VC; Mon, 02 Sep 2024 00:12:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.12 #1
Date: Mon, 02 Sep 2024 00:13:40 +0200
Message-ID: <23316481.ssLaC8jLEa@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.12-rockchip-drivers-1

for you to fetch changes up to e1aaecacfa135cd264a0db331d3ab8b2a04a54a3:

  soc: rockchip: grf: Add rk3576 default GRF values (2024-08-23 12:33:58 +0200)

----------------------------------------------------------------
rk3308 io-domains, and some default settings for bits in the general
register files for rk3128 and the new rk3576 soc.

----------------------------------------------------------------
Alex Bee (1):
      soc: rockchip: grf: Set RK3128's vpu main clock

David Wu (1):
      soc: rockchip: io-domain: Add RK3308 IO voltage domains

Detlev Casanova (2):
      dt-bindings: soc: rockchip: Add rk3576 syscon compatibles
      soc: rockchip: grf: Add rk3576 default GRF values

Jonas Karlman (1):
      dt-bindings: power: rockchip: Document RK3308 IO voltage domains

 .../bindings/power/rockchip-io-domain.yaml         | 24 +++++++++++++
 .../devicetree/bindings/soc/rockchip/grf.yaml      | 16 +++++++++
 drivers/soc/rockchip/grf.c                         | 32 ++++++++++++++++-
 drivers/soc/rockchip/io-domain.c                   | 40 ++++++++++++++++++++++
 4 files changed, 111 insertions(+), 1 deletion(-)



