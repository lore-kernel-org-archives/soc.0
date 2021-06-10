Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502B6C47094
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 07:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18AB6613C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 07:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18AB6613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m2XVjxEGootrXs8NJBM2z7digwZbqtXcRJbKT6PiM2w=; b=T3ZR9V8vAg7JP7
	VONUcgsxLnPYyOqXTjPydQ+dMcTdpfd5utMXP3oXOvIkhDOtLSqAH8THknFektUqNNxK+25HKo0tm
	5henimbzO4gjJRuI0sEN8vz57fl1dOGJKiTenl8AXM3YnW/sbdVXLGSt2vxxI68OVyLVhprMn4zog
	2kYRhCfFeKmrcny1bBwDWL3J8MVY0rm7YqFF4aS2SUD1logF/0dDtaLOw6Qa0fhb3Cp9gOjNGzDOr
	AdE82J8AOIuHv0d7RzvnjVbRZoJgELT0u7nRy8ew8t6IT7j78ZCCKjhuvLOYhKHEJflol91RayyEB
	HRPZtSjAdt90VMJZnbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrFJQ-00HFMP-0C; Thu, 10 Jun 2021 07:41:12 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrFJJ-00HFL0-Na
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 07:41:09 +0000
Received: from mail-wm1-f70.google.com ([209.85.128.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrFJH-0001ZG-Pd
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 07:41:03 +0000
Received: by mail-wm1-f70.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so2715790wmh.9
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 00:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2+wIvEzXuddcIq0HptNZ4S2HwP4Xp1f1Y9ZwuawFc4=;
 b=p8V7RJ1ddhoyciArw+eNDz+YRPz4nGXww5yeqY5TbZlh8vmwSs6/o/KLEYNpf5tQIu
 UlsIWjFhDo5vy/ZP4eyonFswzZd1TXv4w/jShDs8J69+s5qsibP9C0LBpq3oJJ5Ay02O
 X8MGpvdz9a2aOa6WLyDN1zR0mcAjpQf0cNFHgjRpOiJrYQCsWYqfa5VhXerEmHsXcEk+
 OZkzihdlrmNqQTNAQF7IbjHmu9sQEdE6EAU8dG8m7iEicUN/4Y4Ket6eEl7iFRBLUsuC
 zwrkQp1XFFl9XDGSEr+mwccs9Nl46/+vKUfzjKYvCv/8A98dST5eGI7x2l4eNaC9izw+
 ySOA==
X-Gm-Message-State: AOAM533yVaKBaarMTELGl5eF5h0fh/dhAKbx2fVfmw1w6mGX4Othgux3
 lZuVsqDe15n5M18DD8xJTYyS5k4Yl7u86gzak3gzm7plQyrl+bYxhmoirjL1+ohNr77zTvfUECh
 1mJCnOURiDTAkhyQ1VK2xFc1TmLFptww8/tNSM/Rb36G+KC2X3DKr
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr3761926wrv.80.1623310863400; 
 Thu, 10 Jun 2021 00:41:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZwFM7Mtml6+tDBHWQSvn1Ol2Wwfw1kgdH8lO0D7YcHyNXXoa62MbbMN9e/Cmg+98Wt0tHsw==
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr3761833wrv.80.1623310862249; 
 Thu, 10 Jun 2021 00:41:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id k11sm8417229wmj.1.2021.06.10.00.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 00:41:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: samsung: pull for v5.14
Date: Thu, 10 Jun 2021 09:40:54 +0200
Message-ID: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_004105_791408_15650A71 
X-CRM114-Status: GOOD (  11.25  )
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
Message-ID: <20210610074054.cUvm8XNh82Dmx_jgj50iKmQ04OxMLEUuAgV19wQSUyc@z>

Hi,

Few DTS changes. I will have slightly later also pulls for ARM64 and defconfig.

Best regards,
Krzysztof


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.14

for you to fetch changes up to 135adbbee4c66f89b57519633cbf8c3c35b6c4da:

  ARM: dts: exynos: Disable unused camera input for I9100 (2021-05-31 17:53:00 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.14

1. Several cleanups and alignment with dtschema.  This includes removal
   of unused properties and fixing LED brightness property.
2. Enable PMIC RTC interrupt as a wakeup source (intended to wakeup for
   example from Suspend to RAM where the PMIC RTC's power is still
   supplied).
3. Disable unused/not implemented camera on GT-I9100.

----------------------------------------------------------------
Krzysztof Kozlowski (16):
      ARM: dts: exynos: align Broadcom WiFi with dtschema
      ARM: dts: exynos: replace legacy MMS114 touchscreen x/y properties in GT-N7100
      ARM: dts: exynos: fix PWM LED max brightness on Odroid XU/XU3
      ARM: dts: exynos: fix PWM LED max brightness on Odroid HC1
      ARM: dts: exynos: fix PWM LED max brightness on Odroid XU4
      ARM: dts: s5pv210: remove unused Atmel touchscreen properties in Goni
      ARM: dts: exynos: enable PMIC wakeup from suspend on Itop Core
      ARM: dts: exynos: enable PMIC wakeup from suspend on Origen4412
      ARM: dts: exynos: enable PMIC wakeup from suspend on Arndale
      ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid XU
      ARM: dts: exynos: enable PMIC wakeup from suspend on Midas
      ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid X/U3
      ARM: dts: exynos: enable PMIC wakeup from suspend on P4 Note
      ARM: dts: exynos: enable PMIC wakeup from suspend on Arndale Octa
      ARM: dts: exynos: enable PMIC wakeup from suspend on SMDK5420
      ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid XU3/XU4 family

Timon Baetz (1):
      ARM: dts: exynos: Disable unused camera input for I9100

 arch/arm/boot/dts/exynos3250-rinato.dts         | 2 +-
 arch/arm/boot/dts/exynos4210-i9100.dts          | 8 +++++---
 arch/arm/boot/dts/exynos4210-trats.dts          | 2 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 +-
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 1 +
 arch/arm/boot/dts/exynos4412-midas.dtsi         | 1 +
 arch/arm/boot/dts/exynos4412-n710x.dts          | 4 ++--
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
 arch/arm/boot/dts/exynos4412-origen.dts         | 1 +
 arch/arm/boot/dts/exynos4412-p4note.dtsi        | 1 +
 arch/arm/boot/dts/exynos5250-arndale.dts        | 1 +
 arch/arm/boot/dts/exynos5410-odroidxu.dts       | 1 +
 arch/arm/boot/dts/exynos5420-arndale-octa.dts   | 1 +
 arch/arm/boot/dts/exynos5420-smdk5420.dts       | 1 +
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi   | 1 +
 arch/arm/boot/dts/exynos5422-odroidhc1.dts      | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts      | 2 +-
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 4 ++--
 arch/arm/boot/dts/s5pv210-goni.dts              | 9 ---------
 19 files changed, 24 insertions(+), 21 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
