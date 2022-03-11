Return-Path: <SRS0=UXL6=TW=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BF3C433F5
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 09:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 998CDC340EC; Fri, 11 Mar 2022 09:38:14 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB682C340E9;
	Fri, 11 Mar 2022 09:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB682C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id c16-20020a17090aa61000b001befad2bfaaso7695759pjq.1;
        Fri, 11 Mar 2022 01:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXKoOhJsegCgBWbpQZaKhqPFw+9/pc6YzaaD+yCqeLI=;
        b=NsC6TSNJe603PGQnszA9PJacCMKoaSa4T+QzSVMgCch1XLq/wM0zgoP5qL9XSpBxi4
         AQQV+E8zoKJfPg9NTqIAV/TCByvxBF69OxWRZx4U03ja2g14truZBU26BxBemicDq9hb
         8h8iLE6rXHd4UHx24a4c3q7QzfT+6wuX1eW7Jbh0ljsVBK0MRwuEEWwC1awFCJKMAfmQ
         nDbSx4ni2i7Xij5u5crvpcjpFUkg1QQJW4ceV6WuGs5xbsuqP6dJPnfAinU4VrjzbP+9
         yivy2AzAliFv3qvnUdv01GAn4yIFek8TW3jyIJ6aTou9YlsguJy8hR3aeabSYOolieoY
         BNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXKoOhJsegCgBWbpQZaKhqPFw+9/pc6YzaaD+yCqeLI=;
        b=xP2fVv7mVA/Uixtt//d0+f5CcNqBLuDbNnmEYklks8wGQ5786OaFV+jC22lpMnjIaF
         wQ2/aJboWB5eh2/fTLXHLbZT8e+mCrMkWSuhtEjezrE29KfjuACk4ICXWNJjtAxkEqbO
         FLdFUvO5wk+k2iQ0NrH5AaYVOHc7RTHEccxC8SUmoXIoD1SR/ALfnuiD7YbZ3wxKXO93
         DG4Vsglws7O51nS3eLPs8hIjdhQ6ZlPwd+3Us9r7HsKP1FQ0CQpWFQXZ2amO1ErDo8Pl
         31ooUbzTSSQRUAigDCU58Lqge3kbD7GQUL31V6cjyLcQgOoi4qAuOWap5rtIhhGHlqxU
         teCA==
X-Gm-Message-State: AOAM530eG/eYVY1o3x+G/RWWFyo0gIzyPJU/kCRUmSZtWFZMCTNipqka
	FBlTr9LNp1mp05G5EJQbsCY=
X-Google-Smtp-Source: ABdhPJxOwlYZb3pZsNu37/YVDoq39syQkU+41qFjqS4cko1TODNhT00GBLVx5sFkgiyJynay7J/jBg==
X-Received: by 2002:a17:90a:d3d3:b0:1bf:2e8d:3175 with SMTP id d19-20020a17090ad3d300b001bf2e8d3175mr10011200pjw.2.1646991493353;
        Fri, 11 Mar 2022 01:38:13 -0800 (PST)
Received: from localhost.localdomain ([122.161.53.68])
        by smtp.gmail.com with ESMTPSA id m11-20020a056a00080b00b004f75d5f9b5csm9011011pfk.26.2022.03.11.01.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 01:38:13 -0800 (PST)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Chanho Min <chanho.min@lge.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/3] arm64: dts: lg131x: Update spi clock properties
Date: Fri, 11 Mar 2022 15:07:59 +0530
Message-Id: <20220311093800.18778-3-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
References: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PL022 binding require two clocks to be defined but LG1312 and LG1313
platforms don't comply with bindings and define only one clock.

Update spi clocks and clocks-names property by adding appropriate clock
reference to make it compliant with bindings.

CC: Chanho Min <chanho.min@lge.com>
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v2:
- Resend to soc ML
- Add Rob's acked-by tag

 arch/arm64/boot/dts/lg/lg1312.dtsi | 8 ++++----
 arch/arm64/boot/dts/lg/lg1313.dtsi | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/lg/lg1312.dtsi b/arch/arm64/boot/dts/lg/lg1312.dtsi
index bec97480a960..e4de0f98c685 100644
--- a/arch/arm64/boot/dts/lg/lg1312.dtsi
+++ b/arch/arm64/boot/dts/lg/lg1312.dtsi
@@ -172,15 +172,15 @@ spi0: spi@fe800000 {
 			compatible = "arm,pl022", "arm,primecell";
 			reg = <0x0 0xfe800000 0x1000>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "sspclk", "apb_pclk";
 		};
 		spi1: spi@fe900000 {
 			compatible = "arm,pl022", "arm,primecell";
 			reg = <0x0 0xfe900000 0x1000>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "sspclk", "apb_pclk";
 		};
 		dmac0: dma-controller@c1128000 {
 			compatible = "arm,pl330", "arm,primecell";
diff --git a/arch/arm64/boot/dts/lg/lg1313.dtsi b/arch/arm64/boot/dts/lg/lg1313.dtsi
index ada3d4dc6305..873baae75035 100644
--- a/arch/arm64/boot/dts/lg/lg1313.dtsi
+++ b/arch/arm64/boot/dts/lg/lg1313.dtsi
@@ -172,15 +172,15 @@ spi0: spi@fe800000 {
 			compatible = "arm,pl022", "arm,primecell";
 			reg = <0x0 0xfe800000 0x1000>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "sspclk", "apb_pclk";
 		};
 		spi1: spi@fe900000 {
 			compatible = "arm,pl022", "arm,primecell";
 			reg = <0x0 0xfe900000 0x1000>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "sspclk", "apb_pclk";
 		};
 		dmac0: dma-controller@c1128000 {
 			compatible = "arm,pl330", "arm,primecell";
-- 
2.25.1

