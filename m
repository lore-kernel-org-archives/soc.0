Return-Path: <SRS0=B0BC=3Q=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BF0C4332F
	for <soc@archiver.kernel.org>; Wed, 16 Nov 2022 02:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F25A6C433B5; Wed, 16 Nov 2022 02:38:56 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05A03C433C1;
	Wed, 16 Nov 2022 02:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05A03C433C1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NBnKQ5fQ7zHvyR;
	Wed, 16 Nov 2022 10:38:18 +0800 (CST)
Received: from [10.67.103.39] (10.67.103.39) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 16 Nov
 2022 10:38:48 +0800
Message-ID: <63744D38.9010700@hisilicon.com>
Date: Wed, 16 Nov 2022 10:38:48 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>
CC: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, Pierre Gondois <pierre.gondois@arm.com>,
	<zhangyi.ac@huawei.com>, <tangkunshan@huawei.com>, <huangdaode@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<salil.mehta@huawei.com>, <shiju.jose@huawei.com>
Subject: [GIT PULL] HiSilicon ARM64 DT updates for v6.2
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.103.39]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-6.2

for you to fetch changes up to 0de459a3260a58169c55e2d1acf27da5ad8b635f:

  arm64: dts: Update cache properties for hisilicon (2022-11-15 03:39:03 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for 6.2

- Add missing cache-level properties

----------------------------------------------------------------
Pierre Gondois (1):
      arm64: dts: Update cache properties for hisilicon

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi |  2 ++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi |  2 ++
 arch/arm64/boot/dts/hisilicon/hip05.dtsi  |  4 ++++
 arch/arm64/boot/dts/hisilicon/hip06.dtsi  |  4 ++++
 arch/arm64/boot/dts/hisilicon/hip07.dtsi  | 16 ++++++++++++++++
 5 files changed, 28 insertions(+)
