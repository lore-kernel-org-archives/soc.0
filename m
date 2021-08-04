Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BA2C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 08:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2209460EBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 08:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2209460EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKMxW/WT8KnaKB7mj1aaNFHGuC/nbW80ENWimYcfMs4=; b=SuMbo0Cr1Kz9k2EM2ZMttSBDCb
	gOmx/wrzubJYQW2X1XZ1bWCQATm1RisnGqNUInVJWsYlVnZRFO4CBXmXO9OQrFXtF5GLBR27NBd55
	D9w9xq1caq+YyYUPWfEFJfnr1RECz1faWsonY0f+3bn33QVdWAatWo8fxHfHhKpMSC5e2+X5cq4rD
	4HjkhsP7AtUmGRsc5Qe41Pp1IZWlMjG/aaBd5eCzFd6ztmSaz7X/WTG1l1ry0ua8XSy/wXyZhP12h
	ay+GcRs383DhEi6Y2i/56ll6PJv9mLdscbndA+zHKhKit/24zG1ICh4Sf/INqeml1HLQKg8bmPSff
	4+JjkHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBCcN-005DCE-2Y; Wed, 04 Aug 2021 08:51:15 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCcH-005D92-IK
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 08:51:11 +0000
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
Content-Language: en-US
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema764-chm.china.huawei.com (10.1.198.206)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_015109_994700_B46F6382 
X-CRM114-Status: GOOD (  21.59  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210804085101.iZibbiyUsFovD83AcIkQPejIx2RATHZ2cBIgESt3I88@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
