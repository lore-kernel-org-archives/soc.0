Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C27C64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 22:39:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04EEE208C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 22:39:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HhbgbKDd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UNKpHjbd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04EEE208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fcoLtV5k0FaiBuMMXdLgWyx/fVqwqRSV8JzIvBVvFBM=; b=HhbgbKDdX5jkdS3+ln02ghRU0k
	3rSpXlykudhUR+Ii1mpXCYg5zwKwPCk/1YcaPtK8MMUnNtQJBafIvADAcdh4izlFKQWPn+8Uht5FK
	xvz2LixISu4qpHE2gIDDR1nTtk/YaH1pVMi/WdZrch5wXfndp1j3JTCV6JEUjQBsgT8VP7dTPRKIa
	s77NL2kOF7H6c033p2E42BOfvM45xotaW5RZVR7ZlLic/PTfIDUgyWIvPT5TjhMHWDaR2IFLNxvzo
	C29NINpjtR1kv7ldVfoJmbK/I4pME/ooNX7oUwr70ARorLQPHgyRkigmTeHApVO+hlZ8KckIprhI0
	329W9Icw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkEHX-0008Ed-Am; Tue, 01 Dec 2020 22:37:59 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkEHT-0008Cv-Bz
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 22:37:56 +0000
Received: by mail-pj1-x1043.google.com with SMTP id e5so2242708pjt.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 14:37:54 -0800 (PST)
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
 b=ElKDJ2C/OVbnYwGtTzAT404SrHC/u729mUQCw9kP15LQ1tKwtlmIIMkoPiRbPtwBII
 FWcpTiJTy4z1jj+7/CRpIIJBcypf1zt1zUsIWQDhFMAI+mBKBaboxyaRwsJQKv4xZj61
 X38+14bOfUWZsXBpfq1iCDGcXWYxdGy7O57jts9/0UoDBUalY0YfPZXSYy/hLef3fwok
 pH91K28iFGiiltpk2k5lhvCFDcNUvPhZL4gVQt0HmjB8sqwiGqHjo5VEjKISY6z/kE1I
 SVBtFsy7Z0w1PEkvtyCd1odSGXvkZBIX18TYuYc0sckNa3mYxXKccBzorFMK4U1mop99
 6G+w==
X-Gm-Message-State: AOAM532fUzW4ZW4NMWfIEMMJ+9tf9iifZ9zrDhWDArpfPz5kbWXwAuFz
 vH2sUmwpfWn1qOKj8gy08P3x/Q==
X-Google-Smtp-Source: ABdhPJzkFrwLX0tr6PJuC6PMOnBnNCFePCKm0vfgHnd5DQROHh+YdCAmIbZ44sKIAzPlTQo5A+je8A==
X-Received: by 2002:a17:902:bc86:b029:da:9da4:3092 with SMTP id
 bb6-20020a170902bc86b02900da9da43092mr3976245plb.71.1606862272720; 
 Tue, 01 Dec 2020 14:37:52 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q5sm785613pff.36.2020.12.01.14.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 14:37:51 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.11
Date: Tue, 01 Dec 2020 14:37:50 -0800
Message-ID: <7heek9jgox.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_173755_494238_4A5EA541 
X-CRM114-Status: GOOD (  12.53  )
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
Message-ID: <20201201223750.OmHm3HgkhrTB-ot1RlkbCzhN7ZWxZQLj8tUCHw79UNE@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
