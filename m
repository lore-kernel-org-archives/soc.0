Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7128175D5D
	for <soc@lists.linux.dev>; Fri, 25 Oct 2024 06:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729839044; cv=none; b=oHsqg7AU3mSoSXIoRhRcUtSMOnKjIar5Jt7ZLr05sOsnsFGwC7Ha5xwr61H7yqRYRTj+4VgBL6xlPhxIG87tifoASBglLWrOKNedE/NTD2pkJ5BPaWE4H4ktjdGBkpoxB3nBTBgxVHEJQJ1SP18Z85Zi1Mzd/PRdI3GdcS3umFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729839044; c=relaxed/simple;
	bh=N/9W6yyP6HH1xHB8f0uCb5mzGq9ONfNlgRcck+OofoI=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=fJQWzLfWpUPXpaV/f2QsZ8FIh68Yan6zvjEGH90EGoy3ryd8acPnBS0joVs5gCse01V0UdE5v9Z5USi89laiqZLZ8E42JMw1bNS0y4b++TcC5AyxplwjW1RbmT2HpLqoa6mu7fluv7E7GX+eFW+3T3ue6nkoL38axE4/JFM3ZZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 602C5C4CEE4; Fri, 25 Oct 2024 06:50:44 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B91BAC4CEC3;
	Fri, 25 Oct 2024 06:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B91BAC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XZYJR66tczdkNC;
	Fri, 25 Oct 2024 14:48:07 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 0EB2518006C;
	Fri, 25 Oct 2024 14:50:39 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 25 Oct
 2024 14:50:38 +0800
Message-ID: <671B3FBD.8050905@hisilicon.com>
Date: Fri, 25 Oct 2024 14:50:37 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>, <xuwei5@hisilicon.com>,
	<zhangyi.ac@huawei.com>, <tangkunshan@huawei.com>, <daniel.shen@huawei.com>,
	<huangdaode@huawei.com>, <liguozhu@hisilicon.com>, "lihuisong (C)"
	<lihuisong@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <salil.mehta@huawei.com>,
	<shiju.jose@huawei.com>
Subject: [GIT,PULL] hisilicon: driver updates for v6.13
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500014.china.huawei.com (7.221.188.63)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.13

for you to fetch changes up to e3c289c0916e2a3d7859a0cf851ea242fa23ec1e:

  soc: hisilicon: kunpeng_hccs: Support low power feature for the specified HCCS type (2024-10-14 08:54:51 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.13

- Add the sysfs to show all HCCS types used on the platform
- Add the low power feature for HCCS by adjusting the lane number
- Few cleanups and improvements: correct a PCC typo, verify the die, port
information, base address and size, update the lane_mode to max_lane_num

----------------------------------------------------------------
Huisong Li (6):
      soc: hisilicon: kunpeng_hccs: Fix a PCC typo
      soc: hisilicon: kunpeng_hccs: Return failure on having not die or port information
      soc: hisilicon: kunpeng_hccs: Add the check for base address and size of shared memory
      soc: hisilicon: kunpeng_hccs: Fix the 'lane_mode' field name in port info structure to 'max_lane_num'
      soc: hisilicon: kunpeng_hccs: Add used HCCS types sysfs
      soc: hisilicon: kunpeng_hccs: Support low power feature for the specified HCCS type

 .../testing/sysfs-devices-platform-kunpeng_hccs    |  45 ++
 drivers/soc/hisilicon/Kconfig                      |   7 +-
 drivers/soc/hisilicon/kunpeng_hccs.c               | 514 ++++++++++++++++++++-
 drivers/soc/hisilicon/kunpeng_hccs.h               |  33 +-
 4 files changed, 580 insertions(+), 19 deletions(-)
