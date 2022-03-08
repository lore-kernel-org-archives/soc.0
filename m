Return-Path: <SRS0=a1KN=TT=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596E4C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 00:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 209ADC340EF; Tue,  8 Mar 2022 00:06:52 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33829C340E9
	for <soc@kernel.org>; Tue,  8 Mar 2022 00:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33829C340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id g19so4288211pfc.9
        for <soc@kernel.org>; Mon, 07 Mar 2022 16:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:list-id:mime-version
         :content-transfer-encoding;
        bh=ESnSD0M0sMm9mkD5V5GjVHdXKKegVsjzUlOpsOoLRs0=;
        b=cZ2jvdfe2cDE2crnOkuWk0+JW/24IKHfbGK6zLDuk4Cq1eAgg1VS9P7knhYlXrkXDI
         tq5VN87chej+jnp4hs89zb9XgEpFES0u65av824I28GJdDekKxXErMLUBFAZvwE9/Cph
         OErjHvSqf2hMNobCw2fQbx5ezI2FQX2PXVq+bSXEWSZmkY3fzUdf7A7rBbtakBH/gdoj
         gxAtv6J8LEO7GSwu3wcVfGMCFzECRgJyoJIYdc+zQEjR3OEae7XT7RvMz3m9o0CCDI1A
         VEDAzLd3yNhQ15cNtdYl7Up7e9dz4KAQsu2LMXGSx5aAoyylCESnJ7bMivl5osjYfocQ
         3lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id:list-id
         :mime-version:content-transfer-encoding;
        bh=ESnSD0M0sMm9mkD5V5GjVHdXKKegVsjzUlOpsOoLRs0=;
        b=N8kQapuozlppBAOc5ECH6ZwYjeIkXswRMY8DgMJTuZCJjj8mXtu4npgqJsTFyHX0eG
         BGprYcPndOt4xNnnU3Pg1yN+SxKagB6OSrfAKcVgfaxkmiAfzN3SUArFo5W8SVF3MsjR
         vq++IsvN8GXWA00Sh5F2bRwBqwXJb1O8bN01jzt+YaGqkt94cWBBnjUlmeEj47JwW4Hg
         inaFt0hxxxPtEm6w/fXsXNXWgK1I4P3WYTMDLB+N4bwsFdu2bPY5cfirFo55NhRrXFgD
         N5/wuK+S3IEJfC0cHSIEDR56jpRJgla1tj5a08L3Wl6h8TS5HqtCLk1RnTAhsteEvJm5
         zbBQ==
X-Gm-Message-State: AOAM530k7nn6uRr6sEfr4/OlB4BruPNBZ+N/PJ54MpY4QlzaO4DrIIRN
	SZcBPK7zJ/s0FmGYk40falVeMA/l8uHkHg==
X-Google-Smtp-Source: ABdhPJxtWtFAyp7Nne7ooT4Mb2QCK8LIuRRp8i/tWyRWUCxnRYFC8mKxhVRU5oopVPxXvvTpJRePJQ==
X-Received: by 2002:a05:6a00:1692:b0:4df:c6b0:2f02 with SMTP id k18-20020a056a00169200b004dfc6b02f02mr15430981pfc.50.1646698009971;
        Mon, 07 Mar 2022 16:06:49 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id i187-20020a626dc4000000b004f6e0f346e7sm8598695pfc.39.2022.03.07.16.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 16:06:48 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: dts: aspeed: Fix AST2600 quad spi group
Date: Tue,  8 Mar 2022 10:36:31 +1030
Message-Id: <20220304011010.974863-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
List-Id: <devicetree.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Requesting quad mode for the FMC resulted in an error:

  &fmc {
         status = "okay";
 +       pinctrl-names = "default";
 +       pinctrl-0 = <&pinctrl_fwqspi_default>'

[    0.742963] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: invalid function FWQSPID in map table
￼

This is because the quad mode pins are a group of pins, not a function.

After applying this patch we can request the pins and the QSPI data
lines are muxed:

 # cat /sys/kernel/debug/pinctrl/1e6e2000.syscon\:pinctrl-aspeed-g6-pinctrl/pinmux-pins |grep 1e620000.spi
 pin 196 (AE12): device 1e620000.spi function FWSPID group FWQSPID
 pin 197 (AF12): device 1e620000.spi function FWSPID group FWQSPID
 pin 240 (Y1): device 1e620000.spi function FWSPID group FWQSPID
 pin 241 (Y2): device 1e620000.spi function FWSPID group FWQSPID
 pin 242 (Y3): device 1e620000.spi function FWSPID group FWQSPID
 pin 243 (Y4): device 1e620000.spi function FWSPID group FWQSPID

Fixes: f510f04c8c83 ("ARM: dts: aspeed: Add AST2600 pinmux nodes")
Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Link: https://lore.kernel.org/r/20220304011010.974863-1-joel@jms.id.au
---
This is a fix but it's not urgent. Please merge through whichever tree
you think is best.

 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
index 6dde51c2aed3..e4775bbceecc 100644
--- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
@@ -118,7 +118,7 @@ pinctrl_fwspid_default: fwspid_default {
 	};
 
 	pinctrl_fwqspid_default: fwqspid_default {
-		function = "FWQSPID";
+		function = "FWSPID";
 		groups = "FWQSPID";
 	};
 

-- 
2.34.1


