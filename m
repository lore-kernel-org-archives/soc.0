Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D63C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C69764F44
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C69764F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7GTOWjLFtdeXSqebASaCwuaO3vpaABGJFzriIekA+zM=; b=uSnJzHRqJUNFZbqJNwr/FQUej2
	7NfJ9P1fbrGjevY9uxPyNgWqYe412if/fuoZhqpRCkkJqToufMCcBam+3SoTecEqUGEtpgA6lmjwZ
	DB3/bo2vVP2aGdOb0lxF7ynqKDIS7DFi7skOauXyzDB+7Zr+GWR0bIi5twvnq9eju2AE/zJMFwOrB
	6sT9QMxYMmRptg0qWZ1eioxc+qy5JZACFRcgwscvsYnMlRiqqjeY4SrfNGpmlgjhjaZqxihxkXRhz
	VDmSoA+weA3eR1qiCwUguSLqZxp1HdJNFWWmrdltsd2fvQKo5pMGOf7lK94hQjvKJrgBS+eicFPMb
	Sev4KkSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lQK-0007qu-Uu; Thu, 04 Feb 2021 20:40:20 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lQG-0007pY-3C
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:40:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 88EF3425B6;
 Thu,  4 Feb 2021 20:40:06 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 00/18] Apple M1 SoC platform bring-up
