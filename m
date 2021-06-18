Return-Path: <SRS0=npKQ=LM=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFB8C48BE8
	for <soc@archiver.kernel.org>; Fri, 18 Jun 2021 08:50:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 30CED6120D; Fri, 18 Jun 2021 08:50:44 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B384613B9
	for <soc@kernel.org>; Fri, 18 Jun 2021 08:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B384613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f182.google.com with SMTP id d2so12978871ljj.11
        for <soc@kernel.org>; Fri, 18 Jun 2021 01:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=anroGosKFEr0mZTlL1v8sj69BRdrreAQ29eSuww32Mc=;
        b=iRROawemmphCbsUqsu7mW4Nt8gazxfFPyR2fzRGrzcfxlz780rWVHnDipn2qP2cW7Y
         LibCaZ4EXfmnEbvfkKINRt/QNa/8VjOu1V4yZDBiB9XMvuFLBUkdzpid2yC+7Ly81Zcq
         GyMupw93UfOEzpIJXY4zQfecrpiNfNedcmJxKExllIYbfHZUY2kcJrCT3340tfeMfbtd
         ii2EtrPhCDMhZ0Rg8WEdgbYQpeWvLC7Nn9xFdtzL6Zwu5w9cJaF3UtHvNH4/I3CPma/b
         tnN+19ztcUaXdZeOpyH+8eoZkHP8LWhLTATVXGOiG/iNJmqz4vTsuv2M8W+tBNfZkRSM
         i1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=anroGosKFEr0mZTlL1v8sj69BRdrreAQ29eSuww32Mc=;
        b=b+9wSGmV2yUAOgOJRgeZcrt5uchtZohMIy8RUgabx1NbtpbKmQURGgim21JZvY7CK1
         9MkPHDPHTOLsYAiTqFjOyP7mh1wTAl3fw+B5+o59SboU1hi68ACv9Loa3s1oeHMVkezE
         lA4oSmvbMAMtlU+TXlq8xnp46q7z8PovsLnPXMnewErwNP3yakx5k/qGCfdIJPciVea8
         cuydlN83aOP4rT6F3qYqrfyR3i7aCzcDR+mGbIjL4gpY29HByPEVe9C1JFqRu1KKJzLK
         /qVQP0ZVv4vTvOxvyfn0GvtpLSTsqr7ADiOPa72k+f0sABnwJOtSQxn9ityGzlM/zxxk
         pL0Q==
X-Gm-Message-State: AOAM532/bex1plJm1QR+y/DxPNQ8d4EEIRa25WOTqc9bwZPeqazf2z0N
	iofZOMIc3XNr8wgWNca0It16XEPV2CqwMqbGkytvHFa/H2+2GA==
X-Google-Smtp-Source: ABdhPJww6iuwpHz/941WyBxmvk9JK+i8PgLAl8vou11JUQeLTyUzXF9PlEvmciow47KKaw2k50plv+2R0ORPlduU+0c=
X-Received: by 2002:a2e:8789:: with SMTP id n9mr3328199lji.438.1624006242157;
 Fri, 18 Jun 2021 01:50:42 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 18 Jun 2021 10:50:31 +0200
Message-ID: <CACRpkdbw6HSpp7k6q1FYGmtafLmdAu8bFnpHQOdfBDYYsdLbkw@mail.gmail.com>
Subject: [GIT PULL] IXP4xx modernizations for v5.14
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, 
	Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi ARM SoC maintainers,

here is a constructive pull request for modernizing IXP4xx.

As modernizing architectures go, it's cutting some corners
and being a bit different from regular new architectures.
The main details of the contents are in the signed tag, but
note the following:

Arnd's patch to move CPU detection hits drivers all
over the place - that is natural.

hwrandom changes are ACKed by the hwrandom
maintainer and PCI changes are ACKed by the PCI
maintainers.

Some modernization was merged in parallel into the
crypto subsystem for dependencies on other modernizations
of the crypto driver. These make rid of the need to include
<mach/*> or <soc/*> headers but in order to not create a
fuzz during the merge window or in linux-next I have added
these three lines to the crypto driver:

+/* Intermittent includes, delete this after v5.14-rc1 */
+#include <linux/soc/ixp4xx/cpu.h>
+#include <mach/ixp4xx-regs.h>

This makes everything compile and merge nicely in -next.
(Tested to merge things into -next, no colissions.)
We will get rid of them after the merge window. No big deal.

For the next merge window we will be able to start
to delete boardfiles and surplus ixp4xx drivers as
modernization continues. Main stakeholder is the OpenWrt
community.

