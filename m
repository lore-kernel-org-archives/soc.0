Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011414F112
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 02:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973560; cv=none; b=TWplE/OHAbMoLeU2rEkMfoSMQ62WihO/R7UNZ278j3+7tOpny+dRmvKoe7P0QzvSZVvasYLBOt+nL3UkOpWPmdVJpIOeEZG5+wVmM/0vwndb4Yjlu+SO6j+NnKSn4tb6HDoQtLM0CkAJ9zq/GxZfY48oh2WloS7D6m4kL55TREU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973560; c=relaxed/simple;
	bh=RQwTxn/uC4uN0WJoY0k9BTQfTtBCgjUyuewS0fZ85O8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ODEewflvbWV5kiuvOuhYwq/oLph7y8hXjSLdiI1tWftaK2+5TxiYX7AFH5SbAU+KBbef79tb9fotdD0dj+L9zJMlxvmE+cWBUD3X2Lwr5HjH/U77hwz8+WZUMisLEhb+VrQGD3SciMf2oapKZkkEP3Nb1drUL2aDNmWakygGeCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 9 Jun
 2026 10:47:20 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 9 Jun 2026 10:47:20 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Tue, 9 Jun 2026 10:47:21 +0800
Subject: [PATCH v9 4/4] arm64: configs: Update defconfig for AST2700
 platform support
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260609-upstream_ast2700-v9-4-f631752f0cb1@aspeedtech.com>
References: <20260609-upstream_ast2700-v9-0-f631752f0cb1@aspeedtech.com>
In-Reply-To: <20260609-upstream_ast2700-v9-0-f631752f0cb1@aspeedtech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, "Drew
 Fustini" <fustini@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<soc@lists.linux.dev>, <linux-riscv@lists.infradead.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780973240; l=638;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=RQwTxn/uC4uN0WJoY0k9BTQfTtBCgjUyuewS0fZ85O8=;
 b=y/mUay52X8xni2LJVKpUDeSB5DicheU3a7dVumw67Ob1Wqt5S5v/6x8e4xJ4M/H4wOJ7AYBXb
 ssaTuqkCPvnAFMMjcBrxkGrh0mdsF/h/uH+WxvD79tj5saWTjGZ8SOW
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Enable options for ASPEED AST2700 SoC.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 909f3c188e75..4879939353f4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -39,6 +39,7 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
 CONFIG_ARCH_ARTPEC=y
+CONFIG_ARCH_ASPEED=y
 CONFIG_ARCH_AXIADO=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y

-- 
2.34.1

