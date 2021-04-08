Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AEFC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 09:55:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 817C4610FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 09:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 817C4610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=73+lbA/X8uAervh2V5Rbede9jE5QjRqRsbkMd/3cX28=; b=LzQ6pZRS0YFmIZ7hv4DQToKGY
	xzi7pMbnBjNN99oAv909cGXIAd4GXcE44l7ZdxXZqj+A7HNzcWO69SsnPOBYN5xf++eBayPyeuwzU
	PW9Br1sJDMITLuwdSf9N5itccBMSQ2bW4Y5CMgXwrKMujasQLQbcineQDkCmj9DKGGge1KCxtLe1q
	GassLkJqPObNT1V48e2DWpMreA+bdYIYT39Ym3jfYVt/Eg6dj3UQnXAu5Ls/PJVljZpJ8vpy1/YpO
	LbYG5gFeyn91AzRqEUvO7KdYo3nu4KM1zHd8vdqVu3ryIrujtfSxHtpM7rd5tyoYFlnR3noQvxnc/
	36H4O3LfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lURML-007Yk4-2k; Thu, 08 Apr 2021 09:53:57 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lURMG-007YhU-FX
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 09:53:54 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGGjc74bhzPp6v;
 Thu,  8 Apr 2021 17:51:00 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.202) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 8 Apr 2021 17:53:38 +0800
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
Content-Language: en-US
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_105352_798398_FD7F0C27 
X-CRM114-Status: GOOD (  12.27  )
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
Message-ID: <20210408095336.dHY3Wcy0gPALkA-wqUQqsutA8IBEqaM4gH9vW3Ddzjw@z>



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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
