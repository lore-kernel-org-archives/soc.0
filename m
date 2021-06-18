Return-Path: <SRS0=aU08=LM=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DA7C2B9F4
	for <soc@archiver.kernel.org>; Fri, 18 Jun 2021 01:19:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C928C613A9; Fri, 18 Jun 2021 01:19:45 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150286135C;
	Fri, 18 Jun 2021 01:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 150286135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=xuwei5@huawei.com
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G5gxV3Q06zZd6y;
	Fri, 18 Jun 2021 09:16:46 +0800 (CST)
Received: from [10.40.166.221] (10.40.166.221) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 18 Jun 2021 09:19:42 +0800
Message-ID: <60CBF4AE.7040301@hisilicon.com>
Date: Fri, 18 Jun 2021 09:19:42 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>
CC: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@kernel.org>,
	<xuwei5@hisilicon.com>, Hao Fang <fanghao11@huawei.com>, Zhangyi ac
	<zhangyi.ac@huawei.com>, Tangkunshan <tangkunshan@huawei.com>, huangdaode
	<huangdaode@huawei.com>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>, John Garry <john.garry@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>, Shiju Jose <shiju.jose@huawei.com>
Subject: [GIT PULL] arm64: dts: hisilicon dts updates for v5.14
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.166.221]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-5.14

for you to fetch changes up to e3211e414d26cda43f3093fd09e5d8d0a797648f:

  arm64: dts: hisilicon: use the correct HiSilicon copyright (2021-06-17 01:28:15 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for 5.14

- Correct the HiSilicon copyright

----------------------------------------------------------------
Hao Fang (1):
      arm64: dts: hisilicon: use the correct HiSilicon copyright

 arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts   | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi           | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts   | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi           | 2 +-
 arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 2 +-
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts      | 2 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi           | 2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts         | 2 +-
 arch/arm64/boot/dts/hisilicon/hip05.dtsi            | 2 +-
 arch/arm64/boot/dts/hisilicon/hip06-d03.dts         | 2 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi            | 2 +-
 arch/arm64/boot/dts/hisilicon/hip07-d05.dts         | 2 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi            | 2 +-
 include/dt-bindings/pinctrl/hisi.h                  | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)
