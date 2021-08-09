Return-Path: <SRS0=5t0o=NA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D56C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Aug 2021 00:18:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7607860F42
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Aug 2021 00:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7607860F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jwJwm6sl015sY1t6wL0L2/WyZm3BpsD8+Y9Z7/1xch4=; b=OtJBg59weZh8vP
	FNiV8L6rxg7N4oylgcaaTcbu5gnUrhkqN4wjEKLNP1WQPGQbgHmrRI4E076Va0N8uR5OnJS5PEZ6i
	sG9wRELaT2VkIsI+GjdxcNz6G+pqII88hRLy9RSbH0tR3bK4AdxPGLVhWoK52Z45Z7ShUw9CFYjbi
	MvdOdyepRqdL/zMf9Z6RTcDP7HdF9mIdmK/SO+NQkGzv/jKHCb7nxcKnwaHKC6noIecPtqhkvSU8X
	AhST4mB2FecNN+ppeOJQlsCDqXBKMTKoDhemEp2Sus3OjbfNVc+i+3fsDdJmfDuWBf5/96uZ5l4tb
	/kKFObjAVgjMZ3LGxb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCsxh-00Gmtr-QY; Mon, 09 Aug 2021 00:16:13 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCsxe-00Gmsz-KU
 for linux-arm-kernel@lists.infradead.org; Mon, 09 Aug 2021 00:16:12 +0000
Received: by mail-lf1-x129.google.com with SMTP id z2so13542764lft.1
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 08 Aug 2021 17:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SXCwGy8W/lyhDJAw8LeWy5sqKGzOBkB2ozVZa+PP2Vs=;
 b=JolAq4UmFFsURHJrGBrfI0bS1rBwL8A8RT/8k0HuLQhvC0itcNAWl908S89VfZQ9ho
 1QTjsUffdLYiC4dDLCZXBOkjKMgQHwnizBw4koBc7FHT4Ru25CJc0twOVWtFXKJg1YFi
 QiwUNiyg1y1eC0PBHklj40JeDGM/hDJEK4DvHnDuF4+CXRbWD/vUh7KU5eqYmczB48xZ
 oTsTclkKKmJJ2lR2+5I2SyPcHGXMvonnJ2AVVnAWlgDXh/GJ7h/lWVDUBkHvjUJuvW6O
 Pr/LUfJ956tNjF7TSwUFHvx6c/HJXYtr6UvgfLYHtJstWS25MW1q3MPImzFFkfpPuS3l
 8p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SXCwGy8W/lyhDJAw8LeWy5sqKGzOBkB2ozVZa+PP2Vs=;
 b=W2HbM5rm/g1vcGuekrdgG/NpgLH46JfAOAEZmW4fj39i0PSNX07tmcqSgUmgzqKeeG
 F9NiNgmPyueP0iT6yCaAzE9erjUI+fh6jcGvJLakQjC8mcgL7367X1LTNY2gn+dabBWl
 8aEKaPYmAarX3C5cSjPkfovlfgzpwm5yDZ5vWdXnbehMRGgoqvjQN7FZ5hZqp/bGoNwI
 mhsnu17ckMJrdFx4idOQ6GfnxmBOio5vCJONs5r/K36PnJANDyuowtnDYUwQwTVcWTW4
 /WYP77AqYwcVJ2tFSuf/vXqlmVyi4VbRQn7SNezFdEABOtwAb/8LSodxepnbHkdOEiqX
 sDsA==
X-Gm-Message-State: AOAM530h9eGSZDSGGjgZaW0yDo0bD55ZIUjByosaK7ouJDiq1v1DEqM5
 CBseyATc030sZ4npHzFiLC/lSgwTPqHee2VIbocLaw==
X-Google-Smtp-Source: ABdhPJx74Fr1izS++bpq2IWd4Q6ZWz4T+hWD0gQz0NNxzvm/rjrpHOJIbX+AQfiYJh+Z7mY7L0J6vIcqc7iigdyuzDA=
X-Received: by 2002:a19:7b14:: with SMTP id w20mr15701715lfc.29.1628468168009; 
 Sun, 08 Aug 2021 17:16:08 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Aug 2021 02:15:57 +0200
