Return-Path: <SRS0=CkUX=M3=huawei.com=yuzenghui@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A9FC4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 08:51:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7A21C60F02; Wed,  4 Aug 2021 08:51:07 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82D9B60EBC;
	Wed,  4 Aug 2021 08:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82D9B60EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=huawei.com
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GflhN2Y9tz82dS;
	Wed,  4 Aug 2021 16:46:12 +0800 (CST)
Received: from dggema764-chm.china.huawei.com (10.1.198.206) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 16:51:03 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 dggema764-chm.china.huawei.com (10.1.198.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 4 Aug 2021 16:51:01 +0800
Subject: Re: [PATCH 3/5] ARM: remove zte zx platform
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <soc@kernel.org>
CC: Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>
References: <20210120124812.2800027-1-arnd@kernel.org>
 <20210120124812.2800027-4-arnd@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <2ce5cd86-ed0d-3e5f-2ab4-717e055dfef4@huawei.com>
Date: Wed, 4 Aug 2021 16:51:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20210120124812.2800027-4-arnd@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema764-chm.china.huawei.com (10.1.198.206)
X-CFilter-Loop: Reflected

On 2021/1/20 20:48, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The ZTE ZX set-top-box SoC platform was added in 2015 by Jun Nie, with
> Baoyou Xie and Shawn Guo subsequently becoming maintainers after the
> addition of the 64-bit variant.
> 
> However, the only machines that were ever supported upstream are the
> reference designs, not actual set-top-box devices that would benefit
> from this support. All ZTE set-top-boxes from the past few years seem
> to be based on third-party SoCs. While there is very little information
> about zx296702 and zx296718 on the web, I found some references to other
> chips from the same family, such as zx296716 and zx296719, which were
> never submitted for upstream support. Finally, there is no support for
> the GPU on either of them, with the lima and panfrost device drivers
> having been added after work on the zx platform had stopped.
> 
> Shawn confirmed that he has not seen any interest in this platform for
> the past four years, and that it can be removed.
> 
> Thanks to Jun and Shawn for maintaining this platform over the past
> five years.
> 
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

[...]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index aeef69cbc7ec..54b5e6dee017 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2704,40 +2704,6 @@ S:	Maintained
>  F:	arch/arm/mach-pxa/include/mach/z2.h
>  F:	arch/arm/mach-pxa/z2.c
>   
> -ARM/ZTE ARCHITECTURE
> -M:	Jun Nie <jun.nie@linaro.org>
> -M:	Shawn Guo <shawnguo@kernel.org>
> -L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -S:	Maintained

[...]

> -F:	include/dt-bindings/clock/zx2967*.h

include/dt-bindings/clock/zx296718-clock.h hadn't been removed.

> -F:	include/dt-bindings/soc/zte,*.h

include/dt-bindings/soc/zte,pm_domains.h neither.

> -DRM DRIVERS FOR ZTE ZX
> -M:	Shawn Guo <shawnguo@kernel.org>
> -L:	dri-devel@lists.freedesktop.org
> -S:	Maintained
> -T:	git git://anongit.freedesktop.org/drm/drm-misc
> -F:	Documentation/devicetree/bindings/display/zte,vou.txt
> -F:	drivers/gpu/drm/zte/

The whole zxdrm driver is still in tree, which smells like a leftover.

> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6eecdef538bd..ec3c0cb27d1e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -317,12 +317,6 @@ config ARCH_XGENE
>  	help
>  	  This enables support for AppliedMicro X-Gene SOC Family
>  
> -config ARCH_ZX
> -	bool "ZTE ZX SoC Family"
> -	select PINCTRL
> -	help
> -	  This enables support for ZTE ZX SoC Family

And ARCH_ZX is still selected in arm64's defconfig (which is why I
jumped in this series).
