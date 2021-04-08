Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689E3C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 09:54:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF19610FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 09:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EF19610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Subject:CC:To:MIME-Version:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=80C9VoYyXsWLxVVilK0UdVGpdSfysAtpYW6ha6f1uhs=; b=dwHVAlh/G3qtOaBSQP2TT2xgb
	N9Ty0GQ71E9pk3k4VkbvWa2bB5f9UJ+oKgX/woz6gUWJdHrrGhCbSIBUXfnSWOowwYIJwRjmxL/MZ
	rFTLESTDciDqBOOGtzAF++l7PYyjBMCReyfZ5zMAC06CcYjOUwdfwpjRtRUY/OL+fW+MDbWI8Gr6e
	Z/Ubu6+D8Z1Okf/viB+YUAAX9Pk21Q9p2Bg2CzBIOimV1fa03SjxSQ4599Yvgiy9Z8wp6+kF9uv+B
	dGQOZ8EM5N1BpQ90zPQx6CEQ+qyOPmwrI0Ev+fXDrMiQ602X7y/T5Di63vqTwBxKOvlATy5z45WJh
	gWeYi1B+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lURLb-007YYJ-47; Thu, 08 Apr 2021 09:53:12 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lURLV-007YWk-NM
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 09:53:07 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGGjK75pKzrdFp;
 Thu,  8 Apr 2021 17:50:45 +0800 (CST)
Received: from [10.40.166.221] (10.40.166.221) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 17:52:47 +0800
Message-ID: <606ED26F.4080009@hisilicon.com>
Date: Thu, 8 Apr 2021 17:52:47 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
 rv:24.0) Gecko/20100101 Thunderbird/24.2.0
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
References: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com>
 <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
In-Reply-To: <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
X-Originating-IP: [10.40.166.221]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_105306_196012_7E9B5A67 
X-CRM114-Status: GOOD (  11.84  )
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
Message-ID: <20210408095247.UqY_4Tv9vgTEtpJ15f1Jrpm9-fJ-opq0xZpubL5sMvA@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
