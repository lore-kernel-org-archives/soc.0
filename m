Return-Path: <SRS0=bmCH=7X=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59F9C77B79
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 08:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E33FC43324; Fri, 31 Mar 2023 08:35:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9D17C4339E
	for <soc@kernel.org>; Fri, 31 Mar 2023 08:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9D17C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id e18so21583569wra.9
        for <soc@kernel.org>; Fri, 31 Mar 2023 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0V8nry5kWVC4/7uVK2TIBPivIea0+SnMt7iP0mU4Cw8=;
        b=chZXAA03Ktj6cCYt4xjrNnHn2g3CbaZsDusqs4uU9Vhv0+pAm8jD8YNmIH6rxRpV+h
         vZbIeRwPEq02v7H1BQWanP2WxcrxIeZKG+trsgqWf+VelBUfmK5t3LKEmSAqUKxTZ13L
         +G9CVycFJ35xf9hcvHQ/5mpMm4vgT5JJt3pCOGXggW1pTaO5/XGxwGfSkh0l2D4lx3xm
         CdU9FttI+BGLbTmFYxZ4WJMPU0cKt87qQLmEz7fPijrzLc+aEfpd2hBm32tMeL2yzewe
         wa8ggH+56W4skf84z3SrfyGgzpsmcwI8xPuwXPLIfYxeKh5XiRGPo7geoXtpM7Y1dKG0
         wv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0V8nry5kWVC4/7uVK2TIBPivIea0+SnMt7iP0mU4Cw8=;
        b=VKi1J89Wnom3bbI118a0IujAUpB1wllD81GsYa3+CfAfWMM4M55mpOlc/S8KYeQ9ms
         yWylQIT3U27+2aktilrYLD7blfE0M0rU3dBErSCmvMN09tzNDYIElRjXpuoMXpS/06o8
         vCiyHJToHP1wR1POpX2XwJUk7yx/4tUwuI72imEWgem/1zBcI0qu0Uaa7gWCcmeD8Pri
         9Wt4Qk03O2jJ3fD4NcMz7Ak4XhYKMgLICzewSvW/be7fBOUvIeKB+9U/ewh/Fef3Dz3b
         ycfcE1mlaNfXBg7INf5NP3PHM54KJq5AhHkPani7s5sXEQkcsuH3tjCCLvA9Ct39U5/p
         MTcw==
X-Gm-Message-State: AAQBX9crB7B7OdJkEQPXWTyPtRQpOolP57m7oOAuRQd8HkDKNoHsWuzW
	6fjpqlyq1BIX8foXIwQxrBqyBQ==
X-Google-Smtp-Source: AKy350bhK+x7s++84IOWEFVO/gMXDRH9T/LCqh08NqEq24KOmp+VFPEpoLewHAutg0wJysva85qmrQ==
X-Received: by 2002:a5d:550c:0:b0:2d9:5608:ee0 with SMTP id b12-20020a5d550c000000b002d956080ee0mr20654106wrv.69.1680251695160;
        Fri, 31 Mar 2023 01:34:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:34:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:46 +0200
Subject: [PATCH RFC 08/20] dt-bindings: timer: oxsemi,rps-timer: remove
 obsolete bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-8-5bd58fd1dd1f@linaro.org>
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
OX810 and OX820 timer bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/timer/oxsemi,rps-timer.txt      | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt b/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
deleted file mode 100644
index d191612539e8..000000000000
--- a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Oxford Semiconductor OXNAS SoCs Family RPS Timer
-================================================
-
-Required properties:
-- compatible: Should be "oxsemi,ox810se-rps-timer" or "oxsemi,ox820-rps-timer"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : The interrupts of the two timers
-- clocks : The phandle of the timer clock source
-
-example:
-
-timer0: timer@200 {
-	compatible = "oxsemi,ox810se-rps-timer";
-	reg = <0x200 0x40>;
-	clocks = <&rpsclk>;
-	interrupts = <4 5>;
-};

-- 
2.34.1

