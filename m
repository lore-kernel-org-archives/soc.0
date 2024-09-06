Return-Path: <SRS0=bPQw=QE=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57FCE6FE43
	for <soc@archiver.kernel.org>; Fri,  6 Sep 2024 18:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 959FFC4CEC4; Fri,  6 Sep 2024 18:06:55 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CD62C4CEC9;
	Fri,  6 Sep 2024 18:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0CD62C4CEC9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 33F9CC0005C0;
	Fri,  6 Sep 2024 11:06:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 33F9CC0005C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1725646007;
	bh=AO0eS2scRwsOIyQcXNB216UY1gXShjrzt46aSFuGsjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oEJJKjuKjxi+7FNih1mYcEStFsn7KOOM/myjbnyvWFCEMMbJAzcQIeb/fBTtK3W3z
	 PccVd8yossblHnNCdJiusbEhag7CoKqCo3Qq9Sr971tuzM9t61L3TyQDB69LT0I/JU
	 bM/pxJ10t9xoL2jVsh+hSFDJ9AZB4AVrNT8cWQnU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id D9F7918041CAE2;
	Fri,  6 Sep 2024 11:06:46 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/4] Broadcom soc changes for 6.12
Date: Fri,  6 Sep 2024 11:06:43 -0700
Message-ID: <20240906180643.2275460-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240906180643.2275460-1-florian.fainelli@broadcom.com>
References: <20240906180643.2275460-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.12/soc

for you to fetch changes up to 2b28fe75c7dbe7ec322e706eed4622964409e21d:

  ARM: bcm: Select ARM_GIC_V3 for ARCH_BRCMSTB (2024-07-31 16:23:34 -0700)

----------------------------------------------------------------
This pull request contains Broadcom 32-bit SoC changes for 6.12, please
pull the following:

- Florian enables the ARM GICv3 driver since newer STB chips make use of
  a GIC-600 controller

----------------------------------------------------------------
Florian Fainelli (1):
      ARM: bcm: Select ARM_GIC_V3 for ARCH_BRCMSTB

 arch/arm/mach-bcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)
