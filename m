Return-Path: <SRS0=uyAw=TP=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473EBC433EF
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 20:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1157CC340F4; Fri,  4 Mar 2022 20:21:43 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E044C340F1;
	Fri,  4 Mar 2022 20:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E044C340F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 1B6C322175;
	Fri,  4 Mar 2022 21:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1646425293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D1CCXNqz2Fe18wqCxjEJwTrkWxNaSrqODGhKpOUFlpc=;
	b=AbDgxX1XUO520oesNTkBCcF9XUMgERdBCz5zC4NhtZKIlopmv+JjZWEh2s5z8mkxqex3Ch
	PhxtieK5u9V65F6qQfSGnmAH98hzrEQK97EU67NZhCCHWqe/00vjV257jDL8M7c7OOcq0S
	zmoGUEqMHfzOaPjQK26JqEvC3Z3Teh8=
From: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH] arm64: defconfig: enable Layerscape SFP driver
Date: Fri,  4 Mar 2022 21:21:24 +0100
Message-Id: <20220304202124.3401165-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the driver for the Layerscape SFP (Security Fuse Processor) found
on most Layerscape SoCs. For example, a per-device unique serial number
is stored in the fuses.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b8c216b11dae..46ee2dda2253 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1197,6 +1197,7 @@ CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_UNIPHIER_EFUSE=y
 CONFIG_MESON_EFUSE=m
 CONFIG_NVMEM_RMEM=m
+CONFIG_NVMEM_LAYERSCAPE_SFP=m
 CONFIG_FPGA=y
 CONFIG_FPGA_MGR_STRATIX10_SOC=m
 CONFIG_FPGA_BRIDGE=m
-- 
2.30.2

