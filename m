Return-Path: <SRS0=X9r1=DL=infradead.org=rdunlap@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09D3C001DE
	for <soc@archiver.kernel.org>; Tue, 25 Jul 2023 15:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7856C433C9; Tue, 25 Jul 2023 15:28:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0215C433C8;
	Tue, 25 Jul 2023 15:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0215C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=yHIDH3l8nS0DiflUh1G8237ylog4AjfhZXROuCwR23k=; b=CzyeVHbb52nYoy0qM1pgd5syCt
	F7BJYzK9MlDXL3P33HWcbVEqPRO+gNOrCmSWLRewddXvoV2d3RcwnP1In/+dLvEMZ0HBJtFcmDR8l
	1sl15GKFuslbG74AmstMA0zC8jIy/03ysGMijlh7uQTsSIZeto391l26ifk5kVc3RYddXW8DqBpwH
	ZfgQeQZD/8EjHzwy42NZhtfxxnRCvlEXv91EykXHRMKlBfWglOsk8V+EtobkZBy7awp/HVx0T1iMR
	q6+H4fbqj9HRO7MsPneDJhmBYJOSQ3ljDg1OZ3bP7NdXweN/FD2kQZQW0p+TavDe5Dyrb9EBjMiIR
	B7kr5b9g==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJxc-007vLu-0g;
	Tue, 25 Jul 2023 15:28:28 +0000
Message-ID: <d35eddd6-0089-bbe8-c2f9-416941dcbed6@infradead.org>
Date: Tue, 25 Jul 2023 08:28:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 1/2] soc: hisilicon: Support HCCS driver on
 Kunpeng SoC
Content-Language: en-US
To: Huisong Li <lihuisong@huawei.com>, xuwei5@hisilicon.com, arnd@arndb.de,
 krzk@kernel.org, sudeep.holla@arm.com
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, wanghuiqiang@huawei.com,
 tanxiaofei@huawei.com, liuyonglong@huawei.com
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230725075706.48939-1-lihuisong@huawei.com>
 <20230725075706.48939-2-lihuisong@huawei.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230725075706.48939-2-lihuisong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 7/25/23 00:57, Huisong Li wrote:
> diff --git a/drivers/soc/hisilicon/Kconfig b/drivers/soc/hisilicon/Kconfig
> new file mode 100644
> index 000000000000..87a1f15cbedb
> --- /dev/null
> +++ b/drivers/soc/hisilicon/Kconfig
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menu "Hisilicon SoC drivers"
> +	depends on ARCH_HISI || COMPILE_TEST
> +
> +config KUNPENG_HCCS
> +	tristate "HCCS driver on Kunpeng SoC"
> +	depends on ACPI
> +	depends on ARM64 || COMPILE_TEST
> +	help
> +	  The Huawei Cache-Coherent System (HCCS) is a bus protocol standard

Just curious: what makes it a standard?

> +	  for ensuring cache coherent on HiSilicon SoC. The performance of

	                     coherence

> +	  the application may be affected if some hccs ports are in non-full

	                                          HCCS

> +	  lane status, have a large number of CRC errors and so on.
> +
> +	  Say M here if you want to include support for querying the health
> +	  status and port information of HCCS on Kunpeng SoC.
> +
> +endmenu

thanks.
-- 
~Randy
