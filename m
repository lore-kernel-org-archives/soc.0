Return-Path: <SRS0=LVh9=FD=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC7CC5519F
	for <soc@archiver.kernel.org>; Sun, 29 Nov 2020 11:08:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 817DD207CD; Sun, 29 Nov 2020 11:08:25 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26DF620771
	for <soc@kernel.org>; Sun, 29 Nov 2020 11:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Ty9oCilm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26DF620771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pf1-f196.google.com with SMTP id y7so8368188pfq.11
        for <soc@kernel.org>; Sun, 29 Nov 2020 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Rwi6JrG1Bh8jLLcugHVfWoJr8ivQS6AwCC3H82H1b4=;
        b=Ty9oCilmE8NwmSmLvOfYQILMur+rnE1cbwhvpZ43RjMOm2PVKxqz9NZ3eptAmz+/s/
         e3GHuCGcqQdNlb9W7Y4ecVmWqokECnv9IUh9jzNb2jlh7X8VQj0ecIQOGOWItVqOc5M7
         /WHKM9N59j5iYDpspzSSFeGsgp52DzSz4JO60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Rwi6JrG1Bh8jLLcugHVfWoJr8ivQS6AwCC3H82H1b4=;
        b=nhjkuPTEuuHypcF+unI1VJRklxkAIl03uMgAx0XoZxNGlIuNNF0m9RMjZnXgTjbqGz
         XEUQQBCQxIIPEVCP/vMNzry0xzmPwcBKuj6ZiGABR05G80V7aafU6GKKTcTWGaY8S31R
         zvUsd7nd+uOMaECWyR7xEDEG1EmZHrkwsTmQ/jaUZzUVuc+MDThtB0Jzr9SQXDDh1VlY
         I1MsRNGd/Y5Uz0hxoaw4MxQ6wAt4f92kJ2nEmbP/M+ZUwbExZGYZWp6eXLfKqK70fr8m
         Esl7zx7B2kgmSxV8o43pGUFsHjgWBf4r9SbX9sqBi/z2hsdFzqwJAsIQfKKfMe64xlFC
         N0dA==
X-Gm-Message-State: AOAM531/W80VASyvE3jKvalfj2i9NsjPbgrgubzMB4RrYqDTwrHWBDSg
	Ud6tEYI9425EImtaH9gFMgwhpQzgHookmw==
X-Google-Smtp-Source: ABdhPJwdh85fkMA5+0fVUf32WCOFflhHqyFVX+Xj2BKoue3xfo/ozmIZwkGeQJHKEgE0r9y5ZYHklQ==
X-Received: by 2002:a17:90b:3591:: with SMTP id mm17mr20654240pjb.213.1606648104524;
        Sun, 29 Nov 2020 03:08:24 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 03:08:24 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org,
	robh@kernel.org,
	w@1wt.eu,
	daniel@0x0f.com
Subject: [PATCH v4 4/5] ARM: mstar: Add gpio controller to MStar base dtsi
Date: Sun, 29 Nov 2020 20:08:01 +0900
Message-Id: <20201129110803.2461700-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
References: <20201129110803.2461700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO controller is at the same address in all of the
currently known chips so create a node for it in the base
dtsi.

Some extra properties are needed to actually use it so
disable it by default.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index f07880561e11..81369bc07f78 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -109,6 +109,16 @@ l3bridge: l3bridge@204400 {
 				reg = <0x204400 0x200>;
 			};
 
+			gpio: gpio@207800 {
+				#gpio-cells = <2>;
+				reg = <0x207800 0x200>;
+				gpio-controller;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&intc_fiq>;
+				status = "disabled";
+			};
+
 			pm_uart: uart@221000 {
 				compatible = "ns16550a";
 				reg = <0x221000 0x100>;
-- 
2.29.2

