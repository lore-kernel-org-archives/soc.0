Return-Path: <SRS0=GY9X=G5=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD683C433DB
	for <soc@archiver.kernel.org>; Tue, 26 Jan 2021 09:16:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8125423104; Tue, 26 Jan 2021 09:16:51 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3966206E5;
	Tue, 26 Jan 2021 09:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3966206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=xuwei5@huawei.com
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DQ1Kd58Lnzl9yZ;
	Tue, 26 Jan 2021 17:15:17 +0800 (CST)
Received: from [10.40.166.221] (10.40.166.221) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 26 Jan 2021 17:16:41 +0800
Message-ID: <600FDDF9.2060209@hisilicon.com>
Date: Tue, 26 Jan 2021 17:16:41 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>
CC: <olof@lixom.net>, <arnd@arndb.de>, <xuwei5@hisilicon.com>, "Leizhen
 (ThunderTown)" <thunder.leizhen@huawei.com>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>, <linuxarm@openeuler.org>,
	<zhangyi.ac@huawei.com>, <liguozhu@hisilicon.com>, Tangkunshan
	<tangkunshan@huawei.com>, <huangdaode@hisilicon.com>,
	<jonathan.cameron@huawei.com>, <john.garry@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <salil.mehta@huawei.com>,
	<shiju.jose@huawei.com>
Subject: [GIT PULL] arm64: dts: hisilicon dts updates for v5.12
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.166.221]
X-CFilter-Loop: Reflected

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-5.12

for you to fetch changes up to 9091f9b9d2965983ee38dd68609002daeacf5199:

  arm64: dts: hisilicon: hi3670.dtsi: add I2C settings (2021-01-26 15:48:22 +0800)

----------------------------------------------------------------
ARM64: DT: Hisilicon ARM64 DT updates for 5.12

- Further cleanups of the hisilicon DTS to align with the dtschema
- Add or update the I2C, pinctrl and reset nodes for Hikey970

----------------------------------------------------------------
Mauro Carvalho Chehab (3):
      arm64: dts: hisilicon: hi3670.dtsi: add iomcu_rst
      arm64: dts: hisilicon: hikey970-pinctrl.dtsi: add missing pinctrl settings
      arm64: dts: hisilicon: hi3670.dtsi: add I2C settings

Zhen Lei (7):
      arm64: dts: hisilicon: correct vendor prefix hisi to hisilicon
      arm64: dts: hisilicon: separate each group of data in the property "ranges"
      arm64: dts: hisilicon: place clock-names "bus" before "core"
      arm64: dts: hisilicon: normalize the node name of the module thermal
      arm64: dts: hisilicon: normalize the node name of the localbus
      arm64: dts: hisilicon: avoid irrelevant nodes being mistakenly identified as PHY nodes
      arm64: dts: hisilicon: delete unused property smmu-cb-memtype

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |  10 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi          |  79 ++-
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi     |   8 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |   8 +-
 .../arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi | 632 ++++++++++++++++++++-
 arch/arm64/boot/dts/hisilicon/hip05.dtsi           |   2 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi           |   6 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi           |   9 +-
 8 files changed, 717 insertions(+), 37 deletions(-)
