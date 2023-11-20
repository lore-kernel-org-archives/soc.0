Return-Path: <SRS0=kXw4=HB=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AC5C197A0
	for <soc@archiver.kernel.org>; Mon, 20 Nov 2023 21:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5BC9C43391; Mon, 20 Nov 2023 21:21:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5D29C433C8
	for <soc@kernel.org>; Mon, 20 Nov 2023 21:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5D29C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so13118675e9.1
        for <soc@kernel.org>; Mon, 20 Nov 2023 13:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515278; x=1701120078; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkMSBNYAvYCAc3X4q8qxASdZhZ6ecouGkRCIVe4XyTs=;
        b=pZwkuAE3vwZFiFGW4h5eHvAwwNcFRgxLf4G1hOnNXk6PivN1uu38nGH0w8pOe8qSuQ
         K5+1xjddcoAeq+P0M88ax9sq1Uz6fgey5+hpU6elQZXUazW8A0u0uG/ksa9RlnvyaQxV
         usgIrLV/zeOsqbSttujdYNaHO5BgL8WGSSHt93nSdPxMrNwU9pZtLMlDEBw2OLOGxAE6
         cnjIA2JjXDQ/akmUTLxQlDP9I2HMdiiRJY4gQy1dV/wURDAMHC6j6E5wATl0/eVTWrGl
         aMz1R0faovTtT/zSLLl217yhVb2yyGGulkvHxRzW8IChewFvaHYdKf2NG7tVYaG3fKoA
         m4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515278; x=1701120078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkMSBNYAvYCAc3X4q8qxASdZhZ6ecouGkRCIVe4XyTs=;
        b=Om2oqB0wmXOP58Hdd1WCtrfnssPQ1IIgDDMBXxtSo7nqRn9GMx8DENwyqrJqHjx4To
         DNBIsd1njvp1f5+SC+fS/9z5dIpNTXYF6DrISCiZkctcvHxolJxu04RT9aVaUeGVd+1o
         TWiIHppVXTWVQK32dl46zpJyDLaIVVzqVIfgXrlMQgEuIUfe/yLW1GDMaRsO+9NLe0hd
         2+Wc0Z+xv4jviPBciGJe3Lhd5cnpTtMgXoAJ1dBjMNJI+gsycoreL22Jj8886EyrNqPK
         PNeaqkKh/MhmMl1TbMa9CYpvr7QBnFKvACgvQhaSWDiJvEj/EzC/b8y9UMR/HzoXt50S
         UkXg==
X-Gm-Message-State: AOJu0YyhKFT0Zg5N2FhviNkHJnEwbTewXfTxdCd0Pkojf3waD3Whywuz
	ZPJKQvvOSfOJzLAUVmXjlOcMRQ==
X-Google-Smtp-Source: AGHT+IEJbzDcW7S5/GI1PbDI0zdEaDb2gaggZv2mN99zjWhskgR9PmElBCBPkOp59Dez6eQSpkYf2g==
X-Received: by 2002:a05:600c:1d1a:b0:402:ea8c:ea57 with SMTP id l26-20020a05600c1d1a00b00402ea8cea57mr602593wms.7.1700515278079;
        Mon, 20 Nov 2023 13:21:18 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:17 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 08/19] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Mon, 20 Nov 2023 21:20:26 +0000
Message-ID: <20231120212037.911774-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index e32c1b462836..ccc3626779d9 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
-- 
2.43.0.rc1.413.gea7ed67945-goog

