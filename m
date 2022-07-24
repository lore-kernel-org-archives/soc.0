Return-Path: <SRS0=GZ1f=X5=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DD5C43334
	for <soc@archiver.kernel.org>; Sun, 24 Jul 2022 16:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46EFDC341D0; Sun, 24 Jul 2022 16:49:54 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5103C3411E;
	Sun, 24 Jul 2022 16:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5103C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LrTZg4dxWz67Mxp;
	Mon, 25 Jul 2022 00:46:03 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Sun, 24 Jul 2022 18:49:42 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 24 Jul 2022 17:49:39 +0100
From: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
To: <will@kernel.org>, <catalin.marinas@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <arnd@arndb.de>, <olof@lixom.net>,
	<soc@kernel.org>
CC: <jpoimboe@kernel.org>, <linux-kernel@vger.kernel.org>, John Garry
	<john.garry@huawei.com>
Subject: [PATCH 0/2] arm64 defconfig: Get faddr2line working
Date: Mon, 25 Jul 2022 00:43:22 +0800
Message-ID: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected

scripts/faddr2line has not worked by default for arm64 since 5.17

Firstly, since commit f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO
selectable from a choice"), CONFIG_DEBUG_INFO was not getting enabled by
default (and this is required for faddr2line to work).

Secondly, commit dcea997beed6 ("faddr2line: Fix overlapping text section
failures, the sequel") caused a breakage for arm64, as reported at the
following:
https://lore.kernel.org/lkml/3bd9817d-1959-c081-e5d0-8b0e70b3f41e@huawei.com/

Josh has sent fixes/improvements for faddr2line at the following:
https://lore.kernel.org/lkml/cover.1658426357.git.jpoimboe@kernel.org/

In this series I enable CONFIG_DEBUG_INFO by enabling
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT, which seems the sensible
option.

As for merging this, I am not sure who would pick it up - any takers
welcome.

Note: this is based on next-20220722 and it may be wiser to sync the
defconfig manually (instead of using 1/2). Indeed I am not sure what is
the policy is of sync'ing this anyway.

Thanks! 

John Garry (2):
  arm64: defconfig: Sync with savedefconfig
  arm64: defconfig: Enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT

 arch/arm64/configs/defconfig | 85 ++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 48 deletions(-)

-- 
2.35.3

