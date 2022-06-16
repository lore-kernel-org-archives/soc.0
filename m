Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD71C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76367C341D4; Thu, 16 Jun 2022 00:54:40 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37F99C3411C
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37F99C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id 187so96751pfu.9
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hRK+N8glfjkwW89EeiwLUV26aVUV7wxe9krThCPLJyE=;
        b=EhTIVMcl6s3oOS749leaGQ+JKaeM7uP6K8afvea5+UEQ9SiwM/0BkIdy+bjf77koY0
         /eeYaZnSKYP/Vj03mK162szbYWzjaI+HtQMXAsnFw3B/z+ckzR/ELrM7LA170t/ThqDr
         UcjR27TaF5kG0Ajkt7zQ1rIvedjTm9JguMkDsmdPgy8Pe9LA/l7Zytq9rWWPKabCCFWI
         rKfnSXLsdkE2nvw9TBe7b2jbV7SKEXnGnDqVWPKMZb2wCvCDGmquXchkGFEYSRbCw9EL
         1FLRnbeZRAm64EU0Rk8I0hVp/wJbyq+M97zi4bAWSul/a9TaFIdP0mMrK7gcDIxu5hjM
         z/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hRK+N8glfjkwW89EeiwLUV26aVUV7wxe9krThCPLJyE=;
        b=R3o5ox7Il0zvfS7HYvOO0Pu3TNzZ/fmc9OZ9+vfAH5UAMXXzAOe5wNAXjGWLI8BYES
         WBjG1ZNROA3VUf2jlvnzzxyvJTvQzCeaMzBdmqAFRZi6QlGZ2mT+bA1euyvVxhduUwbe
         M5Q2J5trbQVUvZE0e6WdV/Fg5gHRLKcwY1Y5JLVFrd89CTeG+1r3H6BXNna4obSGTr4Q
         b7ezu6YlwJ0KoEupZX5pJAmC3FNZbxrZW3AMeWyySCmFOgeGJpg3+OaIewCyorIBWWLT
         McmqLFtLf71+l813IPjPYcy/HLIJ2mzcr7z8fsSpjH+ivFNveIaBFviaoTwr1nGdXNjo
         sUnw==
X-Gm-Message-State: AJIora+b3Gq5iXegjuhUzGCEdAIfkdq94qg3svBP3k8O7amPJG0XXiu9
	imGbyo4uzzm7uSFBpm4cFRHTrg==
X-Google-Smtp-Source: AGRyM1t5f7PMnYnW7ysu11iUL9hNz7d0Wwmhfz+0v4yiu7bVXmj8+UWmmSt9dPANsftj/fntn4EUyg==
X-Received: by 2002:a63:3f42:0:b0:408:c84e:509c with SMTP id m63-20020a633f42000000b00408c84e509cmr2139322pga.75.1655340878871;
        Wed, 15 Jun 2022 17:54:38 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michal Simek <michal.simek@xilinx.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 30/40] arm64: dts: xilinx: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:53:23 -0700
Message-Id: <20220616005333.18491-30-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
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

