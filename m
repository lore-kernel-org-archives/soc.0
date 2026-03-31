Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75C3A6400
	for <soc@lists.linux.dev>; Tue, 31 Mar 2026 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956073; cv=none; b=bPniKoX/2dbyYShFWoOTUz4a7geiMUJokNOEvdfnjBo5GPrmuAXu3907w5teS4WSHGQR4Ay/Ems1BYIt7fSsAlDUWBs7IyJgINwoFqmLCloXVZfgactuoNJMXk96eCTbBzbDgD3Ysbp/VKGdrW/t007d5mLwqIlrWkP7+GGMimM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956073; c=relaxed/simple;
	bh=IvT3ZrXXp4kcSi2Gj3u+NfJMsaJYABH79RwPVwV0i7k=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=aEA/NBr+54pwDzNCXxPgyqN2c6IJaOdajpaHCPC+0irLOjXcYBKTzl3+m8Nm8fuIEn1a9XEoVbRRD1uqwAv8yh7IpmUaGNBtYhBWiwRhm7DOiKNwpIyztwDJO5GD+irFSqvFMdni0ecJ/ZPt3GdOas+7JO8SB58DTYZhYDaHY5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=bzN6K8Ff; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="bzN6K8Ff"
Received: by smtp.kernel.org (Postfix)
	id 046BDC2BC9E; Tue, 31 Mar 2026 11:21:13 +0000 (UTC)
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C76C0C19423;
	Tue, 31 Mar 2026 11:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C76C0C19423
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fuZB++b9TMG3PcHaNcWo/qvXmPZlIGwLXm1jVsEqRAo=;
	b=bzN6K8FfxjGKKhW4fQfZ3xq4FpzFCrNkRH8rLJ7oqnQlXgc8qKlSEuyOwaLeuXYfrGCSaKPzM
	dG2bkKJKHLqGYshOwm7+qH05x/Me7R8SVy2dgZbDsWUm7bgTmqaU1d6p/fRPQCMbkHz/IYTqfuG
	IcRvTvfQDgM7BqISF3850LI=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4flQX806Y5z12LDF;
	Tue, 31 Mar 2026 19:15:36 +0800 (CST)
Received: from kwepempk100004.china.huawei.com (unknown [7.202.194.225])
	by mail.maildlp.com (Postfix) with ESMTPS id CF55940576;
	Tue, 31 Mar 2026 19:20:59 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 kwepempk100004.china.huawei.com (7.202.194.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 31 Mar 2026 19:20:59 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 31 Mar 2026 19:20:58 +0800
Message-ID: <69CBAE1A.4050509@hisilicon.com>
Date: Tue, 31 Mar 2026 19:20:58 +0800
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
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, "Wuliebao (Joab, Turing
 Solution)" <wuliebao@huawei.com>, "Shenqingchun(DanielShen)"
	<daniel.shen@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	"Zengtao (B)" <prime.zeng@hisilicon.com>, Jonathan Cameron
	<Jonathan.Cameron@Huawei.com>, Bhargav Joshi <rougueprince47@gmail.com>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, <xuwei5@hisilicon.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.1
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-7.1

for you to fetch changes up to f17d7a0f8ff6f9864d8f82e99c46cee1088e945b:

  arm64: dts: hisilicon: Rename dwmmc nodes to mmc (2026-03-27 06:53:02 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v7.1

- Rename dwmmc nodes to mmc to comply with the schema

----------------------------------------------------------------
Bhargav Joshi (1):
      arm64: dts: hisilicon: Rename dwmmc nodes to mmc

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)
