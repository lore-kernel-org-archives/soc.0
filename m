Return-Path: <SRS0=atzn=23=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC7EC433FE
	for <soc@archiver.kernel.org>; Wed, 26 Oct 2022 17:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B022C433D7; Wed, 26 Oct 2022 17:14:00 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5297BC433D6
	for <soc@kernel.org>; Wed, 26 Oct 2022 17:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5297BC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f44.google.com with SMTP id ml12so11037254qvb.0
        for <soc@kernel.org>; Wed, 26 Oct 2022 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lfid/EGLi+19H4uwbSlhnu7zTXD1AOWmoY4BG7Csjzk=;
        b=w2XLX71AJSDs08JMfr4J7+gBpYWssQnKF7mTjcseKI+gsVR28N0HH5u3aGnphmCS3t
         gNXlxecVPdx1Hz4fjH+FuX6G1q1Y5MfQ+h9Kg12DgxFiL3peE/z05GcyQMfLoZBUOWCC
         PEAhRRRZBEg58af5k53cS50uIhMsncd6gmOBaTExPC1cSuxxzvBa4IId0+kUBz//uo7I
         QX1MlyriVfn14H7x0IPs/zCWdGuz0G5ROEKCDeNvJ6EET3oNYrOm0jla+Jfk0f9znfgl
         d+a4togMkqaMYexyeW9uFEPMKAirv7wwiBMPpxVz1wWXT2hyJTZV9UvZrooMPQVXaHYo
         Atng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfid/EGLi+19H4uwbSlhnu7zTXD1AOWmoY4BG7Csjzk=;
        b=kXh6dsg3Gy4azyOKwBzXUZf7WsCR3ooQz5mi6svrrlmDYLI2Sfj6VDUVtUqsyABHW+
         jRTPkz9scTdEIS22ziXRk6cnfDcStB6t6a7qwTwM3mliQlodqQR5iSFRPJ9w3B7dRZC5
         TOxOX9axeT+thVWancEfMEtL7qrfiQozFwcFJIqahIEObbtiaev6ihlFpU+c7TpVEZJD
         lZOaEyIzrju+2+rZPixfGyTVxyTGDWzOCBpHRjrmMpIxMNQ8xX5PZa2x9D9CLWFX0SR2
         COtb/oTWpz2zoR12SodjC37tKXoBi2L2+EeYf2s2ybTU9KF9T5KZx6EZ+jUfbeQKlCUL
         wQuw==
X-Gm-Message-State: ACrzQf0vvS9k8fywtTk7QF4p9MxOQotCVi55eF4wYb2DHdzyC8ypVw1g
	kn04Gn45VQXUMTXRBb45cH46ltKUIM+5Mw==
X-Google-Smtp-Source: AMsMyM4lbAzJKd5Mezh97U/0X3vBaV6OnM4q8/MDRtjUu9awL48NOdaWCLRTpGuqhShNpdeZWhlB0g==
X-Received: by 2002:ad4:5dea:0:b0:4b2:e813:7c35 with SMTP id jn10-20020ad45dea000000b004b2e8137c35mr37120067qvb.74.1666804437178;
        Wed, 26 Oct 2022 10:13:57 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bq14-20020a05622a1c0e00b0039cc64bcb53sm3467002qtb.27.2022.10.26.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 10:13:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.2
Date: Wed, 26 Oct 2022 13:13:54 -0400
Message-Id: <20221026171354.51877-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This includes pieces from late (3rd) pull for v6.1, which did not make that time.

Best regards,
Krzysztof


The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.2

for you to fetch changes up to a11a5debdf4b5b5c24e88a378b53b42cc4fe1bb9:

  dt-bindings: memory-controller: st,stm32: Split off MC properties (2022-10-18 13:05:18 -0400)

----------------------------------------------------------------
Memory controller drivers for v6.2

1. STM32 FMC2:
   a. Correct in bindings the name of property for address
      setup duration. The DTS and driver were already using proper name,
      so it is only alignment of bindings with real usage.
   b. Split off STM32 memory controller bus peripheral properties into
      generic ones (re-usable by multiple memory controllers) and STM32 bus
      peripheral.  This way, the FMC2 controller properties in Micrel
      KSZ8851MLL ethernet controller node can be properly validated.

2. Tegra MC: simplify with DEFINE_SHOW_ATTRIBUTE.

