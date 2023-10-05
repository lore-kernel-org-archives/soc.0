Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D79BE92718
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D66BC433C9; Thu,  5 Oct 2023 15:57:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5574DC433C7
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5574DC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32483535e51so1174801f8f.0
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521455; x=1697126255; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCRvx18FXBZUIE55KgKCOULc2WUqPQQy1aHNXgrW/y8=;
        b=GSduZzniN3IFKKm6gYX/QDskPlNlyZHDZBYFnlGvW+cAND2U9boX666Q4FoICxb8pH
         V1jtDh7ITQy/VzE5r8lAeNT5TAtw2Sq3HZnncVYt0uL/qE+F3gfxOQcQ0uKX+Ezuwq6q
         b9nWaNSp51Il3OZ9x/qVjDSlHDyxAJYBSaaP4HY+nkqRKCH7nIS56Dfyydh6S/bEyft3
         f1QnlVaOa/jWzK7hB4ZThwJiPLqUHd2c6diptyWL7oF7co2tQJqvGL3yPaFUAdRn16MN
         lSquhs9C2w8D3IfkvtorWZ+VO8GnOhmL+K64RezybSU4pbgYdJdRmjr3xDM5W+eCZw02
         Qz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521455; x=1697126255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCRvx18FXBZUIE55KgKCOULc2WUqPQQy1aHNXgrW/y8=;
        b=KwmtYeDcu23B0fIU2pO24+vAsCyb/1GR6Eflnb6T6ePruta0eTBHk3NgiXpMw0L1sb
         sifb497r1bD5RY0eG2SouCo+ogkLDTvwaGGP3luiZ4T9KrpYnvJjKw6CuwoKl/U4/uco
         NJN6B8sRopSMmRpyOfZ48lPI/ZuKSGPhlO+LQMjpr37ej2Dhm19C1eXdj4ipzuY+L0E9
         LmO5TCsyRRHHCg+KDbQ9EQJXCaXc4WhKk6ZlIC/yQKljkbqn48eJZYgmJnQEFQFNcJWN
         05p4jwXuYdjI8xGwFi+eDT/WpzScRpDiTWQOTAJonBx7t4hjANin3O51rFFKTpYAo5Wq
         Iy0A==
X-Gm-Message-State: AOJu0Yx3LVVDzHQ7dxKqMXReA52P5HK/cqZ3626s6CBqMV90vQN5cMTW
	mwc6eqcp2lZT2YsQADeDY2XYCg==
X-Google-Smtp-Source: AGHT+IGXl1CoGjZQDrIr/dGSwn1zWY2LS9ksQvXQhCz9d02zBxSqzFembYLOfI32ScvmkDqICjuDCQ==
X-Received: by 2002:adf:ec48:0:b0:31f:f99c:600a with SMTP id w8-20020adfec48000000b0031ff99c600amr5234563wrn.46.1696521455682;
        Thu, 05 Oct 2023 08:57:35 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:35 -0700 (PDT)
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
Subject: [PATCH 11/21] dt-bindings: clock: gs101: Add cmu_misc clock indices
Date: Thu,  5 Oct 2023 16:56:08 +0100
Message-ID: <20231005155618.700312-12-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMU_MISC generates clocks for IPs such as Watchdog. Add
clock indices for the PLLs, Muxes, dividers and gates
in this clock management unit.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 include/dt-bindings/clock/gs101.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/gs101.h b/include/dt-bindings/clock/gs101.h
index d9b8299fcc0b..7765ba68f734 100644
--- a/include/dt-bindings/clock/gs101.h
+++ b/include/dt-bindings/clock/gs101.h
@@ -218,4 +218,15 @@
 #define CLK_APM_PLL_DIV4_APM					13
 #define CLK_APM_PLL_DIV16_APM					14
 
+/* CMU_MISC */
+
+#define CLK_MOUT_MISC_BUS_USER					1
+#define CLK_MOUT_MISC_SSS_USER					2
+#define CLK_DOUT_MISC_BUSP					3
+#define CLK_DOUT_MISC_GIC					4
+#define CLK_GOUT_MISC_PCLK					5
+#define CLK_GOUT_MISC_SYSREG_PCLK				6
+#define CLK_GOUT_MISC_WDT_CLUSTER0				7
+#define CLK_GOUT_MISC_WDT_CLUSTER1				8
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.42.0.582.g8ccd20d70d-goog

