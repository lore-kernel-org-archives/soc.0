Return-Path: <SRS0=2Wdg=L6=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7831CC10F15
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 11:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4616AC2BD10; Thu, 25 Apr 2024 11:30:50 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2220C113CC;
	Thu, 25 Apr 2024 11:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2220C113CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VQD9P020szvQ4w;
	Thu, 25 Apr 2024 19:27:37 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 0B38D180032;
	Thu, 25 Apr 2024 19:30:40 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Thu, 25 Apr
 2024 19:30:39 +0800
Message-ID: <662A3EDE.5070708@hisilicon.com>
Date: Thu, 25 Apr 2024 19:30:38 +0800
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
Subject: [GIT,PULL] hisilicon: driver updates for v6.10
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500014.china.huawei.com (7.221.188.63)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.10

for you to fetch changes up to 95d6333e0622dd5ca32c7832a015ae24f56d1ad2:

  soc: hisilicon: kunpeng_hccs: replace MAILBOX dependency with PCC (2024-04-25 02:09:46 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.10

- Add the check for obtaining complete port attribute in the HCCS driver
- Replace MAILBOX dependency with PCC for the HCCS driver

----------------------------------------------------------------
Huisong Li (2):
      soc: hisilicon: kunpeng_hccs: Add the check for obtaining complete port attribute
      soc: hisilicon: kunpeng_hccs: replace MAILBOX dependency with PCC

 drivers/soc/hisilicon/Kconfig        | 2 +-
 drivers/soc/hisilicon/kunpeng_hccs.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)
