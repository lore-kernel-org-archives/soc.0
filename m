Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AACC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 13:58:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A43F060F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 13:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A43F060F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAYCDAoctXpdLU2oKxtpEGGF0lhX++8y2ygFhHCkQbM=; b=TdX7XEFwfVwck4
	xHuXjThkmZOcti1diROvrAYwvWHZCJ7RpVNjDm4t9tuBZw/7XLM48Fsm5v/Gp3cJUs0UFqMcz189y
	8k3oOCvy6ENMR77boR66uPs8r1PVqMJUdwGgOm1cgqOb0e+mjnFC6fMPdMYoItiOGrScsj7d9qapV
	ujTKUCb8VEEe+5pVC+fkB+x7TQ4yrGCW4D6hAUiXDlk7RSr3KDor22XFJ5X8/D25R97wOWYFLGnfg
	je62diwk+J+5cru1u2ppa9RntkJDMYhVJHWZrZ5+FDbyC5ZpEfYqiGIQ5xxgmdeG2YymGBhr+A00I
	QHBFkp+D2U7TI4RcCqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHNw-006EIf-JB; Wed, 04 Aug 2021 13:56:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHNs-006EHH-LE
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 13:56:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81EF4601FD;
 Wed,  4 Aug 2021 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628085395;
 bh=L4VivQRgk2G9nlLJGjT1/uuw/ylsF+lfuINmJiLSFc8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GtbYGEwTGw4udsWH7ZzA4Tw64wPGXlKSPsgDUtVdzIBsFRQcjE/nZDeXRPczpXh0z
 40ogSCFoTm3TQcmQCybhX9TkdwvvwDNZCQDyndGOJkL0FLz3hj2goHLUNPMBY+RqC/
 z3vjOj83rbLuIoeS7P/D97YgcwHxau0UBew87FPcRMHB91y/zOZ/xwOYfk+CivgEYl
 iX0Qg9m8dBUXTvXN02kvek8Mv5bwPOSmitYczrG7wmViiyAGGoxnWXIVlgXvmvdglR
 0WyrR24k+PaXaISyRmzSQLTCzKKJqp7FTUud7M8Lu9CE0fmPLdcx9C9VP9wPe40d5H
 AykQchraA8dxQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, linux-omap@vger.kernel.org
Subject: Re: [GIT PULL] Fixes for omaps for v5.14-rc series
Date: Wed,  4 Aug 2021 15:56:31 +0200
Message-ID: <162808537404.328794.8883222389640665372.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1627995895-406133@atomide.com>
References: <pull-1627995895-406133@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_065636_757420_E02FAC2C 
X-CRM114-Status: UNSURE (   7.74  )
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
Message-ID: <20210804135631.czPSPsp9RvMw_1Uzh1e_nrjefv9OX2zD5JuxE1eH4jw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 3 Aug 2021 16:05:29 +0300, Tony Lindgren wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/fixes-rc5-signed
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 19c1eb3605a1bcd784726380f520925948b2962e

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
