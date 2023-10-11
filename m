Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCB6CDB47A
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C50AC433CC; Wed, 11 Oct 2023 18:49:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0745BC433C9
	for <soc@kernel.org>; Wed, 11 Oct 2023 18:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0745BC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-405524e6769so610305e9.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050161; x=1697654961; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFhGX2ksyR6bl6kyiCZl+HBvDwsMQ5EUV+jwQV26TQk=;
        b=d2D6MXFOEI0yr03D4MYyEsUzpk5fIDsR0d/N7j4PKxv8soLmsHyl3BCScKqb1McduE
         mUzFGZnvkyTshWZ/fnFgY350EjQQN/bOHE5p9auFa5RDTDiNN18qW1BoxPxltaQaiDfX
         EVottqKZQjcoCHaRkVdiiD52hHWdphOZ0j5GlKDIDb52zfmy/k1ZOLnazz6rdS4nu27v
         dZndsgVNu3EA1nwqXb7oCjd9nQwdq1/VtcdO/n9UkamYZ46PA338xWYdXPkBrtHIdAMq
         jQDRwS6E5S1gNJ0/H9acCmYH4xZhzyts6RqYW1bnXeRaBWDBwJI55Ym85EF+mIoO1e17
         W9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050161; x=1697654961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFhGX2ksyR6bl6kyiCZl+HBvDwsMQ5EUV+jwQV26TQk=;
        b=c2vdRY7m5Agz+T3wChV1Yqs7KZKLp3vvZegfcw1N0j9llzbQ2Dfrr4FrBmJ78jyhVy
         4/Tg5Hlb2mu41pURsJabvkJ0+8MAoIFhp/8TUoF98i7DTyh5Vq4N0/q3zkObkxIjyXXu
         Ny9H/lC7Mo2Sw5xKravAV3tOAMcJmAAiNHQQ35ww9stQkF4n/tsTE+gIN7lEk+RlntUB
         66N/au6CODxPmbq0EfOJOKIHNiFfOdJPQBtQwvE+JPcENnKLI67pk2+CBDQ6KJeZBHPa
         +tnrvhw4aReNXRmknbw18XIUb3Z8O1hlwr2JSPmfcAGz+tz4KFrQFy7IZWNEijyPqKdH
         mYnQ==
X-Gm-Message-State: AOJu0Yz3oXKrqTb5dU+/57QXj9mGUeFdRY6G/IduDlRpbpqEAtn8d7BR
	9CPbRR4BZf2l1RjMyH5qPbh4JQ==
X-Google-Smtp-Source: AGHT+IF9W+7AW/XlTQ7WDrQGflbC5JtDdmSRP62EIkSF11L7fYaLrR7J1qys5NGk48FiNmOh3TFgig==
X-Received: by 2002:a7b:c84e:0:b0:3fe:1fd9:bedf with SMTP id c14-20020a7bc84e000000b003fe1fd9bedfmr16045843wml.11.1697050161221;
        Wed, 11 Oct 2023 11:49:21 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:20 -0700 (PDT)
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
Subject: [PATCH v3 07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date: Wed, 11 Oct 2023 19:48:10 +0100
Message-ID: <20231011184823.443959-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
where more than one pin controller can do external wake-up interrupt.
So add a dedicated compatible for it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 1de91a51234d..7cddce761c46 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -29,6 +29,7 @@ description: |
 properties:
   compatible:
     enum:
+      - google,gs101-wakeup-eint
       - samsung,s3c2410-wakeup-eint
       - samsung,s3c2412-wakeup-eint
       - samsung,s3c64xx-wakeup-eint
@@ -99,6 +100,7 @@ allOf:
             enum:
               - samsung,exynos850-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
+              - google,gs101-wakeup-eint
     then:
       properties:
         interrupts: false
-- 
2.42.0.655.g421f12c284-goog

