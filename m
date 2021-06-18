Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A945FC48BE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 08:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8906128B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 08:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8906128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xnGHnq530xWsy/RQaPa9HXH4liYbL/0RsmXtaTpeZt0=; b=5BSrgDBh93zfIe
	JmbaiYLVJDGjPVZ3W40X5NUjpd2fQLYcF1hsmmmvhGESOLXSZhI0nyijxB7+nfV9ZSUm+2wma2zzd
	qgrW5+Q9o+x1eM3p8h6BPOmx+8FXahb5An9f86NT96FQuIx/uPQZpg/NNH28D6yYI4Pbl8M4sS5cT
	66bPMY3YYRDTXS3lFyHr9k+Hd0BlLjXmTGDemeNJqbpSDwzXugjS3KtLHqiGpKJXPbKlZlguzNsk2
	mX1h8c3BFF0AwqLzQpbuOrNGBWep71OymJelFVXfkvQPhhL8azeeXQh/qfYbSKHmHnVv2pbuJAn+/
	4jlUAzXfRopyip8DiuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luADC-00DMxG-J2; Fri, 18 Jun 2021 08:50:50 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luAD8-00DMwI-1y
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 08:50:47 +0000
Received: by mail-lj1-x22c.google.com with SMTP id d2so12978860ljj.11
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 18 Jun 2021 01:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=RI0jsFrf/AffZgleXn3JccX6jWU3sz5ey8kd+42LAuQpNtIdFeMlcu7oQODRMu2TW/
 mNpWsx+MSvHA5OVz/HNTcBwr+GtED3//0Jsnb/Ry0e7KtOYXAsx0UieHx7L4/KtbxT0i
 7z/4lg5SFvYcRiviIlPYT15Qo3PgoEFifZtP1MMbbYorQF6K/YvJOrCsWfaALarj21IR
 mLvhcC17QyVFbFpWLt3syWGBlmOoES0tpsY1hNsvrIyPCnpF8IUAg9gHQpfvrcK+K5at
 EHsUYBpQWt9xrBD0axujpDrhbNu0fDyzot40Nl/aQ6jZAySQwtJng91AIfnycR7I2aLn
 HOQA==
X-Gm-Message-State: AOAM533DsmNPP01fEAzfdFMxptMQKGe+4beMGjmWJ+1WvSDpKpU1si2L
 5f/IsEn3t4LjuT7OmZBP7Z5j8M7U3OPDINwf3I5btO4+PbY73Q==
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, 
 Corentin Labbe <clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_015046_156257_633E6647 
X-CRM114-Status: GOOD (  24.42  )
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
Message-ID: <20210618085031.Vk4a39iYOPS9_QYuWuM7B1l4MUgye_jkA5MYoDrKY1M@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
