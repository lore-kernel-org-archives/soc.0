Return-Path: <SRS0=52GY=KN=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45A4C54E4A
	for <soc@archiver.kernel.org>; Thu,  7 Mar 2024 20:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE461C433F1; Thu,  7 Mar 2024 20:04:51 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (unknown [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CABF2C433C7;
	Thu,  7 Mar 2024 20:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CABF2C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A332CC00115D;
	Thu,  7 Mar 2024 12:04:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A332CC00115D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1709841882;
	bh=WX3PXIqwar7P1dbtitXZ9roTf2LNzl4lEJ76EvPJxDQ=;
	h=From:To:Cc:Subject:Date:From;
	b=eZcpohE3wfPGbPTKcVjuYNTe7R37zEx1eHQhl3tuzf1EK70XMvSb+otwSijNfolke
	 qZD3w7gR6ljx6lIoYn2BZc9+zetXdkPtC3wsgzfOU5OdOFgNFSiINNXKh9ZzpzuRft
	 Xo2TF/ocTaMwfQwOH2FhPsm61Bp1+oyw8k03gkqk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 10C4218041CAC4;
	Thu,  7 Mar 2024 12:04:41 -0800 (PST)
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
Subject: [GIT PULL 1/3] Broadcom devicetree-arm64 changes for 6.9
Date: Thu,  7 Mar 2024 12:04:39 -0800
Message-Id: <20240307200441.2151734-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.9/devicetree-arm64

for you to fetch changes up to 27058b95fbb784406ea4c40b20caa3f04937140c:

  arm64: dts: broadcom: bcmbca: bcm4908: drop invalid switch cells (2024-01-29 10:43:10 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs changes for 6.9,
please pull the following:

- Rafal defines a proper NVMEM layout for the Asus GT-AC5300 router and
  removes some invalid Device Tree properties pertaining to the
  Ethernet switch on bcm4908

----------------------------------------------------------------
Rafał Miłecki (2):
      arm64: dts: broadcom: bcmbca: bcm4908: use NVMEM layout for Asus GT-AC5300
      arm64: dts: broadcom: bcmbca: bcm4908: drop invalid switch cells

 .../boot/dts/broadcom/bcmbca/bcm4908-asus-gt-ac5300.dts     | 13 +++++++------
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi            |  3 ---
 2 files changed, 7 insertions(+), 9 deletions(-)
