Return-Path: <SRS0=bmCH=7X=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC52C77B6F
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 08:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3422FC433A4; Fri, 31 Mar 2023 08:35:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0E4EC4332B
	for <soc@kernel.org>; Fri, 31 Mar 2023 08:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0E4EC4332B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id i9so21597939wrp.3
        for <soc@kernel.org>; Fri, 31 Mar 2023 01:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfco65EqQfHZJxTK1kxWA78ZamfCWUWZKPHL0Bp1xH4=;
        b=SqOTTD4EeiNGBszaNOzDLqviTo9jI0ZhAKSeRT3l5LeAaBvHoV1VbnUiNYxQjrF5S5
         UUujdXiQCveG/Iy+PsAnxgkKeorfMhJAmQ2J1mYgkX8eg020zgf6nL/f/EExNZqkpRUx
         XcdDXQ5bnCtHLOcSYFcdnuXeE9b+QxZG2/mH1nfNDIA7j4YtTmk1Al3zY4k3rR5puTQU
         l2NatRLdUPmY31rjFWxbQkcwmbAI5FXvErZOPP+aB0G/SM/9J1u6rMIIFKuvCVysu2q3
         VMSa4Jt860AaDpWD2pjM4fb8tv0/a2sxwe3l0seQy7PhpYace6EYCoZskI6VrPmid9Ji
         W8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lfco65EqQfHZJxTK1kxWA78ZamfCWUWZKPHL0Bp1xH4=;
        b=OkbcTovpSJA7NtjEbPZpDw0//pkfGIDmGqx9RLt+7MvsBEcSbpqSisClp2Dy96VMB0
         5N8DZPQeWugwyS9TQlEYPUbrT/Z53PgFO+7OdgKXNNwHXo+NJv80pYSdJtI+HaCxu5qa
         7aT8PLIpqxAfeV/CF5aoC6RES4v7BEP+vkaltl2S7i0ka0q2JAyBJkyvlwpCD+rC01wX
         TDbCzmB+lAmKjE1VLpRFhWx0fO25/+jFrJwuvpF9vNJmA0Uz3Ju5bVW3trN/qToOA2ZI
         EVc/yKpPQUwF6xl4pUgpBFvDpAnbtLOmUyqvodGstllA6vJGc8Ps+m0wtX7euVLOKhCg
         8Q2Q==
X-Gm-Message-State: AAQBX9dkoluMyGDMbnC4HJdfcbYTShFyHq1g94sNfOEDlst3Vi/xrFjR
	m0ZuGRL/86878299HwoG5iXtgA==
X-Google-Smtp-Source: AKy350YfLJVXZRDyUNg84s43q40a428Zli09J7iKvodwvFp3SatohdxhFRTG46DXiPWYNxkqIkfYZA==
X-Received: by 2002:adf:f348:0:b0:2d7:9206:488d with SMTP id e8-20020adff348000000b002d79206488dmr20315336wrp.36.1680251712356;
        Fri, 31 Mar 2023 01:35:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:58 +0200
Subject: [PATCH RFC 20/20] MAINTAINERS: remove OXNAS entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-20-5bd58fd1dd1f@linaro.org>
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
and since no new features will ever be added upstream, remove MAINTAINERS
entry for OXNAS files.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 MAINTAINERS | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d5bc223f305..c9a29d839ea2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2551,16 +2551,6 @@ S:	Maintained
 W:	http://www.digriz.org.uk/ts78xx/kernel
 F:	arch/arm/mach-orion5x/ts78xx-*
 
-ARM/OXNAS platform support
-M:	Neil Armstrong <neil.armstrong@linaro.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-oxnas@groups.io (moderated for non-subscribers)
-S:	Maintained
-F:	arch/arm/boot/dts/ox8*.dts*
-F:	arch/arm/mach-oxnas/
-F:	drivers/power/reset/oxnas-restart.c
-N:	oxnas
-
 ARM/QUALCOMM SUPPORT
 M:	Andy Gross <agross@kernel.org>
 M:	Bjorn Andersson <andersson@kernel.org>

-- 
2.34.1

