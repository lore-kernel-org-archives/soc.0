Return-Path: <SRS0=6ohN=LD=rnplus.nl=renze@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246FBCD11DD
	for <soc@archiver.kernel.org>; Fri, 29 Mar 2024 13:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5572C433A6; Fri, 29 Mar 2024 13:02:28 +0000 (UTC)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7650AC43399
	for <soc@kernel.org>; Fri, 29 Mar 2024 13:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7650AC43399
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id BD1A937947F
	for <soc@kernel.org>; Fri, 29 Mar 2024 13:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GY_bhnTnFNf4 for <soc@kernel.org>;
	Fri, 29 Mar 2024 14:05:37 +0100 (CET)
Received: from localhost.localdomain (184-179-179-143.ftth.glasoperator.nl [143.179.179.184])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 4D0C3379192;
	Fri, 29 Mar 2024 14:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1711717524; bh=l8mCvlJVZrar8f+bwi8D1Jsz6VsyqIEPsPow82A7rHw=;
	h=From:To:Subject:Date;
	b=NNZS4nqIzaD2hCfu8CA8gTwt99O9g00IswvSMQLre+7+i4h5LYupSeCU5p93fzP9W
	 WWdY1u+D30lLuArKURoztIIMP+dcvzvAhLCU0JWLysSGgcMTByFbyZW5NwCVPc/13J
	 n6hTZvPbIcEEEv2vvnV64ld5LtvO5LTdvL65Alv8=
From: Renze Nicolai <renze@rnplus.nl>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	renze@rnplus.nl
Subject: [PATCH 0/3] ARM: dts: Update devicetree of Asrock X570D4U BMC
Date: Fri, 29 Mar 2024 14:01:38 +0100
Message-ID: <20240329130152.878944-1-renze@rnplus.nl>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

These patches change the GPIO table, ADC channel configuration and
I2C bus configuration of the devicetree for the X570D4U BMC as part of
ongoing efforts to support OpenBMC on this platform.

Best regards,
Renze Nicolai

Renze Nicolai (3):
  ARM: dts: Modify GPIO table for Asrock X570D4U BMC
  ARM: dts: Disable unused ADC channels for Asrock X570D4U BMC
  ARM: dts: Modify I2C bus configuration

 .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 152 +++++++++---------
 1 file changed, 78 insertions(+), 74 deletions(-)

-- 
2.44.0

