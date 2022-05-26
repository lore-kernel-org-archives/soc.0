Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E5DC433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91BEDC34119; Thu, 26 May 2022 20:46:16 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E019BC385B8
	for <soc@kernel.org>; Thu, 26 May 2022 20:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E019BC385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id g20so3153910edj.10
        for <soc@kernel.org>; Thu, 26 May 2022 13:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sodNhrbprDBlR5tvNArSoegdmoIGZLxKNxm4MqZi0Kw=;
        b=j0AS2xKTqbpmPr4US1TqDWaZrfuq2l/Jb8NMfruGp9sLuESLr/c3PrbE+WC4zZPf1w
         lHduoW3fvKnibVG1Y06bt2PCClRcaopTBDE+3+5H4ZmWpmXQeNoUPPtdxItwayVN1Cdi
         9jvoJGdEqytx5fahTlVN5T160OmOQ8n91d8P4dVFlZI9slhtnMLNl7o3bTrefjTLR2g8
         pzYbNBLNLY0019d7BJKZAz1rB4c60F2OJsfnhuTWJMuFHN8UNWs4re9/VqF2kf7RF/5D
         yixJdp+oq1FF3px58CVYOTuaHwDMLZE7hgR98Z3H2aj9r52HidfnH/lf2pVJKrvnzCoY
         ZRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sodNhrbprDBlR5tvNArSoegdmoIGZLxKNxm4MqZi0Kw=;
        b=dKaNhVvE5kxIvO5Slbefll/jXlV0jwwnnjPF/uKSflEcde8AwH3OdsCluJ01VXTf7O
         xV0hAg/v8x0o3T3+aRuBFelv/GaAjmnWfcfNpwWxHiktKShCReX0oZajWLzHXlFz4Sqh
         0aIbZd54yuw2TUnMsd17jyljsH7LaB3XUgHIxG/QMtw4E7J5FzcoOBSpLilavzlM5G0L
         L4DgIhgWON9jv6QZis5pVT2Y3xWLGucs1ZQA/Jjel3YlekE4g11nqfBT0MpxoTZH8xVe
         m845obvd3Ix++jZlJGFgtqeUkNDXNnASErPRBpRV9hyuTm6YsjO7Eaw4v5ycfzV9mZ+I
         04uQ==
X-Gm-Message-State: AOAM530kkSuLHLV8x0ndM+wfOFtBlYW1v+zslNT6w7fDYI+UfQ9GLjha
	RtIFXqqf9Gl3gDCNPV359wDXPg==
X-Google-Smtp-Source: ABdhPJyMqZdNPyppsO99qpgItW+lofA2V7FRCZtisCXRtSW3Kc31/FlvuFJ0N8MgBXeebaPx4c/fJA==
X-Received: by 2002:a05:6402:1247:b0:42b:e2e6:4aa9 with SMTP id l7-20020a056402124700b0042be2e64aa9mr2634806edw.94.1653597974350;
        Thu, 26 May 2022 13:46:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gc21-20020a1709072b1500b006ff16f48e2asm813254ejc.76.2022.05.26.13.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:46:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/5] arm64: dts: toshiba: adjust whitespace around '='
Date: Thu, 26 May 2022 22:46:05 +0200
Message-Id: <20220526204606.833054-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
index 0fc32c036f30..b04829b3175d 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
@@ -485,7 +485,7 @@ pcie: pcie@28400000 {
 			      <0x0 0x28050000 0x0 0x00010000>,
 			      <0x0 0x24200000 0x0 0x00002000>,
 			      <0x0 0x24162000 0x0 0x00001000>;
-			reg-names  = "dbi", "config", "ulreg", "smu", "mpu";
+			reg-names = "dbi", "config", "ulreg", "smu", "mpu";
 			device_type = "pci";
 			bus-range = <0x00 0xff>;
 			num-lanes = <2>;
-- 
2.34.1

