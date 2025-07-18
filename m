Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5F01D7E42
	for <soc@lists.linux.dev>; Fri, 18 Jul 2025 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825845; cv=none; b=j83wHDlGrkK/cDasK/ZSOKmMOodybuPn+nQ4U1u9T6nTYb5cQs+QTVFXnETB58gPSNnrG24O7Z1jbCX4jlYkeR7hGIbCMth8+ZpDG0sTkjuPA2Kh0b97xEUYQe5NfiEjfgE6RvoFq3nZtDBwMZ4/p/7KOJZP6dPVjKvM21mDXug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825845; c=relaxed/simple;
	bh=Cb1xPAPlZvl3B0q9YjDiuWnFiMssq6Jbd9rxHOcC7C0=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=DyaeFg0twWqWLj7Qa+b4FENX57zrB1nuRfsE73HAxhRl6elVzwcm+qvLmk3PIu6Gf+ejw92uuI+8t8jargMh6p2bL89erDvGs+ZhW7+nXYrCcaMlzoDJPqyISaVy/heshogMhkuXTIN5ns17iqYTkRGhI0otWayF3OiPEA7I1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 775FFC4CEF0; Fri, 18 Jul 2025 08:04:04 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6061C4CEEB;
	Fri, 18 Jul 2025 08:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6061C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bk2QL0pHTz27j25;
	Fri, 18 Jul 2025 16:04:58 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id C3F841A0188;
	Fri, 18 Jul 2025 16:03:58 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Jul 2025 16:03:58 +0800
Received: from [10.67.113.98] (10.67.113.98) by kwepemq100003.china.huawei.com
 (7.202.195.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 18 Jul
 2025 16:03:57 +0800
Message-ID: <6879FFED.1050002@hisilicon.com>
Date: Fri, 18 Jul 2025 16:03:57 +0800
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
	"lihuisong (C)" <lihuisong@huawei.com>, Jonathan Cameron
	<Jonathan.Cameron@Huawei.com>, <shiju.jose@huawei.com>,
	<salil.mehta@huawei.com>
Subject: [GIT,PULL] hisilicon: driver updates for v6.17
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.17

for you to fetch changes up to b1136432c97241f0e5c40d58597da00d49cd9917:

  soc: hisilicon: kunpeng_hccs: Fix incorrect log information (2025-07-18 07:27:26 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.17

- Print the hardware ID instead of the index in the HCCS driver

----------------------------------------------------------------
Huisong Li (1):
      soc: hisilicon: kunpeng_hccs: Fix incorrect log information

 drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