Message-ID: <CACRpkdY19AvWT--OcmEKbwFue_EcThVs7uZeHkzORten7xj-RA@mail.gmail.com>
Subject: [GIT PULL] IXP4xx DTS updates for v5.15
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_171610_724717_D4AF4F67 
X-CRM114-Status: GOOD (  15.79  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210809001557.Lr669kB8A4QHf97tSyOt-Sx8zHpG0f6B6zFKuhEJJXY@z>

Hi SoC folks,

this is the big DTS update for IXP4xx for kernel v5.15.

There is still some two device trees that need some more work
and some of these may need some additional hammering before
they are perfect(TM) but the basic functionality for all these systems
should be there and we can proceed to delete some boardfiles
as soon as we have successful boots on them all or we get tired of
waiting for someone to test them.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-dts-arm-soc-v5.15-1

for you to fetch changes up to f2841e3ab175da656e9124a9b032daf5a86c7ade:

  ARM: dts: ixp4xx: Add a devicetree for Freecom FSG-3 (2021-08-09
01:55:59 +0200)

----------------------------------------------------------------
IXP4xx DTS file updates for the v5.15 kernel cycle:

- Fix up some (non-urgent) IRQ flags for the PCI buses.

- Add the second UART to the generic ixp4xx.dtsi

- Make use of the new expansion bus driver in all device
  trees with e.g. flash memory on the expansion bus.

- Adds the CF card slot to the Gateworks GW2358.

- Add new device trees for:
  - Iomega NAS 100D
  - D-Link DSM-G600
  - Netgear WG302v2
  - Arcom Vulcan
  - Gateworks Avila GW2348
  - Intel IXPD425 and siblings
  - Coyote and IXDPG425
  - Linksys WRV54G

----------------------------------------------------------------
Linus Walleij (14):
      ARM: dts: ixp4xx: Fix up bad interrupt flags
      ARM: dts: ixp4xx: Add devicetree for Iomega NAS 100D
      ARM: dts: ixp4xx: Move EPBX100 flash to external bus node
      ARM: dts: ixp4xx: Add devicetree for D-Link DSM-G600 rev A
      ARM: dts: ixp4xx: Add second UART
      ARM: dts: ixp4xx: Use the expansion bus
      ARM: dts: ixp4xx: Add devicetree for Netgear WG302v2
      ARM: dts: ixp4xx: Add Arcom Vulcan device tree
      ARM: dts: ixp4xx: Add Gateworks Avila GW2348 device tree
      ARM: dts: ixp4xx: Add CF to GW2358
      ARM: dts: ixp4xx: Add Intel IXDP425 etc reference designs
      ARM: dts: ixp4xx: Add device trees for Coyote and IXDPG425
      ARM: dts: ixp4xx: Add devicetree for Linksys WRV54G
      ARM: dts: ixp4xx: Add a devicetree for Freecom FSG-3

 arch/arm/boot/dts/Makefile                         |  14 +-
 arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts      | 110 +++++++++++++
 arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts    | 167 ++++++++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts  | 145 +++++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts   | 158 +++++++++++++++++++
 .../arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts | 172 ++++++++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts  | 146 +++++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-ixdp425.dts         |  72 +++++++++
 arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts        | 125 +++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts   |  30 ++--
 arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts  | 173 +++++++++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-netgear-wg302v2.dts |  95 +++++++++++
 .../arm/boot/dts/intel-ixp42x-welltech-epbx100.dts |  84 +++++-----
 arch/arm/boot/dts/intel-ixp42x.dtsi                |   5 +
 .../arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts |  81 ++++++----
 arch/arm/boot/dts/intel-ixp43x-kixrp435.dts        |  68 ++++++++
 arch/arm/boot/dts/intel-ixp43x.dtsi                |   6 +
 arch/arm/boot/dts/intel-ixp45x-ixp46x.dtsi         |  11 ++
 arch/arm/boot/dts/intel-ixp46x-ixdp465.dts         |  38 +++++
 .../boot/dts/intel-ixp4xx-reference-design.dtsi    | 132 ++++++++++++++++
 arch/arm/boot/dts/intel-ixp4xx.dtsi                |  44 +++++-
 21 files changed, 1784 insertions(+), 92 deletions(-)
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-ixdp425.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-netgear-wg302v2.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp43x-kixrp435.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp46x-ixdp465.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp4xx-reference-design.dtsi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
