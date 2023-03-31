Return-Path: <SRS0=bmCH=7X=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D303C77B60
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 08:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F09E9C4332A; Fri, 31 Mar 2023 08:35:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 218BCC43323
	for <soc@kernel.org>; Fri, 31 Mar 2023 08:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 218BCC43323
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id q19so18517706wrc.5
        for <soc@kernel.org>; Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5/X3/1Tx5hLaqv79uU7wuySkv7lfnq2I4RAVqFuiIk=;
        b=JRJQX3qf6nbWRRhjPQNrARTIyJRjN85WbOZTRhfjLkq95loPYQtmcz9uuRtmXD+gF0
         pbjlvjWUpM5s35eLwCfaIEAjNdqCVJqUbIoJ0QQ+NUMzZjtV7Kxbb9qHdGemp2rn+kMY
         Iogew4j3vSCvnnTWMPSv3pUmltFB4eJLvdhtB7DgxhbLKFxRNR7Kae+MW+amWDOuGH+K
         0TIBTDavzQ/ATWYsYCgjlgvssAy0cZ+yRGjNI/IOQWRKqbCot7nTCcwYctdEE3g9Fhow
         0GHMU5sij/cF06KleMdx4uNj5gz06aYrtqcKb/iZZ8GuVraLGpO2QvwZWp3MdMXVyQ6A
         wvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5/X3/1Tx5hLaqv79uU7wuySkv7lfnq2I4RAVqFuiIk=;
        b=zgZC8NmG4tuCIQC/4uKvWtfIajCXuIDRgo4STz204uwS8w52r2whMb5VHHImRGZDC4
         faODwOZJxaaCi6T7bCSvplF0OesUClRnsUHMjvVSdWTgwzvptkysL5L9rPRdV4pndgJS
         DOlQKfa+e5sIgCNLV2puGNbl9Enal3YtNK9QyJnkHT3T/Ek7NfplLtnAZQvNrP7AgX6p
         p2fBchnwrlkP12QHJpTfCOxcd9GGROf5psV5bei/vubyvZfv1To7tkM1DuNC5NYbwsdc
         xcxXEb+tKivuMPW8xPWGxNj+UeKrCuK9PnrSBwmlmv4SUdW4D+z3gw9xWsGM/BJSJM70
         bt3w==
X-Gm-Message-State: AAQBX9eJBTo4oMOMWkb1KqUEF8CA03h3lTKo0fX+JMBCpHtkk9X/PgDs
	5sxJvAXO2mMQTQcAOsxFh24XGA==
X-Google-Smtp-Source: AKy350aYemXoWmOPKcUW9zRssljXvnRo5Q8xdKbF8v8OuSCqLpxJ51RrFOLM7mEYYMCY0HOKI4STBA==
X-Received: by 2002:adf:f04b:0:b0:2d8:57b1:db6c with SMTP id t11-20020adff04b000000b002d857b1db6cmr18990831wro.9.1680251709411;
        Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:56 +0200
Subject: [PATCH RFC 18/20] irqchip: irq-versatile-fpga: remove obsolete
 oxnas compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-18-5bd58fd1dd1f@linaro.org>
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
and since no new features will ever be added upstream, remove support
for OX810 and OX820 IRQ controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/irqchip/irq-versatile-fpga.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index ba543ed9c154..5018a06060e6 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -242,5 +242,4 @@ static int __init fpga_irq_of_init(struct device_node *node,
 }
 IRQCHIP_DECLARE(arm_fpga, "arm,versatile-fpga-irq", fpga_irq_of_init);
 IRQCHIP_DECLARE(arm_fpga_sic, "arm,versatile-sic", fpga_irq_of_init);
-IRQCHIP_DECLARE(ox810se_rps, "oxsemi,ox810se-rps-irq", fpga_irq_of_init);
 #endif

-- 
2.34.1

