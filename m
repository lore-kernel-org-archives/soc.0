Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A100CCA47E
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14FB8C341CD; Thu, 16 Jun 2022 00:54:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4F90C341CC
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4F90C341CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id g8so9519plt.8
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aAhmJJMLt+dZsJwSy+3+Zt2MW08hnmRQ8CsVMDcBXk8=;
        b=XpJypG1PqVJijPFXMhshyEGhFTjzLT1zr9/dt9OPg/kf7Mz0onmMT6LzlId/BPek0v
         SNCWb22y8I8WkTMjojQ9bzUKWsylwLq3qifRwDEZUHtcFrDzflSAQMp6wgG8+NY+BBCc
         V769tA+Nd9fzR7EQyIJbvnIBEQeU1eE12qs80oTTaasuiuNdVWQvcn3fxtPR6jcPXiDr
         MVgYNB4oW6mXrz+QS+uK2Kix6DErvBuSGQuJbxrbexCofV3hZScjIXGEkv961JbbNvPC
         +6TiBL+iK/mxHyr513xRcWwtwmBW8S2MpBercg901WImFJlhGd0d1V9pftNPB3TqKmKe
         XcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aAhmJJMLt+dZsJwSy+3+Zt2MW08hnmRQ8CsVMDcBXk8=;
        b=gh28W3o/AP2OOzcCeGBS4Z4Dta3u4H/LhM7zyEc/MbAH5SvmxhjQHnLZimd2ZQKNOs
         nnqhbKn5J2hD7isih8FfD2L9iPb7v3DQlW91/TrfoCqcgB6wvngHUtT/K1DPjkpexPQg
         2RdBZD+5jdwXj0g5LNeMUZiI4EpW9Pw9qph/W+6Kk62xaWvtO/ak8eFUWRTTVbWPC1Sq
         2EGW2G+5/gfAUovt+gcGjU5jyWP4h79yLgyV8yzcVr8eVlA2daT82YSyWSQWmpVkkr9v
         rKt5V0Q9C70/zDy5jEfs7LoHMPTDCJ5u3tFBW3z3ZTgy+gtju3e3ecaDyTc9BpYNh5XH
         2mUQ==
X-Gm-Message-State: AJIora8t2UWX3tmZq2xN+IO6JPj35iKxu/Idu8Pew8CTTUTOyrJ1Mplz
	fvDlsY4t8e211gNLiDmuZ4kQJg==
X-Google-Smtp-Source: AGRyM1tlfUjwzSCWhGKQW3q+Dq56sqBcx82ObxjiMPph4KVF0w1gBdY62NGgyTxYpOcuu7KoVT1CrQ==
X-Received: by 2002:a17:90a:a22:b0:1ea:e934:3079 with SMTP id o31-20020a17090a0a2200b001eae9343079mr1337262pjo.46.1655340847110;
        Wed, 15 Jun 2022 17:54:07 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Wei Xu <xuwei5@hisilicon.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 09/40] arm64: dts: hisilicon: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:53:02 -0700
Message-Id: <20220616005333.18491-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index f68580dc87d8..0fe0542bf40e 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -74,7 +74,7 @@ keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwr_key_pmx_func &pwr_key_cfg_func>;
 
-		power {
+		key-power {
 			wakeup-source;
 			gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
 			label = "GPIO Power";
diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
index 40f3e00ac832..ad53066ac495 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
@@ -27,12 +27,12 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pwrbutton {
+		pwr-button {
 			label = "Power Button";
 			gpios = <&porta 8 GPIO_ACTIVE_LOW>;
 			linux,code = <116>;
-- 
2.34.1

