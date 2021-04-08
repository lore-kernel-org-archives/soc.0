Return-Path: <SRS0=eM7g=JF=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43FEC433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 09:53:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B21D861154; Thu,  8 Apr 2021 09:53:00 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E74DC6115B;
	Thu,  8 Apr 2021 09:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E74DC6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=xuwei5@huawei.com
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGGjK75pKzrdFp;
	Thu,  8 Apr 2021 17:50:45 +0800 (CST)
Received: from [10.40.166.221] (10.40.166.221) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 17:52:47 +0800
Message-ID: <606ED26F.4080009@hisilicon.com>
Date: Thu, 8 Apr 2021 17:52:47 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>,
	"Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>, Zhangyi ac
	<zhangyi.ac@huawei.com>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
	Tangkunshan <tangkunshan@huawei.com>, Daode Huang <huangdaode@hisilicon.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, John Garry
	<john.garry@huawei.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v5.13
References: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com> <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
In-Reply-To: <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.166.221]
X-CFilter-Loop: Reflected

Hi Arnd,

On 2021/4/7 22:31, Arnd Bergmann wrote:
> On Sat, Apr 3, 2021 at 5:06 PM Wei Xu <xuwei5@hisilicon.com> wrote:
>>
>> Hi ARM-SoC team,
>>
>> Please consider to pull the following changes.
>> Thanks!
> 
> I'd prefer to not break compatibility of old kernels with new dts files
> here, as this would prevent installing an old distro with an ebbr
> compliant boot loader, for purely cosmetic reasons.  These are used
> in the popular 'hikey' boards, which are used in many scenarios,
> which makes it fairly likely that someone might want to install
> something other than the very latest kernel.
> 
> Could you instead keep both the old and the new property in there
> for at least a few years?

Got it and it does make sense.
I will sync with Zhen Lei to see whether he want to do the change or not. 
And then I will send out the new pull request.
Thanks!

Best Regards,
Wei

> 
>         Arnd
> .
> 
