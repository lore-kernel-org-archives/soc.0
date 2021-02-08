Return-Path: <SRS0=H6Jw=HK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0B0C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Feb 2021 17:10:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A153F64E2E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Feb 2021 17:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A153F64E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i1t/b3AwaNVViyZug+GnbqPf78lpwxWupIAadYgimro=; b=ezNzGskc675jK6jL5ZhFD7VGF
	Gk+uHJFLwUmWczqcMTtnkDGMoXhx3iuUwrjmO6ESgXEWBoGIxx/hEDbOqyAzWDFpMBa2F4Wj7UQkS
	Ms6XleRymx4Qxn0NIT9Z15pUgVPNP/BTZ+tbNyoLt6kqQZmQWHyzNkQ9xJs4w9MRp6XNBW4S6PdVO
	1xTsC5FzMYNGSAFxEkqkx0ieSMQasNLkkccZnZoaTJ75mNeVOCWTKRD7ulBdv80LHv6Y0KtCTAg+N
	b/d2T8jRj18ISZAakNgejtNoGVjVeIUsjzkbec6Nvztwi8x68FCd0Fjzm14g038oHwrY1QqgeCbJK
	uiI5kQp5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9A2w-0007xh-Ig; Mon, 08 Feb 2021 17:09:58 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9A2r-0007we-Ka
 for linux-amlogic@lists.infradead.org; Mon, 08 Feb 2021 17:09:55 +0000
Received: by mail-pg1-x52f.google.com with SMTP id b21so10617542pgk.7
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Feb 2021 09:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=akU23dffyJjz+djylk5jsVdyyG8Be7sK0HA6TbaxMtQ=;
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
 b=O/nja5Ot/sjB1nAqo/1lWQGcokM3xTSSFSfvsvBZ5Cw7UXoV/ytSfB3AISp/xaqQiQ
 ZSIcTLeYOM3wGR8v04Fo05j0ueBnXWkQNCxGvAE0VyzSo+0RrLD0CPBkMrdLCg9RquKx
 LBgMX6LS0/K7Nbz7vR4WUD6ngyD3jwLRtSQRpAcfRhrl3gdkAIrh54mt1LJ3A9sbSpr3
 Fd1xdhVr00PzuDf7dC16FaHRUahT0OoSZHZw2v47MwbcEOzlsmKe/qPA3mtOrgthPUVq
 DC6CGhaWR9chKFOb5w54FDYom10vJQcWIz9OT9kyfjL5rUBqUgyB3uZIhBaUEsMgblwj
 dKBQ==
X-Gm-Message-State: AOAM530lnAYblSvkwr191XdgdNCKfa+BMgk4RMHCPSPSF+MwTYtpHkMg
 htKWkS+ihDWO0RcCSYsZvBOoJCTj+LTfeqJT
X-Google-Smtp-Source: ABdhPJzLsUpJoGQ4+hph9y8nKFNNGleQfa9cyYQEilGrdqt4hsPs1L34v5obEJDt9uS+dj7tmuB6nQ==
X-Received: by 2002:a62:e804:0:b029:1dd:cf18:bdee with SMTP id
 c4-20020a62e8040000b02901ddcf18bdeemr5201557pfi.63.1612804190099; 
 Mon, 08 Feb 2021 09:09:50 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x20sm7080559pjp.41.2021.02.08.09.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 09:09:49 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org, Christian Hewitt <chewitt@libreelec.tv>
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.12
In-Reply-To: <7him792brk.fsf@baylibre.com>
References: <7him792brk.fsf@baylibre.com>
Date: Mon, 08 Feb 2021 09:09:48 -0800
Message-ID: <7heehq7ag3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_120953_767050_C97A21D6 
X-CRM114-Status: GOOD (  15.72  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208170948.WfFO5oPg9n1fhStDmYhBbfYnDQggljE4pimbfY6sT98@z>

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

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
