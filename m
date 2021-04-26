Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D23C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 16:08:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACBB761154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 16:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACBB761154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3T+ccpCSoFd1Bpf9OUbA9XxuMtQbK1E8moMd7RId4is=; b=dIQrpMzHY8Z/ynJ4EWhLOgJBN
	L/BtAxDGGQ3EKXcqZkR6CqZ9CHpNlD8Vr4dfW12sXktQ6XbZr0Q5wGHOiV418bRx2MOg88owmivqP
	UtgVOg1ocT+noaPV5wGuna0EnsB4rH2pAUtQ8NM271GUMsotGT3FNNlTDmgPwjW9O5RsqbG3BDUIW
	8rQDkGp2bgUpc3sgh106ZEccqT4SkEEGlnMiYpJzfKUd8W0K0V2zmq+5w47MtZBZah6nLabUAMIfZ
	nfFbE8AjMEJGJ8rsT92XHaTa3yDPSRPTXhvYfnVpAe9BTUssOoJCg8QFI6ZHgFhQHcgmX3kks7RoM
	5GusqJD0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb3ka-0083S3-Ow; Mon, 26 Apr 2021 16:06:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb3kW-0083RT-MQ
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 16:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3huTd1MDM4r6GZtb3CNPwJanV25OI0BwdXbh79X2SJ4=; b=5ANVsknVZ+MncPdkG+61FtKjfS
 VgzThLmDwExSy1HHBaScqxywfjvWUnJ6TxIIK14sVruFFYv8h4d5ZytXEbxRJ94ne8heqMW4VkBw8
 fyyRjltx2kOqhyD+ZPRybjTQ2P5aJ8pYnqOVhghccqBV12CRD43oB0IknDhykb6gT8VxPiWoMRMFs
 NWbM+DkUZC1TAV7n+EX+Id3etmWfd7BXdCHyqZGMN5NAtxT6EXemZsiG0va2gNyBqIhf2uQIFZ9iv
 AJ+eDLk53Px2NrDdsHixTdZRtCtuRhJAJNppTAfaZRQzQOyL/eDOfE9i+9YYinr0nWy5uUlYeBYq5
 Z4uwQoPQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb3kT-00G4js-JO
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 16:06:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7A6E60FF1
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 26 Apr 2021 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619453172;
 bh=GkfpWcfAA7YiWXrMqYR1OVCVgeGtJ3zCtRlKOSbqqpU=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=SFmwmcpgXj4KNSAoJw2UaBzTi+58MzilBZoBl3c/BzM0f8pG7/zvtt0xc6oKVKKli
 99TwoUdHp0opSHeqfTBChw89bTUoax4RTXJdGS8rZJ/nQVjl1sKGJBejgcNv8rr5Ji
 yMe8wSUEUmTtak1MO73RJcBEwJNmMh1HXitf0KYsBoHswdgxPTjbcUx3974Gw9rgCe
 oRCHRfEIo94br8eodmuwv2ETWn5+rYtzaYWce+aBq2GFfsUnDiIIRQA5wVh0CbeLXG
 zGkKeRy9cQuGx2eFo8BXM7975nI6yHZVI8lzS5X+XBYcCkTiiArBEpPzTTqtL24jvX
 C0qzJJDWfXzCg==
Received: by mail-wr1-f42.google.com with SMTP id j5so55501833wrn.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 26 Apr 2021 09:06:12 -0700 (PDT)
X-Gm-Message-State: AOAM533Ru+iueZd2SnB2FjXQWM551upxi3Xrn/J/sWL9Iqn1Fge1NHgT
 rjdi8Qvq/7eFThjfC8dpHSNdtMt7FRsys8axHfM=
X-Google-Smtp-Source: ABdhPJwWvjCeDBB7XGCE9lCWxIIs6XVKhx5ctgOTUVVLroVZln2LzP8JQLQEScid67yF5ukTVSBlsZEeJUYweo1WnAI=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr24478149wrg.165.1619453171328; 
 Mon, 26 Apr 2021 09:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 26 Apr 2021 18:05:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a388f9iSncTW-sAdbeg3-=vc=6r0X9392puGE=FsWy=Yw@mail.gmail.com>
Message-ID: <CAK8P3a388f9iSncTW-sAdbeg3-=vc=6r0X9392puGE=FsWy=Yw@mail.gmail.com>
Subject: [GIT PULL 6/6, look out for dependencies ] ARM: platform support for
 Apple M1
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_090613_747630_16EF1F31 
X-CRM114-Status: GOOD (  17.81  )
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
Message-ID: <20210426160542.hGliK7pT5Mu1cc4Bt3F0yddHiKdeJKcAQ4fkgJjK1O4@z>

