Return-Path: <SRS0=n/Pu=63=gmail.com=tomato1220@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF44C7EE2F
	for <soc@archiver.kernel.org>; Fri,  3 Mar 2023 06:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78D8BC433D2; Fri,  3 Mar 2023 06:37:02 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B4C5C433EF;
	Fri,  3 Mar 2023 06:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B4C5C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id q23so876392pgt.7;
        Thu, 02 Mar 2023 22:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwKQWiJXolgzL1MeiJl+AGrVhqp1zaGutWHj6thTrA0=;
        b=B198lDGitf009QIb9uXueNODLc03HLIak8EtHmF9jj3Np5WRntWEA8PuLhQZOK/zGP
         NZ+vn+0aZwvmCGiVcShKPvP8ch6lvHIqTaj6YVlqVyNXnOaWDHo+851LJaZie9TOokdl
         Cvnp9VNwYYhUUChaZ5h8QCVuaUq2brD7JPDUzcKGoyUjA9pIob8oYQTGiVoslmjuYSdt
         24qkAEuzM+8WYuiUnMGstAT1eV2X+CUVgLXG4qhM7qcfGFNobUJ8kCHu9nmMsIQK4J/q
         Ivs2Ec6nJjjRGNJLC6ZvfvgYtzFY/haUdzrIz/oSfNdmUMMrnR8b2TChDTcasy/Z6UYI
         itig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwKQWiJXolgzL1MeiJl+AGrVhqp1zaGutWHj6thTrA0=;
        b=k+RZoIAD9bEh4qdNAxRsLCZYFXcCr5vuLYJEty4a8s3ooNkfN8877tj6iaXfD3mamw
         Re6bhnrOExzF01MIi9ojPqnermBLtMQg8FUO/7STV/VPuLoHuAtsq0joisHivi4k+LT7
         kC0XSTl6i06NdHt2EJbwyjcc5XtBc3zMVyZT1cdvoPMFQv6kzP18I269YIgpCLGWLLiw
         T0Yl7GzhNqU9EqLZ1pvoN6cVVdYElO31ROybX00ytkCd+ITTODyv6GIwtGU3pXAZZkNr
         N+dBwNb3MGC1UEpj42X72urfrrgTgsJAu1dIQ82IqIph5OfXnBYEU2Z3EB5zv3pkFIhJ
         wPmA==
X-Gm-Message-State: AO0yUKXtr47YLo9LAQ4vQhC1GGGU9bOK8hXUlUDAVrKEI15nPHzxgVo8
	J3Fyhy30tP2TsqSAJVzXKv8=
X-Google-Smtp-Source: AK7set/mi2fukCSpA4ET7YXAhcZoWqchQvjCCfDcfym+FcBe1AfZMJ3f5FJytQnHgfVRYLiITx70Eg==
X-Received: by 2002:a62:1c91:0:b0:5e6:14a9:b0c8 with SMTP id c139-20020a621c91000000b005e614a9b0c8mr1000851pfc.32.1677825421100;
        Thu, 02 Mar 2023 22:37:01 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:37:00 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	fran.hsu@quantatw.com,
	David Wang <davidwang@quantatw.com>
Subject: [PATCH 5/7] ARM: dts: nuvoton: gsj: Correct gpio-pins
Date: Fri,  3 Mar 2023 14:34:33 +0800
Message-Id: <20230303063435.803097-5-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct gpio-pins accoring to the nuvoton pinctrl driver.

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
index 53cfd15fa03f..527755dfd4e1 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
@@ -99,12 +99,12 @@ gpio19pp_pins: gpio19pp-pins {
 			drive-push-pull;
 		};
 		gpio24pp_pins: gpio24pp-pins {
-			pins = "GPIO24/IOXHDO";
+			pins = "GPIO24/HGPIO4/IOXHDO";
 			bias-disable;
 			drive-push-pull;
 		};
 		gpio25pp_pins: gpio25pp-pins {
-			pins = "GPIO25/IOXHDI";
+			pins = "GPIO25/HGPIO5/IOXHDI";
 			bias-disable;
 			drive-push-pull;
 		};
@@ -114,12 +114,12 @@ gpio37od_pins: gpio37od-pins {
 			drive-open-drain;
 		};
 		gpio59pp_pins: gpio59pp-pins {
-			pins = "GPIO59/SMB3DSDA";
+			pins = "GPIO59/HGPIO6/SMB3DSDA";
 			bias-disable;
 			drive-push-pull;
 		};
 		gpio60_pins: gpio60-pins {
-			pins = "GPIO60/SMB3DSCL";
+			pins = "GPIO60/HGPIO7/SMB3DSCL";
 			bias-disable;
 			input-enable;
 		};
-- 
2.25.1

