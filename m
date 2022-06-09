Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97530C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 822D2C3411D; Thu,  9 Jun 2022 11:40:43 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE4F5C3411B
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE4F5C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id z7so30792227edm.13
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hRK+N8glfjkwW89EeiwLUV26aVUV7wxe9krThCPLJyE=;
        b=KSf2X/2PX5zWHc4IMpXABVZVkeiiIbY6pXoOyfX+XhOf0Zc2UA97UxUpBIFwguLtgA
         DdT/uVqpINr1h6XDAZzcMin4sOCbCEb8tEn6WRllGoisRpyPuB64jRQmzzgUlu8w9XNY
         HhcEm3xhpI73Go/ZpFJ8a8l5O9kWExZSQ8RETAXTqEQYlmjZjAa1wqKYDTDQFqaSepxi
         vvp5qeRLVX6dOzvwL7jytokDoo+Y62MkG0dSck7Q43GHj6Ph02tRaxXjl9BjYOl17Ke5
         i48dCCJgceMkSJiz/eCnRQSvQPOJrn4Xuo+FokNYjXiUPvC58qkwsLDDgpfVabwRpTm3
         L5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hRK+N8glfjkwW89EeiwLUV26aVUV7wxe9krThCPLJyE=;
        b=BtKrbrsAad9s0vXTM+ggWEWE8rldFcw7mGWZs0XcVIClr4F6KeNBZQclVnukmn8Q5Q
         j1MpDHXTs1rf0upZLQ2nwvhu5z8ah6AoaesG8LyA6/L1xTel6qb101MVb62t7Vx3lXze
         swHSGVj2dUVt7wJV6T7S2ekYEfCpHp/a2v1xtjt2f+cw3S6msPs4EuHnIzKx2mjqHg43
         BfEcHbRQMgFpdwnMWoSv91/k7fyi3vjCqVyJtS1ukUEMB1l+Bm0zUbspRCQaOzarBacW
         7/W7MzoRv5Kg+3t41eBkDPSp5HDOaxFGLfhYK9BckQ1iAPobwbxJyr3AiTkgPhL6gqsP
         Y67A==
X-Gm-Message-State: AOAM532gTLNUxKQx99eW76m2auA1On8oEsDjdwJ6D4ab64+N6Ln0e8ef
	zLzjZhISaGGyB6xR/2KdWxIAdg==
X-Google-Smtp-Source: ABdhPJxpEa3U4pgU0/TBuX/8kv2dV4LLwzkuty0j9z+lzZl7j01fgTsLGoyhF7H10B0iimLJWCtITQ==
X-Received: by 2002:a05:6402:d05:b0:425:b5c8:faeb with SMTP id eb5-20020a0564020d0500b00425b5c8faebmr44926306edb.273.1654774841241;
        Thu, 09 Jun 2022 04:40:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906058a00b007101f6f0720sm7760844ejn.120.2022.06.09.04.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michal Simek <michal.simek@xilinx.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 36/48] arm64: dts: xilinx: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:40:23 +0200
Message-Id: <20220609114026.380682-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts | 2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts | 2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts | 2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts | 2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
index bb2602dd2805..20e83ca47b5d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
@@ -52,7 +52,7 @@ memory@0 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
-		fwuen {
+		key-fwuen {
 			label = "fwuen";
 			gpios = <&gpio 12 GPIO_ACTIVE_LOW>;
 		};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
index f6aad4159ccd..d61a297a2090 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
@@ -49,7 +49,7 @@ memory@0 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
-		sw4 {
+		switch-4 {
 			label = "sw4";
 			gpios = <&gpio 23 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index 7b9a88b125d1..5fd6b70a154a 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -47,7 +47,7 @@ memory@0 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
-		sw19 {
+		switch-19 {
 			label = "sw19";
 			gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_DOWN>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index 20b7c75bb1d3..e2dd72fe33ce 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -47,7 +47,7 @@ memory@0 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
-		sw19 {
+		switch-19 {
 			label = "sw19";
 			gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_DOWN>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index e36df6adbeee..d685d8fbc36a 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -47,7 +47,7 @@ memory@0 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
-		sw19 {
+		switch-19 {
 			label = "sw19";
 			gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_DOWN>;
-- 
2.34.1

