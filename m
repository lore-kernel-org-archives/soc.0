Return-Path: <SRS0=AYRD=HK=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1A1C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 17:09:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3B69D64DD4; Mon,  8 Feb 2021 17:09:52 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E4D64E2E
	for <soc@kernel.org>; Mon,  8 Feb 2021 17:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32E4D64E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-pg1-f169.google.com with SMTP id r38so10598583pgk.13
        for <soc@kernel.org>; Mon, 08 Feb 2021 09:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=akU23dffyJjz+djylk5jsVdyyG8Be7sK0HA6TbaxMtQ=;
        b=CUoivAS49SaxWU5qfUCJtkCgiYieRHKTI3WPX5lT/wINHbzWQFrj6Gv26FdA99+KTm
         7hT7znW89G+onT1DdKxiTgz5aSu3ChXk375uqNo8yfM0PN0el+uliMG/MScd9PcquJa1
         siCXPZoRbOWClW4dRcvpwRr6h1AudReYdMlgHAVzC3yjvoDJMG5wJT0XXTmDK21H7kRA
         W/f8zqksfVrj7JLtlmODjXZqMC9vfq489PYfJTmx09gtgmf5qF+yP0opEZn70/L2sXAB
         OJRN7+sfiJAsKm5XhF4t9FRRyfcz7/H1H45hYFGacxi88s6Ri59ziOqyaaNvgPVM9Rzt
         17mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=akU23dffyJjz+djylk5jsVdyyG8Be7sK0HA6TbaxMtQ=;
        b=Alsk195PrG+PMFUF6l4yd2vR8x+Ij4MeAE8vXsWvs0P42qCSKHmwnxexjkC1iocKxO
         ErtII33WhaTXrbyx08oOwXYkVV5dtXs+7Jtqv7IcjekGtub5JF9IdTyABKDYQWm4rFfF
         NPMcurv+KBl8HZp7ttBfgv4Ow1XsD5sQstOdXB3GcEERqa2qG22pah9dyL9u/jGmh5Yl
         dBjXn5u9jvTigEd69TlNJD8lkAsrVJDqvH/dAoRiz8MtEr+l3cf4i4UyTZuQMI/xYSQA
         14LVdz7ILCWVxkmnQ+VNYbWu43Qk/ZtQY23MjptjQ8G8wsVSOHJLlVlWA37BsXDX0enW
         bmog==
X-Gm-Message-State: AOAM532iBaWVJEvvzXn4DyWg1FdXhu2NVLkUBJTS8903653S7DXGDpu6
	yUOeXVXGdQolCcLMKUnn5aBL+XUtNx8pvKAe
X-Google-Smtp-Source: ABdhPJzLsUpJoGQ4+hph9y8nKFNNGleQfa9cyYQEilGrdqt4hsPs1L34v5obEJDt9uS+dj7tmuB6nQ==
X-Received: by 2002:a62:e804:0:b029:1dd:cf18:bdee with SMTP id c4-20020a62e8040000b02901ddcf18bdeemr5201557pfi.63.1612804190099;
        Mon, 08 Feb 2021 09:09:50 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id x20sm7080559pjp.41.2021.02.08.09.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 09:09:49 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org, Christian Hewitt <chewitt@libreelec.tv>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.12
In-Reply-To: <7him792brk.fsf@baylibre.com>
References: <7him792brk.fsf@baylibre.com>
Date: Mon, 08 Feb 2021 09:09:48 -0800
Message-ID: <7heehq7ag3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Hilman <khilman@baylibre.com> writes:

> Arnd, Olof,
>
> This round of DT changes for Amlogic SoCs is based on top of the v5.11
> fixes already merged by Arnd.
>

Oops, minor respin of this one was needed since I messed up authorship
of one of Christian's patches after fixing up a conflict resolution.

Only change compared to previous one was changing the authorship of one
patch from me to Christian.

Thanks Christian for catching my mistake!

Kevin



The following changes since commit daf12bee07b9e2f38216f58aca7ac4e4e66a7146:

  arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain on Odroid-C4 (2021-01-27 10:08:23 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-1

for you to fetch changes up to 33b14f663df84196cdfbbfccd85d36d10b2d1820:

  arm64: dts: meson: add initial device-tree for ODROID-HC4 (2021-02-08 09:03:30 -0800)

----------------------------------------------------------------
arm64: dts: amlogic updates for v5.12
- new board: Hardkernel ODROID-HC4 (SoC: SM1)
- new board: Beelink GS-King-X (SoC: S922X)
- shorten shorten audio card names for alsa compatibility
- misc cleanups & fixes

----------------------------------------------------------------
Alexander Dahl (1):
      arm64: dts: meson: Fix schema warnings for pwm-leds

Artem Lapkin (1):
      arm64: dts: meson: fix broken wifi node for Khadas VIM3L

Christian Hewitt (9):
      dt-bindings: arm: amlogic: add support for the Beelink GS-King-X
      arm64: dts: meson: add initial Beelink GS-King-X device-tree
      arm64: dts: meson: shorten audio card names for alsa compatibility
      arm64: dts: meson: add i2c3/rtc nodes and rtc aliases to ODROID-N2 dtsi
      dt-bindings: arm: amlogic: sort SM1 bindings
      arm64: dts: meson: sort Amlogic dtb Makefile
      arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi
      dt-bindings: arm: amlogic: add ODROID-HC4 bindings
      arm64: dts: meson: add initial device-tree for ODROID-HC4

Jerome Brunet (1):
      arm64: dts: meson: vim3: whitespace fixups

Martin Blumenstingl (3):
      dt-bindings: sram: Add compatible strings for the Meson AO ARC SRAM
      dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
      ARM: dts: meson: add the AO ARC remote processor

 Documentation/devicetree/bindings/arm/amlogic.yaml                          |   6 +-
 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml |  42 +++++++
 Documentation/devicetree/bindings/sram/sram.yaml                            |   2 +
 arch/arm/boot/dts/meson.dtsi                                                |   7 ++
 arch/arm/boot/dts/meson8.dtsi                                               |  21 ++++
 arch/arm/boot/dts/meson8b.dtsi                                              |  21 ++++
 arch/arm64/boot/dts/amlogic/Makefile                                        |   4 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts                           |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                          |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts                         | 133 ++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts                       |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts                           |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi                       |  16 ++-
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts                        |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi                      |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi                         |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts                        |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts                      |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts                         |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts                        |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts                      |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts                |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts                  |   6 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts             |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts                |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts                       |   6 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi                          |  21 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts                      |   7 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts                         | 429 +-------------------------------------------------------------------
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts                        |  96 ++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi                           | 442 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts                            |  10 +-
 32 files changed, 827 insertions(+), 472 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
