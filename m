Return-Path: <SRS0=uTQZ=JA=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D75C433ED
	for <soc@archiver.kernel.org>; Sat,  3 Apr 2021 15:06:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9AAAD61278; Sat,  3 Apr 2021 15:06:11 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45D4611CC;
	Sat,  3 Apr 2021 15:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45D4611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=xuwei5@huawei.com
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FCKv20MpVz18GcM;
	Sat,  3 Apr 2021 23:03:58 +0800 (CST)
Received: from [10.46.67.229] (10.46.67.229) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Sat, 3 Apr 2021
 23:05:55 +0800
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <olof@lixom.net>, <arm@kernel.org>, <thunder.leizhen@huawei.com>,
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, <liguozhu@hisilicon.com>,
	<tangkunshan@huawei.com>, <huangdaode@hisilicon.com>,
	<jonathan.cameron@huawei.com>, <john.garry@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <salil.mehta@huawei.com>,
	<shiju.jose@huawei.com>, <mchehab+huawei@kernel.org>
From: Wei Xu <xuwei5@hisilicon.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v5.13
Message-ID: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com>
Date: Sat, 3 Apr 2021 23:06:05 +0800
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

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-5.13

for you to fetch changes up to 3d208c8207bfaa861a783c8fed9f31438fc0bcc6:

  arm64: dts: hisilicon: correct vendor prefix hisi to hisilicon (2021-04-02 15:12:52 +0800)

----------------------------------------------------------------
ARM64: DT: Hisilicon ARM64 DT updates for 5.13

- Correct the vendor prefix for hi3660 and hi3670

----------------------------------------------------------------
Zhen Lei (1):
      arm64: dts: hisilicon: correct vendor prefix hisi to hisilicon

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
