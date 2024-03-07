Return-Path: <SRS0=52GY=KN=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BA7C54798
	for <soc@archiver.kernel.org>; Thu,  7 Mar 2024 20:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07497C433F1; Thu,  7 Mar 2024 20:04:48 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13FFFC433C7;
	Thu,  7 Mar 2024 20:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13FFFC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E740CC0000F4;
	Thu,  7 Mar 2024 12:04:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E740CC0000F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1709841883;
	bh=3F6pcXkEIkL0aTsmU/MIbDZ7aL8xSEk3Y33/Ir5L+D0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CI1LZ5aC8tu3UTxvPb0yO9mE2fdT4CjFozFd1u0k/KvZGJoWRXcBdUf/2XYou5MtC
	 8TW08FcH8+e9QWWOa3SxS4xANuNyDvUKkJC3rF3CzR2rMNefPC1rJLzl3ZShLrYQMW
	 1p6+g/AmUYM5G1chsQEwyMK+beygGuFUM2AQ/mSg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 2C17D18041CAC6;
	Thu,  7 Mar 2024 12:04:41 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/3] Broadcom drivers changes for 6.9
Date: Thu,  7 Mar 2024 12:04:40 -0800
Message-Id: <20240307200441.2151734-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307200441.2151734-1-florian.fainelli@broadcom.com>
References: <20240307200441.2151734-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.9/drivers

for you to fetch changes up to 86964bb62a9334acfebd869ca8ffc184dc365b75:

  bus: brcmstb_gisb: Added support for 74165 register layout (2024-01-29 10:43:22 -0800)

----------------------------------------------------------------
This pull request contains Broadcom SoC device drivers changes for 6.9,
please pull the following:

- Florian adds support for the 74165 GISB arbiter layout which shuffled
  register offsets around

----------------------------------------------------------------
Florian Fainelli (2):
      dt-bindings: bus: Document Broadcom GISB arbiter 74165 compatible
      bus: brcmstb_gisb: Added support for 74165 register layout

 Documentation/devicetree/bindings/bus/brcm,gisb-arb.yaml |  1 +
 drivers/bus/brcmstb_gisb.c                               | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
