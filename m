Return-Path: <SRS0=piyp=LE=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EA5C48BDF
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 23:28:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 138EB613F5; Thu, 10 Jun 2021 23:28:38 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA430613E9;
	Thu, 10 Jun 2021 23:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA430613E9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wm1-f49.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso7560765wmh.4;
        Thu, 10 Jun 2021 16:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fY39Ptk0sw5qXBAnjzWmLKrEgOiYPHLxRS1HTe3/ra8=;
        b=a/MiVDn1JdEQF9wRpjW4aEDvLn1WR4dUr3dVfjAg2cV8yAdEsdR/hsZXp3Qxwq21Sd
         4TI/x+j1vfVV5nfCkZe/1T6aPR+FAYy3wjVksI/ryDaU5Y7oyWLd46Bgi71YqG1pC/tv
         Sft8hMp55HpAxY15hgXgls8SpkoWrsV3I4g9FU1uDIQ8vuNEH4BF/dTOqshCjrPOk22V
         CTHZai335bSowLt1rNe7zUYkrGBMSkVtiJp67O7cCvA052LmtQTGXo067npFVKPZQkss
         IoZVnZXCLAbXcsmTGV3mVqp6AVlw17PUr7w/iLvuhLjf61YtWsjCCImhia2CbSCpiEKj
         1z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fY39Ptk0sw5qXBAnjzWmLKrEgOiYPHLxRS1HTe3/ra8=;
        b=QwFviPAqUXGGLcmecWxBULUHFXkuPD9b/oUJOy7tFa7iv8KF9RBy/rZod1z10z1ewa
         9322SwdQBHekFIZ/RjSypDwGEOshmF43bzenXo8eTVNqvmt2gEjqobyxi1XwXZEIz2d8
         jTs7WWYvvuQggLcBUtVUOf1UASeetqp1FsS9K07y8KJW0KIXGKe9oTMifSkHwukR3Ogi
         8am3DG4w3RgEMvPG4m7h5QMtzd2gjCoBrih9TQaFpTsviYLbxyiHL2c5nhBR2gxFVNnf
         S95FR7QBPO+vdmRMpKz9+BNW69XxqvMqBC+ZWMxtu89P/NVwjwEd2Y4bwENtbaKWvj77
         Br9A==
X-Gm-Message-State: AOAM530sWF0iY2Cf1y8cmb5k4DfMcYrsIpxhZGVfPiDpbCume48Riw76
	AGiQudqXGwx2bQPeaMFdYaY=
X-Google-Smtp-Source: ABdhPJy+s2yIZkcJEiGe84bEKlWeqiQEB0JakPzVhGXnIuj7SAMYOp9sVBFq4Je+XRMXvzk1PZe56w==
X-Received: by 2002:a1c:ddc3:: with SMTP id u186mr17327237wmg.44.1623367716526;
        Thu, 10 Jun 2021 16:28:36 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id o7sm5433527wro.76.2021.06.10.16.28.35
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 10 Jun 2021 16:28:36 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/5] ARM: dts: NSP: Add Meraki MX64/MX65 to Makefile
Date: Fri, 11 Jun 2021 00:27:14 +0100
Message-Id: <20210610232727.1383117-3-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610232727.1383117-1-mnhagan88@gmail.com>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Makefile entries for the Meraki MX64/MX65 series devices.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f8f09c5066e7..033d9604db60 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -154,6 +154,12 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
 	bcm958525xmc.dtb \
 	bcm958622hr.dtb \
 	bcm958623hr.dtb \
+	bcm958625-meraki-mx64.dtb \
+	bcm958625-meraki-mx64-a0.dtb \
+	bcm958625-meraki-mx64w.dtb \
+	bcm958625-meraki-mx64w-a0.dtb \
+	bcm958625-meraki-mx65.dtb \
+	bcm958625-meraki-mx65w.dtb \
 	bcm958625hr.dtb \
 	bcm988312hr.dtb \
 	bcm958625k.dtb
-- 
2.26.3

