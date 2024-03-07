Return-Path: <SRS0=52GY=KN=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB76C54E58
	for <soc@archiver.kernel.org>; Thu,  7 Mar 2024 20:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AF7B7C43390; Thu,  7 Mar 2024 20:04:51 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (unknown [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C667BC433F1;
	Thu,  7 Mar 2024 20:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C667BC433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D7EE4C002453;
	Thu,  7 Mar 2024 12:04:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D7EE4C002453
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1709841882;
	bh=M9OGRhWJ7reQEsrD07Eela+124QSS8X5t011YmonP0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mQhECA2VeXvWMudJ2KXGx/l5KiiWtK+i5/YKmnd+Ro2W4YM/aisoyRU7wwblvXn/o
	 niVhSB3On61quhsSzx0AKBaoh4WqjIu0zxs3l0gLWaRTGqX0TxNjZGkezB71dDhqT0
	 sFkMr46Dufn4HrbshbfcNpaymwc1jcLKNvdWY+pY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 46EDB18041CAC7;
	Thu,  7 Mar 2024 12:04:41 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/3] Broadcom soc changes for 6.9
Date: Thu,  7 Mar 2024 12:04:41 -0800
Message-Id: <20240307200441.2151734-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307200441.2151734-1-florian.fainelli@broadcom.com>
References: <20240307200441.2151734-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.9/soc

for you to fetch changes up to 456df41549f29546546d63bdf814cf455c01b56c:

  ARM: bcm: stop selecing CONFIG_TICK_ONESHOT (2024-02-28 10:32:25 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs updates for 6.9,
please pull the following:

- Arnd removes a select CONFIG_TICK_ONESHOT done by the ARCH_BCM_MOBILE
  architecture which could cause compilation failures

- Florian adds a debug UART entry for BCM74165

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: bcm: stop selecing CONFIG_TICK_ONESHOT

Florian Fainelli (1):
      ARM: brcmstb: Add debug UART entry for 74165

 arch/arm/include/debug/brcmstb.S | 8 +++++---
 arch/arm/mach-bcm/Kconfig        | 1 -
 2 files changed, 5 insertions(+), 4 deletions(-)