3. Renesas RPC IF: add suppor tfor R-Car Gen4.

4. LPDDR bindings: refactor and extend with description of DDR channels.
   Add also bindings for LPDDR4 and LPDDR5.

The rationale for (4) above - LPDDR bindings changes, wrote by Julius Werner:

"We (Chromium OS) have been trying to find a way to pass LPDDR memory
chip information that is available to the firmware through the FDT
(mostly for userspace informational purposes, for now). We have been
using and expanding the existing "jedec,lpddr2" and "jedec,lpddr3"
bindings for this (e.g. [1]). The goal is to be able to identify the
memory layout of the system (how the parts look like, how they're tied
together, how much capacity there is in total) as accurately as
possible from software-probed values.

...

The problem with this is that each individual LPDDR chip has its own
set of mode registers (per rank) that only describe the density of
that particular chip (rank). The host memory controller may have
multiple channels (each of which is basically an entirely separate set
of physical LPDDR pins on the board), a single channel may be
connected to multiple LPDDR chips (e.g. if the memory controller has
an outgoing 32-bit channel, that channel could be tied to two 16-bit
LPDDR chips by tying the low 16 bits to one and the high 16 bits to
the other), and then each of those chips may offer multiple
independent ranks (which rank is being accessed at a given time is
controlled by a separate chip select pin).

So if we just have one "io-width" and one "density" field in the FDT,
there's no way to figure out how much memory there's actually
connected in total, because that only describes a single LPDDR chip.
Worse, there may be chips where different ranks have different
densities (e.g. a 6GB dual-rank chip with one 4GB and one 2GB rank),
and different channels could theoretically be connected to chips of
completely different manufacturers."

Link: https://lore.kernel.org/r/CAODwPW9E8wWwxbYKyf4_-JFb4F-JSmLR3qOF_iudjX0f9ndF0A@mail.gmail.com

----------------------------------------------------------------
Cong Dang (1):
      memory: renesas-rpc-if: Clear HS bit during hardware initialization

Geert Uytterhoeven (1):
      memory: renesas-rpc-if: Add support for R-Car Gen4

Hai Pham (1):
      dt-bindings: memory: renesas,rpc-if: Document R-Car V4H support

Julius Werner (4):
      dt-bindings: memory: Factor out common properties of LPDDR bindings
      dt-bindings: memory: Add numeric LPDDR compatible string variant
      dt-bindings: memory: Add jedec,lpddr4 and jedec,lpddr5 bindings
      dt-bindings: memory: Add jedec,lpddrX-channel binding

Liu Shixin (4):
      memory: tegra20-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra30-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra210-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra186-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code

Marek Vasut (2):
      dt-bindings: memory-controller: st,stm32: Fix st,fmc2_ebi-cs-write-address-setup-ns
      dt-bindings: memory-controller: st,stm32: Split off MC properties

 .../ddr/jedec,lpddr-channel.yaml                   | 146 +++++++++++++++++++++
 .../memory-controllers/ddr/jedec,lpddr-props.yaml  |  74 +++++++++++
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |  48 ++-----
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |  44 ++-----
 .../memory-controllers/ddr/jedec,lpddr4.yaml       |  35 +++++
 .../memory-controllers/ddr/jedec,lpddr5.yaml       |  46 +++++++
 .../memory-controllers/mc-peripheral-props.yaml    |  38 ++++++
 .../memory-controllers/renesas,rpc-if.yaml         |   5 +
 .../st,stm32-fmc2-ebi-props.yaml                   | 144 ++++++++++++++++++++
 .../memory-controllers/st,stm32-fmc2-ebi.yaml      | 138 +------------------
 .../devicetree/bindings/net/micrel,ks8851.yaml     |   1 +
 drivers/memory/renesas-rpc-if.c                    |  22 +++-
 drivers/memory/tegra/tegra186-emc.c                |  15 +--
 drivers/memory/tegra/tegra20-emc.c                 |  15 +--
 drivers/memory/tegra/tegra210-emc-core.c           |  15 +--
 drivers/memory/tegra/tegra30-emc.c                 |  15 +--
 include/memory/renesas-rpc-if.h                    |   1 +
 17 files changed, 531 insertions(+), 271 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-props.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr4.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr5.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi-props.yaml
