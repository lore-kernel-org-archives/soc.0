Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96F220C029
	for <soc@lists.linux.dev>; Tue, 18 Mar 2025 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742301363; cv=none; b=Q7inPqSBr684wliVdi7izZHc/JTgXFdQ0w+uGItgVtLhR7sBu2Hyhnt4EC6wwlxkPqeHElAZ5uvSPeDlzOjZVMESDoxh4inwv23G0CeRU3siK4ppSGzQr1qAIx/hxrXSf5AdPiVq+4dBGa08csiJA0bhlNN29eITQzQTF8hr/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742301363; c=relaxed/simple;
	bh=OtcvnpFHXZe73802ZhdyJ43/GAihg4PGfhQ8/TZbVSc=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=mmJW9aJQYdR8z8LEZtsnswXlYpRpUc9mvMdjvmpQkBM62xsZ9sj125lsGD6iqc+VC/E1j7mlhsqNRMNrNZB7/ltgAqyqLv96dYzDyxNzN6xDue5W+mMMnNdgkxyFDC3ekzeMkPhT6Sn/SquhOFxftKy98cl+SoLc/ns2eDx742c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 29AF7C4CEDD; Tue, 18 Mar 2025 12:36:03 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD490C4CEE3;
	Tue, 18 Mar 2025 12:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD490C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZHB6p0CFyzvWvJ;
	Tue, 18 Mar 2025 20:32:02 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 4ECE614038F;
	Tue, 18 Mar 2025 20:35:55 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 18 Mar
 2025 20:35:54 +0800
Message-ID: <67D968A9.7080504@hisilicon.com>
Date: Tue, 18 Mar 2025 20:35:53 +0800
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
	<xuwei5@hisilicon.com>, Leo Yan <leo.yan@arm.com>, <zhangyi.ac@huawei.com>,
	<daniel.shen@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <shiju.jose@huawei.com>,
	<salil.mehta@huawei.com>, <wuliebao@huawei.com>, <tangkunshan@huawei.com>,
	"Zengtao (B)" <prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<james.clark@linaro.org>, <alireza.sanaee@huawei.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.15
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-6.15

for you to fetch changes up to 8095a17b0ace09a280a5954096701b883dcaa135:

  arm64: dts: hi3660: Add property for fixing CPUIdle (2025-03-18 11:46:55 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v6.15

- Add property to the ETM nodes for fixing CPU idle states

----------------------------------------------------------------
Leo Yan (1):
      arm64: dts: hi3660: Add property for fixing CPUIdle

 arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)
