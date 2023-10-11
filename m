Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D01CDB47F
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 351E1C433D9; Wed, 11 Oct 2023 18:49:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AF78C433CC
	for <soc@kernel.org>; Wed, 11 Oct 2023 18:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6AF78C433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40666aa674fso2364835e9.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 11:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050181; x=1697654981; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdsParCuymjlmImw/5r7LgWUbKh/XK9/vZ2/JG1KUVA=;
        b=zTBU4zIFGjigZa/iFDt9NOkC1/H3rB/iOl1NZf352ggGBDdggpdV9LGjBK+jctjGFo
         U0XKgx0biiQdAKaGV3SerKopiTpJd1EsOrFdk6FMWlTU0cxQrHDapCjmD9o9IXvIbo79
         SF4qgMfT4ceSm+QXq+wyxhUty6A3n6oTG1fcCEMKw7pf7rEMiejfImTld+sjI1x9FxBW
         RWKpfA7D5slNshGp3TZUA1FSiUtRPijVms+s37VE0qZvQQtTjLtd0MRsFTMzHIBMUQFr
         V5O9xqK+RgQNCDCz1NJtgkHpQXyBmY/qn1LZtkCwBKSn8d4MLeC93u6C9+p8qr13MqM7
         Y3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050181; x=1697654981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdsParCuymjlmImw/5r7LgWUbKh/XK9/vZ2/JG1KUVA=;
        b=XZBrj2Di8t/zuVWkGQ8tJtCbt0tsbox98DctGIDEBzP+I9K5NF+w9Adt18j+deu2Er
         JU17GBq2rNYlssHwrcO2Qms2OLPacuZc/wDMo32BM0Xy2++YU46M5hT1R+E6TOkBRoOg
         oslannXLjexJoINDhB2NMc3+Gij/vuixg2Q0z39MESD865/jIX/1UytduHHDp3eiHyvF
         wpYmBS7mGXgA/+zGFtUUMGimuIQbCzZg4sVwM7tezWIcG6GcNlrpYQN+VTs77lmtgjqX
         qct7V14zXqbYkOhDCJwiqab/dGBOfuAkrz/z4GZD/nfntzTkxwcHkmv6qSDVjvf3Z9fB
         sRxw==
X-Gm-Message-State: AOJu0Yz6NHOh9NkqXteRjLaYWCwijEM9kl2Z+THe3PBfMSE4hKkq2E0K
	iSoGgZf4Nnsgf1O7UYHN6vHa9g==
X-Google-Smtp-Source: AGHT+IFBklXaphM/CWCVEBadRe6eZJrH2hObJzvWcKnrEkFzR9HfnZ6RvER0PV3n72K21bArq7jmlA==
X-Received: by 2002:a5d:4cc1:0:b0:324:885f:f7fd with SMTP id c1-20020a5d4cc1000000b00324885ff7fdmr19347507wrt.15.1697050181726;
        Wed, 11 Oct 2023 11:49:41 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:41 -0700 (PDT)
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
	cw00.choi@samsung.com
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
Subject: [PATCH v3 20/20] MAINTAINERS: add entry for Google Tensor SoC
Date: Wed, 11 Oct 2023 19:48:23 +0100
Message-ID: <20231011184823.443959-21-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainers entry for the Google tensor SoC based
platforms.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..149a0c364309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8836,6 +8836,16 @@ S:	Maintained
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
+F:	include/dt-bindings/clock/google,clk-gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.42.0.655.g421f12c284-goog

