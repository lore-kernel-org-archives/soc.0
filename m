Return-Path: <SRS0=eIL7=HT=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F76C4167B
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 07:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 975F3C433CC; Fri,  8 Dec 2023 07:25:03 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0A45C433C8;
	Fri,  8 Dec 2023 07:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0A45C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemd100008.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SmjH85VXcz1Q6Jq;
	Fri,  8 Dec 2023 15:21:08 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd100008.china.huawei.com
 (7.221.188.193) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1258.28; Fri, 8 Dec
 2023 15:24:57 +0800
Message-ID: <6572C4C8.6050401@hisilicon.com>
Date: Fri, 8 Dec 2023 15:24:56 +0800
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
	<salil.mehta@huawei.com>, <shiju.jose@huawei.com>, Johan Hovold
	<johan+linaro@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.8
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd100008.china.huawei.com (7.221.188.193)
X-CFilter-Loop: Reflected

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-6.8

for you to fetch changes up to 94fa073377db02ef0ca391f32e11e0f4649b2657:

  arm64: dts: hisilicon: hikey970-pmic: clean up SPMI node (2023-12-08 06:14:05 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v6.8

- Merge the hi3620-clock binding into hisilicon,sysctrl
- Clean up the hikey970 PMIC dtsi

----------------------------------------------------------------
Johan Hovold (2):
      arm64: dts: hisilicon: hikey970-pmic: fix regulator cells properties
      arm64: dts: hisilicon: hikey970-pmic: clean up SPMI node

Rob Herring (1):
      dt-bindings: hisilicon: Merge hi3620-clock into hisilicon,sysctrl binding

 .../bindings/arm/hisilicon/controller/sysctrl.yaml   | 17 +++++++++++++++++
 .../devicetree/bindings/clock/hi3620-clock.txt       | 20 --------------------
 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi     |  6 +-----
 3 files changed, 18 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/hi3620-clock.txt
