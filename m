Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEAE1B0F35
	for <soc@lists.linux.dev>; Thu,  2 Jan 2025 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735818714; cv=none; b=eiHWkorrFZ1cWGp8T3p47PRphYge2j+nfaTw8AGI99DM5L1iSFU778iV0JB/81uiktWB/0NH/EQclNYj421nQhG+6TdGlTkv0aUECnVOCetf4EblboRLpgsqwpjSXf/wjfzVcnS04NIqfVQNdH3t1npEolzB7M47t8ajqiz8oX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735818714; c=relaxed/simple;
	bh=VeizEJOY5NISbI2BJQm6VPe+Fe+dwGv/tY29TE+aOo8=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=Imgw/qC642V+ou7EZAhUCLL5o2jpdgwz3RXeDoKN5Lx6K+aC8oAijhOUNqfeFjrxXWxOstIx9kZeZOXDviKjZ2eWEHlmezZIjN9NxNK3uHZ4geuCOWdvNUE3iW2lfq9aZtABzCDq0IwNYgQjDlvJA/Q6bnmUnA5Xtx0AyiOtrKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id B23BBC4AF0B; Thu,  2 Jan 2025 11:51:53 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA48AC4CEDC;
	Thu,  2 Jan 2025 11:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA48AC4CEDC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YP4jV3cQnz2Djrp;
	Thu,  2 Jan 2025 19:48:46 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 53AFE180042;
	Thu,  2 Jan 2025 19:51:40 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 2 Jan
 2025 19:51:39 +0800
Message-ID: <67767DCA.8060902@hisilicon.com>
Date: Thu, 2 Jan 2025 19:51:38 +0800
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
	Arnd Bergmann <arnd@arndb.de>, <xuwei5@hisilicon.com>, Rob Herring
	<robh@kernel.org>, <zhangyi.ac@huawei.com>, <daniel.shen@huawei.com>,
	<huangdaode@huawei.com>, <liguozhu@hisilicon.com>, Jonathan Cameron
	<Jonathan.Cameron@Huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<shiju.jose@huawei.com>, <salil.mehta@huawei.com>, <wuliebao@huawei.com>,
	<tangkunshan@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.14
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd500014.china.huawei.com (7.221.188.63)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-6.14

for you to fetch changes up to 4a45f8c502a8b8a836c3c932a18d538856097ac7:

  arm64: dts: hisilicon: Remove unused and undocumented "enable-dma" and "bus-id" properties (2024-12-17 12:03:08 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v6.14

- Remove "enable-dma" and "bus-id" properties from the spi node on hi6220

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: hisilicon: Remove unused and undocumented "enable-dma" and "bus-id" properties

 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 2 --
 1 file changed, 2 deletions(-)
