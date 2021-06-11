Return-Path: <SRS0=HVwK=LF=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460C2C48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 22:07:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1FD17613CF; Fri, 11 Jun 2021 22:07:16 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2046613CD
	for <soc@kernel.org>; Fri, 11 Jun 2021 22:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2046613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f49.google.com with SMTP id x24so5042396lfr.10
        for <soc@kernel.org>; Fri, 11 Jun 2021 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v+CJ5jUjZTJX38svdKnOCuqWhdmCpbOqqtQIHkEjacI=;
        b=fqbyauwdHI6UcTK9bXEswNQ7KAH9to9Xs7Wn5DEYI5uuvw/F7tZJIsx787g3/IBxMX
         A4JUp48EUg+Wuny2KPcz+Zyh1pI+jYgwyjQA0Qmd0ksGdmwX9fHAdrkACgJbQnqAVE59
         I05mI9zYPhWxfR+PfYhs1cP7zJ5pCAF4H4I1MfjC7+q+8RI5cFWUskYd2Kf83zH3Qi+N
         74UatAJqWpoxkNifFMzvX65/MjxD1QjPFZL1FBugGMeE3S3YhBI/PmfmKqMIIEEJJ8LA
         7Y8mUlLfBNSrx8MzPAdbtFnohj9cRQu6Hp98kybbYyFtInIVPPK/tJFagBM7ZXIRflF9
         zMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v+CJ5jUjZTJX38svdKnOCuqWhdmCpbOqqtQIHkEjacI=;
        b=FmwUxPba5qhQA9hcPUggkstARMDHlZEhCs2bwwDkqRRv2rpJ1eJE6QawsPeJ7rxFgY
         5YCwVMCnRDKeUwDCVI8WXzFUvoN20WZZRht2IftLD8vRdERawnUwxSHsuSm9Ny7vgriA
         1GqMcyMRABa8rZHlFy4CHNQ1YAvC3TBQFWzRnmEBsRJYGTimfKiNdi44o2cfgLHRVaJX
         w3Hm0Uhu1Rfkc3St/xdNxdnRPnWjnqEEanliiX9MhSWYITW6BI67lKdEXd9fJxS4J/oq
         G5ZLMP/QY2RADn1hMyvdwLU76SnFVnTNkULA3daycZuIMj7CtVtRR+H3ilkNQwDv93fB
         rWHA==
X-Gm-Message-State: AOAM531q9qoGzRLs3n0nqlwMC282buXoEdCU14bcxmjJLaS9X6raAZGD
	4GFxDMHI2ix1cPReXGu43zutDkUQkjRndQ==
X-Google-Smtp-Source: ABdhPJy0xiGIQY6+yzGWZvlXFN+IXa8zqzzs+65ulnk5JrYeG26hyq3t0ogjcFc9r1kkY3pJnGSL2Q==
X-Received: by 2002:a05:6512:31c5:: with SMTP id j5mr3902549lfe.116.1623449234293;
        Fri, 11 Jun 2021 15:07:14 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id u25sm705454lfm.308.2021.06.11.15.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 15:07:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: gemini: add crypto node
Date: Sat, 12 Jun 2021 00:05:01 +0200
Message-Id: <20210611220501.684997-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Corentin Labbe <clabbe@baylibre.com>

The SL3516 SoC has a crypto offloader IP.
This patch adds it on the gemini SoC Device-tree.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC people, the crypto driver for Gemini made it in
to this merge window as well so please merge this DTS
snippet into the same branch as the other Gemini DTS
changes for this merge window.
---
 arch/arm/boot/dts/gemini.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index e5c15fe71a35..cc053af3c347 100644
--- a/arch/arm/boot/dts/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini.dtsi
@@ -357,6 +357,14 @@ gmac1: ethernet-port@1 {
 			};
 		};
 
+		crypto: crypto@62000000 {
+			compatible = "cortina,sl3516-crypto";
+			reg = <0x62000000 0x10000>;
+			interrupts = <7 IRQ_TYPE_EDGE_RISING>;
+			resets = <&syscon GEMINI_RESET_SECURITY>;
+			clocks = <&syscon GEMINI_CLK_GATE_SECURITY>;
+		};
+
 		ide@63000000 {
 			compatible = "cortina,gemini-pata", "faraday,ftide010";
 			reg = <0x63000000 0x1000>;
-- 
2.31.1

