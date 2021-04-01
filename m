Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F21C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 12:59:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09A0A611EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 12:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09A0A611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zonque.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k4eYIPxLH/Gs2CLwrlMjosqf/ryFTVui1SS4c6Tfcow=; b=Tdtf3tp6QGMfnrzca6ZaumDxV
	pKITAsc7fjyDDwBNOomiT+tZvGxVTjIM6HNGPVhHUrpTN6mG9dzsbxDTSmYey8YhOjBc48A/yDAnc
	YkvQXeoFY4fMY4tDwbz8/xAUOZUXV1ITNT0c2I/haF1Lw47lrWo4Wl6uWOn3iWcAuafD7PCGsjHIM
	1tqhXEPhsKAKx5GyjU0aPiRF7E/BoBkxq90qVrGeQcHOipva4HFwxbLaW9rI84KkdHkv7nQO+LoLB
	XB+wjXz8iI+T3cLHcQWKj6lRtOx14btz+aqnahEH9yQTTFfYSEytVSBXZqJyY743NZ0OHEMCJ1kbi
	GEqP8Ab8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRwtw-009dsA-16; Thu, 01 Apr 2021 12:58:20 +0000
Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRwtq-009drk-SC
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 12:58:16 +0000
Received: from [192.168.178.106] (p57bc9e3b.dip0.t-ipconnect.de
 [87.188.158.59])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 47CDF4C69CC;
 Thu,  1 Apr 2021 12:50:08 +0000 (UTC)
Subject: Re: [PATCH] ARM: configs: Remove REGULATOR_USERSPACE_CONSUMER
To: Mark Brown <broonie@kernel.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210401102858.4095-1-broonie@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <7ee9fcd3-e4ed-1edf-4ac5-0bcb26ab4d2a@zonque.org>
Date: Thu, 1 Apr 2021 14:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210401102858.4095-1-broonie@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_135815_013323_19ABCE39 
X-CRM114-Status: GOOD (  15.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210401125007.hdtetklIfOPuIW2QZ3tgs2-v8VQYZehzxBByUMMjjIA@z>

On 4/1/21 12:28 PM, Mark Brown wrote:
> The userspace consumer is a development tool, not intended for producton
> systems and so should not be present in defconfigs especially not those
> for specific machines so is not a good fit for defconfig, remove it from
> those defconfigs where it is enabled. No system in mainline actually
> instantiates one.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm/configs/ezx_defconfig    | 1 -
>  arch/arm/configs/imote2_defconfig | 1 -
>  arch/arm/configs/pxa_defconfig    | 1 -

Acked-by: Daniel Mack <daniel@zonque.org>



>  3 files changed, 3 deletions(-)
> 
> diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
> index 81665b7abf83..a49e699e52de 100644
> --- a/arch/arm/configs/ezx_defconfig
> +++ b/arch/arm/configs/ezx_defconfig
> @@ -213,7 +213,6 @@ CONFIG_POWER_SUPPLY=y
>  CONFIG_EZX_PCAP=y
>  CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_DEBUG=y
> -CONFIG_REGULATOR_USERSPACE_CONSUMER=y
>  CONFIG_REGULATOR_PCAP=y
>  CONFIG_MEDIA_SUPPORT=y
>  CONFIG_VIDEO_DEV=y
> diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
> index ae15a2a33802..118c4c927f26 100644
> --- a/arch/arm/configs/imote2_defconfig
> +++ b/arch/arm/configs/imote2_defconfig
> @@ -194,7 +194,6 @@ CONFIG_POWER_SUPPLY=y
>  CONFIG_PMIC_DA903X=y
>  CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_DEBUG=y
> -CONFIG_REGULATOR_USERSPACE_CONSUMER=y
>  CONFIG_REGULATOR_DA903X=y
>  CONFIG_MEDIA_SUPPORT=y
>  CONFIG_VIDEO_DEV=y
> diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
> index bd7dd81c9c54..875a3c28a267 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -415,7 +415,6 @@ CONFIG_MFD_TC6393XB=y
>  CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_DEBUG=y
>  CONFIG_REGULATOR_FIXED_VOLTAGE=m
> -CONFIG_REGULATOR_USERSPACE_CONSUMER=m
>  CONFIG_REGULATOR_ACT8865=m
>  CONFIG_REGULATOR_AS3711=m
>  CONFIG_REGULATOR_AXP20X=m
> 


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
