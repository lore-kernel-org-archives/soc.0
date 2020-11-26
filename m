Return-Path: <SRS0=esR3=FA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B32C63798
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 21:19:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF92821D1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 21:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3DhTUCJ6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+fbwxZp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF92821D1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wbgE5BwmEkuSirbTSLkS4GCUZCoVxDIEg1rm4/l7hUk=; b=3DhTUCJ6usHFUMR4ljvSqsV/e
	8S+AH73O2Y1jgzpQqTAPs4DdgRfEWxmw8bFm0ZWFvHFqYI0R8ca653mhPKpdhfo0iltYAoIMIGqiz
	uq9076D2edjr9OGuqsC3XJepcLLfuIZVEb6oyotdms9MLyVrOC3p5l01R8gzLvFHXwnjs7+Q37TDD
	Ci7p18kMdTneq3G5T8C8rkRNdGvguf9TgEJunhXZf0+RKhU2YBMyzlpMzh9QsC+h1eXjZqED/cVsz
	N6dTM7yRwb2NvTlZELXKz5iLpgB9xnrHiYXWB4OARXErRg7cFWaeFAKTvynw5uzC7BRvrroyxtmgV
	owQMeir0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiOem-0005xF-Fi; Thu, 26 Nov 2020 21:18:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiOeQ-0005r7-Qw
 for linux-arm-kernel@lists.infradead.org; Thu, 26 Nov 2020 21:18:04 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14E70221F7;
 Thu, 26 Nov 2020 21:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606425482;
 bh=BMGFCM9Rj5zeyt57Oiu4DCwCB26U4lTp003oqrGFbLg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i+fbwxZpjqkVw/txIC6NtkKYEXaws24ufgDu75TY7BVuFDaJMet8helPKRbArrUFJ
 lpIbE8Y2K/r+gQChmnciHXIDir53yVdAD0UnUi0QiTvxe/OGJ769QTp0/Q5SjQIhYs
 G//17Qh+9o8vcAfghWDn3YVHXe63rfmrHbjJ8qps=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "arm@kernel.org" <arm@kernel.org>, soc@kernel.org,
 Wei Xu <xuwei5@hisilicon.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] arm: dts: hisilicon dts updates for v5.11
Date: Thu, 26 Nov 2020 22:17:51 +0100
Message-ID: <160642546617.1426861.9109722588377522115.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <5FBDC347.4050102@hisilicon.com>
References: <5FBDC347.4050102@hisilicon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_161803_613321_48E6CCD5 
X-CRM114-Status: GOOD (  11.52  )
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
Cc: Salil Mehta <salil.mehta@huawei.com>, John Garry <john.garry@huawei.com>,
 Tangkunshan <tangkunshan@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 huangdaode <huangdaode@hisilicon.com>,
 "Leizhen \(ThunderTown\)" <thunder.leizhen@huawei.com>,
 Olof Johansson <olof@lixom.net>,
 "Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
 Zhangyi ac <zhangyi.ac@huawei.com>, Shiju Jose <shiju.jose@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201126211751.fRUpqgRFvP04SLMvgkugmhWC_1YNvlYpUQR33Qnp9kA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 10:36:55 +0800, Wei Xu wrote:
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei

Merged into arm/dt, thanks!

merge commit: 3319f1489ef8516981a153ca4c96c442b356dc2c

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
