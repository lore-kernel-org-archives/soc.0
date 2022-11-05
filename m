Return-Path: <SRS0=j0A+=3F=bewilderbeest.net=zev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89A0C433FE
	for <soc@archiver.kernel.org>; Sat,  5 Nov 2022 01:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AEF1C433C1; Sat,  5 Nov 2022 01:33:36 +0000 (UTC)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C2F9C433B5;
	Sat,  5 Nov 2022 01:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C2F9C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 85675F1;
	Fri,  4 Nov 2022 18:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667612008;
	bh=0kVuSBCQW7dnCQkFGMlB2Vk2wcSiucoD2YkTfpm6/UE=;
	h=From:To:Cc:Subject:Date:From;
	b=Jk7aKEiTgjXw62nT31xtCXGFBdlrNRSFQ7kKgJfUIboZnpAnHCfBNkgFgeOLbU1YJ
	 7LQX+XtTq5P87Zznn2sw33zKvSquli93DmVKKR/F4PzmTEgMhU5woq3o33lOluErzW
	 0Vf781mWTnh83efDGWXvSyznyj8ipZtO7ReT5DyA=
From: Zev Weiss <zev@bewilderbeest.net>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	soc@kernel.org
Cc: Zev Weiss <zev@bewilderbeest.net>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] ARM: dts: aspeed: Add Delta AHE-50DC BMC
Date: Fri,  4 Nov 2022 18:33:19 -0700
Message-Id: <20221105013321.2719-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series adds a device-tree for the BMCs of the Delta AHE-50DC
Open19 power shelf.  The first patch adds a compat entry to the Aspeed
bindings; the second adds the device-tree itself.


Thanks,
Zev

Zev Weiss (2):
  dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
  ARM: dts: aspeed: Add Delta AHE-50DC BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/Makefile                    |    1 +
 .../arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts | 1094 +++++++++++++++++
 3 files changed, 1096 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts

-- 
2.38.1

