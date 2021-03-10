Return-Path: <SRS0=xqHC=II=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F83C433E9
	for <soc@archiver.kernel.org>; Wed, 10 Mar 2021 08:33:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DF57F65004; Wed, 10 Mar 2021 08:33:33 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B3E064FF4
	for <soc@kernel.org>; Wed, 10 Mar 2021 08:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B3E064FF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJuHb-0003GD-98
	for soc@kernel.org; Wed, 10 Mar 2021 08:33:31 +0000
Received: by mail-wr1-f72.google.com with SMTP id s10so7655118wre.0
        for <soc@kernel.org>; Wed, 10 Mar 2021 00:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RZxvgYZhRwx3vtBKrExOY7yB1Rao/D3y6ddDmt53T8k=;
        b=GFpkjn0MCGNHuJColZM9SMzf3x/HfRp4eBkOJdNwZrKVa5y76w3ZzW9xzHOO9B+3Fm
         01hhAGeHua2DH/Tnh7WOWi+WdsKqlIVHul6AfhB8NjVhy/ufrRI5zp0tIuKDTEfY7Frh
         VLuj8gM4wNPcbUEtge2Rb7eqXAJvp8UzHdSUaz/EjVXMk7G9Q6tFtt7ahXoWs+UKv0LD
         /0J8XS3GjNfurNOLZ+gGKAxTfmkbcGXfn4QIxU8ym2xaGLVIedKpXBEY3Zl+Gf8I6NKM
         9G8wclRnrupxTtN53dLE7xIWjWqeA3NvRvKJFNa55+C9UpXpFWi5cRS799IbqxDSKD40
         PeQw==
X-Gm-Message-State: AOAM533odrlHuroojY2oPHsX0XqgsWojYWc2PpEQJMywdzGH71FVc6Le
	H28QKmp3iTWnVeBj2qROqAvyXCOW6GBaoShy+/84WBaisImJYXDtlfnuF48vpAiJK5KQ38cNYHT
	PQaaHXzTyLlFbul0nUxKwLe8=
X-Received: by 2002:a1c:f406:: with SMTP id z6mr2225379wma.24.1615365211049;
        Wed, 10 Mar 2021 00:33:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+uPRMBgFfoVCHx5kur24yVECBMZDDtyDQfyluEn8gAohH3gku3X1wAI4MIWrYIO0FNDk1jQ==
X-Received: by 2002:a1c:f406:: with SMTP id z6mr2225348wma.24.1615365210807;
        Wed, 10 Mar 2021 00:33:30 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id m17sm28675495wrx.92.2021.03.10.00.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 00:33:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Lee Jones <lee.jones@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RFC v2 0/5] arm64 / clk: socfpga: simplifying, cleanups and compile testing
Date: Wed, 10 Mar 2021 09:33:22 +0100
Message-Id: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

All three Intel arm64 SoCFPGA architectures (Agilex, N5X and Stratix 10)
are basically flavors/platforms of the same architecture.  At least from
the Linux point of view.  Up to a point that N5X and Agilex share DTSI.
Having three top-level architectures for the same one barely makes
sense and complicates driver selection.

Try to unify them.

Changes since v1:
=================
1. New patch 3/5: arm64: socfpga: rename ARCH_STRATIX10 to ARCH_SOCFPGA64
2. New patch 4/5: arm64: intel: merge Agilex and N5X into ARCH_SOCFPGA64
3. Fix build issue reported by kernel test robot (with ARCH_STRATIX10
   and COMPILE_TEST but without selecting some of the clocks).

I tested compile builds on few configurations, so I hope kbuild 0-day
will check more options (please give it few days on the lists).

Best regards,
Krzysztof


Krzysztof Kozlowski (5):
  clk: socfpga: allow building N5X clocks with ARCH_N5X
  clk: socfpga: build together Stratix 10, Agilex and N5X clock drivers
  arm64: socfpga: rename ARCH_STRATIX10 to ARCH_SOCFPGA64
  arm64: intel: merge Agilex and N5X into ARCH_SOCFPGA64
  clk: socfpga: allow compile testing of Stratix 10 / Agilex clocks

 arch/arm64/Kconfig.platforms                | 17 ++++-------------
 arch/arm64/boot/dts/altera/Makefile         |  2 +-
 arch/arm64/boot/dts/intel/Makefile          |  6 +++---
 arch/arm64/configs/defconfig                |  3 +--
 drivers/clk/Kconfig                         |  1 +
 drivers/clk/Makefile                        |  4 +---
 drivers/clk/socfpga/Kconfig                 | 17 +++++++++++++++++
 drivers/clk/socfpga/Makefile                |  7 +++----
 drivers/edac/Kconfig                        |  2 +-
 drivers/edac/altera_edac.c                  | 10 +++++-----
 drivers/firmware/Kconfig                    |  2 +-
 drivers/fpga/Kconfig                        |  2 +-
 drivers/mfd/Kconfig                         |  2 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig |  4 ++--
 drivers/reset/Kconfig                       |  2 +-
 15 files changed, 43 insertions(+), 38 deletions(-)
 create mode 100644 drivers/clk/socfpga/Kconfig

-- 
2.25.1

