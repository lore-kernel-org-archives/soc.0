Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44A3C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 16:16:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B136206F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 16:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B136206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PKf3gxLo8+zhY9HWfiQJkBShAiAmBsRZC8NtFZNIkwk=; b=CMGpQqgd2ts51FlVGWen1aauJ
	rjPIADZ4LfXDM+OVGRE5w4bSLHX5rxGDcMrC00xwA7anni7GQ5dgyEQO7Tg8RaGwmxhsEdA0MMRl8
	5p2frlC0YFRsoz5licOlENNgb0k+xeEDHAtihJ0rKwHwxbKV27crMk3KKG0n7xoaRiu3pf3IzqJVH
	aNEN3Tje9v9z/xQZlKrd5bDMLP1J7/sJ6kQCu2voOAa9opjmnGJ2p1TLDU1WggVrekt5NGPWipwTM
	MCYrT8NrPThhyCRmCRtVhr3UAOO8bLPP/VXBL5CLgi7tcXwgx8ZSZ8nEW3iUAxTlYCkixBZw9MrMP
	tuJfikEtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2z5E-0003Lx-IL; Fri, 22 Jan 2021 16:14:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2z5B-0003LU-QI
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 16:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611332085; x=1642868085;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=akfaX8ej4mNSDSiYlmg4n0T8nIbvD+geiuHI63vtcuQ=;
 b=DV8KKhuN7RIKh/qhJi6iGy00rgB11+tOmmu9eYCm24LAWFxVH2YM5/kn
 4WRxR3nulL4D767LgF4ZRAqutNh0LBbZHjBIOd1L0yckvy7n8IErvmHAk
 bT86weBHjmgQZR7ySjsrU2ugEH6Zn0+IiuQkyxvB8TPzrzbmf15HP8PtP
 s8i4RKmVPnr/EWFPLLmBQ4Ub6MGpX9l6HLaonzbxervwtyBft15O3WwKM
 FCtcq71ipDgnvbnxuc44u6tofwWBjLVs3hmOkH+TUZUbUxuVhv9XS4UkK
 aPi4L7XN8W5s+J5SJy4Jv2WSoWmMLrzItXlGm+8uwt7QiCjGRVwPiR/qd g==;
IronPort-SDR: PGarIi6QTG+I9LIhdvquCOGfspA7sPtUx5742TLHSw1axWQdKUAD9BtXK8cFbV0FxBkNLlmAyR
 ptd2SH4h1l/FrlGrSlrxAYP0HqkQ1JZn0+BHBnl0smH6oOUM6ebMyiLyQBnHXXhlx8ifA2oOUj
 GGN5IrRM3GCtD0jLYS5CQicGmwP0iCRG0ySdulAo5VFOC7LUEGIPw0hsNlNHwxy60QjQwUVWpB
 3qV93A7Y6FpalYIjFY7VUzHVfKU6W6lZhe+qVdLdLl7z+nrXGrBEMnj+M3EtFs7/vX76QjEGd7
 ogI=
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="101063226"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jan 2021 09:14:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 22 Jan 2021 09:14:34 -0700
Received: from [10.171.246.92] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Fri, 22 Jan 2021 09:14:32 -0700
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12
To: Arnd Bergmann <arnd@kernel.org>
References: <20210122143536.168833-1-nicolas.ferre@microchip.com>
 <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <715938cd-d898-5d12-cc11-d79cf27c5430@microchip.com>
Date: Fri, 22 Jan 2021 17:14:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_111446_140886_F3AC9D0B 
X-CRM114-Status: GOOD (  21.26  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel list <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Olof Johansson <olof@lixom.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122161432.6C_B-18U3Oy4NODy1-_ellGxnVnQsKFMhOZ4CkC04Ik@z>

On 22/01/2021 at 16:25, Arnd Bergmann wrote:
> On Fri, Jan 22, 2021 at 3:35 PM <nicolas.ferre@microchip.com> wrote:
>>
>> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>>
>> Arnd, Olof,
>>
>> I'm taking back the lead on sending the pull-requests for AT91 and hope that I
>> didn't loose the knowledge in the meantime. Tell me if there's something I'm
>> missing. Thanks a lot to Alexandre who kept our flow steady and very
>> predictable during all those years!
>>
>> Here are the first SoC changes for 5.12 which contain a single patch for multi
>> platform kernels.
>>
>> I plan to send another pull-request for the SoC changes related to new sama7g5
>> that Claudiu sent to the mainling-list recently. I'll let it mature in
>> linux-next by the beginning of next week and will send another pull-request by
>> mid-next-week.
>> Tell me if you see a problem with this approach.
> 
> This all looks good to me, but I think I'd rather take the 'soc' pull request
> into the v5.11 bugfixes, as this may already affect users on other machines.
> 
> I would also suggest adding a 'Cc: stable@vger.kernel.org' tag. If you like,
> I can just cherry-pick that patch into the fixes branch and add it there.

Oh yes, that'd be good, indeed.

You can add the following tag:
Cc: stable@vger.kernel.org #4.12+

Best regards,
-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
