Return-Path: <SRS0=TN87=FD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD57C3E8C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Nov 2020 11:09:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A145C20771
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Nov 2020 11:09:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r4wT1Or3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="sKo2DUTD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A145C20771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=201QnxHDA2WUXba0s2em++1HUi7y/2g2QiFMVQhNL40=; b=r4wT1Or3vIJgtUI4tUg77Gnc1m
	JmVynHjRL3GnvGHsmPUAxx8s9PEvE3Lo1FFUKJ19MjMossnwlXytu5PNY3dovpkRkvh1WSv+4oGdf
	6WE8Nq0aKsApNRGbosgVHcHAW/Z0We1bmyznOosWqO3zDgcmohO2AbDrMUn5sOmkeVTSiNvo2eCQQ
	jD4xPGAtG48/NFj4gRJHT7hcj25ZXVaTLgc8j9YlEXMKGpt91Tl41wwHDzhhV8Nw36F+bKTZXK+GL
	tLNKYkmxi5BxDcsEFNwoUvpAoVvdJWAiJOmjqml0Afdsmr0QQF8ORa2Sg8U8ZWOvBagLqox4pyj5+
	oDBr2mkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjKZ5-0006DU-1b; Sun, 29 Nov 2020 11:08:23 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjKZ1-0006CB-Cp
 for linux-arm-kernel@lists.infradead.org; Sun, 29 Nov 2020 11:08:20 +0000
Received: by mail-pg1-x544.google.com with SMTP id w4so8036765pgg.13
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 29 Nov 2020 03:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
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
 b=l3U2ECi/e4HHjS4pAojw+/qSFbpRtxB8e3TgU8/See9rcRg4KIOfXByzWKCNv2MFOH
 2HvsqLsUnpZTEbD4XyHlpvmnZJmkUOhAOIwfZjMP5JQyQgohqV+kVCg66A+4kuYYPwqt
 UlnF0uVvVErq5rdB2sIm8lpHWiRi/imKUHthYoZkcQwELFn1+q07yhzmtDmcCDd+yQT7
 MTRsT2OPR4QsS0Xx6mbRGVV0Sfotkc0VlMi535khe6OOA4Fe7pBn0ZgUXlvNJ1lbJYQf
 YQ4xXam3yJalEFGtK3MmqYpr+CY7UCEcHsl6ad7CEZkqhJJG1VONnRULrwakXq2oWBpV
 q/CA==
X-Gm-Message-State: AOAM532UTgFbnN+gpvdcP0wQuD8tcz12T9F1BJp6j6Fmmlir3xPuf5YB
 j3wRM23woJFPtqnRBRlRR3mCrQ==
X-Google-Smtp-Source: ABdhPJx2TWa65jQIOPR1bVgac6u1Qz7JaJNyTfwd5Cu71RgjmSi4gPQzIEb34BD6JhIN/Kg5vSRbgg==
X-Received: by 2002:a17:90b:203:: with SMTP id
 fy3mr18895929pjb.231.1606648093633; 
 Sun, 29 Nov 2020 03:08:13 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 03:08:13 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
Date: Sun, 29 Nov 2020 20:07:57 +0900
Message-ID: <20201129110803.2461700-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_060819_726135_5EA3A199 
X-CRM114-Status: GOOD (  20.92  )
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
Cc: devicetree@vger.kernel.org, robh@kernel.org, linus.walleij@linaro.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, w@1wt.eu,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201129110757.sAxrgpJrS0L2RCgSWkG2swrTFI5ueLmhUIg6rK40RDQ@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
