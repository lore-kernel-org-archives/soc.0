Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B21C43470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:16:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC14D610F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC14D610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jg98lAMWe3UUc8lbHNF43QdBbJR2W5CSKbjCSsAtp+o=; b=WU58Hnpw74MKm07eO+TP2T7qU
	Rk3/aHMMJ2rlgwr5xWJoLRVobOF+iGi1FEo5G+NjjgjzZJ4rML5xBqLXtdUhXUzjN3C0PM3Xp47XI
	5hR9Q8dxOy+y6Cul11Ir0kU0c4JCMf28tn85hIZJZV1AR421LegIhrSPOEZuXuSUMiVomNZVuD2x9
	lX6Pqy88H3liidxMhbN+vAoDHHUgrvBY4HocUDOGCTOjYM+uyB3HE00MdOIRGz8/uxnEnO/eGbvkL
	ahFDEzAzHaqIk/AlI5bAQoFbacfu09NlztdEDWjAGcee07vxvl3BcbZtUWllH6HV2XfmRId9ZWGYp
	VjAT8jjhQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS4eM-00B1kj-70; Thu, 01 Apr 2021 21:14:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS4XD-00B10G-8T
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 21:07:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC5DA6112F;
 Thu,  1 Apr 2021 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617311237;
 bh=3oStrjzAvVbQa0S1FwZRjUrmDCAHpXIE1z/QYbHDtOw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q/81vyuzAp1HBF45rRIeQlHbO9Zz94x5zr9IvXtD1uCffpIiFbALWvmQ30MQxZg7G
 nANGZ20jcv6h3XmC1JSWHHwzybVyIOgRL5dixRckSz5cpZRggIrsMr0V/bPkoCR9Lm
 GKcY6UY4UVoxk2ffnCqmsld3s/I6x2xxz2hjLqrCvN0NoLI+E/bOxVIuSe4m73Tr6v
 1lw6vyxlWYVef406Jq14IFFFqiuDXIQ4X6zjOXgD9UN9qbsK6Qtb5gdtsaJOx5oYul
 7yOEitcCangyJvVHEEGi0+rZqfscxZ6MK980NlLGCFYAxPFo+nGGJWYmjF2AmF7T5e
 A+ovDIRfwXiNQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, linux-omap@vger.kernel.org
Subject: Re: [GIT PULL 3/3] Drop legacy data for dra7 and omap4/5 and clean-up
Date: Thu,  1 Apr 2021 23:07:06 +0200
Message-ID: <161731121857.663132.4089815992350147845.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617004205-537424@atomide.com-3>
References: <pull-1617004205-537424@atomide.com>
 <pull-1617004205-537424@atomide.com-3>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_220723_642313_368EFB82 
X-CRM114-Status: UNSURE (   6.13  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210401210706.Ctj6UReYrQoHr5JeGYl6XG6MZQoEfz0NdVT1GikSSw8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 29 Mar 2021 10:55:22 +0300, Tony Lindgren wrote:
> The following changes since commit 083516ad540a1104a0ae5ae7e83f2a2d8e39d2bc:
> 
>   Merge tags 'genpd-dts-dra7', 'genpd-dts-omap4' and 'genpd-dts-omap5' into omap-for-v5.13/dts-genpd (2021-03-10 14:16:34 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/genpd-cleanup-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 3e26eccd40f9d4ff43fbd05edaccb96abfab04e8

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
