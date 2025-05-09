Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BF4269CF1
	for <soc@lists.linux.dev>; Fri,  9 May 2025 06:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771923; cv=none; b=SiY3DUrTJee4egPmzLZJlSeAkfggWTFcWJ78GIeUmwhogy+jAo6gEHEa23hlRNj3dEUQyx8tboVUhUInEKOxL2Hnd6QbcTTrrQJmn2EAxp3Ciw7Nxpjx9XjCWlZjaJjIQZTT9ProbfhGDl2ecaPrLGdLlpdihqNLeoQYoLfEtiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771923; c=relaxed/simple;
	bh=H1wFV26YR3skrwBsPiv+fow2GXN0KJyCIOLAfA5U+mM=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=S9SUPaaD+/lKA0MIBULx6lBJRpem7R+m8D5nz1duy9Oz2ZTdpe2eWh81pM9I7fU7RqqB9ST3aDBO4rd7TwfWwlzgYJcJnvzuLvbIXu4TOt8RNaGvCpEZqPpuHa/X+1sYwyF+cBh0W7kBQ3cNCw8YKuA+tXExuY3YDbBpBZe1Xro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 406EAC4CEE4; Fri,  9 May 2025 06:25:23 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F23EBC4CEE9;
	Fri,  9 May 2025 06:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F23EBC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZtzVp0dYYz1k1JG;
	Fri,  9 May 2025 14:24:34 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 71C7018001B;
	Fri,  9 May 2025 14:25:10 +0800 (CST)
Received: from [10.67.113.98] (10.67.113.98) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 9 May
 2025 14:25:09 +0800
Message-ID: <681D9FC4.6080508@hisilicon.com>
Date: Fri, 9 May 2025 14:25:08 +0800
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
	<daniel.shen@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	Sudeep Holla <sudeep.holla@arm.com>, "lihuisong (C)" <lihuisong@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <salil.mehta@huawei.com>,
	<shiju.jose@huawei.com>
Subject: [GIT,PULL] hisilicon: driver updates for v6.16
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd500014.china.huawei.com (7.221.188.63)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.16

for you to fetch changes up to 49da9105781d99db3650c5e9a0d58ed9526d07c7:

  soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory region handling (2025-04-21 12:00:27 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.16

- Simplify PCC shared memory region handling in HCCS driver

----------------------------------------------------------------
Sudeep Holla (1):
      soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory region handling

 drivers/soc/hisilicon/kunpeng_hccs.c | 42 +++++++++++++-----------------------
 drivers/soc/hisilicon/kunpeng_hccs.h |  2 --
 2 files changed, 15 insertions(+), 29 deletions(-)
