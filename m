Return-Path: <SRS0=lB4r=ZQ=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C471CECAAA1
	for <soc@archiver.kernel.org>; Tue, 13 Sep 2022 02:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 917ACC433B5; Tue, 13 Sep 2022 02:01:13 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC512C433D6;
	Tue, 13 Sep 2022 02:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC512C433D6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MRRRX324bz14QZQ;
	Tue, 13 Sep 2022 09:57:12 +0800 (CST)
Received: from [10.67.102.125] (10.67.102.125) by
 kwepemi500011.china.huawei.com (7.221.188.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 10:01:07 +0800
Message-ID: <631FE463.6070701@hisilicon.com>
Date: Tue, 13 Sep 2022 10:01:07 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
CC: <xuwei5@hisilicon.com>, John Garry <john.garry@huawei.com>,
	<andriy.shevchenko@linux.intel.com>, <linuxarm@huawei.com>,
	<zhangyi.ac@huawei.com>, <huangdaode@huawei.com>, <tangkunshan@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <salil.mehta@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <shiju.jose@huawei.com>,
	<hesham.almatary@huawei.com>, <srinivas.kalaga@huawei.com>
Subject: [GIT PULL] HiSilicon driver updates for v6.1
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.125]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

--- 

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.1

for you to fetch changes up to 4678a2d352e055a186dd02613d54e30785810fb0:

  bus: hisi_lpc: Use platform_device_register_full() (2022-09-08 02:27:29 +0000)

----------------------------------------------------------------
HiSilicon driver updates for 6.1:
- some small improvements to the hisi_lpc driver

----------------------------------------------------------------
Andy Shevchenko (4):
      bus: hisi_lpc: Don't dereference fwnode handle
      bus: hisi_lpc: Use devm_platform_ioremap_resource
      bus: hisi_lpc: Correct error code for timeout
      bus: hisi_lpc: Don't guard ACPI IDs with ACPI_PTR()

John Garry (1):
      bus: hisi_lpc: Use platform_device_register_full()

 drivers/bus/hisi_lpc.c | 96 +++++++++++++++++++++++---------------------------
 1 file changed, 44 insertions(+), 52 deletions(-)
