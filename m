Return-Path: <SRS0=dB9Q=EP=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE41C6FA8F
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 09:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5986BC433C9; Wed, 30 Aug 2023 09:04:24 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E483C433C8;
	Wed, 30 Aug 2023 09:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7E483C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-48cfdfa7893so2328606e0c.0;
        Wed, 30 Aug 2023 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693386262; x=1693991062; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zRFnOrEZvLN5kMlEOUmKO68YNnlEwR47/rOgrclL5cI=;
        b=oHjenqkJusiTlKdRwzyllDsCciqMaZC/oee/AkgpkZKxeOghH5y5Vv9EIrKfBBv+nc
         tASvMBPVTRL6L0vV5h/rD8kcMroCll2CviAWdkhVP+6Qtok/zkAiouS0BIL7Xeb4qBJF
         GcJOW3DRAAtkjj+DtyJIgS4KXOcAEeLfhUeU+xBVEDuYuwfEzcyTjmULC5EO7kEcKqRf
         U/9Y1E7ZMu8Uf42EEvQdx42lSfvVwDhZvYjhknEtEMxHdg1J70ewilxo0MVeWOKScrmv
         NUwTOBjJYS70mZYX/aZl/7ZbxAW16YhgXXkfWuT/qRatzXTQPGBpdAnzTd9aeAd70MHF
         6mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693386262; x=1693991062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRFnOrEZvLN5kMlEOUmKO68YNnlEwR47/rOgrclL5cI=;
        b=ZOGfp0rKnNP2XzqoBmXbafgwngzaMx7Qq+dlZjbm+UbcANRYcHkUI7QMFfOlRw/9Jt
         e4sx4FHr0TwseoJoUVshrY/tocjTlnV9et5taPezAANs5sbCRInpPNx2uX3pq2PRxO49
         P6ZobCrEbWZg45xEXP9i/VWo+rtWmwbCqDruCFFnDSJgGYJfQZk4cVBPo5Gw3+EbU9k0
         VTfr308FW+cEEf/GaQTNqdFAQ9jYoOwLTnmZCqr2KepI1/+UyxbO2f/cJVoEDpWVBfmx
         jkOpAtais7fvDi2G1h1AVytzHTuNMu5SOE4VlFY7n9quvdPZhIs0AwDoMhFFxpocd2MD
         Q24w==
X-Gm-Message-State: AOJu0YwYZlkTfs70wkG/2y5N2YM6nCYdpENqqUzk2hf3VUqAOvv6TCzi
	DfX1OlORgvhel1m+kT5zOug=
X-Google-Smtp-Source: AGHT+IFRF/QDUiw8HkrwOVzahLlEG5guebup/jA0oCLgscvJyaeOR/MUVQPM2c8W1nVG0Tzyudffzw==
X-Received: by 2002:a1f:4a02:0:b0:48d:4b:66df with SMTP id x2-20020a1f4a02000000b0048d004b66dfmr1520456vka.0.1693386262097;
        Wed, 30 Aug 2023 02:04:22 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id x4-20020a656aa4000000b00553dcfc2179sm9263226pgu.52.2023.08.30.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:04:21 -0700 (PDT)
From: peteryin <peteryin.openbmc@gmail.com>
List-Id: <soc.lore.kernel.org>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: cosmo.chou@quantatw.com,
	potin.lai@quantatw.com,
	daniel-hsu@quantatw.com,
	peteryin <peteryin.openbmc@gmail.com>
Subject: [PATCH v4 0/2] ARM: dts: aspeed:Minerva:
Date: Wed, 30 Aug 2023 17:02:09 +0800
Message-Id: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
v3 line : https://lore.kernel.org/lkml/20230830025133.3756506-1-peteryin.openbmc@gmail.com/

Change log:

v4:
    1.seprate dts document.

v3:
    1.Fixed commit description.
    2.Add sgpio line name to sgpioP.
    3.Add ipmb debug card bus.

v2:
    1.Add facebook,minerva-bmc in aspeed.yaml
    2.Use stdout-path
    3.Add Makefile

v1:
    1. Create minerva dts file.

*** BLURB HERE ***

peteryin (2):
  ARM: dts: aspeed: Minerva: Add Facebook Minerva (AST2600) BMC
  dt-bindings: arm: aspeed: add Meta Minerva board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 385 ++++++++++++++++++
 3 files changed, 387 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts

-- 
2.25.1

