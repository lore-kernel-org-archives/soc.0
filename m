Return-Path: <SRS0=LeP6=JE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12AEC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 07:01:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A1E961260
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 07:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A1E961260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n1GMLujrV+Iw1U5o7G+96Y8UqDi24cEFpl8ukdNt8is=; b=Kzf1zQfESIAVbvH0F8yhEhJMr/
	JrZoYEfkk+XA3wrAQK0JquAqeWFkvw0LWKcw4zd6XfMzvHgnpP0frxRuXGtDyZZ/SJpo3ikFr4MCY
	Nw4NVYXgmVdHFVnE8B8tQyv10qUYbZmu1vZtKUTW02aEYFHPzSFUCEbjwPTKYWIp/oJW7QHe9OEv9
	fY3WLJz1vFWWoso/4IPfRgyUUxZTPhBEsTM/ptbIbwU6PQ0yJZRw5qzLH2j9c3ZjHePl5ZBuNMwk+
	ZKQKVm0ShLxw64e6lMBV71EZo2os22G5xThLKd+hpF07vgnwPA/eCr3SbY83ZB4mn+Lgl+c5VD65h
	dVWFlP2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU29c-004GnN-BG; Wed, 07 Apr 2021 06:59:08 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU29D-004Glc-2T
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 06:58:47 +0000
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lU298-0000e4-T4
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 06:58:39 +0000
Received: by mail-wr1-f71.google.com with SMTP id o2so6084040wrm.9
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 06 Apr 2021 23:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zf/0xmgkd8JXssWxjuLFbhP71v2tVuYVuW0VdB/t3GU=;
 b=i4rif3mRJxm0xvXDeEdIl3WP87tRD+crDm2GadQrF/Vihneuwsdvo1PgUFSQDlucrT
 pb2kprxtZri/R9GYj/pvgPv0L5WJN0buUllbmWlCTQFbPiCOXIe32nZb3odAdoHhuWik
 Z17h59QOk/cnLspXK4VYw0j2tdw8iJB/tIb3l8GN65QLJtW7ApZZm5qBU8vaQf1qsDpa
 8red06TPy0NDxpfw8UB5i38iRuxf3D4pIQNSoYyOXloqInR7qcuVfufiI1/vMoQY/Qda
 auB9LWgm/cRb+NHTgwcHTT4gYy0JuYp+DfVZXGqz7Vjvr0ag90+xhYwi9hk9Bg1lpOCb
 VYBg==
X-Gm-Message-State: AOAM530YhfQ8lNfXuwLdzgVhOWhuZPp9m1fxVo4E+CMBVBdVWn3BhyY5
 6kY98RUPXbUGhFl75FE3mlIAW81ZXAu6zvkovfVsVDV9R+XAdDZ5rgi3iYF66qhjuRmyLs4x1rX
 abb51RSIIuLQ/pDZ8E9hCstB3V3vrdngOM3MEozyC3O6VMpbat0z7
X-Received: by 2002:adf:ee0f:: with SMTP id y15mr2377219wrn.43.1617778718585; 
 Tue, 06 Apr 2021 23:58:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9IcdaSKcj+GrigVRg0Helk2YtTBPvlNhfhdALWQNwbMWOwjMQ3kKaSPfk/Wup3uyGbo1/Gg==
X-Received: by 2002:adf:ee0f:: with SMTP id y15mr2377204wrn.43.1617778718408; 
 Tue, 06 Apr 2021 23:58:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id c16sm2410506wrx.46.2021.04.06.23.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 23:58:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/3] ARM: dts: samsung: Pull for v5.13
Date: Wed,  7 Apr 2021 08:58:26 +0200
Message-ID: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_075843_588582_DACAE191 
X-CRM114-Status: GOOD (  11.08  )
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
Message-ID: <20210407065826.JFLG4bmU3dhy_0Un0d7NQ-Vw4AahcmOHoAPtEFqVM3M@z>

From: Krzysztof Kozlowski <krzk@kernel.org>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.13

for you to fetch changes up to 7f4ebf3e4ce10a1ed8ff2aee5d75568dc3522b2f:

  ARM: dts: exynos: Add front camera support to I9100 (2021-03-28 20:10:09 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.13

1. Configure battery charger and front camera on GT-I9100 phone.
2. Fix in several boards the Maxim PMIC/MUIC/fuel gauge interrupt flags
   to match real type of interrupt coming from the device.
3. Correct DTS with dtschema.  This brings back the commit adding input
   clock to CMU in Exynos4412 Odroid which was reverted some time ago
   due to unsupported deferred probes (now supported and tested).

----------------------------------------------------------------
Krzysztof Kozlowski (13):
      ARM: dts: exynos: correct fuel gauge interrupt trigger level on GT-I9100
      ARM: dts: exynos: correct fuel gauge interrupt trigger level on P4 Note family
      ARM: dts: exynos: correct fuel gauge interrupt trigger level on Midas family
      ARM: dts: exynos: correct MUIC interrupt trigger level on Midas family
      ARM: dts: exynos: correct PMIC interrupt trigger level on Midas family
      ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid X/U3 family
      ARM: dts: exynos: correct PMIC interrupt trigger level on P4 Note family
      ARM: dts: exynos: correct PMIC interrupt trigger level on SMDK5250
      ARM: dts: exynos: correct PMIC interrupt trigger level on Snow
      ARM: dts: s5pv210: correct fuel gauge interrupt trigger level on Fascinate family
      ARM: dts: exynos: add input clock to CMU in Exynos4412 Odroid
      ARM: dts: exynos: replace deprecated NTC/Murata compatibles
      ARM: dts: exynos: white-space cleanups

Timon Baetz (2):
      ARM: dts: exynos: add charger supply for I9100
      ARM: dts: exynos: Add front camera support to I9100

 arch/arm/boot/dts/exynos3250-monk.dts           |  4 +-
 arch/arm/boot/dts/exynos3250-rinato.dts         |  4 +-
 arch/arm/boot/dts/exynos4210-i9100.dts          | 56 ++++++++++++++++++++++++-
 arch/arm/boot/dts/exynos4412-midas.dtsi         |  6 +--
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  5 ++-
 arch/arm/boot/dts/exynos4412-odroidx.dts        |  3 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi        |  4 +-
 arch/arm/boot/dts/exynos4412-ppmu-common.dtsi   | 48 ++++++++++-----------
 arch/arm/boot/dts/exynos5250-smdk5250.dts       |  2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi   |  2 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi       | 28 ++++++-------
 arch/arm/boot/dts/s5pv210-fascinate4g.dts       |  2 +-
 12 files changed, 110 insertions(+), 54 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
