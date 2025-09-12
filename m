Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F7A26281
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 01:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757640402; cv=none; b=EdApCQx5Ogzte/sZMfaEZoOddvRcacF8mudjrtMoNg+B8g2Vhh7Xse+P04mI3kAEGjv5ht8TjlWi8U9s0OPCwDsNCqrOcG61w5ggOYQKURhuAUx5c6o28ZE3UVzYSvFj/2R2GVqAvRuRxb/SDhyiyhc7qOIAiThUpS0R7xdHRrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757640402; c=relaxed/simple;
	bh=2DFtzhzuHpZt6A/Q3EwcNpxzKn8DRsiPyfCwj0pwFUM=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=qEcgTTGYe3DpM43T+SE4Foe0Ti6d3aOdYDgk3sXJT4gfO1Ww0GPzgHEXcgdO30MAGt8iDC5CdfYjnxI1M+ssznQDKXKvNArvIc/uodqNe3/zDPdVKvtdFMFfBcGDCR/nig5NjstAMNcmYZWDuj0TofW16rO3aWRgT2q6+58YIK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id ADB2BC4CEF8; Fri, 12 Sep 2025 01:26:41 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E457BC4CEF0;
	Fri, 12 Sep 2025 01:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E457BC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cNGvg3HQgztTcY;
	Fri, 12 Sep 2025 09:25:35 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 539411401F2;
	Fri, 12 Sep 2025 09:26:30 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Sep 2025 09:26:30 +0800
Received: from [10.67.113.98] (10.67.113.98) by kwepemq100003.china.huawei.com
 (7.202.195.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 12 Sep
 2025 09:26:29 +0800
Message-ID: <68C376C4.2030808@hisilicon.com>
Date: Fri, 12 Sep 2025 09:26:28 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, <tangkunshan@huawei.com>,
	<wuliebao@huawei.com>, <daniel.shen@huawei.com>, <huangdaode@huawei.com>,
	<liguozhu@hisilicon.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>,
	"lihuisong (C)" <lihuisong@huawei.com>, Colin Ian King
	<colin.i.king@gmail.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	<shiju.jose@huawei.com>, <salil.mehta@huawei.com>,
	<alireza.sanaee@huawei.com>
Subject: [GIT,PULL] hisilicon: driver updates for v6.18
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.18

for you to fetch changes up to 07188450191da0e3cff6f6d0c42de74d6cdb3602:

  soc: hisilicon: kunpeng_hccs: Fix spelling mistake "decrese" -> "decrease" (2025-08-28 11:23:08 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.18

- Fix a spelling mistake in the HCCS driver

----------------------------------------------------------------
Colin Ian King (1):
      soc: hisilicon: kunpeng_hccs: Fix spelling mistake "decrese" -> "decrease"

 drivers/soc/hisilicon/kunpeng_hccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
