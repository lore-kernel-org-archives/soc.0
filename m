Return-Path: <SRS0=eIL7=HT=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12379C4167B
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 07:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E23B4C433CA; Fri,  8 Dec 2023 07:22:09 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92470C433C8;
	Fri,  8 Dec 2023 07:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92470C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemd100008.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4SmjJB36xPz14LDV;
	Fri,  8 Dec 2023 15:22:02 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd100008.china.huawei.com
 (7.221.188.193) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1258.28; Fri, 8 Dec
 2023 15:22:03 +0800
Message-ID: <6572C41B.6050703@hisilicon.com>
Date: Fri, 8 Dec 2023 15:22:03 +0800
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
	<lihuisong@huawei.com>
Subject: [GIT,PULL] hisilicon: driver updates for v6.8
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.8

for you to fetch changes up to be2f78a8a638e71bbbc2109bc052524143e8f42a:

  soc: hisilicon: kunpeng_hccs: Support the platform with PCC type3 and interrupt ack (2023-12-07 06:16:35 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.8

- Add support for the platform with PCC type3 and interrupt ack
- Few cleanups and improvements: correct the format of some strings and domain typo,
add failure log

----------------------------------------------------------------
Huisong Li (5):
      soc: hisilicon: kunpeng_hccs: Fix some incorrect format strings
      soc: hisilicon: kunpeng_hccs: Add failure log for no _CRS method
      soc: hisilicon: kunpeng_hccs: Remove an unused blank line
      doc: kunpeng_hccs: Fix incorrect email domain name
      soc: hisilicon: kunpeng_hccs: Support the platform with PCC type3 and interrupt ack

 .../testing/sysfs-devices-platform-kunpeng_hccs    |   6 +-
 drivers/soc/hisilicon/kunpeng_hccs.c               | 152 ++++++++++++++++-----
 drivers/soc/hisilicon/kunpeng_hccs.h               |  15 ++
 3 files changed, 137 insertions(+), 36 deletions(-)
