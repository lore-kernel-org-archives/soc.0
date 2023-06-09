Return-Path: <SRS0=wjyJ=B5=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2F9C7EE25
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 06:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70366C4339B; Fri,  9 Jun 2023 06:31:22 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5ADE8C433D2;
	Fri,  9 Jun 2023 06:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5ADE8C433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Qcrkq47gQztQZP;
	Fri,  9 Jun 2023 14:28:51 +0800 (CST)
Received: from [10.67.103.39] (10.67.103.39) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 9 Jun
 2023 14:31:14 +0800
Message-ID: <6482C732.3060300@hisilicon.com>
Date: Fri, 9 Jun 2023 14:31:14 +0800
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
	<salil.mehta@huawei.com>, <shiju.jose@huawei.com>, Tony Lindgren
	<tony@atomide.com>
Subject: [GIT,PULL] arm: dts: hisilicon dts updates for v6.5
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.103.39]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm32-dt-for-6.5

for you to fetch changes up to 709f6754fa357d82f497dac9bc5c5a1538713f97:

  ARM: dts: hisilicon: Unify pinctrl-single pin group nodes (2023-06-07 02:55:48 +0000)

----------------------------------------------------------------
ARM: DT: HiSilicon ARM32 DT updates for v6.5

- Clean up the pinctrl-single node names and correct the pinctrl
controller nodes of the hi3620 SoC

----------------------------------------------------------------
Tony Lindgren (1):
      ARM: dts: hisilicon: Unify pinctrl-single pin group nodes

 arch/arm/boot/dts/hi3620-hi4511.dts | 130 ++++++++++++++++++------------------
 arch/arm/boot/dts/hi3620.dtsi       |   6 +-
 2 files changed, 67 insertions(+), 69 deletions(-)
