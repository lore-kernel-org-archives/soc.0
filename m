Return-Path: <SRS0=B5jS=MC=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5FBC04FFE
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C31AC113CD; Mon, 29 Apr 2024 21:37:14 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AF27C4AF19;
	Mon, 29 Apr 2024 21:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5AF27C4AF19
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D85CBC0000F4;
	Mon, 29 Apr 2024 14:37:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D85CBC0000F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714426625;
	bh=A9NYdqQJM/TxmnY04wnTvbd+K/cRspbtbQoSS0lPxjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EgOGKwgqj4vH751zTHrJUGtFeEoJmpxD7BATu7b6zJio5Qf5TLG5UmaoSgPsMuDEX
	 WQyENoKwLNhxYcgZKQxZnkFTObByhr1lEmbrsxwoDcxkbzvyv/fPbhprHMn8kkb+ZY
	 Zy0eLxYJKsVKGhkKoHKVM/t128dPGKaeVLv7q2KQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id EF04A18041CAC7;
	Mon, 29 Apr 2024 14:37:03 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/4] Broadcom devicetree-arm64 changes for 6.10
Date: Mon, 29 Apr 2024 14:37:02 -0700
Message-Id: <20240429213703.2327834-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
References: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.10/devicetree-arm64

for you to fetch changes up to 328ad44c5290cc4575be5f0dc457c75bb71015d4:

  arm64: dts: broadcom: bcmbca: bcm4908: set brcm,wp-not-connected (2024-04-02 13:41:01 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 6.10, please pull the following:

- Rafal moves the "brcm,wp-not-connected" property from the individual
  board DTSes to the SoC' DTSI since all boards a designed the same way

----------------------------------------------------------------
Rafał Miłecki (1):
      arm64: dts: broadcom: bcmbca: bcm4908: set brcm,wp-not-connected

 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi | 1 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dts | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)
