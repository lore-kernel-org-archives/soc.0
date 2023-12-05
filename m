Return-Path: <SRS0=VKcq=HQ=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F59C4167B
	for <soc@archiver.kernel.org>; Tue,  5 Dec 2023 22:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34B97C433C9; Tue,  5 Dec 2023 22:50:31 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F6ECC433C8;
	Tue,  5 Dec 2023 22:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F6ECC433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 33C23C004EB1;
	Tue,  5 Dec 2023 14:50:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 33C23C004EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1701816623;
	bh=lSOz1wbB3CIiqmDuPA2AKiQ0EuMA5RhxkQsvz1uKDAM=;
	h=From:To:Cc:Subject:Date:From;
	b=HYsGPNW/bbuZzV1wix3xCsuef2XK4Ds5bJRzHPplWq87a+R3LpLQornDwmHt6xGFt
	 oebneLwL58SfYglbn076zkhknGsF9QcNQ4z1H0p9nX4wzn+9DGoK6GgPegzKxNbBv/
	 ZvYJhTejBWyaXToco97Cq18fh5lj8ZY+eXmCuLFc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id F061218041CAC4;
	Tue,  5 Dec 2023 14:50:21 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree fixes for 6.7
Date: Tue,  5 Dec 2023 14:50:21 -0800
Message-Id: <20231205225021.653045-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.7/devicetree-fixes

for you to fetch changes up to dc761f11af2e39119d3a7942e3d10615f3d900e7:

  ARM: dts: bcm2711-rpi-400: Fix delete-node of led_act (2023-11-28 16:26:07 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
6.7, please pull the following:

- Stefan corrects the disabling of the activity LED for the Raspberry Pi
  400

----------------------------------------------------------------
Stefan Wahren (1):
      ARM: dts: bcm2711-rpi-400: Fix delete-node of led_act

 arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
