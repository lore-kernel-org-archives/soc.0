Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644D9E92718
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BC7BC4163D; Thu,  5 Oct 2023 15:58:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59965C116A9
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59965C116A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso11020925e9.3
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521469; x=1697126269; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nur27tW19rRSdA+inDic0S7r9ItKpgvMyVV6vQ9tmEQ=;
        b=gjBsCucHhnApIzX1Zw1Ay7WYY2wAw4t2xMnItYi/KuvtOSwJflcnKaFs/qb6VM1S1v
         eHy6u6Dpj703ScewpInFuiXRo5uRDuNoDXAKg1av7IbjG5wkVosJaiEUlJUYA+av40yt
         WuaNi8Szxnv6MHCykt1SUxJ+kHEExJ/Sr9wa98rMj+F5jbC2UsCQY0WFQRknkJEjdqSq
         /JP/f+oZXfKHtP+/QSIgFPDvb8ipgQxOswxf3IB310dMXJKVqtYdKsKMqxU3VfH1O1qy
         nqM+/brNz4qSBtanle3STowMVxv3oEAxB2BkWUsQZ9YaNNUFkDEGAxAOoiFSukG3aiO/
         3yuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521469; x=1697126269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nur27tW19rRSdA+inDic0S7r9ItKpgvMyVV6vQ9tmEQ=;
        b=BLt1Ns5PbSlPLZN4yt1Nj8jmUK+/j3s4wNWPE0V/TUZlvpvYW2FG9kF7y63vh++dLw
         W3zDblAvkp+IhdqYNp18Ef1yHn7n3mR80cr5IZCwrttG+TIVEEnuhciWkYKC/5DCIGU6
         IoZE5jGpz4aDfQ6zhde+x55hockEBSNKK4vZV6O2hJhunrjp7mWZvHcuuV53PFdQe15C
         Vd3xnRcYtBrfqzkOc3hMAZFk7fCUCwqcMBsxSVSty0YQ5uIXs95uovDynt+B5J6LInHv
         AHU5xQsRzn+tR/dKk9ghcAxtL/J5NdkHjE1SSj28l0vXqc9OUP6Mu/K7XtaT1eCKilfw
         qmNw==
X-Gm-Message-State: AOJu0YzPcCE5PRu1jKHQtGw/GzhQDdXiN2+3DSkgiLa7C2KpfEGs0acb
	PWQuLLiazB7y6LPFIBp/D7jgIw==
X-Google-Smtp-Source: AGHT+IF0KkpCw7exE287U3x0Way1lMxqQVtTi1YA1LDZ0OBcnwTpgIQbWiSTzafiHowqawG63A3wkQ==
X-Received: by 2002:adf:f1c6:0:b0:323:3b5f:3564 with SMTP id z6-20020adff1c6000000b003233b5f3564mr5295468wro.10.1696521469054;
        Thu, 05 Oct 2023 08:57:49 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:48 -0700 (PDT)
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
	cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 19/21] google/gs101: Add dt overlay for oriole board
Date: Thu,  5 Oct 2023 16:56:16 +0100
Message-ID: <20231005155618.700312-20-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LK bootloader on Pixel6 searches for a dt overlay in the
dtbo partition with a board_id and board_rev that matches
what is baked into the device. If this overlay is not present
then the phone will bootloop in fastboot and you can't boot
the upstream kernel.

This commit adds a dtbo for the production oriole variant.
The other pre-production board overlays are not included
at this time.

Adding the dtbo here allows for a better experience when
building/booting the upstream kernel on Pixel devices
as all the DT required to boot the device will be created
as part of the kernel build process. Rather than having to
fetch the dtbo from some other repo.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/google/Makefile          |  1 +
 arch/arm64/boot/dts/google/gs101-oriole.dtso | 21 ++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dtso

diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
index 6d2026a767d4..3f1761f8daa9 100644
--- a/arch/arm64/boot/dts/google/Makefile
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -2,5 +2,6 @@
 
 dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
 	gs101-oriole.dtb \
+	gs101-oriole.dtbo
 
 
diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dtso b/arch/arm64/boot/dts/google/gs101-oriole.dtso
new file mode 100644
index 000000000000..50832fd94204
--- /dev/null
+++ b/arch/arm64/boot/dts/google/gs101-oriole.dtso
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Oriole DVT Device Tree
+ *
+ * Copyright 2021-2023 Google,LLC
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	board_id = <0x20304>;
+	board_rev = <0x10000>;
+	fragment@boardbase {
+		target-path="/";
+		__overlay__ {
+			model = "Oriole DVT";
+			compatible = "google,gs101-oriole";
+		};
+	};
+};
-- 
2.42.0.582.g8ccd20d70d-goog

