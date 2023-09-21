Return-Path: <SRS0=ScSP=FF=lakka.kapsi.fi=mcfrisk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF7EE71085
	for <soc@archiver.kernel.org>; Thu, 21 Sep 2023 14:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0646BC4E75C; Thu, 21 Sep 2023 14:57:49 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C045C4E75E;
	Thu, 21 Sep 2023 14:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C045C4E75E
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lakka.kapsi.fi
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qjL7R-00CSWK-0T;
	Thu, 21 Sep 2023 17:57:29 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qjL7Q-00964k-Sq; Thu, 21 Sep 2023 17:57:28 +0300
From: mikko.rapeli@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Olof Johansson <olof@lixom.net>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	stable@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Jon Mason <jon.mason@arm.com>,
	Jon Mason <jdmason@kudzu.us>,
	Ross Burton <ross@burtonini.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=y
Date: Thu, 21 Sep 2023 17:57:22 +0300
Message-Id: <20230921145723.2167927-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: 0.1 (/)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: FREEMAIL_ENVRCPT(0.00)
 Symbol: TAGGED_RCPT(0.00)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: RCPT_COUNT_TWELVE(0.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FREEMAIL_CC(0.00)
 Symbol: SUSPICIOUS_RECIPS(1.50)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230921145723.2167927-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Rapeli <mikko.rapeli@linaro.org>

There is no code for this config option and enabling it in defconfig
causes warnings from tools which are detecting unused and obsolete
kernel config flags since the flag will be completely missing from
effective build config after "make olddefconfig".

Fixes yocto kernel recipe build time warning:

WARNING: [kernel config]: This BSP contains fragments with warnings:
...
[INFO]: the following symbols were not found in the active
configuration:
     - CONFIG_COMMON_CLK_NPCM8XX

The flag was added with commit 45472f1e5348c7b755b4912f2f529ec81cea044b
v5.19-rc4-15-g45472f1e5348 so 6.1 and 6.4 stable kernel trees are
affected.

Fixes: 45472f1e5348c7b755b4912f2f529ec81cea044b ("arm64: defconfig: Add Nuvoton NPCM family support")
Cc: stable@kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Jon Mason <jdmason@kudzu.us>
Cc: Ross Burton <ross@burtonini.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

v2: sending to soc list, added maintainers to Cc after discussion with Arnd

v1: https://lore.kernel.org/linux-arm-kernel/20230815073656.507651-1-mikko.rapeli@linaro.org/

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..24531891c7be 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1175,7 +1175,6 @@ CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC5=y
-CONFIG_COMMON_CLK_NPCM8XX=y
 CONFIG_COMMON_CLK_BD718XX=m
 CONFIG_CLK_RASPBERRYPI=m
 CONFIG_CLK_IMX8MM=y
-- 
2.34.1

