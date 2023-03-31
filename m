Return-Path: <SRS0=bmCH=7X=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C82C77B62
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 08:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43F46C433AC; Fri, 31 Mar 2023 08:35:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33C81C433A4
	for <soc@kernel.org>; Fri, 31 Mar 2023 08:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33C81C433A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so13345695wmq.3
        for <soc@kernel.org>; Fri, 31 Mar 2023 01:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTkJHErpGDJ9v7s3ekjmHN8aO4NJsl7q6Q7QZM8QMbI=;
        b=UGr6jhzO3hUVTB6rY7/leRAeWl750ZHVMPEYAKeTT4X06mEnwpBCz4Phsf+P7ItSjw
         TIi62QAKl2i4gwbJZgnixjiWLnYymuWJtQlev/UOTE8L3tTaSoTPelFszUO9MlZAhEBb
         svJnNSmQ+fTYwJwHOfZ+BnzUQABhVZKyZM2IISk4TAN6KerdE9+u76JqT768MMwy0WrZ
         hHa30huv6N2SbwamrxfA5MxDt5MO3eFrL7KNDytCeuOyhCtNf98GhPdjDroQkxFbYiio
         9lM6zhXS3q9g9LP/PSzlqPbEENCEjOSZL6tjJxXO/fNDHiRHf4knVvhNWSfCrnbGAaBR
         r18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTkJHErpGDJ9v7s3ekjmHN8aO4NJsl7q6Q7QZM8QMbI=;
        b=R9BL4d7tTxfZ7U/vgtWB99p4boZ2at0AEK4ql4f764hx5OCQUVg8rTQ6dwnFTMGUiT
         GLRE7blrbJ7G2ScN0/O0KmiLNhh2NB2zgfRqM5PPKIarkNoWLZ4C1oOgHyBTADlixbH1
         Fpt6v9xNU9Qvg3pjeZKY+cl6PrMkZ+TLbpmoXfyCeDvbM2U3k6vs1B7BGKPvJuWRqrzc
         c0tZmEWNsMuZXlVjNjzTqpD6g9WJkETjNnZP/fbiVownTfFLqI/PrWGKnWFOHBuaosxp
         F/xo9IQW/KmwbSvRVT4qcTTfK/gv+9XlDGFd2HxArfs+SzeZ37ffay5Y/KJsZxnZ8Xp0
         mq+Q==
X-Gm-Message-State: AO0yUKXPZcCxzN7t99EpEQptQXfUZVtp3Dl6iAXQ2IsVwIvGXs08n/Vp
	oS83KU3M8SaXhjvEA0PMh0MIaA==
X-Google-Smtp-Source: AK7set+EJ3ur6/ee9yCfqdjB5MLNFawGDsn0ZJD+xQ08Aa57oAcgfY47mb3l6TfHxYQ73tsX3o+sPw==
X-Received: by 2002:a1c:7714:0:b0:3ee:3f7:35aa with SMTP id t20-20020a1c7714000000b003ee03f735aamr21641887wmi.19.1680251703765;
        Fri, 31 Mar 2023 01:35:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:52 +0200
Subject: [PATCH RFC 14/20] dt-bindings: pinctrl: oxnas,pinctrl: remove
 obsolete bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-14-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 pinctrl bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  | 56 ----------------------
 1 file changed, 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
deleted file mode 100644
index b1159434f593..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-* Oxford Semiconductor OXNAS SoC Family Pin Controller
-
-Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
-../interrupt-controller/interrupts.txt for generic information regarding
-pin controller, GPIO, and interrupt bindings.
-
-OXNAS 'pin configuration node' is a node of a group of pins which can be
-used for a specific device or function. This node represents configurations of
-pins, optional function, and optional mux related configuration.
-
-Required properties for pin controller node:
- - compatible: "oxsemi,ox810se-pinctrl" or "oxsemi,ox820-pinctrl"
- - oxsemi,sys-ctrl: a phandle to the system controller syscon node
-
-Required properties for pin configuration sub-nodes:
- - pins: List of pins to which the configuration applies.
-
-Optional properties for pin configuration sub-nodes:
-----------------------------------------------------
- - function: Mux function for the specified pins.
- - bias-pull-up: Enable weak pull-up.
-
-Example:
-
-pinctrl: pinctrl {
-	compatible = "oxsemi,ox810se-pinctrl";
-
-	/* Regmap for sys registers */
-	oxsemi,sys-ctrl = <&sys>;
-
-	pinctrl_uart2: pinctrl_uart2 {
-		uart2a {
-			pins = "gpio31";
-			function = "fct3";
-		};
-		uart2b {
-			pins = "gpio32";
-			function = "fct3";
-		};
-	};
-};
-
-uart2: serial@900000 {
-	compatible = "ns16550a";
-	reg = <0x900000 0x100000>;
-	clocks = <&sysclk>;
-	interrupts = <29>;
-	reg-shift = <0>;
-	fifo-size = <16>;
-	reg-io-width = <1>;
-	current-speed = <115200>;
-	no-loopback-test;
-	resets = <&reset 22>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
-};

-- 
2.34.1

