Return-Path: <SRS0=uTQZ=JA=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE67C433B4
	for <soc@archiver.kernel.org>; Sat,  3 Apr 2021 14:59:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B64F161263; Sat,  3 Apr 2021 14:59:12 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799ED611CC;
	Sat,  3 Apr 2021 14:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799ED611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=xuwei5@huawei.com
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FCKkz6mMszrbtj;
	Sat,  3 Apr 2021 22:56:59 +0800 (CST)
Received: from [10.46.67.229] (10.46.67.229) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Sat, 3 Apr 2021
 22:58:56 +0800
From: Wei Xu <xuwei5@hisilicon.com>
Subject: [GIT,PULL] arm: hisilicon: SoC updates for v5.13
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <olof@lixom.net>, <arnd@arndb.de>, <xuwei5@hisilicon.com>,
	<fanghao11@huawei.com>, <zhangyi.ac@huawei.com>, <liguozhu@hisilicon.com>,
	<tangkunshan@huawei.com>, <huangdaode@hisilicon.com>,
	<jonathan.cameron@huawei.com>, <john.garry@huawei.com>,
	<salil.mehta@huawei.com>, <shiju.jose@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>
Message-ID: <eba8b55e-0969-8ca2-eca3-7c471cb0ff6f@hisilicon.com>
Date: Sat, 3 Apr 2021 22:59:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.67.229]
X-CFilter-Loop: Reflected

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-armv7soc-for-5.13

for you to fetch changes up to c1ce9d8081a9fca5fd1b2e48bcc20e5dc3387302:

  ARM: hisi: use the correct HiSilicon copyright (2021-04-02 15:36:27 +0800)

----------------------------------------------------------------
HiSilicon ARMv7 SoC updates for v5.13

- Correct the HiSilicon copyright

----------------------------------------------------------------
Hao Fang (1):
      ARM: hisi: use the correct HiSilicon copyright

 arch/arm/mach-hisi/hisilicon.c | 4 ++--
 arch/arm/mach-hisi/hotplug.c   | 2 +-
 arch/arm/mach-hisi/platmcpm.c  | 2 +-
 arch/arm/mach-hisi/platsmp.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
