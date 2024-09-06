Return-Path: <SRS0=bPQw=QE=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D99E6FE46
	for <soc@archiver.kernel.org>; Fri,  6 Sep 2024 18:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5E80C4CEC9; Fri,  6 Sep 2024 18:06:55 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (saphodev.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 208E3C4CEC8;
	Fri,  6 Sep 2024 18:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 208E3C4CEC8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id F392AC011B73;
	Fri,  6 Sep 2024 11:06:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com F392AC011B73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1725646007;
	bh=zOJMaIAWSFLRdBKznvOrXT7bV2+j/F+fmCifjq0R/Kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NsdkwVcjGTcbE+ZNMhcNC6T1BdPzPd9ITmFUcaWqVgiVCOvWuUS2nTwFsd78ucXpt
	 RPBfyFXaQdueh682hq7fhy+aTiqn6IEN5OPEgQbuscBMg6FQDOsOuYVJ8xCBr5jTWB
	 Q9B+k5DsNhmmtmhB7Kb+EIWvUF0dc1jlO+m0ClrY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 9D1A018041CACA;
	Fri,  6 Sep 2024 11:06:46 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/4] Broadcom devicetree-arm64 changes for 6.12
Date: Fri,  6 Sep 2024 11:06:41 -0700
Message-ID: <20240906180643.2275460-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240906180643.2275460-1-florian.fainelli@broadcom.com>
References: <20240906180643.2275460-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.12/devicetree-arm64

for you to fetch changes up to eb81f43c901ff799d762aa65888fd87d08d9a1ff:

  ARM: dts: bcm2837/bcm2712: adjust local intc node names (2024-08-13 13:25:03 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64 SoCs Device Tree changes for
6.12, please pull the following:

- Andrea adds a minimal Device Tree for the Raspberry Pi 5 (2712)

- Stefan adjusts the bcm2837/bcm2712 bcm2836-l1-intc node name to
  conform to the binding changes

----------------------------------------------------------------
Andrea della Porta (1):
      arm64: dts: broadcom: Add minimal support for Raspberry Pi 5

Stefan Wahren (1):
      ARM: dts: bcm2837/bcm2712: adjust local intc node names

 arch/arm/boot/dts/broadcom/bcm2837.dtsi          |   2 +-
 arch/arm64/boot/dts/broadcom/Makefile            |   1 +
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts |  64 +++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi        | 283 +++++++++++++++++++++++
 4 files changed, 349 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712.dtsi
