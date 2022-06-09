Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACAACCA47B
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86CD3C34114; Thu,  9 Jun 2022 11:40:54 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 005CAC341C0
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 005CAC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id n28so30815112edb.9
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kjxoc+L6eqxwMNT3+yJrollfGrhiqYTPiC+5llKZhTw=;
        b=oa5631gPzZ1vSALtmIgPQ+Mf2fsesOimoN3QBdze+ncoEvIoUOZIQzTcCPHrzIKHcg
         yhxu9cReJajlsc0snjM6nbNTjUbBNkjaJRLcGG8lpuE933I0HHW0ltJn1bX49zq2i8D+
         5a8pAxLB0cNfFCNf11VIcbv5cIz4AmXbEl5Ha1ULh3QrBhrZqugtchW7HmyRvJiHCIBc
         ASD8ReYxNzn2piJ/K6/MXRGlb6WaU5h7vWqUUVeOFVOrbDRt732w/3tdtMoIULsI230+
         GTnpEi1uMO+EhFCH/wS/wgTF4wUK9+gJN53r5+fPmWcl2e1lT5d64LI4PEnlQAf8mrh+
         jf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kjxoc+L6eqxwMNT3+yJrollfGrhiqYTPiC+5llKZhTw=;
        b=YIOWfqcSov4yJDhBPineizvl6YVEZFJKVMfDpobuhGRV++JaWrSEHa/m2nP3xcqnb3
         LfQ6JGWSp9YWhAu0RtNetpkMntzkOStxJqVBP4+pTG2VkNjqdrtIg0fBLNHPWAt2Mwc7
         IqFXt/dYTCkzWm4657e9BOUmOwyptE7jpuiGiQvcLLFXXVTNWTPwa9oEZfWOmcjqbBz+
         /djRKMe9CXg5j5Ywg8LFW1rDcfNzEvlLtYNTaJak1Z1/HhWHLezK6il2xGtvoEIumtBp
         G2e15nryER0NjSmCtjQISNu4dXEY7nNk7sjwY0M74tc/lYr+UPgkg9S1OecQo19bV6F+
         2fJQ==
X-Gm-Message-State: AOAM532d0qp8YosXcmGC9ef1FaR51IV8XJhdKsiB5HWKyJUbCdZsizj1
	sRgSMgcTKZxTA/yGeZrM6d3Uew==
X-Google-Smtp-Source: ABdhPJxPc63M50iTCbsK+6FFVsXhJJ0JDj0X+1FyV6eeg49NgHlKPMPWQ5q/sd9fNQQFNNP14yzouw==
X-Received: by 2002:a05:6402:510d:b0:42d:e266:e02f with SMTP id m13-20020a056402510d00b0042de266e02fmr44330056edd.277.1654774853478;
        Thu, 09 Jun 2022 04:40:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bk2-20020a170906b0c200b006fef557bb7asm10498662ejb.80.2022.06.09.04.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 41/48] ARM: dts: animeo: correct gpio-keys properties
Date: Thu,  9 Jun 2022 13:40:40 +0200
Message-Id: <20220609114047.380793-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/animeo_ip.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/animeo_ip.dts b/arch/arm/boot/dts/animeo_ip.dts
index 3fa3db2d9d02..29936bfbeeb7 100644
--- a/arch/arm/boot/dts/animeo_ip.dts
+++ b/arch/arm/boot/dts/animeo_ip.dts
@@ -170,8 +170,6 @@ tx_red {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		key-switch-in {
 			label = "keyswitch_in";
-- 
2.34.1

