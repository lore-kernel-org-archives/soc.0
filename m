Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81613C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 17:11:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2772464E2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 17:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2772464E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0tPSjZ6JLQ+nvu4mcb1OQpDTuNQV9aOWEusOrhO5FEk=; b=ceiKXWfekuIcDsRddkAqOrTMQ
	imPRM/I/ma/jXqpU6BC2G+0kKFMNy4Zm/CGMTSEGSGdNX/EBEYGY6Ps8fPq/KFNjYwU1gr6zkVZsE
	bFN/eBG5uq7K/zTDna0I4Zran9sJ2dBluDgEApSjjaz+Ko3v5jCuRIZ7uA92MMJWZc220NTou4+/M
	FpRRLs5luPGDj3LPdZvWoBIdwT0CQ4SLOYwb9xwbb12Rosa74Sl3dn6il5OfQfXBmtcoKDs11BU6r
	JcuNyk7CNt3Pj6m3gf8li14TKUWjN8QSACugvkABmgW/GF/q9ZkvK+7v4GLhGug5QrZd2/zQV89pQ
	9gTL5JIuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9A2u-0007xT-Lq; Mon, 08 Feb 2021 17:09:56 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9A2r-0007wb-KY
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 17:09:55 +0000
Received: by mail-pg1-x531.google.com with SMTP id z21so10642330pgj.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 09:09:51 -0800 (PST)
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
 b=hBeKpqF7zId4UO1Ua3mvbHZcC09N6CKHBnHCFT4FUuVSUQxJajq0jqC0Ho1Uaj5c5U
 PFeeuRMR8H4FkyqmBkMCGQUNVPrTu2SdYjaDZaa49HbeAjNjVR+oEvixo/p/nHKXeSHk
 kZCCqdN6f6qS8PYkGoT8ari25jTYmyU47CEMcRlTJejIG6G0UyrZGdTX+xoGYNVUtx1m
 37o8PjrBSeICgjOdjycUONASapBILscTirO4rhoVciavIRPBPXEoU9Yhq5kHUWhkOhgL
 aWVv58tw6KqjJEIK6QzvdaLpnxdXl3gR+ehyS2/xCD6661X5olIFdU7ULEVRqQjTidEY
 UV7A==
X-Gm-Message-State: AOAM533bxTNuUPowzK1gq9MszXi6taYJYSAv/gXfZ0vA9myt9JCjlo6c
 PH7NgW3lQuGR7y3yYIU1bF8VFg==
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
X-CRM114-CacheID: sfid-20210208_120953_766672_0EE10843 
X-CRM114-Status: GOOD (  17.23  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208170948.onUTRabuqddQ5IhQ_XbJheysvGVSFJvTbfIAaXYtiek@z>

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
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
