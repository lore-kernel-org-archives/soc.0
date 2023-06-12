Return-Path: <SRS0=zY6S=CA=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC59FC88CB2
	for <soc@archiver.kernel.org>; Mon, 12 Jun 2023 18:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75B79C433EF; Mon, 12 Jun 2023 18:01:13 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49AFDC4339B
	for <soc@kernel.org>; Mon, 12 Jun 2023 18:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49AFDC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-977cc662f62so678742066b.3
        for <soc@kernel.org>; Mon, 12 Jun 2023 11:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686592869; x=1689184869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCGwbCad1AH2eGvAnap/WQX11/HOeuflBKO2IBu5SxQ=;
        b=pjkD0h+jj27yUXdF8AZb5enQZd3P3E7REc8v6jmRE4qJSFoiHmpHe0G4fR4tRRA4qW
         tasS4zx8SgBmk4eW3zZPNT6JckKTlFzaCjvD3syajY6TtEn/FqQuyeVUOXfD+WuIbKXy
         xwGs011tIC89i7WjrfeBaDH4/kIbcPqKeOSmzNC/F/4xYQ5kzquOP6ulbPS2w9R4Z7qI
         JU2mUTM+xf2/u4wsgBQ8TKy5OkEEn7k6TzLO1kb/85l2OWj9BpA9veK/3h/X4CGXu0Xp
         KLuVvqamPPNpfwsZ6XvcYJqC8cngIa1GBEQ3IceexyD7xsxgNwA3UsvfVz/ZWo+fulkn
         rfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686592869; x=1689184869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCGwbCad1AH2eGvAnap/WQX11/HOeuflBKO2IBu5SxQ=;
        b=UHQptlcTfslv1ue92ck7a1QHXHSX8NPpbtmm8iBhqVyt1vhGGOk44yLY/ocOM9sTRC
         fYAPQS2cXEi+soFFHinU4+tz91o2XeKPibWTS17a5ZLw3Hxuc45TxuljcGU7pwBUHFgJ
         dJOfIKToQoH5XR0hU3vi0rVJnjf9e2UMtr9MYv1rjvBGiUxreV7TGphgU90RsVzb1ZEZ
         8BLZiCHUTHCKNzJfNUBMsjrXLbNdFZbL4DVgHvTE5wecsF2jbGt/3ZSNHp+L5bUB9cXa
         Yy2Kr4X/1N30N4+gs7bonm/+ObPXW1XfcXCNi8DhCgH8BwK/KjFRpJCiHnHsLd2Tcd9A
         AWSA==
X-Gm-Message-State: AC+VfDwpJIin+UD1ef8JgVHTh+pr1JQmcvO3QY9x8kfE+54EZWMoiEye
	javeKe71YAguSYW+rU3KAi7noA==
X-Google-Smtp-Source: ACHHUZ4/mCSxbJC+qLaVY77hKvoJbuJ/qDPXf6Y1hMusTYTf4XRvLJuYdGgg41+7NeQ6B+KnVz53vA==
X-Received: by 2002:a17:907:31c6:b0:974:62d1:e942 with SMTP id xf6-20020a17090731c600b0097462d1e942mr10381519ejb.21.1686592869286;
        Mon, 12 Jun 2023 11:01:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id j22-20020a170906411600b00965cfc209d5sm5556907ejk.8.2023.06.12.11.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:01:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL] arm64: dts: exynos: Remove clock from Exynos850 pmu_system_controller
Date: Mon, 12 Jun 2023 20:01:02 +0200
Message-Id: <20230612180102.289745-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sam Protsenko <semen.protsenko@linaro.org>

As described in the corresponding binding documentation for
"samsung,exynos850-pmu", the "clocks" property should be used for
specifying CLKOUT mux inputs. Therefore, the clock provided to exynos850
pmu_system_controller is incorrect and should be removed. Instead of
making syscon regmap keep that clock running for PMU accesses, it should
be made always running in the clock driver, because the kernel is not
the only software accessing PMU registers on Exynos850 platform.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Link: https://lore.kernel.org/r/20230308233822.31180-8-semen.protsenko@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index d67e98120313..aa077008b3be 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -200,7 +200,6 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
-			clocks = <&cmu_apm CLK_GOUT_PMU_ALIVE_PCLK>;
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
-- 
2.34.1