Date: Fri,  5 Feb 2021 05:39:33 +0900
Message-ID: <20210204203951.52105-1-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154016_394907_6C8CFC15 
X-CRM114-Status: GOOD (  20.03  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204203933.Fl7J1-PKPH8OMaJg9k2hhppHunND-7lQdwQeNBcuKTk@z>

This series brings up initial support for the Apple M1 SoC, used in the
2020 Mac Mini, MacBook Pro, and MacBook Air models.

The following features are supported in this initial port:

- UART (samsung-style) with earlycon support
- Interrupts, including affinity and IPIs (Apple Interrupt Controller)
- SMP (through standard spin-table support)
- simplefb-based framebuffer
- Devicetree for the Mac Mini (should work for the others too at this
  stage)

The primary pain points of this port are:

- Apple SoCs require FIQs, as the timers and "fast" IPIs are hardwired
  to the FIQ interrupt line. This patchset introduces FIQ support through
  the alternatives mechanism, so as to not affect other platforms,
  implemented as simply merging IRQs and FIQs. The AIC driver takes care
  of discriminating and routing IRQs to the right users.

- These SoCs blackhole nGnRE writes to internal MMIO ranges, and require
  nGnRnE. There is no obvious right solution to solve this. I do not
  expect the two patches for that in this series to be merged as-is, but
  the commit messages describe the problem and potential solutions. I
  hope we can have a discussion and converge on the right approach to
  solve this problem in the sanest way.

These machines officially support booting unsigned/user-provided
XNU-like kernels, with a very different boot protocol and devicetree
format. We are developing an initial bootloader, m1n1 [1], to take care
of as many hardware peculiarities as possible and present a standard
Linux arm64 boot protocol and device tree. In the future, I expect that
production setups will add U-Boot and perhaps GRUB into the boot chain,
to make the boot process similar to other ARM64 platforms.

The machines expose their debug UART over USB Type C, triggered with
vendor-specific USB-PD commands. Currently, the easiest way to get a
serial console on these machines is to use a second M1 box and a simple
USB C cable [2]. You can also build a DIY interface using an Arduino, a
FUSB302 chip or board, and a 1.2V UART-TTL adapter [3]. In the coming
weeks we will be designing an open hardware project to provide
serial/debug connectivity to these machines (and, hopefully, also
support other UART-over-Type C setups from other vendors). Please
contact me privately if you are interested in getting an early prototype
version of one of these devices.

A quickstart guide to booting Linux kernels on these machines is
available at [4], and we are documenting the hardware at [5].

[1] https://github.com/AsahiLinux/m1n1/
[2] https://github.com/AsahiLinux/macvdmtool/
[3] https://github.com/AsahiLinux/vdmtool/
[4] https://github.com/AsahiLinux/docs/wiki/Developer-Quickstart
[5] https://github.com/AsahiLinux/docs/wiki

== Project Blurb ==

Asahi Linux is an open community project dedicated to developing and
maintaining mainline support for Apple Silicon on Linux. Feel free to
drop by #asahi on freenode to chat with us, or check our website for
more information on the project:

https://asahilinux.org/


Hector Martin (18):
  dt-bindings: vendor-prefixes: add AAPL prefix
  dt-bindings: arm: cpus: Add AAPL,firestorm & icestorm compatibles
  dt-bindings: arm: AAPL: Add bindings for Apple ARM platforms
  arm64: Kconfig: Introduce CONFIG_ARCH_APPLE
  tty: serial: samsung_tty: add support for Apple UARTs
  dt-bindings: serial: samsung: Add AAPL,s5l-uart compatible
  tty: serial: samsung_tty: enable for ARCH_APPLE
  arm64: cpufeature: Add a feature for FIQ support
  arm64: cputype: Add CPU types for the Apple M1 big/little cores
  arm64: Introduce FIQ support
  arm64: Kconfig: Require FIQ support for ARCH_APPLE
  arm64: setup: Use nGnRnE IO mappings for fixmap on Apple platforms
  arm64: ioremap: use nGnRnE mappings on platforms that require it
  dt-bindings: interrupt-controller: Add DT bindings for apple-aic
  irqchip/apple-aic: Add support for the Apple Interrupt Controller
  irqchip/apple-aic: Add SMP / IPI support
  dt-bindings: display: add AAPL,simple-framebuffer
  arm64: apple: Add initial Mac Mini 2020 (M1) devicetree

 .../devicetree/bindings/arm/AAPL.yaml         |  36 ++
 .../devicetree/bindings/arm/cpus.yaml         |   2 +
 .../bindings/display/simple-framebuffer.yaml  |   5 +
 .../interrupt-controller/AAPL,aic.yaml        |  88 +++
 .../bindings/serial/samsung_uart.yaml         |   4 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  14 +
 arch/arm64/Kconfig                            |  10 +
 arch/arm64/Kconfig.platforms                  |   8 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/apple/Makefile            |   2 +
 arch/arm64/boot/dts/apple/apple-j274.dts      | 143 +++++
 arch/arm64/include/asm/assembler.h            |   4 +
 arch/arm64/include/asm/cpucaps.h              |   3 +-
 arch/arm64/include/asm/cpufeature.h           |   6 +
 arch/arm64/include/asm/cputype.h              |   6 +
 arch/arm64/include/asm/daifflags.h            |   7 +
 arch/arm64/include/asm/fixmap.h               |  10 +-
 arch/arm64/include/asm/io.h                   |   9 +-
 arch/arm64/include/asm/irqflags.h             |  17 +-
 arch/arm64/kernel/cpufeature.c                |  32 ++
 arch/arm64/kernel/entry.S                     |  27 +-
 arch/arm64/kernel/setup.c                     |  12 +
 drivers/irqchip/Kconfig                       |  10 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-apple-aic.c               | 501 ++++++++++++++++++
 drivers/tty/serial/Kconfig                    |   2 +-
 drivers/tty/serial/samsung_tty.c              | 297 +++++++++--
 .../interrupt-controller/apple-aic.h          |  14 +
 include/linux/serial_s3c.h                    |  16 +
 include/uapi/linux/serial_core.h              |   3 +
 31 files changed, 1243 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/AAPL.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
 create mode 100644 arch/arm64/boot/dts/apple/Makefile
 create mode 100644 arch/arm64/boot/dts/apple/apple-j274.dts
 create mode 100644 drivers/irqchip/irq-apple-aic.c
 create mode 100644 include/dt-bindings/interrupt-controller/apple-aic.h

--
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
