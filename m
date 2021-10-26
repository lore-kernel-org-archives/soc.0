Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7EFC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 09:49:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B329161039
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 09:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B329161039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAoS88mGuhOQJVIDmnrX48dFF4OvVr9rODbXBMdCZ48=; b=KnU2r6bj7gAj16
	ZLJENupLGgbI04+QYgnucKWvxwHeZhoXjknpzndSCdRPHTnDda/HTJnt8oma5G2ej7F9llvMtLMsJ
	WJ3zPuEkjvOseFGIN1yLsWagDhNcESll6LXXY6qDzi5W3ruf0gOQMisCAzakF63GRMp90C4qNU9A9
	Jr6FJbEpiaNsfd5pJgkrXNCsBSMFwd7w47Y/tiAXAqijsAzKh6OKYoDSryRfamxJ5vDIgPhpfs2zE
	sV3pEyijYvqQ/Cbosso/L8H6QMnAxkwNtW1BtynuAUH+qUOBKT8v9osk2opp2nZmWOWvIcBA6aKBs
	EVvjGuUUe3kHiVKHwDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfJ3K-001LyH-8R; Tue, 26 Oct 2021 09:47:30 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfJ38-001LvC-GW
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 09:47:20 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 53B3D3FFF9
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635241635;
 bh=cYZ6vLVJzKfmCMrRSQ5rwJQ1AQl6SdnwWfSPPnNLfrY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=BZPzJQOhHpo+7q+TZ5YaCoucAyZf1jNGNRF9AU+yUtHi4BhN+ZoD3106mXBjHjC2g
 VxukDRoEctiZeu29JQKInyhe0sOFoj8Vk80WMbi3YgWFo+Q14Zg/CzCskiwvpLBK4j
 JWzD48x/3Ik1i8ehKRxT7OSQAOIIov3lpyPMt6WSvQEQJcbyd4Rza3164jR80zpWOw
 tvQhl2fthOLhjhyfjYrSJzizr4I5+nMjOBxI//zv0f0Pai5sMAvQ+kgTjOmb8QrtHe
 iNYTXAwQsuRh5gU2iTtyLe4Y6yJwpzDPYYgBqe34fpBCJaS6kziWoxxCqrhQoBM2w1
 VAdcY8c78Zl3Q==
Received: by mail-lf1-f70.google.com with SMTP id
 k15-20020a0565123d8f00b003ffb31e2ea9so29760lfv.17
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 02:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cYZ6vLVJzKfmCMrRSQ5rwJQ1AQl6SdnwWfSPPnNLfrY=;
 b=IqiueCmYhFaXrhghUg6Khn6tZh+lEuosHMjKPFFAr8R5U+a6ZY/TmFyLFnClqqQBhl
 a1wTGkT0lm0T6BuZLCsW+kbvn7KnG0WITkGGlyQ421BHKyktOsiLuyHSfO+ctEeNnJpi
 Ta2TJDrpfBWJwKTpOq8FZouMhN3SAACkusQeaAsoK5fINS9wpal7juIsRgN4V9pVU1HT
 uDzzkrdUiX97wGVWwjr3jPvCmVf87Igxh0DdJ4lcOW2QWzlL4jsGhpN+58rviV9B5sqS
 dtNk5iqnyoY1Eke87ypb6AfwkBN4RHZfgVPkZj7YFPFXNM18M5uNBfBkRZ1k9uyYaSgd
 ovwQ==
X-Gm-Message-State: AOAM530sSZ1Dnsi5X92Pb9hGxSVwjVrUc2XqBDhVkR9Hd+dk2DN94yQT
 r6u/lbBKKffrAiYDJvBN824xCFN6UmI4dpRO3G6dl3EZ8LoFBsqK++l6MoWuih6mCbzCl+gNEHv
 1TEJKZusxqC29aDTRIDIxtJiyJ6qe/sV8zaYl8fXtBARDLnswDeCA
X-Received: by 2002:a05:6512:68b:: with SMTP id
 t11mr21162781lfe.586.1635241634811; 
 Tue, 26 Oct 2021 02:47:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlQgrckrQHX3Yvswq5svDMfRPICsoGQMe4d5hGv/Expe3ttKtnyzJNWvaJkOw7N4Zei2O1cQ==
X-Received: by 2002:a05:6512:68b:: with SMTP id
 t11mr21162737lfe.586.1635241634261; 
 Tue, 26 Oct 2021 02:47:14 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 v17sm113794lfo.167.2021.10.26.02.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:47:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/4] soc: samsung: drivers for v5.16
Date: Tue, 26 Oct 2021 11:47:06 +0200
Message-ID: <20211026094709.75692-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
References: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_024718_724219_F72340B9 
X-CRM114-Status: GOOD (  14.33  )
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
Message-ID: <20211026094706.FnP8uCX0lfLEWeV8_HHofSW8dorDImMq2DsCzhu5GlE@z>

Hi,

Set of changes mostly around Exynos ChipID driver. I hope it is not too late
for this. These were sitting in my tree for some time, so they got linux-next
coverage.

Best regards,
Krzysztof


The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.16

for you to fetch changes up to b417d1e88f32645ed62a00d43c347b4386a0a021:

  soc: samsung: exynos-chipid: add exynosautov9 SoC support (2021-10-26 09:16:53 +0200)

----------------------------------------------------------------
Samsung SoC drivers changes for v5.16

1. Convert Exynos ChipID and ASV driver to a module and make it a
   default, instead of selected. The driver is not essential, so it
   could be disabled, if needed.
2. Add support for Exynos850 and Exynos Auto v9 to Exynos ChipID and ASV
   driver.
3. Get rid of HAVE_S3C_RTC because it was adding just another layer
   instead of direct dependencies.
4. Minor cleanups.

----------------------------------------------------------------
Chanho Park (1):
      soc: samsung: exynos-chipid: add exynosautov9 SoC support

David Virag (1):
      soc: samsung: exynos-pmu: Fix compilation when nothing selects CONFIG_MFD_CORE

Krzysztof Kozlowski (4):
      soc: samsung: exynos-chipid: avoid soc_device_to_device()
      soc: samsung: exynos-chipid: convert to a module
      soc: samsung: exynos-chipid: do not enforce built-in
      soc: samsung: pm_domains: drop unused is_off field

Sam Protsenko (3):
      soc: samsung: exynos-chipid: Pass revision reg offsets
      dt-bindings: samsung: exynos-chipid: Document Exynos850 compatible
      soc: samsung: exynos-chipid: Add Exynos850 support

Will McVicker (2):
      arm64: exynos: don't have ARCH_EXYNOS select EXYNOS_CHIPID
      rtc: s3c: remove HAVE_S3C_RTC in favor of direct dependencies

 .../bindings/arm/samsung/exynos-chipid.yaml        |  5 +-
 arch/arm/Kconfig                                   |  1 -
 arch/arm/mach-exynos/Kconfig                       |  2 -
 arch/arm/mach-s5pv210/Kconfig                      |  1 -
 arch/arm64/Kconfig.platforms                       |  2 -
 drivers/rtc/Kconfig                                | 10 +--
 drivers/soc/samsung/Kconfig                        |  5 +-
 drivers/soc/samsung/Makefile                       |  3 +-
 drivers/soc/samsung/exynos-chipid.c                | 94 ++++++++++++++++++----
 drivers/soc/samsung/exynos5422-asv.c               |  1 +
 drivers/soc/samsung/pm_domains.c                   |  1 -
 include/linux/soc/samsung/exynos-chipid.h          |  6 +-
 12 files changed, 94 insertions(+), 37 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
