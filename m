Return-Path: <SRS0=S9At=X6=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422ADC43334
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 06:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED7E5C341C7; Mon, 25 Jul 2022 06:50:59 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DC79C341C6;
	Mon, 25 Jul 2022 06:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DC79C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LrrD629dsz67xgN;
	Mon, 25 Jul 2022 14:46:14 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Jul 2022 08:50:53 +0200
Received: from [10.126.173.156] (10.126.173.156) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Jul 2022 07:50:53 +0100
Message-ID: <6a85baa4-80cc-a715-b5f5-fcc276d44010@huawei.com>
Date: Mon, 25 Jul 2022 07:50:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/2] arm64 defconfig: Get faddr2line working
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Olof Johansson
	<olof@lixom.net>, SoC Team <soc@kernel.org>, <jpoimboe@kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
 <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.173.156]
X-ClientProxiedBy: lhreml723-chm.china.huawei.com (10.201.108.74) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected

On 24/07/2022 21:35, Arnd Bergmann wrote:
>> Note: this is based on next-20220722 and it may be wiser to sync the
>> defconfig manually (instead of using 1/2). Indeed I am not sure what is
>> the policy is of sync'ing this anyway.
> I only synchronized the 32-bit defconfig files in my tree, not the 64-bit
> one. However, I can't really apply your patch 2/2 because you appear
> to  mix refreshing the order of the options with changes that remove
> options that are gone after a 'savedefconfig', risking that we miss
> other bugs as well, as seen from your diffstat:
> 
>   1 file changed, 36 insertions(+), 48 deletions(-)
> 
> I have refreshed this one as well now, which on my tree gives me
> 
>   1 file changed, 31 insertions(+), 31 deletions(-)

I am not sure what you are doing in this refresh - can you share the 
steps? I guess that you sync with the savedefconfig and then manually 
edit the resultant defconfig to restore the configs which were getting 
deleting (and not just moved around).

For me - as you may expect - I do the following for the sync:
make defconfig
make savedefconfig
mv defconfig arch/arm64/configs/defconfig

> 
> for a nonfunction change. I have left the other ones untouched
> for the moment:
> 
> CONFIG_ARCH_BCMBCA=y
> CONFIG_SECCOMP=y
> CONFIG_QRTR=m
> CONFIG_PINCTRL_MSM=y
> CONFIG_SND_SOC_TEGRA210_OPE=m
> CONFIG_MAILBOX=y
> CONFIG_QCOM_ICC_BWMON=m
> CONFIG_SLIMBUS=m
> CONFIG_INTERCONNECT=y
> CONFIG_CONFIGFS_FS=y
> 
> These should be checked manually to find out why savedefconfig
> no longer shows them, it could be either a bug (a new dependency,
> renamed option, a driver randomly selects another subsystem, etc)
> that we need to fix, or a harmless change (driver was removed,
> option is now intended to be default-enabled, ...)
> 
> If you want to help more, can you check some or all of the above
> and send patches to either re-enable the options or remove them
> individually with explanations about why they are no longer
> part of the savedefconfig output?

ok, I can check them.

Thanks,
John