The following changes since commit 1e28eed17697bcf343c6743f0028cc3b5dd88bf0:

  Linux 5.12-rc3 (2021-03-14 14:41:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-apple-m1-5.13

for you to fetch changes up to ea96292838397682530ac77a429974f8ff5f2df3:

  asm-generic/io.h: Unbork ioremap_np() declaration (2021-04-09 08:48:27 +0200)

----------------------------------------------------------------
ARM: platform support for Apple M1

The Apple M1 is the processor used it all current generation Apple
Macintosh computers. Support for this platform so far is rudimentary,
but it boots and can use framebuffer and serial console over a special
USB cable.

Support for several essential on-chip devices (USB, PCIe, IOMMU, NVMe)
is work in progress but was not ready in time.

A very detailed description of what works is in the merge commit
and on the AsahiLinux wiki.

Link: https://lore.kernel.org/linux-arm-kernel/bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------

Note: this tree pulls in changes from the tty and arm64 trees as a dependency.
The diffstat below is based on on commit 847bea3d08a (Merge remote-tracking
branch 'arm64/for-next/fiq'), and is what  you should see when you
pull those two first.

There is also a small Makefile conflict against the irqchip branch of
the tip tree.

----------------------------------------------------------------
Arnd Bergmann (3):
      docs: driver-api: device-io: Document I/O access functions
      Merge branch 'apple/m1-dependency' into arm/apple-m1
      Merge tag 'm1-soc-bringup-v5' of
https://github.com/AsahiLinux/linux into arm/apple-m1

Hector Martin (18):
      dt-bindings: vendor-prefixes: Add apple prefix
      dt-bindings: arm: apple: Add bindings for Apple ARM platforms
      dt-bindings: arm: cpus: Add apple,firestorm & icestorm compatibles
      arm64: cputype: Add CPU implementor & types for the Apple M1 cores
      dt-bindings: timer: arm,arch_timer: Add interrupt-names support
      arm64: arch_timer: Implement support for interrupt-names
      asm-generic/io.h:  Add a non-posted variant of ioremap()
      docs: driver-api: device-io: Document ioremap() variants & access funcs
      arm64: Implement ioremap_np() to map MMIO as nGnRnE
      asm-generic/io.h: implement pci_remap_cfgspace using ioremap_np
      of/address: Add infrastructure to declare MMIO as non-posted
      arm64: Move ICH_ sysreg bits from arm-gic-v3.h to sysreg.h
      dt-bindings: interrupt-controller: Add DT bindings for apple-aic
      irqchip/apple-aic: Add support for the Apple Interrupt Controller
      arm64: Kconfig: Introduce CONFIG_ARCH_APPLE
      dt-bindings: display: Add apple,simple-framebuffer
      arm64: apple: Add initial Apple Mac mini (M1, 2020) devicetree
      asm-generic/io.h: Unbork ioremap_np() declaration

 Documentation/devicetree/bindings/arm/apple.yaml   |  64 ++
 Documentation/devicetree/bindings/arm/cpus.yaml    |   2 +
 .../bindings/display/simple-framebuffer.yaml       |   5 +
 .../bindings/interrupt-controller/apple,aic.yaml   |  88 +++
 .../devicetree/bindings/timer/arm,arch_timer.yaml  |  19 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/driver-api/device-io.rst             | 356 +++++++++
 Documentation/driver-api/driver-model/devres.rst   |   1 +
 MAINTAINERS                                        |  14 +
 arch/arm64/Kconfig.platforms                       |   7 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/apple/Makefile                 |   2 +
 arch/arm64/boot/dts/apple/t8103-j274.dts           |  45 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               | 135 ++++
 arch/arm64/configs/defconfig                       |   1 +
 arch/arm64/include/asm/cputype.h                   |   6 +
 arch/arm64/include/asm/io.h                        |  11 +-
 arch/arm64/include/asm/sysreg.h                    |  60 ++
 arch/sparc/include/asm/io_64.h                     |   4 +
 drivers/clocksource/arm_arch_timer.c               |  24 +-
 drivers/irqchip/Kconfig                            |   8 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-apple-aic.c                    | 852 +++++++++++++++++++++
 drivers/of/address.c                               |  43 +-
 include/asm-generic/io.h                           |  21 +-
 include/asm-generic/iomap.h                        |   9 +
 include/clocksource/arm_arch_timer.h               |   1 +
 .../dt-bindings/interrupt-controller/apple-aic.h   |  15 +
 include/linux/cpuhotplug.h                         |   1 +
 include/linux/io.h                                 |  18 +-
 include/linux/ioport.h                             |   1 +
 include/linux/irqchip/arm-gic-v3.h                 |  56 --
 lib/devres.c                                       |  22 +
 33 files changed, 1815 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/apple.yaml
 create mode 100644
Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 create mode 100644 arch/arm64/boot/dts/apple/Makefile
 create mode 100644 arch/arm64/boot/dts/apple/t8103-j274.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8103.dtsi
 create mode 100644 drivers/irqchip/irq-apple-aic.c
 create mode 100644 include/dt-bindings/interrupt-controller/apple-aic.h

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
