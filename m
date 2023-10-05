Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1DDE9270D
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C9A0C433BA; Thu,  5 Oct 2023 15:58:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D0FFC433AB
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D0FFC433AB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-327be5fe4beso1111931f8f.3
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521472; x=1697126272; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZcQdif16KIsV/1ocyIAmtjZ1yEW/jfAGT5DH5ZGevU=;
        b=PrUdIBnCkZANsZ5Mshcr7PsCMCCYsl/+JrRhgGX2Yj0UhoBgBLFMTra96yIahqEdyP
         lJjEc1OpMXLSFdEMWDJ/CxY18DUsmqg4kS3cZZNdBWWuzSmmSg6xzn+aiq3kXkManAP2
         h1klVwZejGYk3QeBXfuQexRWUSwL2ICHdh6fkev8QnZyHIFfB/i9sKY+cX61ZWTK2+v/
         0bs+7d8QhjCqOn/DRjjdjZQPYPlJmHrARKnfIkssJEhCwabQIAHzZ3jQsg/FI4rJ2n4F
         HMdzrxq+vilnx4x1jdAu1BaIQjZVK+xSZaqdbgE64D9gTVt7LIEuWFA85jFfMv7xup1A
         ncHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521472; x=1697126272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZcQdif16KIsV/1ocyIAmtjZ1yEW/jfAGT5DH5ZGevU=;
        b=lIFLxS95Xy7hRkuyjVQuq9KO+iPWrCeTc5gAB/RiZrob3XCvdOJ2o2zTX7SBRx9DJT
         JYoeBMKqAZx5CYdURg6gOLk0I6k7N/rQ2Wvuij6iGRVNicbpzCddmRavEgzXl1P0irTr
         tmXuzGo4BvokruXQeR5j6w3O36C3cFTbFGQ6sL/p6EK1MMz6YEaLDEspkhyDcdyCrUn0
         mjP1n9A7RJe3BbpIAjVvvW2oZuxxdt/96ytiUd3zrMD0/21FMm1hhdSqJBovINhG9LzD
         Q96n3+XHIHH6mh6AXvhZA3+8zQNZxHuSvR3B32RhWcsUcKy0aHVmJxuJl6BUVp0MiUGy
         ALcA==
X-Gm-Message-State: AOJu0YwEm8pebKyxD+YmRm4rLydJ8r8OEKWIlAEiBQx+DbXegGNohEHg
	5zBfnFwIyTmQib7bq/+pSgy0/w==
X-Google-Smtp-Source: AGHT+IHj3KgFg4X3Xr+ezMStBQo1fMmV89Ktlr/kyhx9iyz1eOIitC1QjlqKnhb/zdCiKAYFtNDLWg==
X-Received: by 2002:adf:e9d0:0:b0:31f:f432:b541 with SMTP id l16-20020adfe9d0000000b0031ff432b541mr5241309wrn.69.1696521471952;
        Thu, 05 Oct 2023 08:57:51 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:51 -0700 (PDT)
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
Subject: [PATCH 21/21] MAINTAINERS: add entry for Google Tensor SoC
Date: Thu,  5 Oct 2023 16:56:18 +0100
Message-ID: <20231005155618.700312-22-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainers entry for the Google tensor SoC based
platforms.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..23cfc0799c04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8836,6 +8836,17 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
 
+GOOGLE TENSOR SoC SUPPORT
+M:	Peter Griffin <peter.griffin@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/samsung/clk-gs101.c
+F:	include/dt-bindings/clock/clk-gs101.h
+F:	include/dt-bindings/interrupt-controller/gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.42.0.582.g8ccd20d70d-goog

