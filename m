Return-Path: <SRS0=RL/0=RD=huawei.com=cuigaosheng1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCD9C433FE
	for <soc@archiver.kernel.org>; Sat, 18 Dec 2021 08:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA676C36AE1; Sat, 18 Dec 2021 08:57:54 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9C6DC36AE5;
	Sat, 18 Dec 2021 08:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9C6DC36AE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from dggeme762-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JGKRN5P1CzZcWc;
	Sat, 18 Dec 2021 16:54:40 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.44) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Sat, 18 Dec 2021 16:57:44 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
List-Id: <soc.lore.kernel.org>
To: <linux@armlinux.org.uk>, <krzysztof.kozlowski@canonical.com>,
	<andrew@lunn.ch>, <gregory.clement@bootlin.com>,
	<sebastian.hesselbarth@gmail.com>, <vireshk@kernel.org>,
	<shiraz.linux.kernel@gmail.com>, <soc@kernel.org>,
	<linus.walleij@linaro.org>, <ardb@kernel.org>, <cuigaosheng1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<gongruiqi1@huawei.com>, <wangweiyang2@huawei.com>
Subject: [PATCH -next 0/3] replace open coded VA->PA calculation
Date: Sat, 18 Dec 2021 16:58:40 +0800
Message-ID: <20211218085843.212497-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.44]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected

These patches replace an open coded calculation to obtain the physical
address of a far symbol with a call to the new ldr_l etc macro, and they
belong to the kaslr patch set of arm32.

Reference: https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=arm-kaslr-latest

Ard Biesheuvel (3):
  arm-soc: exynos: replace open coded VA->PA conversions
  arm-soc: mvebu: replace open coded VA->PA conversion
  arm-soc: various: replace open coded VA->PA calculation

 arch/arm/mach-exynos/headsmp.S     |  9 +--------
 arch/arm/mach-exynos/sleep.S       | 26 +++++---------------------
 arch/arm/mach-mvebu/coherency_ll.S |  8 +-------
 arch/arm/mach-spear/headsmp.S      | 11 +++--------
 arch/arm/plat-versatile/headsmp.S  |  9 +--------
 5 files changed, 11 insertions(+), 52 deletions(-)

-- 
2.30.0

