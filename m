Return-Path: <SRS0=3d55=G5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84601C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Jan 2021 09:18:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D64C206E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Jan 2021 09:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D64C206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:MIME-Version:From:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+CbaMmEWkc0kpbEeJMgtTAvElCIUPTdJme5exH6Hrg8=; b=yuWSwl5L7qCByggmLWZHGZ7Jm/
	QANyTFa87Lh6fP9XgR9nXBsElsDCaZ531nhDVvYjw0aQpxF3KkfXTqZSlbmAyncQQdrHCW+QcZ6Bl
	07cvlcqM+giVslkr2Qy5YmibzCzoAre9SCF+bsb7tkrmurKTti3suLmXVz2tmKMJIsnV/SX88iI3t
	615T6arn9rbVPhV9wk83a3E67a3CXtdPqduV1niWOGvxIrLBHMICbkLn2CHltRM0MfJ6pVMG+hvdT
	hl2cXKs6YpUUQj0IQVvzN0Haaqn98d1EBLTfkJM89QPIDI32Q5WpnwOsSVpFZ3LyGOd6PseCi5bRm
	z1ho1srg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4KT2-0004oh-UV; Tue, 26 Jan 2021 09:16:56 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4KSz-0004n7-Uz
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Jan 2021 09:16:55 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DQ1Kd58Lnzl9yZ;
 Tue, 26 Jan 2021 17:15:17 +0800 (CST)
Received: from [10.40.166.221] (10.40.166.221) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 26 Jan 2021 17:16:41 +0800
Message-ID: <600FDDF9.2060209@hisilicon.com>
Date: Tue, 26 Jan 2021 17:16:41 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
 rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] arm64: dts: hisilicon dts updates for v5.12
X-Originating-IP: [10.40.166.221]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_041654_277115_F6A1B671 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: salil.mehta@huawei.com, john.garry@huawei.com,
 Tangkunshan <tangkunshan@huawei.com>, arnd@arndb.de,
 shameerali.kolothum.thodi@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, jonathan.cameron@huawei.com,
 linuxarm@openeuler.org, xuwei5@hisilicon.com, huangdaode@hisilicon.com,
 "Leizhen \(ThunderTown\)" <thunder.leizhen@huawei.com>, olof@lixom.net,
 liguozhu@hisilicon.com, zhangyi.ac@huawei.com, shiju.jose@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210126091641.Djsoa1ALgQGSG0IBHFGCLW2G17afyq5_uCbSjqnQ-wY@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
