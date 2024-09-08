Return-Path: <SRS0=EDZP=QG=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2574BECE577
	for <soc@archiver.kernel.org>; Sun,  8 Sep 2024 21:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D779C4CEC6; Sun,  8 Sep 2024 21:52:23 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D67DC4CEC3;
	Sun,  8 Sep 2024 21:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D67DC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fWksfkF/dfTEvvEEssbvTf51SW/1LayFIfu3J119k6A=; b=EQEkcpn52a7drlMn0gd5ZJCVHR
	YmQ4JDwC6esRe7dqIswvh62IB59ZUp0fiwdH+sF7iC6Raz/sw62N5zpyLN1UL2d+Aio2UzxjMQf+/
	31Po+l0fOMgqn2s6Ya7ZrUjnY9hEmCUFcw+xLQ6fseBuFiAQuvaPYeBxbDbkYJ4fSwv9VCHpz9uD3
	1ehsZFu/tVg6/dPMR8Y6TEvx/mh6+AgA/aIah8cTx71BaU5Ko05aHal5mJHoyBFoo95dQC07BrQnM
	1jQK/rxfHQFlkYTzzo3TXHztDJ+mlNCTKSUMwU3cFRGrU0PG2Y5dUGOTd+7rxEowlKcYwclemyA+d
	9bWnD7PA==;
Received: from i5e8616cc.versanet.de ([94.134.22.204] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1snPpT-0004Ic-JX; Sun, 08 Sep 2024 23:52:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.12 #2
Date: Sun, 08 Sep 2024 23:54:35 +0200
Message-ID: <3004026.A7TYtsqqnE@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit e1aaecacfa135cd264a0db331d3ab8b2a04a54a3:

  soc: rockchip: grf: Add rk3576 default GRF values (2024-08-23 12:33:58 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.12-rockchip-drivers-2

for you to fetch changes up to 59420d8ad7809827524824a3891d6a081e735449:

  dt-bindings: arm: rockchip: Add rk3576 compatible string to pmu.yaml (2024-09-04 00:00:01 +0200)

----------------------------------------------------------------
One new pmu compatible for rk3576

----------------------------------------------------------------
Detlev Casanova (1):
      dt-bindings: arm: rockchip: Add rk3576 compatible string to pmu.yaml

 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)



