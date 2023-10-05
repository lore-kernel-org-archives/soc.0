Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF5FE9270D
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88BD8C43140; Thu,  5 Oct 2023 15:57:32 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64709C433C7
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64709C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3231d67aff2so1168084f8f.0
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521449; x=1697126249; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WotVRIx4IfQWLl7bsIqhgSrhHJCYtM2efkzCcXjlJ0=;
        b=sDaqNFkLZ6zgiXErvqYrGaz0pCLqF53FD/T7aElrkAib6ZMiOXNT0Chpj56fGolAfm
         k7UAGDa12E2uDdFZEGzAZVd2fGhfgbkOKYU1lqUQ5uE14wd13Ki9waQ5G8mSCCu3XEgy
         wHX5BwxJwWuiJ9n/cTJwwMQCty7p6t87tnvR1+5elvKaE/3GWr3Tq8kbx6hyEgge/mN4
         fO/tl8UTm7FLmzxvuh2ZMGVZNe9X4IEcm+imXCI7AyzkKxmFgc/+ufYwBwV8M0skE2gX
         txsblV8t7vZiHk0PUt7g8+o9s5LYQQfOIXnulNTc1Qiv2AKyuAegthtQ1lJLwS4MYlB3
         7lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521449; x=1697126249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WotVRIx4IfQWLl7bsIqhgSrhHJCYtM2efkzCcXjlJ0=;
        b=jv48vrXo6UjZiCQFeeJbqT4Zlz55+Cq4P45+xZs4qJmQC1DL1GEIkmTJWlL8iniXI/
         ZEbTg3AJaVydt5duQZmh+9DeA8rFImgjwZsAn7uRjmzurdAo5oZyBDcffVPKBZFwOnKU
         wOg8GHw+aAYFAatqhp/a7EUCUqAXeDNO1KZhBB1MMmVYafz+R8w+tjVzS2NzwZj0UC3s
         E6HfMYkFVCtE4ioO0CsoQ/2fS0ZjqzIsPelZbJaWdgTVT8UkNLwlNq6xQTigm0qXbZRg
         zr8iun7X/J2S4XsLPdVjA1IAlePCl4p6/Rl9p7O0RcKvSywQd+L1jo4T4Fve6BkxqwyX
         K81Q==
X-Gm-Message-State: AOJu0YxvHelshoTmprW22BQQP4W0tFmIe4XJHD1RdwdMH927rW07knOb
	BZqLOfPYcKQnkm+cjQG7bO4aKQ==
X-Google-Smtp-Source: AGHT+IHb0s500PrFGOrLeuuBwpGQ7OFg+clB+5dsL7CoXu4v4IuKDCuex94QNDTzGTMDp0JcDuLSUg==
X-Received: by 2002:adf:cc81:0:b0:321:5971:23a5 with SMTP id p1-20020adfcc81000000b00321597123a5mr5355332wrj.20.1696521449677;
        Thu, 05 Oct 2023 08:57:29 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:29 -0700 (PDT)
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
Subject: [PATCH 07/21] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date: Thu,  5 Oct 2023 16:56:04 +0100
Message-ID: <20231005155618.700312-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Add maxItems of 50 for the interrupts property as gs101 can have
multiple irqs.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 26614621774a..e0f37f8ae8e7 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,11 +54,13 @@ properties:
       - samsung,exynos850-pinctrl
       - samsung,exynosautov9-pinctrl
       - tesla,fsd-pinctrl
+      - google,gs101-pinctrl
 
   interrupts:
     description:
       Required for GPIO banks supporting external GPIO interrupts.
-    maxItems: 1
+    minItems: 1
+    maxItems: 50
 
   power-domains:
     maxItems: 1
-- 
2.42.0.582.g8ccd20d70d-goog

