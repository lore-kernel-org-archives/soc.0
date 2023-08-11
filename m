Return-Path: <SRS0=ux5N=D4=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77D8C0015E
	for <soc@archiver.kernel.org>; Fri, 11 Aug 2023 09:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5B85C433C8; Fri, 11 Aug 2023 09:56:55 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3FEAC433C7;
	Fri, 11 Aug 2023 09:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3FEAC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RMfLF5dDVz1L8wW;
	Fri, 11 Aug 2023 17:55:33 +0800 (CST)
Received: from [10.67.103.39] (10.67.103.39) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 17:56:46 +0800
Message-ID: <64D605DE.2070303@hisilicon.com>
Date: Fri, 11 Aug 2023 17:56:46 +0800
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
	<salil.mehta@huawei.com>, <shiju.jose@huawei.com>, "lihuisong (C)"
	<lihuisong@huawei.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<rdunlap@infradead.org>, <zenghui.yu@linux.dev>
Subject: [GIT,PULL] hisilicon: driver updates for v6.6
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

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.6

for you to fetch changes up to b51022b416f5be113cd5345a2cab287d78e6b74c:

  doc: soc: hisilicon: Add Kunpeng HCCS driver documentation (2023-08-08 12:36:31 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.6

- Add HCCS driver for HiSilicon Kunpeng SoC and document the sysfs description

----------------------------------------------------------------
Huisong Li (3):
      soc: hisilicon: Support HCCS driver on Kunpeng SoC
      soc: hisilicon: add sysfs entry to query information of HCCS
      doc: soc: hisilicon: Add Kunpeng HCCS driver documentation

 .../testing/sysfs-devices-platform-kunpeng_hccs    |   81 ++
 MAINTAINERS                                        |    7 +
 drivers/soc/Kconfig                                |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/hisilicon/Kconfig                      |   20 +
 drivers/soc/hisilicon/Makefile                     |    2 +
 drivers/soc/hisilicon/kunpeng_hccs.c               | 1275 ++++++++++++++++++++
 drivers/soc/hisilicon/kunpeng_hccs.h               |  191 +++
 8 files changed, 1578 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
 create mode 100644 drivers/soc/hisilicon/Kconfig
 create mode 100644 drivers/soc/hisilicon/Makefile
 create mode 100644 drivers/soc/hisilicon/kunpeng_hccs.c
 create mode 100644 drivers/soc/hisilicon/kunpeng_hccs.h
