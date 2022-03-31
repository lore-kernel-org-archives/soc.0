Return-Path: <SRS0=IGJM=UK=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637F9C433EF
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 02:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F77EC36AE3; Thu, 31 Mar 2022 02:43:18 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id 84672C340EC;
	Thu, 31 Mar 2022 02:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84672C340EC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
	by maillog.nuvoton.com (Postfix) with ESMTP id 6BFD11C81053;
	Thu, 31 Mar 2022 10:43:07 +0800 (CST)
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 31
 Mar 2022 10:43:07 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 31 Mar
 2022 10:43:06 +0800
Received: from localhost.localdomain (172.19.1.47) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 31 Mar 2022 10:43:02 +0800
From: Jacky Huang <ychuang3@nuvoton.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
CC: <robh+dt@kernel.org>, <sboyd@kernel.org>, <krzk+dt@kernel.org>,
	<arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>, <cfli0@nuvoton.com>,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH 0/3] Add initial support for MA35D1 SoC
Date: Thu, 31 Mar 2022 10:42:53 +0800
Message-ID: <20220331024256.14762-1-ychuang3@nuvoton.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

This patch series adds initial support for Nuvoton MA35D1 SoC,
include initial dts and clock controller binding.

Jacky Huang (3):
  dt-bindings: clock: add binding for MA35D1 clock controller
  dt-bindings: clock: Document MA35D1 clock controller bindings
  arm64: dts: nuvoton: Add initial support for MA35D1

 .../bindings/clock/nuvoton,ma35d1-clk.yaml    |  59 ++++
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/nuvoton/Makefile          |   2 +
 arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts    |  23 ++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 106 +++++++
 .../dt-bindings/clock/nuvoton,ma35d1-clk.h    | 262 ++++++++++++++++++
 6 files changed, 453 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
 create mode 100644 arch/arm64/boot/dts/nuvoton/Makefile
 create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
 create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
 create mode 100644 include/dt-bindings/clock/nuvoton,ma35d1-clk.h

-- 
2.30.2

