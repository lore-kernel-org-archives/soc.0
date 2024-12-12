Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9267C213E6B
	for <soc@lists.linux.dev>; Thu, 12 Dec 2024 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018772; cv=none; b=WsS4EmcQyLxWpWDpKfeVPLiW/X3MB4fOhyXzNljvSAQ4CkgXoe9aA3P35O2cA2iKIbGG0L0V1k+VB9ysZdyK9EFgPCn7tER7YSetnUGqzW8J+SM248j63RHQV616RHqPFQdC4WnN3hDXr8GqSVavQegLYvBgao4zZ7y1wXopjQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018772; c=relaxed/simple;
	bh=6KvSWy/qvctLgXtiy34HcDw5CYN2RqavDCfoL9/qKKo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H7Ma528MAcEDGYJaCkBc1CLme8Iqlz2l0s9liViLIIFf/uOXhOXWvU77zvDEglzOgEYZGEv0ee1VO1FUgNST+wuUI8eU8vlHuJC398HMlqT55jrPFH8ZKaiwr2e/AhPt/sYbi/sERAzk+wpqwItDn3gzn7peZtNIN/qEUS4hin4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 12 Dec
 2024 23:52:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 12 Dec 2024 23:52:41 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <tglx@linutronix.de>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <quic_bjorande@quicinc.com>, <geert+renesas@glider.be>,
	<dmitry.baryshkov@linaro.org>, <konradybcio@kernel.org>,
	<neil.armstrong@linaro.org>, <johan+linaro@kernel.org>,
	<kevin_chen@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>
Subject: [PATCH v3 0/6] Introduce ASPEED AST27XX BMC SoC
Date: Thu, 12 Dec 2024 23:52:29 +0800
Message-ID: <20241212155237.848336-1-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

---
v3:
  - Split clk and reset driver to other commits, which are in series of
    "Add support for AST2700 clk driver".
  - For BMC console by UART12, add uart12 using ASPEED INTC architecture.

aspeed,ast2700-intc.yaml
  - Add minItems to 1 to fix the warning by "make dtbs_check W=1".
  - Add intc1 into example.

Kconfig.platforms
  - Remove MACH_ASPEED_G7.

Kevin Chen (6):
  dt-bindings: interrupt-controller: Refine size/interrupt-cell usage.
  dt-bindings: arm: aspeed: Add ASPEED AST27XX SoC
  arm64: aspeed: Add support for ASPEED AST27XX BMC SoC
  arm64: dts: aspeed: Add initial AST27XX device tree
  arm64: dts: aspeed: Add initial AST2700 EVB device tree
  arm64: defconfig: Add ASPEED AST2700 family support

 .../bindings/arm/aspeed/aspeed.yaml           |   6 +
 .../aspeed,ast2700-intc.yaml                  |  60 ++++-
 MAINTAINERS                                   |   1 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/aspeed/Makefile           |   4 +
 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi     | 236 ++++++++++++++++++
 arch/arm64/boot/dts/aspeed/ast2700-evb.dts    |  57 +++++
 arch/arm64/configs/defconfig                  |   1 +
 9 files changed, 359 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts

-- 
2.34.1

