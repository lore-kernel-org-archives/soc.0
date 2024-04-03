Return-Path: <SRS0=tmn7=LI=rnplus.nl=renze@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643FECD1292
	for <soc@archiver.kernel.org>; Wed,  3 Apr 2024 13:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3450BC433C7; Wed,  3 Apr 2024 13:45:39 +0000 (UTC)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3747CC433F1
	for <soc@kernel.org>; Wed,  3 Apr 2024 13:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3747CC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 52793379489
	for <soc@kernel.org>; Wed,  3 Apr 2024 13:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHAm4pdhHo-z for <soc@kernel.org>;
	Wed,  3 Apr 2024 15:37:34 +0200 (CEST)
Received: from localhost.localdomain (184-179-179-143.ftth.glasoperator.nl [143.179.179.184])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 7CD69379443;
	Wed,  3 Apr 2024 15:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1712151450; bh=FqNyiUeqU0Pi3/GSVu8yFgj/1p765NCY3NVehafqT10=;
	h=From:To:Subject:Date;
	b=Wdbmf0PSAjMBK1k8e50gyXubKjLSTqiAFqXXSasBGIjuLMSPlTy+wci0jMXX9dca3
	 ph80GzB/yb8rBfheED55l2O8AqLrCVDLyKbKV61Wso338InwQE+/8SuclWq0XlBwkh
	 NCTS69t5KOjgsy6YSVZjIqukolrdEoNo+XWz7bLw=
From: Renze Nicolai <renze@rnplus.nl>
List-Id: <soc.lore.kernel.org>
To: renze@rnplus.nl,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH v2 0/3] ARM: dts: Update devicetree of Asrock X570D4U BMC
Date: Wed,  3 Apr 2024 15:28:50 +0200
Message-ID: <20240403133037.37782-1-renze@rnplus.nl>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches change the GPIO table, ADC channel configuration and
I2C bus configuration of the devicetree for the X570D4U BMC as part of
ongoing efforts to support OpenBMC on this platform.

Changes since v1:
 - Fixed warnings indicated by checkpatch.pl
 - Change commit message of ADC channels commit to match imperative mood
 - Restructure GPIO table to better match other ASPEED devices
 - Clarify naming scheme better

Best regards,
Renze Nicolai

Renze Nicolai (3):
  ARM: dts: Modify GPIO table for Asrock X570D4U BMC
  ARM: dts: Disable unused ADC channels for Asrock X570D4U BMC
  ARM: dts: Modify I2C bus configuration

 .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 131 ++++++++----------
 1 file changed, 57 insertions(+), 74 deletions(-)

-- 
2.44.0

