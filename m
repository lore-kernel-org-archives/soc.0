Return-Path: <SRS0=WXVb=XQ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38929C43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 205A4C341CF; Mon, 11 Jul 2022 16:45:13 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49215C341CA;
	Mon, 11 Jul 2022 16:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49215C341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 72so5250862pge.0;
        Mon, 11 Jul 2022 09:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MIuswtQIknunxRlx2LZT8SAtUohtCTMYbduVcp0c5kc=;
        b=JwT9f8B4rPVYRrR/4Sz6VZZpAeOWfArYM8hzDlzZzQFKXqb3mLlmDO27rt9AWxWgbf
         ZxFHE+pssUKPOb8i0Z3SClP1lsxUveZybVgSY17lzNtMkeiCykVOStylyAD0OD14ajgZ
         +GblVk6QDKee0cfQwOC74ZccF+G+oaz3cwn5/TVG/fwr7b/CNAqKmytodhE9unwnSIAY
         mtr/BeFGqum0oEsSwOCDdchy7P12aJO7NrArnLe667mL0nS1AnY7LcYq+qo7nzoOG+R0
         kYGXuthWfVBLGYdFyD0MZnKU9C4eRn1iej4Chc4VeksLhSwaqZtye+CHwvPp7bDD8Hc0
         sz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MIuswtQIknunxRlx2LZT8SAtUohtCTMYbduVcp0c5kc=;
        b=TJX7OfFJJ4kcp8QbnlMs9YGk6mH9SAenERjJBL+satM5xR5Xa1uoDH4hkdsWzbdWSo
         m6TZ4FiYQf+rR4ghzAH8qV80O/DfaNTuEGzXpOfrCRm4S95m1xwlRRjLPVZMo5qY7fBa
         59ZrGkeprQ2ydMR0oJV04iNEqVWWBZDjULgm3EnPIjXh+qJ47b1i8J1tURYRbz1pwDsT
         ftsyVwNnGF+Q+Y77zmfG0FRpTqzJsYBtxroAYEgw0CoMYjA6HYX2Wrzxkf3fwH8p8ov/
         MCfKGPsjrLJ6EeL2OhT+vDUroBSephxp/48rQGjT0SZ3rfDYbqNFiYp8g2wN9z0X1VTL
         znRw==
X-Gm-Message-State: AJIora/aVMwgFqpQgyAZ5sX4czu+t3Lmu2i6waACyOZzCUmv1zUsK3Cg
	abAqbPJq1E2fa2daO38i5135xQsNEy4=
X-Google-Smtp-Source: AGRyM1vzNLISRp0zb82WwdizHZ1POYqZ8dP335+Xl3z0bxL9ngYw5OOkx7lJvdlPUGHtgEHgHGFHbg==
X-Received: by 2002:a63:480b:0:b0:40d:d4d1:7daf with SMTP id v11-20020a63480b000000b0040dd4d17dafmr16769949pga.512.1657557911307;
        Mon, 11 Jul 2022 09:45:11 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v3-20020aa799c3000000b0052ab9f1fe45sm4961266pfi.120.2022.07.11.09.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 09:45:10 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Anand Gore <anand.gore@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/7] Broadcom devicetree-arm64 changes for 5.20
Date: Mon, 11 Jul 2022 09:44:48 -0700
Message-Id: <20220711164451.3542127-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711164451.3542127-1-f.fainelli@gmail.com>
References: <20220711164451.3542127-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.20/devicetree-arm64

for you to fetch changes up to eab6bb0994b806525fc5e362e8b865f61c4a9e20:

  arm64: dts: Add DTS files for bcmbca SoC BCM6813 (2022-06-15 10:40:02 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SocS Device Tree
updates for 5.20, please pull the following:

- William adds the ARCH_BCMBCA Kconfig entry to follow the ARM 32-bit
  counter part and adds basic support for these DSL/PON SoCs: 63158,
  4912, 63146, 6856, 6813

- Anand adds basic support for the 6858 SoC

- Krzysztof fixes a missing space between a property name and its value
  in a number of DTS files

----------------------------------------------------------------
Anand Gore (1):
      ARM64: dts: Add DTS files for bcmbca SoC BCM6858

Krzysztof Kozlowski (1):
      arm64: dts: broadcom: adjust whitespace around '='

William Zhang (6):
      arm64: bcmbca: add arch bcmbca machine entry
      arm64: dts: Add DTS files for bcmbca SoC BCM63158
      arm64: dts: Add DTS files for bcmbca SoC BCM4912
      arm64: dts: Add DTS files for bcmbca SoC BCM63146
      arm64: dts: Add DTS files for bcmbca SoC BCM6856
      arm64: dts: Add DTS files for bcmbca SoC BCM6813

 arch/arm64/Kconfig.platforms                       |   9 ++
 arch/arm64/boot/dts/broadcom/Makefile              |   1 +
 arch/arm64/boot/dts/broadcom/bcmbca/Makefile       |   7 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi   | 128 +++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63146.dtsi  | 110 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi  | 128 +++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi   | 128 +++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi   | 103 +++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi   | 121 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm94912.dts   |  30 +++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm963146.dts  |  30 +++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dts  |  30 +++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm96813.dts   |  30 +++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dts   |  30 +++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dts   |  30 +++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   2 +-
 16 files changed, 916 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/Makefile
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm63146.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm94912.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm963146.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm96813.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dts
