Return-Path: <SRS0=1iVd=FF=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29D0C71156
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 22:37:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7FEBA2087C; Tue,  1 Dec 2020 22:37:54 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE1D208C3
	for <soc@kernel.org>; Tue,  1 Dec 2020 22:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UNKpHjbd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAE1D208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-pj1-f68.google.com with SMTP id r20so2237008pjp.1
        for <soc@kernel.org>; Tue, 01 Dec 2020 14:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=KdghF0122FkdkajYNIvGjUxGJDb5bbiau51gZyMHydI=;
        b=UNKpHjbdsMYXdbfn/uoRrsVxy0NpYYnKpjEP3/cHRDLlr1/X5TEF9n59jfFdsU7Iq7
         +osUCQmEg3FGjnaTYoJ2G1yROuO0X6IYtgAsewj3n/XvI4XYB9smGAC4jt5mWoT3xXE/
         4HxgxVpxsPHbyhMtD0px6LaGpVZ8XDMTkl+brvW/b7wlHTscjp1CRfnKSpqiiX0zIENs
         EiYUNlfa929747mS9KSQuNxLZ6anDl87fsl9txIIhoxrFdXAnVEsCRBg0n6hHJEziiWU
         MnTCwh6y0kfteIRnlk2XICd7Ho7AUeHx4NPGCzqU/G5izR3xgjBQ1saHvKzJW1AmJis7
         O29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=KdghF0122FkdkajYNIvGjUxGJDb5bbiau51gZyMHydI=;
        b=q1D998MNAuo9pJHZxWm5Hg/9W78d2SDuYzVIzv8o50jDeZ0wPuMSsPEcRHoVWCDV8N
         NLSWTGavxc2EruJi2BX+7v4yHH4HFZMrEfP9dKSmzamSDsSQShQTIy7GhxoFpC13T4Hu
         VFfQ3xwSyLC8JRnxVg2rB0FTAUOBPxfVREnHgV+i6S/hNPFT4iChqVJnAiRi6yAeh1JR
         h+iYq4MI2yrj4loGLkpwXgBX8kSAkIHS4SUReez3P+VWaRFiNA7BYeb95AsLOjsMcfdW
         7VLoMlqiju/yytaP29KJncTrYa6+gPQO8I00jG5huq3ofE3R5zsGdz9wbHchRww6KMTC
         hXQw==
X-Gm-Message-State: AOAM531fgugHhsfwVrBoa92diw9i7FH7ilYbRu2vhehRFhbIeaPkMR6A
	iQg2fhUSS8SGL1fbEi7MsYMl3EjNGxR4t1gr
X-Google-Smtp-Source: ABdhPJzkFrwLX0tr6PJuC6PMOnBnNCFePCKm0vfgHnd5DQROHh+YdCAmIbZ44sKIAzPlTQo5A+je8A==
X-Received: by 2002:a17:902:bc86:b029:da:9da4:3092 with SMTP id bb6-20020a170902bc86b02900da9da43092mr3976245plb.71.1606862272720;
        Tue, 01 Dec 2020 14:37:52 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id q5sm785613pff.36.2020.12.01.14.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 14:37:51 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.11
Date: Tue, 01 Dec 2020 14:37:50 -0800
Message-ID: <7heek9jgox.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

Arnd, Olof,

Note that this branch pulls in a tag from the clk-meson tree which has
already been queued for clk-next.  This is for a couple new clock IDs.
I also included my amlogic-fixes tag (which you've already pulled) to
fix up potential conflicts.

Kevin


The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to b6a1c8a1eaa73b1e2ae251399308e9445d74cef7:

  arm64: dts: meson-sm1: fix typo in opp table (2020-11-30 16:12:46 -0800)

----------------------------------------------------------------
arm64: dts: amlogic updates for v5.11
- AXG SoCs: add/enable PCIe & USB OTG support
- AXG SoCs: add MIPI DSI support
- Khadas VIM: add RTC
- several cleanups & fixups

----------------------------------------------------------------
Anand Moon (1):
      arm64: dts: amlogic: add missing ethernet reset ID

Artem Lapkin (1):
      arm64: dts: meson: fix spi-max-frequency on Khadas VIM2

Christian Hewitt (7):
      arm64: dts: meson: remove empty lines from aml-s905x-cc v2 dts
      arm64: dts: meson: add watchdog to g12-common dtsi
      arm64: dts: meson: enable rtc node on Khadas VIM1/VIM2 boards
      arm64: dts: meson: Add capacity-dmips-mhz attributes to GXM
      arm64: dts: meson: add rtc aliases to meson-khadas-vim3.dtsi
      arm64: dts: meson: update the Khadas VIM3/3L LED bindings
      arm64: dts: meson: add KHAMSIN IR remote node to SML5442TW

Dongjin Kim (1):
      arm64: dts: meson-sm1: fix typo in opp table

Jerome Brunet (1):
      arm64: dts: meson: odroid-n2 plus: fix vddcpu_a pwm

Kevin Hilman (2):
      Merge tag 'amlogic-fixes' into v5.11/dt64
      Merge tag 'clk-meson-v5.11-headers-1' of git://github.com/BayLibre/clk-meson into v5.11/dt64-deps

Martin Blumenstingl (2):
      arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible
      ARM: dts: meson8: remove two invalid interrupt lines from the GPU node

Neil Armstrong (8):
      arm64: dts: meson-axg: add USB nodes
      arm64: dts: meson-axg-s400: enable USB OTG
      dt-bindings: clk: axg-clkc: add Video Clocks
      dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
      arm64: dts: meson-axg: add PWRC node
      arm64: dts: meson-axg: add MIPI DSI PHY nodes
      arm64: dts: meson-axg: add PCIe nodes
      arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots

Scott K Logan (1):
      arm64: dts: meson: add missing g12 rng clock

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts                  |  16 +++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                      | 174 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi               |  12 ++-
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts       |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                       |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts       |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts      |   3 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts |   4 -
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts           |   5 +-
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi                      |  20 ++++
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi              |  15 ++-
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                      |   2 +-
 include/dt-bindings/clock/axg-clkc.h                            |  25 +++++
 13 files changed, 268 insertions(+), 17 deletions(-)
