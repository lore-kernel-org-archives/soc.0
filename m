Return-Path: <SRS0=dEvG=3I=bewilderbeest.net=zev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890BAC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 00:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47879C433D7; Tue,  8 Nov 2022 00:16:08 +0000 (UTC)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CEB36C433C1;
	Tue,  8 Nov 2022 00:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CEB36C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 39228216;
	Mon,  7 Nov 2022 16:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667866560;
	bh=VIkVQ5MTYduxA9TI2MvsFc6HLebHjxk8Luy5qKBI/ok=;
	h=From:To:Cc:Subject:Date:From;
	b=HIioipVNI5LZeGOhYsQxaD1DVC05XZ2NBPQpUo/BYR70nUO9y0A4gk9yKPSz5Dhoz
	 mXCjsgZk07ildLOPSNOZ5bTxKau1Tv6i4Ir8Tc59b+UjTh6aBEl8fIBV3yhz+dQFIA
	 g1fG/872VyNtaIrf4lfEnn23NBv+H1EYpHfCaekw=
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
Subject: [PATCH v2 0/2] ARM: dts: aspeed: Add Delta AHE-50DC BMC
Date: Mon,  7 Nov 2022 16:15:49 -0800
Message-Id: <20221108001551.18175-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series adds a device-tree for the BMCs of the Delta AHE-50DC
Open19 power shelf.  The first patch adds a compat entry to the Aspeed
bindings; the second adds the device-tree itself.

Changes since v1 [0]:
 - rearranged patch 2 with macros to reduce boilerplate
 - added ack from Krzysztof on patch 1

Thanks,
Zev

[0] https://lore.kernel.org/lkml/20221105013321.2719-1-zev@bewilderbeest.net/T/

Zev Weiss (2):
  dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
  ARM: dts: aspeed: Add Delta AHE-50DC BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts | 418 ++++++++++++++++++
 3 files changed, 420 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts

-- 
2.38.1

