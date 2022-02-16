Return-Path: <SRS0=ROrZ=S7=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C72EC433EF
	for <soc@archiver.kernel.org>; Wed, 16 Feb 2022 19:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 527B2C340F0; Wed, 16 Feb 2022 19:31:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C401C004E1;
	Wed, 16 Feb 2022 19:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C401C004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id bg21-20020a05600c3c9500b0035283e7a012so2409598wmb.0;
        Wed, 16 Feb 2022 11:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+4dWWBzc89gjU289LhWcZTRLPciLjGInw1zUvEz5oCE=;
        b=iHYwXJiRt4wvY70pU4ubOsKxxhqlMUxjs9akBSldGU447FDp0u3uoSVN4Zk5ZCISkw
         cJjGUcIV1EKGNcrmRBBycV4PAZGhGZsKn2kyEOPE83u2TY0FYpgftzXUgEnQP9RAG/ko
         YYX4KVLDVzRo5FOz14FtKWDX3cXMci/l2gCKechiNKQOeySSAR3sLiNyhP/N2+IGfS4O
         8DTKxnB1DR9Pkx8KQ2RdPcoPeu5sgA/UsF8fBLQZqTs6qAE1eYk46IX8EhS2TAsTR5sc
         p/K/E9tC/XYjaxegiJGSPSLbOwlYsMslHCwFuz0EcQTgpuW4Qg1qZdDIQ9ojkFVHxu7D
         taQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+4dWWBzc89gjU289LhWcZTRLPciLjGInw1zUvEz5oCE=;
        b=UyuBYq28EKGCT9LE8cJZe6S9WF6jgRAHsVr19aRgVM2L4HUNlCgA0lH9d4E3e5AGMy
         mHBr3emKMHsurdmnb4gCikm1KYEuWQHwJHKSXTxEJSrd+GK1Ty6RbESoPUpNBTzXU5VH
         S2dNuYF8vlZcIpIzrw4Czf5cKwSP2T5+Wdju8fxaIvOfKTbqan/SMljzH+tE0FPuKWHr
         Gr4JgGQUbbL45gSg1Ttc77fNFcXZQZSBy3qcLZNhK/v5fyWFMp6z6yiLYFZZwu2pAsmW
         MFN2Q275n/aJx8woDvuGy2XUvP6ixUV2yqZRvFKtiwis6kPk06tqqQwDWesHzMchGY60
         ww4A==
X-Gm-Message-State: AOAM533l6NkIaLVTx0GwTHFuX7kS2lMEeasb9CeZSt9oVXUXYVwb0Hb3
	kgCeLBRygPagfIdN2UbBaW8=
X-Google-Smtp-Source: ABdhPJzQii5ahIY5zO3sY/vi84bReAdmwM8QKK9RpLicRDuMal9KZ7Vc4jX+B34dtPWl2i6WHHgeOg==
X-Received: by 2002:a1c:1905:0:b0:34f:477e:8850 with SMTP id 5-20020a1c1905000000b0034f477e8850mr2914428wmz.131.1645039898583;
        Wed, 16 Feb 2022 11:31:38 -0800 (PST)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id r1sm2757311wme.3.2022.02.16.11.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 11:31:37 -0800 (PST)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Daniel Palmer <daniel@0x0f.com>,
	Romain Perier <romain.perier@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] ARM: dts: mstar: updates for v5.18 
Date: Wed, 16 Feb 2022 20:31:31 +0100
Message-Id: <20220216193131.59794-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Here's the ARM DTS changes for 5.18:
- mstar: Add definition for cpupll
- mstar: Add new boards
- mstar: Enable gpio support for the ssd20xd SoCs

Regards,
Romain

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://github.com/linux-chenxing/linux.git mstar-dt-next

for you to fetch changes up to 344118c3ee4e9083c678d8393c539daf917e3b33:

  ARM: mstar: Extend opp_table for infinity2m (2022-02-16 19:27:48 +0100)

----------------------------------------------------------------
Daniel Palmer (13):
      ARM: dts: mstar: Set gpio compatible for ssd20xd
      dt-bindings: vendor-prefixes: Add prefix for Miyoo
      dt-bindings: arm: mstar: Add compatible for Miyoo Mini
      ARM: dts: mstar: Add a dts for Miyoo Mini
      dt-bindings: vendor-prefixes: Add prefix for 100ask
      dt-bindings: arm: mstar: Add compatible for 100ask DongShanPiOne
      ARM: dts: mstar: Add board for 100ask DongShanPiOne
      dt-bindings: clk: mstar msc313 cpupll binding description
      ARM: mstar: Add cpupll to base dtsi
      ARM: mstar: Link cpupll to cpu
      ARM: mstar: Link cpupll to second core
      ARM: mstar: Add OPP table for infinity
      ARM: mstar: Add OPP table for infinity3

Romain Perier (3):
      dt-bindings: add vendor prefix for Wireless Tag
      ARM: dts: mstar: Add the Wireless Tag IDO-SBC2D06-V1B-22W
      ARM: mstar: Extend opp_table for infinity2m

 Documentation/devicetree/bindings/arm/mstar/mstar.yaml                         |  4 ++++
 Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml               | 45 +++++++++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml                         |  6 ++++++
 arch/arm/boot/dts/Makefile                                                     |  3 +++
 arch/arm/boot/dts/mstar-infinity.dtsi                                          | 34 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01.dtsi                         | 20 ++++++++++++++++++++
 arch/arm/boot/dts/mstar-infinity2m-ssd202d-100ask-dongshanpione.dts            | 25 +++++++++++++++++++++++++
 arch/arm/boot/dts/mstar-infinity2m-ssd202d-miyoo-mini.dts                      | 25 +++++++++++++++++++++++++
 arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts | 23 +++++++++++++++++++++++
 arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi        | 28 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi                                |  5 +++++
 arch/arm/boot/dts/mstar-infinity2m.dtsi                                        | 17 +++++++++++++++++
 arch/arm/boot/dts/mstar-infinity3.dtsi                                         | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mstar-v7.dtsi                                                |  9 +++++++++
 14 files changed, 302 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-100ask-dongshanpione.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-miyoo-mini.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi

