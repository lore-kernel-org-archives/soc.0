Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873353C3C07
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596233; cv=none; b=O1v+WRb3aFVNrJuhTtHKCjwc5SbV5pkHXqab/Tml1Wx+QxNbN/MqCB4OSfThux/Ijhy6dUTt0cdN6ETw1hrYEbJHz3UHa1YBnveu/Xi9nCLNsjSlpcMaHxncMVsCLoNIVHsbMzXd1FIjjPoV1evUL3BQfhuJg1Nd9wvYIZ0qGcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596233; c=relaxed/simple;
	bh=hQQd+vBfasWq0ccQR92IhVaQZSlVGnRjBV7y353CY4o=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=EDkRUQJ9KaGr/8nkwi8nur9tWHZWnCQEbzo3KL96xWOfZSRTjNUPqTdz3purweCtE9RyyV64SEbImcFs8gYRKjX9C2JrHaXViao8eKurKRt1MnLRQ16v3UotjzToK6Jiq3q9MUHkXkPNWEvfGeta+A32V0eubEBKXLHiT64oekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=GGiTR81Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="GGiTR81Z"
Received: by smtp.kernel.org (Postfix)
	id E161BC19424; Fri, 27 Mar 2026 07:23:52 +0000 (UTC)
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC083C2BCB0;
	Fri, 27 Mar 2026 07:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC083C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CG3vtCf5Sbk7c4icMmkdOZzkT4cdHrn6RucaZdWVV8Y=;
	b=GGiTR81Zi+gS6MxqzwsQF1PDIk+ukhK8SnbZ51KoVUae0BprhAEAHKBMUI63W5YR1WbJjUK6E
	xFeeL108OxJRMT+euunBpUKRRLc+dSa9lSVQsjC1UKkNxW1NTXk6cEDZeejZq8oA46EcKC4T1R5
	ii2R6ezGGyVjedfhe4PB9jE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fhsS56zf8z1T4M0;
	Fri, 27 Mar 2026 15:18:13 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id BFE444056A;
	Fri, 27 Mar 2026 15:23:47 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 15:23:47 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 15:23:46 +0800
Message-ID: <69C63082.1000806@hisilicon.com>
Date: Fri, 27 Mar 2026 15:23:46 +0800
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
	<Jonathan.Cameron@Huawei.com>, <shiju.jose@huawei.com>,
	<salil.mehta@huawei.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [GIT,PULL] arm64: dts: hisilicon: fixes for v7.0
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

  https://github.com/hisilicon/linux-hisi.git tags/hisi-dts-fixes-for-7.0

for you to fetch changes up to 1af997cad473d505248df6d9577183bb91f69670:

  arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges (2026-03-21 03:38:11 +0000)

----------------------------------------------------------------
HiSilicon dts fixes for v7.0

- Correct the PCIe reset GPIO polarity for hi3798cv200-poplar
- Add the missing dma-ranges for hi3798cv200

----------------------------------------------------------------
Shawn Guo (2):
      arm64: dts: hisilicon: poplar: Correct PCIe reset GPIO polarity
      arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges

 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi       | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
