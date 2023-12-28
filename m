Return-Path: <SRS0=BEyS=IH=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71592C3DA6E
	for <soc@archiver.kernel.org>; Thu, 28 Dec 2023 08:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57055C433C9; Thu, 28 Dec 2023 08:58:32 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (unknown [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6668EC433C7;
	Thu, 28 Dec 2023 08:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6668EC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 30B9FC005FE8;
	Thu, 28 Dec 2023 00:58:24 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 30B9FC005FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1703753904;
	bh=JWDmEda7T3y8e86/GOTZZuS38y5NTjXyGTEelJIeCts=;
	h=From:To:Cc:Subject:Date:From;
	b=LgLkvKv9l+cJfecjag6WQWhYGJSQcfM7wNNeMNU3ZywtolWt35rSGiPFM556wNhJJ
	 8tW7N3NzI4hRcNosFi1WmQ8IfBA/Vyi4ZbzZDy2xsVatPPGYmoEe8ANUtoKtJhpopU
	 96Njx1Bb/j3ZLpmHofM4ciPe85ngrDEba5YRxv0o=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id B9D0418041CAC4;
	Thu, 28 Dec 2023 00:58:22 -0800 (PST)
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
Subject: [GIT PULL 1/1] Broadcom devicetree changes for 6.8
Date: Thu, 28 Dec 2023 00:58:22 -0800
Message-Id: <20231228085822.3656546-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.8/devicetree

for you to fetch changes up to dadc77c93b6e8ca8edd1e290fc1702dc5cef18e3:

  ARM: dts: broadcom: Add BCM63138's high speed UART (2023-12-05 14:44:48 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 6.8, please pull the following:

- Rafal adds a Device Tree node for the BCM63138 high-speed UART used
  for Bluetooth devices

----------------------------------------------------------------
Rafał Miłecki (1):
      ARM: dts: broadcom: Add BCM63138's high speed UART

 arch/arm/boot/dts/broadcom/bcm63138.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)
