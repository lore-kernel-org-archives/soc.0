Return-Path: <SRS0=Tcbz=HM=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71047C10F05
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5984EC433BC; Fri,  1 Dec 2023 16:11:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 840C2C433C8
	for <soc@kernel.org>; Fri,  1 Dec 2023 16:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 840C2C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40b5155e154so19895355e9.3
        for <soc@kernel.org>; Fri, 01 Dec 2023 08:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447081; x=1702051881; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW19mxe4mqyEScY6tYe0GRvxeq4h2O2gsGPGYkrMyss=;
        b=hEeZuAP5yY2YhCmCo2HYV/iG69Q0vpHnwXzruDzM4LGxNB61HJGZzW8eYbLXzYYDA+
         7a4MFmCuOhSbfmMcPFWYmOSLZ8n6MvXkxVG1Jwz63MGbntgWa1XPP4tMTlfDe0mN5MhZ
         D4pVBUFwDYxvETEe/Q/ovfk790w8kJfGfnSoOZ1vFrDRdboAWPE89xHswOlhC5mn7b87
         chOfX41l1bI2w1ZkofkdtFchPqs4IM2WZ7BnCC95nJQVhEf7i5DlAYdry/xg4If+2etK
         rt/L2aIf3fq/QH1yku5zIckyCXDghiya25xxIOHDk/hFwbc8vyvUueYScYO0yTsQR8pt
         1Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447081; x=1702051881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW19mxe4mqyEScY6tYe0GRvxeq4h2O2gsGPGYkrMyss=;
        b=CzUnZ3oOs+JsBuGkTUpbUF7tBIz7lqHZ7nwWDQ8Zsr+OsZWcwZYxosQTR0smSOJhf4
         YBv7lBnM2f5OTTpKYSws0lLE2ZTcFlGMZhG6+B6jASlPDdYwncTbQS4DrvtFzC5I2dCE
         izycGPA3ACJ1ocEu29r0fI9KVM7CnI4OmgEW+9SkDq1IQDUlWs9+0o6pSWyJGniavjtm
         RGvfL6J/oKsYIoPpyLRDoHvtxpL3ETlYZpTYpu33uYeBydkym8habUQinEsxBnut+8i0
         L3jLPLUC9uUNXyI7eiKao0p2DGt8DCQNJbrrNARWEayqT/QAIC3yyDZFPewQVT6DJkoq
         u1Fw==
X-Gm-Message-State: AOJu0YzbQ0mMNWqxRwvEDoS7ChWf5q+1kpgWXZYrMV/nKccXq8ldppU8
	hyQ1WpboW/NZJF6a2sSUNeUolg==
X-Google-Smtp-Source: AGHT+IEAInbF0fkztmGpsgy6V1cv3bcIiQ/CkWEoRX4j4aDC0mNAEkPg+rKi6QFg/uuZCcRUUH4s0A==
X-Received: by 2002:a05:600c:230c:b0:40b:5e21:bde1 with SMTP id 12-20020a05600c230c00b0040b5e21bde1mr406099wmo.112.1701447081131;
        Fri, 01 Dec 2023 08:11:21 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:20 -0800 (PST)
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
Subject: [PATCH v5 20/20] MAINTAINERS: add entry for Google Tensor SoC
Date: Fri,  1 Dec 2023 16:09:25 +0000
Message-ID: <20231201160925.3136868-21-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainers entry for the Google tensor SoC based
platforms.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36f6e76170e6..a3bd682c9e32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9032,6 +9032,16 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
 
+GOOGLE TENSOR SoC SUPPORT
+M:	Peter Griffin <peter.griffin@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	arch/arm64/boot/dts/exynos/google/
+F:	drivers/clk/samsung/clk-gs101.c
+F:	include/dt-bindings/clock/google,clk-gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0.rc2.451.g8631bc7472-goog

