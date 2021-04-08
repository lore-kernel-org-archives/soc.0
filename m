Return-Path: <SRS0=Xg5E=JF=huawei.com=thunder.leizhen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6E5C433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 09:53:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0924B61164; Thu,  8 Apr 2021 09:53:51 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE57610FA;
	Thu,  8 Apr 2021 09:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BE57610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=thunder.leizhen@huawei.com
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGGjc74bhzPp6v;
	Thu,  8 Apr 2021 17:51:00 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.202) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 17:53:38 +0800
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v5.13
To: Arnd Bergmann <arnd@arndb.de>, Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>,
	Zhangyi ac <zhangyi.ac@huawei.com>, "Liguozhu (Kenneth)"
	<liguozhu@hisilicon.com>, Tangkunshan <tangkunshan@huawei.com>, Daode Huang
	<huangdaode@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	John Garry <john.garry@huawei.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>
References: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com>
 <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <028b2fd0-854f-a683-22be-36f3af5b5784@huawei.com>
Date: Thu, 8 Apr 2021 17:53:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected



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

However, it seems unlikely that users only upgrade dts without upgrading the driver.

> in the popular 'hikey' boards, which are used in many scenarios,
> which makes it fairly likely that someone might want to install
> something other than the very latest kernel.
> 
> Could you instead keep both the old and the new property in there
> for at least a few years?
> 
>         Arnd
> 
> .
> 

