Return-Path: <SRS0=y6Nc=JA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B989C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Apr 2021 15:01:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13DA1611C0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Apr 2021 15:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13DA1611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:CC:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o+5rVqy4J4vKI7gWVh17ZuGLMIszCYvhNyq/RzWzyjc=; b=kfewjR4u4G8a+cBV7aiRzsLf4Y
	5G8rDeLV6ZKlzaEl4ZVYuGYpXIGEZGBfQmIgHMAmVMSYmyzYv9ZJ8v6l1cRBll8R0qM9vJLGKZnto
	yLGOsjE3Cj7DUfMFsx0AOH5Hlwzr4QMGwGpJqjxn5OptFngj2WSJ8rT3/M/AfRLHlSg2+5Hb3Eon2
	Xd+SMnhZCZbbQZfi0UIAKQUeTh7Lg4DUrU8suvJQyoMvWQ3mrZq+UWLgvggo6kCP3PxVuiZ0tVUnD
	GZLCaR/Yh+/X2DSu3z0jUvGfj9UR4dOV1QLPXAGw1heAnSgUkFEbLjctIo4p8ybhxZE9g/6IxIUFs
	5SuyXvOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lShkE-00Ekik-Gk; Sat, 03 Apr 2021 14:59:26 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lShkA-00Ekhb-4q
 for linux-arm-kernel@lists.infradead.org; Sat, 03 Apr 2021 14:59:24 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FCKkz6mMszrbtj;
 Sat,  3 Apr 2021 22:56:59 +0800 (CST)
Received: from [10.46.67.229] (10.46.67.229) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0;
 Sat, 3 Apr 2021 22:58:56 +0800
From: Wei Xu <xuwei5@hisilicon.com>
Subject: [GIT,PULL] arm: hisilicon: SoC updates for v5.13
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <olof@lixom.net>, <arnd@arndb.de>, <xuwei5@hisilicon.com>,
 <fanghao11@huawei.com>, <zhangyi.ac@huawei.com>, <liguozhu@hisilicon.com>,
 <tangkunshan@huawei.com>, <huangdaode@hisilicon.com>,
 <jonathan.cameron@huawei.com>, <john.garry@huawei.com>,
 <salil.mehta@huawei.com>, <shiju.jose@huawei.com>,
 <shameerali.kolothum.thodi@huawei.com>
Message-ID: <eba8b55e-0969-8ca2-eca3-7c471cb0ff6f@hisilicon.com>
Date: Sat, 3 Apr 2021 22:59:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
X-Originating-IP: [10.46.67.229]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210403_155922_678067_265AC2D1 
X-CRM114-Status: UNSURE (   6.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210403145906.OVwZIi5zPRhxACUrPDjFf89jsZ9TkhdPx647UJ_mxRw@z>

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-armv7soc-for-5.13

for you to fetch changes up to c1ce9d8081a9fca5fd1b2e48bcc20e5dc3387302:

  ARM: hisi: use the correct HiSilicon copyright (2021-04-02 15:36:27 +0800)

----------------------------------------------------------------
HiSilicon ARMv7 SoC updates for v5.13

- Correct the HiSilicon copyright

----------------------------------------------------------------
Hao Fang (1):
      ARM: hisi: use the correct HiSilicon copyright

 arch/arm/mach-hisi/hisilicon.c | 4 ++--
 arch/arm/mach-hisi/hotplug.c   | 2 +-
 arch/arm/mach-hisi/platmcpm.c  | 2 +-
 arch/arm/mach-hisi/platsmp.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
