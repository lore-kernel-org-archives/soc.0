Return-Path: <SRS0=FMRd=O3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EE8C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 10:26:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B80610FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 10:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36B80610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPZZ8ZMnAziosDcRiy/l9mmfh2KKDwwpk+V/CUZ+4Rs=; b=uhbtj3iDi+4l3UeS/ahkXrcKff
	MnJ+SnRq2mSLYXKbeqDRLg3bIdvNI7j56fJtKpCvQ5CQHe3D48EArUHxAcQJsCoURR0vZjl5ydEqB
	LmzVyv/yJeW8ZlLi9WelpI0VtQp055Mo+mBpdUcm3i2p6J7mmiGmd8rNvDIBk78M+wXLrfRKzCd1T
	0iFqVBo2UUCnHI5FDmjcrPSNN0+/8gBzJWPPGT7B33nTrKmYWi4Z7q7H9t2SmCIPAT50j1sEuJJgL
	hjgoiyk8RyTapS1fH28nqPeVtpVL+fPsXYK5rLZLmFwzrTGetN1igBfO9QijWy40V/RFMPxTisGLC
	NzenOQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYQZw-00GspL-26; Thu, 07 Oct 2021 10:24:44 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYQZs-00GsoP-BH
 for linux-arm-kernel@lists.infradead.org; Thu, 07 Oct 2021 10:24:42 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HQ6kv2Ss0z907Q;
 Thu,  7 Oct 2021 18:19:51 +0800 (CST)
Received: from dggema764-chm.china.huawei.com (10.1.198.206) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 18:24:36 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 dggema764-chm.china.huawei.com (10.1.198.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Thu, 7 Oct 2021 18:24:35 +0800
Subject: Re: [PATCH] arm64: defconfig: drop obsolete ARCH_* configs
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, <soc@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <will@kernel.org>, <wanghaibin.wang@huawei.com>, Arnd Bergmann
 <arnd@arndb.de>
References: <20210821030519.127-1-yuzenghui@huawei.com>
 <39c2b2f9-4de2-8e7d-2135-96f1dab750e0@canonical.com>
 <5991e347-18f0-30cd-58b9-9e3276bd98bd@huawei.com> <YV7HGniKSKe7nXp/@arm.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <1ebc899f-b7d7-fff4-9204-a0edd2be4387@huawei.com>
Date: Thu, 7 Oct 2021 18:24:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <YV7HGniKSKe7nXp/@arm.com>
Content-Language: en-US
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema764-chm.china.huawei.com (10.1.198.206)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_032440_590519_B41BEBF7 
X-CRM114-Status: GOOD (  13.27  )
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
Message-ID: <20211007102424.vUPkWEULDjHIbnHmqFa241T_FaoVyWQfb8flOpXhTb8@z>

On 2021/10/7 18:08, Catalin Marinas wrote:
> On Thu, Oct 07, 2021 at 05:42:46PM +0800, Zenghui Yu wrote:
>> On 2021/8/23 21:01, Krzysztof Kozlowski wrote:
>>> On 21/08/2021 05:05, Zenghui Yu wrote:
>>>> Per commit 4a9a1a5602d8 ("arm64: socfpga: merge Agilex and N5X into
>>>> ARCH_INTEL_SOCFPGA") and commit 89d4f98ae90d ("ARM: remove zte zx
>>>> platform"), they can be dropped from defconfig now.
>>>>
>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
>>>> ---
>>>>  arch/arm64/configs/defconfig | 3 ---
>>>>  1 file changed, 3 deletions(-)
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>
>> I have no idea about which tree should this patch go via, so a gentle
>> ping here. I've verified that this can still be applied cleanly on top
>> of today's -next.
> 
> Usually defconfig changes go in via the arm-soc tree rather than the
> arm64 one.

Thanks for the pointer!

[+ soc@kernel.org]

Zenghui

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