I would really like this to land in v5.14 as we have some
momentum but I know it may be a bit late in the merge
cycle. Pretty please.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-arm-soc-v5.14

for you to fetch changes up to 0da518dae87dd18e5f23e406e15575f393e4a97c:

  ixp4xx: fix spelling mistake in Kconfig "Devce" -> "Device"
(2021-06-17 15:31:05 +0200)

----------------------------------------------------------------
This is a major chunk of IXP4xx modernization:

- Fist we move some registers around to make room for
  the predetermined PCI I/O space.

- Then we add some Kconfig options to make it possible
  to use the old PCI driver in parallell with the new
  shiny one.

- Then we add the new PCI driver and some bindings for
  it.

- On top of this we add an (ages old) patch from Arnd
  that centralize the CPU/SoC detection in drivers/soc
  and make the header a standard Linux header to avoid
  the <mach/*> business in drivers.

- Then we split out and modernize some platform data
  headers for pata, and hwrandom, and top it up with
  DT bindings and support for hwrandom.

----------------------------------------------------------------
Arnd Bergmann (3):
      soc: ixp4xx: move cpu detection to linux/soc/ixp4xx/cpu.h
      pata: ixp4xx: split platform data to its own header
      hw_random: ixp4xx: enable compile-testing

Colin Ian King (1):
      ixp4xx: fix spelling mistake in Kconfig "Devce" -> "Device"

Linus Walleij (8):
      ARM/ixp4xx: Move the virtual IObases
      ARM/ixp4xx: Make NEED_MACH_IO_H optional
      PCI: ixp4xx: Add device tree bindings for IXP4xx
      PCI: ixp4xx: Add a new driver for IXP4xx
      hw_random: ixp4xx: Use SPDX license tag
      hw_random: ixp4xx: Turn into a module
      hw_random: ixp4xx: Add DT bindings
      hw_random: ixp4xx: Add OF support

 .../devicetree/bindings/pci/intel,ixp4xx-pci.yaml  | 100 +++
 .../devicetree/bindings/rng/intel,ixp46x-rng.yaml  |  36 ++
 MAINTAINERS                                        |   7 +
 arch/arm/Kconfig                                   |   3 +-
 arch/arm/Kconfig.debug                             |   4 +-
 arch/arm/mach-ixp4xx/Kconfig                       |  35 +-
 arch/arm/mach-ixp4xx/avila-setup.c                 |   1 +
 arch/arm/mach-ixp4xx/common.c                      |  47 +-
 arch/arm/mach-ixp4xx/fsg-setup.c                   |   1 +
 arch/arm/mach-ixp4xx/include/mach/cpu.h            |  54 --
 arch/arm/mach-ixp4xx/include/mach/hardware.h       |   2 +-
 arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h    |  61 +-
 arch/arm/mach-ixp4xx/include/mach/platform.h       |  14 -
 arch/arm/mach-ixp4xx/ixp4xx-of.c                   |   8 +-
 arch/arm/mach-ixp4xx/nas100d-setup.c               |   1 +
 arch/arm/mach-ixp4xx/nslu2-setup.c                 |   1 +
 drivers/ata/Kconfig                                |   2 +-
 drivers/ata/pata_ixp4xx_cf.c                       |   1 +
 drivers/char/hw_random/Kconfig                     |   2 +-
 drivers/char/hw_random/ixp4xx-rng.c                |  53 +-
 drivers/crypto/ixp4xx_crypto.c                     |   4 +
 drivers/net/ethernet/xscale/ixp4xx_eth.c           |   2 +
 drivers/net/ethernet/xscale/ptp_ixp46x.c           |   3 +-
 drivers/net/wan/ixp4xx_hss.c                       |   1 +
 drivers/pci/controller/Kconfig                     |   8 +
 drivers/pci/controller/Makefile                    |   1 +
 drivers/pci/controller/pci-ixp4xx.c                | 671 +++++++++++++++++++++
 drivers/soc/ixp4xx/ixp4xx-npe.c                    |   2 +
 drivers/soc/ixp4xx/ixp4xx-qmgr.c                   |   2 +
 include/linux/platform_data/pata_ixp4xx_cf.h       |  21 +
 include/linux/soc/ixp4xx/cpu.h                     | 106 ++++
 31 files changed, 1079 insertions(+), 175 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
 create mode 100644 Documentation/devicetree/bindings/rng/intel,ixp46x-rng.yaml
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/cpu.h
 create mode 100644 drivers/pci/controller/pci-ixp4xx.c
 create mode 100644 include/linux/platform_data/pata_ixp4xx_cf.h
 create mode 100644 include/linux/soc/ixp4xx/cpu.h
