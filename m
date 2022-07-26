Return-Path: <SRS0=w+Vp=X7=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971BCC433EF
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 11:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F35FC341C8; Tue, 26 Jul 2022 11:58:26 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87263C341C0
	for <soc@kernel.org>; Tue, 26 Jul 2022 11:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87263C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml743-chm.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Lsb3R2g9sz67wFS;
	Tue, 26 Jul 2022 19:56:19 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml743-chm.china.huawei.com (10.206.15.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Jul 2022 13:58:21 +0200
Received: from [10.126.168.6] (10.126.168.6) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 26 Jul
 2022 12:58:20 +0100
Message-ID: <89e2f878-1474-ad90-e94a-c2c3f513df3b@huawei.com>
Date: Tue, 26 Jul 2022 12:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] arm64: defconfig: Sync some configs with savedefconfig
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Olof Johansson <olof@lixom.net>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>,
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Florian Fainelli
	<f.fainelli@gmail.com>
References: <1658827473-121156-1-git-send-email-john.garry@huawei.com>
 <CAK8P3a1=W6VisgRcx=Xf65PrG+2pyb3ehOQQ6F32Qr6Agp_9tg@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <CAK8P3a1=W6VisgRcx=Xf65PrG+2pyb3ehOQQ6F32Qr6Agp_9tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.168.6]
X-ClientProxiedBy: lhreml728-chm.china.huawei.com (10.201.108.79) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected

On 26/07/2022 12:09, Arnd Bergmann wrote:
>> config ARCH_BCMBCA is selected by config ARCH_BCM4908 from
>>    arch/arm64/Kconfig.platforms, and the latter is enabled in the defconfig,
>>    so no need to explicitly enable in the defconfig.
> I double-checked this one and found that this was just added to the defconfig
> as a transitional entry, with the ARCH_BCM4908 being the one that is
> the one to go away, as described in 32d3da7d2f44 ("arm64: make
> ARCH_BCM4908 select ARCH_BCMBCA"), so I think we should leave this
> one out.
> 
>> - config SECCOMP was changed to def_bool y in commit 282a181b1a0d ("
>>    seccomp: Move config option SECCOMP to arch/Kconfig"), so no need to
>>    explicitly enable in the defconfig.
>>
>> - config MAILBOX is already selected by some drivers enabled in the
>>    defconfig, so no need to explicitly enable.
>>
>> - config QRTR was enabled in the defconfig from commit 1bdf91fd2ae82 ("
>>    arm64: defconfig: Enable Qualcomm QRTR"). However until many kernel
>>    versions later in commit 231a136fdf46 ("arm64: defconfig: enable ath11k
>>    driver"), no driver depended on config QRTR - not for building anyway.
>>    In commit 231a136fdf46, config ATH11K_PCI was enabled and this selects
>>    config QRTR, so there is no need to explicitly enable in the defconfig.
> The rest is fine. If it's ok with you, I'll just apply the other three bits
> and drop the ARCH_BCMBCA part from the patch and the description.

ok, fine, thanks!
