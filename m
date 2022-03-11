Return-Path: <SRS0=UXL6=TW=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6D6C433EF
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 09:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6C6FC340F3; Fri, 11 Mar 2022 09:38:17 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54A2FC340E9;
	Fri, 11 Mar 2022 09:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54A2FC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id e6so7037073pgn.2;
        Fri, 11 Mar 2022 01:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jav/fi0zl69Rvu23rBiGYix2mFrzEsj77NIMSen2XaI=;
        b=VjXQZHqxoLRyLX7F5aLPCv15b6AqvVlWnJmiQAdhuWRn0KwoNJkh+SWWcsI7FnZmf3
         QVV+IwB8MxlMtI49THKmoI7J0WQnla7zXbAdsVn+/pQN4uWe3YzlZhCOTwprUtGSA9XM
         j87N6Mzm+a9aIKfdVMwABIi+Tumyo9DCxLGi/W8umPpCpjiRk6uaykb/Vk/kicwzAqBs
         oVfxU0QmdMG/uXMPNAbr3NPpQhSdiKggcJ7ZZLU5G70a0lOMD0JTj4QcTiVRXltqGhho
         DBBCDqYlv5Q+E0o3yJ5X7LhZ28W0WOtjzCMLKaHNqVZ8Oh6KORLUUC0gZUViKMcGiV7G
         jRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jav/fi0zl69Rvu23rBiGYix2mFrzEsj77NIMSen2XaI=;
        b=73H6zC8rEeQRiC4+NrWsugJWmhYNzMy/H0jpamANe7hZXl68fqfCi79l00RwJwPPuJ
         UKXSWa5Be6krXtxXUvH2MtihSiCumaJNIc7NWIF1W8OsavBHi2HhE6xEVLMNeQvn6Wmh
         PtNKBhzbfW4lCLZJoRIbjkKYKYt4Z8pMijZ6h/KDxsXBo8dJGzVJk3bKacYRrF8VdWuN
         QAsRAgY+NBYDF2tRn4X8F6dsyBpG8n7fB8QBDmsAAitBbl7gCsUNMjA6AnC//P2q0Rnn
         M9r8mEuMdpGCp9S5zzFDSsOX3ZtkIggKwggPDYN/0nGiVs72QtyfY38kDYxtX3Sbgi0p
         nrPA==
X-Gm-Message-State: AOAM533Lx8svBe6cNJzAjmTEmdOAqbnlX9avAsK2xLcx1iCmAqZFuZaJ
	hLNLyKqkZu20NCs6HHY4XME=
X-Google-Smtp-Source: ABdhPJwjrAfYTZPyQMA6MOU0MwTXYXZdKqKf5YBttfZnCBljGWbZ5bAoYsy7+x/Yzo4rposTNrmpUA==
X-Received: by 2002:a65:6c0c:0:b0:378:d9d6:cd0a with SMTP id y12-20020a656c0c000000b00378d9d6cd0amr7526184pgu.117.1646991496787;
        Fri, 11 Mar 2022 01:38:16 -0800 (PST)
Received: from localhost.localdomain ([122.161.53.68])
        by smtp.gmail.com with ESMTPSA id m11-20020a056a00080b00b004f75d5f9b5csm9011011pfk.26.2022.03.11.01.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 01:38:16 -0800 (PST)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] ARM: dts: lpc32xx: Update spi clock properties
Date: Fri, 11 Mar 2022 15:08:00 +0530
Message-Id: <20220311093800.18778-4-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
References: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PL022 binding require two clocks to be defined but lpc platform doesn't
comply with bindings and define only one clock i.e apb_pclk.

Update spi clocks and clocks-names property by adding appropriate clock
reference to make it compliant with bindings.

CC: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
v2:
- New patch with similar changeset
- Send to soc ML

 arch/arm/boot/dts/lpc32xx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index c87066d6c995..30958e02d5e2 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -178,8 +178,8 @@ ssp0: spi@20084000 {
 				compatible = "arm,pl022", "arm,primecell";
 				reg = <0x20084000 0x1000>;
 				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk LPC32XX_CLK_SSP0>;
-				clock-names = "apb_pclk";
+				clocks = <&clk LPC32XX_CLK_SSP0>, <&clk LPC32XX_CLK_SSP0>;
+				clock-names = "sspclk", "apb_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -202,8 +202,8 @@ ssp1: spi@2008c000 {
 				compatible = "arm,pl022", "arm,primecell";
 				reg = <0x2008c000 0x1000>;
 				interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk LPC32XX_CLK_SSP1>;
-				clock-names = "apb_pclk";
+				clocks = <&clk LPC32XX_CLK_SSP1>, <&clk LPC32XX_CLK_SSP1>;
+				clock-names = "sspclk", "apb_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
-- 
2.25.1

