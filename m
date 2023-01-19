Return-Path: <SRS0=Dfbk=5Q=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E108C004D4
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 18:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 223A8C433A0; Thu, 19 Jan 2023 18:59:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EAAADC433F0;
	Thu, 19 Jan 2023 18:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EAAADC433F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso1965655wmq.5;
        Thu, 19 Jan 2023 10:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zctZ2DfOPnSiD7ZptxyzEXDvaTUy3vq5hDZIJ2ooBA=;
        b=My6BTbzil3RwSeY6SKZ8mEjCQLPA8sVElBsVAqSRdZSqB0wHVzqey9b9QAb8ih0ulw
         Rj59HIWe0fERei0NJSXTJUMhIaQtCA90vgaADnLEMjX60IstGO1Ibm9lga94MIW//wQb
         aBVkX6eQ5mlg28k8QzgMo6G7qUsdyhn79L2UPVhu/lol11tIl4//vjUR27yWYgzZoJ0L
         0tDY3/ZJcfkpSFfvM2FRnFI8n5cr2cIQCFS/LztDvnxA+kxW206mI1oE5AUOH4CbZAEp
         FjpMQtYOsIBX4nm7quPN0/Hx5L9yMb73F9a1CynoUADVlWTsM2UgVdN2GucKAqHdSl8P
         2CFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zctZ2DfOPnSiD7ZptxyzEXDvaTUy3vq5hDZIJ2ooBA=;
        b=3my0IVes7+c00Dsv38nLZz6dsR9QrweyM7kQHcoxRUO92do3xsA3MqeV0O697cvRT5
         dUrE4I58QBVkvN7QdhcSdNyBSN2s25nZyBDVLKFsflkgHp75BeuZ9bol1oGWRAaVEJCz
         8La3sH5E+q0bmwCbBrjI087dm0exdJu99dZpZlOCoWjGslZYvLZ0LQ/DXnurnnsLjiG6
         E8kEKEfgpbBeWIqXpEMtFrr438nni8e0ZMNfIPWGR1JAf95vLU89rwfgrCSesKdprlP/
         7bMTUEIDL4EmM7H2dvRtCG7BKvnWKrRCBMI/9iF3OHyLjPQob1tsSqNcjs69/DEuTGw5
         mJvA==
X-Gm-Message-State: AFqh2kp1HeAtz7qdluY8qG6u+lVl/J9IPnYBjTSwGbw9XDOOHi3/ewq8
	Ip5GRk+s8ApjOAWupfyy1eg=
X-Google-Smtp-Source: AMrXdXvwGx3rijOtSmLzSWCy6TFXUhQR1BI7Fx77MhzLOOjjgleAtnn2wM96S08SIOPNQ/8C+OufGA==
X-Received: by 2002:a05:600c:ccf:b0:3db:f34:e9e0 with SMTP id fk15-20020a05600c0ccf00b003db0f34e9e0mr8086140wmb.35.1674154738190;
        Thu, 19 Jan 2023 10:58:58 -0800 (PST)
Received: from localhost.localdomain ([37.55.203.63])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003daf6e3bc2fsm7757544wmq.1.2023.01.19.10.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 10:58:57 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] Add support for Samsung Galaxy S5 (Exynos)
Date: Thu, 19 Jan 2023 20:58:42 +0200
Message-Id: <20230119185848.156502-1-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung Galaxy S5 (Exynos) is a mobile phone released in 2014.
It has an Exynos5422 platform. This version of Galaxy S5 is only
capable of 3G communication using the Intel modem, while the
LTE version of the device (klte) has a Qualcomm Snapdragon SoC.

Currently, internal eMMC, USB, regulators on a PMIC, and touchscreen
are enabled in the device-tree.

It also has the following peripherals:

- 5" 1080p S6E3FA2 DSI display,
- Cypress StreetFighter touch buttons,
- Broadcom BCM4354 wireless connectivity module,
- Intel XMM6360 3G modem,
- STM32F401 serving as a sensor hub,
- Validify Solutions VFS61 series fingerprint sensor,
- Lattice ICE401M FPGA as an IRDA controller,
- Maxim MAX86900 heart rate sensor,
- NXP PN547 NFC controller,
- Wolfson WM5110 Audio DSP,
- Broadcom BCM4753 GPS radio,
- Maxim MAX77804 PMIC,
- Silicon Image SII8240 MHL controller,
- TI LP5562 LED driver


Markuss Broks (2):
  Documentation: devicetree: bindings: Add compatible for Samsung Galaxy
    S5 (Exynos)
  arm: dts: Add device-tree for Samsung Galaxy S5 (Exynos)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/exynos5422-samsung-k3g.dts  | 676 ++++++++++++++++++
 3 files changed, 678 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5422-samsung-k3g.dts

-- 
2.39.0

