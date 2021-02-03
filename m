Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBA5C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:26:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E9964E39
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21E9964E39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B7WAuPD+7SfhvixdRLXkO9dXCroQglOfd60OJrljvYE=; b=xxCTR1xt6sCj2FlzMl+5I982vk
	McHpraHghDEaQ11a+sZ8bZBh9Eg5AFrkEFj+hKqPcu2tpbbFAwRLcxJevB6Ub4MuhaCkIB7MZ+bXI
	NbzULWbIYw84TUmrIChToiloSPRbkLp8MJj+2BYpY3kVXI77ZXHEMIgTqrqPxrVVyL44UhSZBm5SX
	eAK+j95qW1rx7fqIF/gvyLhz2vSbSCnx4+Rcu411sWiybY25xId9PYI5LC5XOeWhC/MoQolaAZv0J
	RJ31sJu3gXLbDNfnCjJlG2UcsVC5WOC37O5wzSZbKvcZ0Ts0bb/kA/tWeevglp7OXebnlACRcPsQm
	mdYMDLEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7NnZ-00017Z-Fg; Wed, 03 Feb 2021 19:26:45 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7NnW-00016K-Ml
 for linux-amlogic@lists.infradead.org; Wed, 03 Feb 2021 19:26:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id 8so403053plc.10
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Feb 2021 11:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=x7h7K5ukePrcY6OqyWfZmCMplSVtCDuh2Io7lfL8osI=;
 b=W07MmgCGHhj93bA/3yDT8F1TjaBmnO0JPCQkcY8uF/4iIT2PgHNCCfs66jyPYsO7V8
 8sDiPuANPEmaHp9VZbSt91T42ht0yjddxSbNbxLP/ZbzQNH8PxagU32rK6K9B5af0Wu7
 2P/K/QPbZMfWwyii/OTkcLXJSk7Xcq/Ylpvr2F+qQEPgTRlODRffpsd5b9DLSO25DBff
 f66J7E5LMQv7G0bCRbjguGTwVX5XA17bPHwfT9vQvlX1jLOt3c/VZNc+Bi4GX7lLb4kH
 ukUJDCVFdNliUjEjOwJ7KLEj2pejNUTvN6iVzDYnugiGNKaED095jLuxe1SPj2+bkOe+
 OL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=x7h7K5ukePrcY6OqyWfZmCMplSVtCDuh2Io7lfL8osI=;
 b=VQw/31j71rxbmBMc+yvn/PGGE9h7P+zoOLpL8egfJ9PVwQUXFpT4h3rYwPZAPb9MlG
 WAtI3zT9aZ/hhPqU9oiOFuVwfn/DoJdqKzuXMaF3xiNo3gJ2IiSI/YYovcE0Dxep+kGr
 IhF9R8cTEvGfhBu5SshbqtlUotxL3PrXJ/jsU7YQCrl5e2vvqcifrro6u3BTzFl0J441
 Pw0G6bqwrdpQGxDod6tKt8D4SehxOEmLKDoZWWQg2pBEGStkTwwYWADOP/165AC4skWY
 vS6BkwDbutmrYukZa4df0EgzO+/XNuJbNxM5EPgIhdnGdLjQPcRbwaH3c4BjnvpIqFbh
 kapA==
X-Gm-Message-State: AOAM531YBoJdSmvED8H/G2+B6vE1EcPkGk4RxJxr7n7JbLkArQ0uz9Jl
 Uky4DiSCPQWpYzgHrrQf3Ntf/w==
X-Google-Smtp-Source: ABdhPJyeVoyRo3JNcVdbTH1zf3Sdmd3riRUqIPt8BNn8HaG5aBUrzWK0dorgucANAlC5/Kra/cimFQ==
X-Received: by 2002:a17:90a:77ca:: with SMTP id
 e10mr4571397pjs.53.1612380400139; 
 Wed, 03 Feb 2021 11:26:40 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id l14sm2718128pjy.15.2021.02.03.11.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:26:39 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.12
Date: Wed, 03 Feb 2021 11:26:39 -0800
Message-ID: <7him792brk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_142642_784983_C4D9EEE2 
X-CRM114-Status: GOOD (  11.94  )
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
Message-ID: <20210203192639.H5WLvbn2lBFl0VbK011B42IaDatjn-JIP5DVFgp9eA4@z>

Arnd, Olof,

This round of DT changes for Amlogic SoCs is based on top of the v5.11
fixes already merged by Arnd.

Kevin


The following changes since commit daf12bee07b9e2f38216f58aca7ac4e4e66a7146:

  arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain on Odroid-C4 (2021-01-27 10:08:23 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to 9be09db3e2adf5843ec1e20771c598e70d2bd34a:

  arm64: dts: meson: add initial device-tree for ODROID-HC4 (2021-02-03 10:30:10 -0800)

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

Christian Hewitt (8):
      dt-bindings: arm: amlogic: add support for the Beelink GS-King-X
      arm64: dts: meson: add initial Beelink GS-King-X device-tree
      arm64: dts: meson: shorten audio card names for alsa compatibility
      arm64: dts: meson: add i2c3/rtc nodes and rtc aliases to ODROID-N2 dtsi
      dt-bindings: arm: amlogic: sort SM1 bindings
      arm64: dts: meson: sort Amlogic dtb Makefile
      dt-bindings: arm: amlogic: add ODROID-HC4 bindings
      arm64: dts: meson: add initial device-tree for ODROID-HC4

Jerome Brunet (1):
      arm64: dts: meson: vim3: whitespace fixups

Kevin Hilman (1):
      arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi

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
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts                         | 133 +++++++++++++++++++++
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
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts                         | 429 +-----------------------------------------------------------------
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts                        |  96 +++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi                           | 442 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
