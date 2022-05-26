Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B98C433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1ACCCC34113; Thu, 26 May 2022 20:46:10 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FE61C385B8
	for <soc@kernel.org>; Thu, 26 May 2022 20:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2FE61C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id f9so5237189ejc.0
        for <soc@kernel.org>; Thu, 26 May 2022 13:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zKFl69Qf/EfZisA1xjfBE06TiXrFDlro+owcvXYxfLs=;
        b=OPrJTmWWghJxejBwqiBJKnQTE203iScML6t38O4ge+iX4qrqf9UUL8F1yxMhy9/D2I
         vtU5EtfG4quCCB2ZCn7woUy8Nlfcnv6W5+2drvtJ1F47aHI0CBGa6KfwacFvANbHiQao
         m3YW06Doa442ooxkosamZ/z07i70Y14NmNCWJbkzdISVa3PiF39J7UMufwc0qNQQB8ef
         Z5aLWglU/wPFO1tD7Oz7/WJAfzKfC7X6M5Hm/VD4FRMeOyTIjryxWRjYBVdpBAtWMojw
         6Qj2YFapZvbVb/Jm/d+V7ugCCRHN1STPy/TpgRt/Xu2neoZSth7ha2V06YLazxgi8ONB
         CqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zKFl69Qf/EfZisA1xjfBE06TiXrFDlro+owcvXYxfLs=;
        b=lWu/zzFfVrhpyp0shDr2wo/fSZikhRw9tTsvF+ivCGT8/87Qh1pci/0tQtXNtThSHE
         YumQTqcBhOK8Wi6n7zrEAu+r1Dv4LMPrP+Xcp2XdQhOlqYWIRS30Tn01X8TiBdeOsqrO
         Dfs/4puNBUMziu6FY1/JoFI14+WaFmCL6h08k3DfF6c04jU7beL7uPq73qSYkNDDF6LH
         d8jEnlPdU6Uh44ebY1cERgETemoGAtAJHHTiLoeQh+YQOjZzMYpoo/ZVJWrCKawyfhj3
         30Tkn711gFcJFWgT5oU2Y30mPl5UFH0n4ZolPvJaOsMMqkG5pxVU45fcE1TELvDlvVXT
         nTyg==
X-Gm-Message-State: AOAM533cIJnJ2/YaVfFovEtWyfq+GbQH7775AcekNc15gIE/mz/H21uH
	vO41owlUB+0r8EXqVwrwe2MOoNVtvLVHQs0I
X-Google-Smtp-Source: ABdhPJxjg7MxB9+eNd5wcXXuMUeFFezHj5yR25BZpYg2A0ogiMJQ3jbwAK7yX/hn0Rc1JtM5uBcpOw==
X-Received: by 2002:a17:907:a414:b0:6ff:2e46:e891 with SMTP id sg20-20020a170907a41400b006ff2e46e891mr2501719ejc.758.1653597956660;
        Thu, 26 May 2022 13:45:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709067e4100b006fe8ac6bc69sm827633ejr.140.2022.05.26.13.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:45:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: amlogic: adjust whitespace around '='
Date: Thu, 26 May 2022 22:45:51 +0200
Message-Id: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                      | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                       | 2 +-
 .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 3f5254eeb47b..04f797b5a012 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1535,7 +1535,7 @@ aobus: bus@ff800000 {
 
 			sysctrl_AO: sys-ctrl@0 {
 				compatible = "amlogic,meson-axg-ao-sysctrl", "simple-mfd", "syscon";
-				reg =  <0x0 0x0 0x0 0x100>;
+				reg = <0x0 0x0 0x0 0x100>;
 
 				clkc_AO: clock-controller {
 					compatible = "amlogic,meson-axg-aoclkc";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index aa14ea017a61..023a52005494 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -450,7 +450,7 @@ aobus: bus@c8100000 {
 
 			sysctrl_AO: sys-ctrl@0 {
 				compatible = "amlogic,meson-gx-ao-sysctrl", "simple-mfd", "syscon";
-				reg =  <0x0 0x0 0x0 0x100>;
+				reg = <0x0 0x0 0x0 0x100>;
 
 				clkc_AO: clock-controller {
 					compatible = "amlogic,meson-gx-aoclkc";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
index fcb304c5a40f..6831137c5c10 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -216,7 +216,7 @@ &uart_A {
 
 	bluetooth {
 		compatible = "realtek,rtl8822cs-bt";
-		enable-gpios  = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
 		host-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
        };
 };
-- 
2.34.1

