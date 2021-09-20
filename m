Return-Path: <SRS0=0B9I=OK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2060C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Sep 2021 10:08:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6289D60F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Sep 2021 10:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6289D60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Rn/tFxibkXoCVwPbhxT9tmyJHANDRkEzo+MNOj2tR8=; b=eWn6+JZx3y4ZEQ
	YiP10R49c/+uKGyy8+qCBevJoiGpDn3qrj/7uEjYx2oODdlYUfzpS4JVFfjy+7JskBEMV176pMdnR
	8bv7aqhRAJr4Z04KjQ9qyGBwK5P9PTUjlX0ypROotn7ivZJw2rKuKfEAnVjzkRWPmRNsVDhRbNfW6
	05rmE8Mz1yQzHYPN9f6XVWpiUeUZhREnxup+iNRtUIER3z34I+hOn/u9ZvIPQ1S7g0yNiVe6UFOu0
	vPtLgJxRq+B12QQ9Nb3BHx9zuJgPhE2RrWT62vT+JHTNpL1tvUOrN/OwOZOCJQVYGzR11mhqsmLyk
	weagzTadzDx6HcuzmD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSGBs-001E5x-6e; Mon, 20 Sep 2021 10:06:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSGBm-001E4d-IA
 for linux-arm-kernel@lists.infradead.org; Mon, 20 Sep 2021 10:06:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50D6F60F5D;
 Mon, 20 Sep 2021 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632132378;
 bh=cWNYxGntqMjtuFTPah0ukt4ZiP3ZlHgC+JMjq3iH+5E=;
 h=From:To:List-Id:Cc:Subject:Date:From;
 b=P9Yh1cfompD9ktsrZYxFoVUgjbEI2p/Bg/fSwNmz7vsSj8VZV1GMrHmDhE9moHVnG
 NFPvqwD/odAt4lKq8cifYgxEnm8qmE7sKeSCYyy6NzGFtEyiCsPSUsIGXs21oqTATI
 xfgcWVIJmFdyGAdWH6/bnvwLbW/7nNsPm0oxgIBtXdSuCVoUegZdNQt46/HX1teFmt
 82DbyVQGtHajToYyDtBaICap5cJq+ImFZrEYSI2sZHllh5hXfudyepLtUzV7oiRBNc
 3OTnGErcmgpxmK86zFth4gI+X1mHuBQFVeqJkyDTN1FfLS3XERyj1rERSCKQsWHF9I
 yqFRnFKLQuyyA==
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Pankaj Dubey <pankaj.dubey@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] soc: samsung: exynos-pmu: select CONFIG_MFD_CORE
Date: Mon, 20 Sep 2021 12:06:08 +0200
Message-ID: <20210920100613.1613919-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_030618_690243_C8A14F51 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210920100608.4hFeOueXXt8NDJ-XlvTeg72Zv9JS-n8qqfu2KQmHmK8@z>

From: Arnd Bergmann <arnd@arndb.de>

Using devm_mfd_add_devices() fails if no driver selects the
MFD core code:

aarch64-linux-ld: drivers/soc/samsung/exynos-pmu.o: in function `exynos_pmu_probe':
exynos-pmu.c:(.text+0xa0): undefined reference to `devm_mfd_add_devices'

Add the missing select statement.

Fixes: 93618e344a5e ("soc: samsung: exynos-pmu: instantiate clkout driver as MFD")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 5745d7e5908e..1f643c0f5c93 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -25,6 +25,7 @@ config EXYNOS_PMU
 	bool "Exynos PMU controller driver" if COMPILE_TEST
 	depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
 	select EXYNOS_PMU_ARM_DRIVERS if ARM && ARCH_EXYNOS
+	select MFD_CORE
 
 # There is no need to enable these drivers for ARMv8
 config EXYNOS_PMU_ARM_DRIVERS
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
