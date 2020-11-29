Return-Path: <SRS0=LVh9=FD=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8467BC3E8C5
	for <soc@archiver.kernel.org>; Sun, 29 Nov 2020 11:08:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4B50320771; Sun, 29 Nov 2020 11:08:15 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8025E207BC
	for <soc@kernel.org>; Sun, 29 Nov 2020 11:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="sKo2DUTD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8025E207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pg1-f194.google.com with SMTP id t3so8040312pgi.11
        for <soc@kernel.org>; Sun, 29 Nov 2020 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfG3IJYFfaN+LLPLPN9u5BA6DY35eu9G1j5saJ10vaQ=;
        b=sKo2DUTDonDaiIv9hFnn0BJLMzL4XqOt+FgwsQebG2oxgVCSSgvueeNbnkq00vT/fn
         +0IqL36Aqs6B5P0bRgcN1eD8JTPI7oVWWM4a0a5ecelIheCW185xNziicy/8GGXGr0gG
         KsEW3oC0jkfxgG0hmRVy/gDIT9GmgXLnZNyMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfG3IJYFfaN+LLPLPN9u5BA6DY35eu9G1j5saJ10vaQ=;
        b=C81Z4QbDjlDiV6T5uh47raNbgeobObEpatwHuq8e0EwokwjmcSsLCt+GwlaIvSN7sJ
         AiK/SvHWTTUh1BwnCS44oFNxuqA5ABo13UWX+vl7txaso9lesOsSJc+THz+MzV+ghHbs
         34wkPq9aw49xL5tBlDEewOQ4Tm9yxQ2CIpRobMFMfuk/XSzwaKOZML2eLFfJ5ujxTdDI
         ZShG1C+rEFiN5GwAV3FFeQ6mzlvzNtuYzcy/8+7JoJplwNqxNFiPPz2c/8vLCZ6OgIuF
         JqE4aVI7SAsy8gGMIT8V8xumI8r7rz5xxGYqVEFGnCEdNSlseuGP9CjJ8I5tK/z1Eaqf
         LX5w==
X-Gm-Message-State: AOAM532TmVEF7H5hi2r85YwleokgFD4lFCDYycywKx44sbjqyKwP9wWg
	rJfxezQXxSa+ilBuFIjoT2kmrX5KDLLD0A==
X-Google-Smtp-Source: ABdhPJx2TWa65jQIOPR1bVgac6u1Qz7JaJNyTfwd5Cu71RgjmSi4gPQzIEb34BD6JhIN/Kg5vSRbgg==
X-Received: by 2002:a17:90b:203:: with SMTP id fy3mr18895929pjb.231.1606648093633;
        Sun, 29 Nov 2020 03:08:13 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 03:08:13 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org,
	robh@kernel.org,
	w@1wt.eu,
	daniel@0x0f.com
Subject: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
Date: Sun, 29 Nov 2020 20:07:57 +0900
Message-Id: <20201129110803.2461700-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the moment the MStar/SigmaStar support is only really
capable of shell from an initramfs and not much else.

Most of the interesting drivers are blocked on clock and pinctrl
drivers and those are going to take me a little while to get cleaned
up.

Clock and pinctrl aren't needed for basic GPIO to work (all pins
start off as GPIOs..) and it makes it possible to actually do something
so this series adds everything that is needed for the main GPIO
block in these chips.

Changes since v3:
- Remove unneeded "gpio-ranges-group-names" property from binding yaml.

Changes since v2:

- Numerous style and code cleanups as suggested by Andy Shevchenko,
  Linus Walleij, Marc Zyngier and Rob Herring.

- Pad names moved out of the binding header because they are no longer
  needed there. The pin/pad numbers are still there as I couldn't think
  of a better way to do this. meson8b-gpio.h seems to be similar.

Changes since v1:

- Moves the binding header commit before the yaml commit
  
- Fixes the license on the binding header to include BSD-2-Clause

- The driver has been reworked to use the gpiolib irqchip functionality
  as suggested by Linus[0]. I think I got this right. The gpio controller
  doesn't actually do anything with interrupts itself.. It just happens
  to have 4 lines that are also wired to lines on one of the interrupt
  controllers.

- Now that the driver is an interrupt controller in it's own right for
  the gpio lines that have associated interrupts the binding description
  has been updated to add the interrupt-controller bits and remove the
  description of the interrupt-names that described how the interrupts
  used to be passed in.

Daniel Palmer (5):
  dt-bindings: gpio: Add a binding header for the MSC313 GPIO driver
  dt-bindings: gpio: Binding for MStar MSC313 GPIO controller
  gpio: msc313: MStar MSC313 GPIO driver
  ARM: mstar: Add gpio controller to MStar base dtsi
  ARM: mstar: Fill in GPIO controller properties for infinity

 .../bindings/gpio/mstar,msc313-gpio.yaml      |  59 +++
 MAINTAINERS                                   |   3 +
 arch/arm/boot/dts/mstar-infinity.dtsi         |   7 +
 arch/arm/boot/dts/mstar-v7.dtsi               |  10 +
 drivers/gpio/Kconfig                          |  11 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-msc313.c                    | 460 ++++++++++++++++++
 include/dt-bindings/gpio/msc313-gpio.h        |  53 ++
 8 files changed, 604 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 create mode 100644 drivers/gpio/gpio-msc313.c
 create mode 100644 include/dt-bindings/gpio/msc313-gpio.h

-- 
2.29.2

