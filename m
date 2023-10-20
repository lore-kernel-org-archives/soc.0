Return-Path: <SRS0=9ehk=GC=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613BCCDB474
	for <soc@archiver.kernel.org>; Fri, 20 Oct 2023 13:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F4DAC433C9; Fri, 20 Oct 2023 13:11:47 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B538CC433C8
	for <soc@kernel.org>; Fri, 20 Oct 2023 13:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B538CC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso1178493e87.1
        for <soc@kernel.org>; Fri, 20 Oct 2023 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697807503; x=1698412303; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GL10mD/FLbOItmDyNITg+uUO9blE8HK4R5k37UlzQzo=;
        b=b724cX1fxNRT7hkZsZws94iDup2+ZsJI+/tArrlNbjIgL8YgkOHJEHezQ5Wh2vXzIn
         C1BAA3KLiAYGsDsHU2hJzpROcNsV5/liVNJ0y5aBDgc0mSSKguaV3EA02knlYdcjUjR9
         OCvq4hsXh2l1nLd9Mgj6tzMxh4HVcZaxmf8dYrdRmKv5n5fpWbyxxOnVy4dxBoRUlM19
         DtKSJUrjB2ptQGDdIK1g0ePcUQoXJbyr29yziY3UGK+V1AcGEv+F7S07U9P2cpcF8cv3
         zLD2VnVG9KkP1HrkmiVWqw+tW3XN9k8rM1nJ0rnJ390gh/8kUxXpTR/oBEzH72YBUakJ
         EdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697807503; x=1698412303;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GL10mD/FLbOItmDyNITg+uUO9blE8HK4R5k37UlzQzo=;
        b=PaxYBadZn/1dxiP1ZMSBAJ/ZZPKjbLk6OaiVam89gNj29PqWcypi8OKX+QJu7GtraO
         rkOGySzj50PvKRsmlv8A+jVTm/qw+kjl2m07ssuvxDFB7PwX0SnxLbCn9EDwMdUdpnGR
         21qEjWdtHmHf/eG+PMKUicH592mysPs+IMFIIXhnDuvmhYbnVVMF7Omk1tB8ae3vRiK/
         zGdR7EOoCefd0BxapnlShSEl7YAeEOUi8mR1PJAjTu5Gtot6/+oGwy4HV7DR23ORtgt7
         CsYltgKsEdw9th8Ibuo00NITXKVX5YCUA7H5vgZLc1y5z97NMOkXpFLl7WOQlT0gATUq
         LiaQ==
X-Gm-Message-State: AOJu0YzqhPNvW86wTjrQDdXwrJRsDs9yjdey0syzJZp6bCEkv62qlsBj
	kKBon60JrhD/Z448Y8bqV8q3TA==
X-Google-Smtp-Source: AGHT+IEeaT/OOr57B/i50P1sXv/SOXjEZKJNHtg0MoVBXDiCS8Nek7YqxkKadsMLTf/Q33OrGiNIow==
X-Received: by 2002:a05:6512:3247:b0:501:c779:b3bb with SMTP id c7-20020a056512324700b00501c779b3bbmr1194651lfr.60.1697807502739;
        Fri, 20 Oct 2023 06:11:42 -0700 (PDT)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id f19-20020a05651232d300b00507b112ba48sm353875lfg.132.2023.10.20.06.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:11:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Oct 2023 15:11:41 +0200
Subject: [PATCH] ARM: dts: usr8200: Fix phy registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231020-ixp4xx-usr8200-dtsfix-v1-1-3a8591dea259@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIx8MmUC/x2MQQqAMAzAviI9W6hTUfyKeBBbtZcpq8pg+HeHx
 wSSBCZBxWAoEgR51PTwGaqygGWf/SaonBkcuboiR6jxbGLE20LviJAvWzWiMLX9snLL1EFuzyB
 Z/99xet8Pq36fbWcAAAA=
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3

The MV88E6060 switch has internal PHY registers at MDIO
addresses 0x00..0x04. Tie each port to the corresponding
PHY.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly to DTS files or
fixes whatever comes first.
---
 .../intel/ixp/intel-ixp42x-usrobotics-usr8200.dts  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-usrobotics-usr8200.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-usrobotics-usr8200.dts
index 90fd51b36e7d..2c89db34c8d8 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-usrobotics-usr8200.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-usrobotics-usr8200.dts
@@ -165,6 +165,24 @@ mdio {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				/*
+				 * PHY 0..4 are internal to the MV88E6060 switch but appear
+				 * as independent devices.
+				 */
+				phy0: ethernet-phy@0 {
+					reg = <0>;
+				};
+				phy1: ethernet-phy@1 {
+					reg = <1>;
+				};
+				phy2: ethernet-phy@2 {
+					reg = <2>;
+				};
+				phy3: ethernet-phy@3 {
+					reg = <3>;
+				};
+
+				/* Altima AMI101L used by the WAN port */
 				phy9: ethernet-phy@9 {
 					reg = <9>;
 				};
@@ -181,21 +199,25 @@ ports {
 						port@0 {
 							reg = <0>;
 							label = "lan1";
+							phy-handle = <&phy0>;
 						};
 
 						port@1 {
 							reg = <1>;
 							label = "lan2";
+							phy-handle = <&phy1>;
 						};
 
 						port@2 {
 							reg = <2>;
 							label = "lan3";
+							phy-handle = <&phy2>;
 						};
 
 						port@3 {
 							reg = <3>;
 							label = "lan4";
+							phy-handle = <&phy3>;
 						};
 
 						port@5 {

---
base-commit: 9f3539d6b794040c3054acf1f547c41fb381a0fc
change-id: 20231020-ixp4xx-usr8200-dtsfix-ed058cfd5d07

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

