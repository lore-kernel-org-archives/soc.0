Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE38CCA47B
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89280C3411B; Thu,  9 Jun 2022 11:40:43 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB489C385A2
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB489C385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id h23so35836073ejj.12
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=itsEy92F8LgvkoK7MoKZ9B/GZxw2SAC9YAvwl0r5wg8=;
        b=Oxug/ke+Q18uNPTc76KAnvm3XW5VZD/Adi0mZ4N0a4drEay7osACxDmHxCypfpQXLG
         IKnc6ERqhRJtqXdpKMiSII5QXp9tdpfWwqV7O4mW/zFa4q9rkEQoqDJK2gVYeY+eW+rS
         p8Cxlf7JU0L4JdsCGo/ChW47iFOaqSq/cuEO+hdt2R3lmjNvq4bj03OewAUXc36vuJHM
         xVNybWt5HujPTL+Jpeq5/E4xauYDAeGYBViTSQB5IYELtBkemayWbvegI9AOv+ggoro4
         kBO1Mi31M/qWuS5DA0BIeZ3szMdR7o1xWUGnrkGOmmN7j588uXzMdHG+rrKAmChsB9sd
         peuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=itsEy92F8LgvkoK7MoKZ9B/GZxw2SAC9YAvwl0r5wg8=;
        b=yFd8DlzopRQYa3ky3WqutklnfBfcFd/ssxL58agf/UBjJM5G+7vq8hRhsg6K7BGB/q
         zHD1hH8iPywaUoSq5c6UkDm47k5TVX0l65VWcFWDczzqSbFrqpsyWo1Y8lBcX0fLTQTh
         8L640Uh88LCsjNszEgf/jFiITRm4fKtx7sOBwcWvyWKCPxXTDEww9c93foKVRgMSYuGG
         TLjOUmD6QgKMiH8SmotLZMyyJmbZbju85BBAgzdDblRfdLQ5YrQYIYj/GLLJA15XCyyJ
         A07OTmWzW/DiHkLK5RqL2Dcx1nSVUFqyB3PiMRG5h6DQBjeZ1sDHkItzQjLKNMsHNBju
         J+BA==
X-Gm-Message-State: AOAM532pI0GhOpGZMCRm3SH2DoBA5v4iOvCn767njGII1lU2wVi8cX5Y
	oz3mVXa2rtUqOuvVZytO7YfyOw==
X-Google-Smtp-Source: ABdhPJxxXjuRWeNSOrRAq8RdCQDP19RGRNSmJXWhHhYzlIXknuViFdrCOhvi7uJs9lFBKTH6jPLqNw==
X-Received: by 2002:a17:906:147:b0:711:fd7e:7d6 with SMTP id 7-20020a170906014700b00711fd7e07d6mr5537332ejh.389.1654774842528;
        Thu, 09 Jun 2022 04:40:42 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906058a00b007101f6f0720sm7760844ejn.120.2022.06.09.04.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:42 -0700 (PDT)
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
Subject: [PATCH v2 37/48] ARM: dts: xilinx: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:40:24 +0200
Message-Id: <20220609114026.380682-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/zynq-zc702.dts         | 4 ++--
 arch/arm/boot/dts/zynq-zturn-common.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index cf70aff26c66..d23201ba8cd7 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -30,14 +30,14 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
-		sw14 {
+		switch-14 {
 			label = "sw14";
 			gpios = <&gpio0 12 0>;
 			linux,code = <108>; /* down */
 			wakeup-source;
 			autorepeat;
 		};
-		sw13 {
+		switch-13 {
 			label = "sw13";
 			gpios = <&gpio0 14 0>;
 			linux,code = <103>; /* up */
diff --git a/arch/arm/boot/dts/zynq-zturn-common.dtsi b/arch/arm/boot/dts/zynq-zturn-common.dtsi
index bf5d1c4568b0..dfb1fbafe3aa 100644
--- a/arch/arm/boot/dts/zynq-zturn-common.dtsi
+++ b/arch/arm/boot/dts/zynq-zturn-common.dtsi
@@ -49,7 +49,7 @@ usr-led2 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
-		K1 {
+		key {
 			label = "K1";
 			gpios = <&gpio0 0x32 0x1>;
 			linux,code = <0x66>;
-- 
2.34.1

