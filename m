Return-Path: <SRS0=bmCH=7X=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A38EC77B6E
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 08:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A8E4C433A0; Fri, 31 Mar 2023 08:35:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 566EAC433A4
	for <soc@kernel.org>; Fri, 31 Mar 2023 08:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 566EAC433A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id r11so21577842wrr.12
        for <soc@kernel.org>; Fri, 31 Mar 2023 01:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5S8DS7MwX0eSMjECdngcIupXRvdIfBFKmoZZhwAEom0=;
        b=tnfnYtQdWHkb+imXQ5cdS0qz5r299xH4jhkGPSnNJ2hyhvDgzphIZ+JrRafIpmAM9p
         AYZ75Po2o2Z0SH8MZ2PJlbzGo/n61VmC8VnuZ2JuYUqUV2XrQWwn3l07chxkJqnSXjPP
         5f1CEgxiSVpvn2h1nzoHxbtdANfxsiKSj6kGo5Gn+zXB98k4Ll0nq2FYEQMcqg9qKycl
         SaFHJ31SA4vogcCrvZnJv61gFMikTvHDNS7J+H+by9jPFBPOVQx/EaIZbfwOl1I2Oqqc
         0h4V53L2ZH7bwDuc5XrqWaqkZAcFFMRby1EyH50XYnZmPSj9SLb8FRQWZxdM2RBBTVHm
         BCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S8DS7MwX0eSMjECdngcIupXRvdIfBFKmoZZhwAEom0=;
        b=K3GSKj0Qp5wpnMKJFwQ9GH5S3MMTVk9hdPv7e9jyZayuBM2xNwX+qgLhD9cg9gjArS
         lWgfuqEMM1ojl9Jz4rr4+gwwEYFzunUtCx+J6bpVwSS7iluKf8cuJMw4lsxBTz1uf6vz
         ruwTFsZcIbXF5CRvXIatSI+CtBBswN1cbniFWTvwkFZ7w1e3MFRVkxjMzYFkqxTttEI8
         KlUftNwmJNy5uU8IL1ljpvzIknWMXu7y0yO7zLeLHI/8GdG+75OvhanZeQv2IHHZALJD
         T/QZDPkdy0GWkivlPVv5uxas+vOul0c+iO/+ghCDmg8+pueUFHz+d8EDK3tRoMcqZYXx
         zyZg==
X-Gm-Message-State: AAQBX9cobfUPEGDD3ZFxyGQKVaLMacP+LXgffg03S7+LJVsWNQp76pyJ
	cEOKZbQWVTIscxHVGQRC0nQ/Gg==
X-Google-Smtp-Source: AKy350bVO2xvOdcujlPweNogfEF/aS/RwRjRN7oD1rhoaEfLODuiLQvDCF4zUxggrf8oM3l2ae/tZg==
X-Received: by 2002:adf:fa09:0:b0:2dd:cb8:2299 with SMTP id m9-20020adffa09000000b002dd0cb82299mr20102833wrr.11.1680251710872;
        Fri, 31 Mar 2023 01:35:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:57 +0200
Subject: [PATCH RFC 19/20] dt-bindings: interrupt-controller:
 arm,versatile-fpga-irq: mark oxnas compatible as deprecated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-19-5bd58fd1dd1f@linaro.org>
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
and since no new features will ever be added upstream, mark the
OX810 and OX820 IRQ compatible as deprecated.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/interrupt-controller/arm,versatile-fpga-irq.txt          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
index 2a1d16bdf834..ea939f54c5eb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
@@ -6,7 +6,7 @@ controllers are OR:ed together and fed to the CPU tile's IRQ input. Each
 instance can handle up to 32 interrupts.
 
 Required properties:
-- compatible: "arm,versatile-fpga-irq" or "oxsemi,ox810se-rps-irq"
+- compatible: "arm,versatile-fpga-irq"
 - interrupt-controller: Identifies the node as an interrupt controller
 - #interrupt-cells: The number of cells to define the interrupts.  Must be 1
   as the FPGA IRQ controller has no configuration options for interrupt
@@ -19,6 +19,8 @@ Required properties:
   the system till not make it possible for devices to request these
   interrupts.
 
+The "oxsemi,ox810se-rps-irq" compatible is deprecated.
+
 Example:
 
 pic: pic@14000000 {

-- 
2.34.1

