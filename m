Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4268ACCA479
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2346FC341C0; Thu, 16 Jun 2022 00:54:31 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCE46C341C6
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DCE46C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id s37so92241pfg.11
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KUiL3np2ygfecmy1I7ARIj+Q5w0zv0RhTyVvk3vWH4=;
        b=qTu+cDWP2SW+X/kxzM9HzF4tQCSbSVySmmELcTZ4ArgF64hnXlwU5OFTDcmYSrEJqV
         J3V/CnQBgrZaENLjncNSN2f+Vgi35snbWabs3pNJrkOqLHXQYvjl6xfJ1uRxe0N8S/vv
         PNsLemAjaQ0ny8pTaXCbRdadciaEnTn762LEa8nN8dBJVp+RjnAywG0Xqxj9MjgPtySv
         4TTv49H3iVXOzYHkSirgjjf41mbJbuMkxA8EbwG7qSraxDXxEUA6ufpA+WxO4TZRdegD
         MUwzkuKT1S+sr3yr0qGbHnXDgxdbw27JCazs4sXZ0lYo9d5icvRt7QSS4KrihUcj2Asb
         ShSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KUiL3np2ygfecmy1I7ARIj+Q5w0zv0RhTyVvk3vWH4=;
        b=FY5fK204dSC+gvuDCcTP+QKM8paW64GU+MxaQVWfgT1IiOKEW6ZYUM5/1p5rHQObb8
         EFpduyFVaiCmcxgmLJE3OKED3qutCRBblg5STQCpZqevJR9xcMIyfuZf7NB+k465UZZd
         TYrAVYnqWcJiZdx4JjMW/T/ATtPFrDAkVfjjfSQsuJejzdmPeVCShqg9cwa+0mKT85mq
         4jFyXGRQyc8Ct/HiYrFw3A6uuMBknXCZ+RlIlqgzt/VcblN3g6ELgFuH8g9Zp7/mSIr+
         awuTgCDe4YAY8KW1F+HpZTE3XCXnjFyjXs2q2d3hs+qnO2dzFeqmY6eFocxfF2KIo0Az
         lHXA==
X-Gm-Message-State: AJIora+FRGRBPBGPszRZO+roQCuyKof3ccmPuSr+ps3FStoqwivZ1kmH
	4m3AIK8lzjUjDNldJSg/X6DVBw==
X-Google-Smtp-Source: AGRyM1sQO1seQ1T1fSTkQxKxi0GxBWaONbYL90YcQ+4JTholhfwkn0saBCHtFOJyC2TUQaJpfiI0vA==
X-Received: by 2002:a05:6a00:1894:b0:522:d414:61f7 with SMTP id x20-20020a056a00189400b00522d41461f7mr2209200pfh.18.1655340868943;
        Wed, 15 Jun 2022 17:54:28 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
Date: Wed, 15 Jun 2022 17:53:16 -0700
Message-Id: <20220616005333.18491-23-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nodes do not need explicit status=okay.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 42e89f41eb7d..48720026423d 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -88,7 +88,6 @@ cam_vana_rear_vreg: cam_vana_rear_vreg {
 	};
 
 	gpio-keys {
-		status = "okay";
 		compatible = "gpio-keys";
 
 		key-camera-focus {
-- 
2.34.1

