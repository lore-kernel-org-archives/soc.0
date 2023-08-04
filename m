Return-Path: <SRS0=Z+PL=DV=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22B8C04A6A
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 06:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5C26C433CA; Fri,  4 Aug 2023 06:31:05 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B8B4C433C7;
	Fri,  4 Aug 2023 06:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B8B4C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RHG5M2WXwzVjgX;
	Fri,  4 Aug 2023 14:29:11 +0800 (CST)
Received: from [10.67.103.39] (10.67.103.39) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 14:30:57 +0800
Message-ID: <64CC9B21.70907@hisilicon.com>
Date: Fri, 4 Aug 2023 14:30:57 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>, <xuwei5@hisilicon.com>,
	<zhangyi.ac@huawei.com>, <tangkunshan@huawei.com>, <daniel.shen@huawei.com>,
	<huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	<Jonathan.Cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<salil.mehta@huawei.com>, <shiju.jose@huawei.com>, Rob Herring
	<robh@kernel.org>
Subject: [GIT,PULL] arm: dts: hisilicon dts updates for v6.6
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.103.39]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm32-dt-for-6.6

for you to fetch changes up to e0d64db2a8c298990f3c1436b3ffd45e73c6dcb1:

  ARM: dts: hisilicon: Fix "status" values (2023-07-19 06:18:24 +0000)

----------------------------------------------------------------
ARM: DT: HiSilicon ARM32 DT updates for v6.6

- Fix "status" values

----------------------------------------------------------------
Rob Herring (1):
      ARM: dts: hisilicon: Fix "status" values

 arch/arm/boot/dts/hisilicon/hi3519.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

