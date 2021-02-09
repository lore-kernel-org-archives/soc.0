Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91721C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:20:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC4964E30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC4964E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RvpBTkmtO+aMC1fvcF2AcWkIVjy4afh5BdipsyHZ9Iw=; b=fvnXYEJKaTL11E9mMpPvBjAz0
	qsf/LqYRToM2JGhewD3l+gUDmG+TeZeL2m429abMvoZ5a7t4g+yg/BROikG8UI/BzV+K+uwmR32sY
	rlkXyskNg8bfOfpEQ4LX8LfMocAngWCBHEAE6AwoYMbf1/hYsJphoGZVVmX3F5siMXUa/ZqEKl0RU
	E+59Fgt8Z9HUUwCGAJCq5ST8X+6WDJPFUtRlbdLZPUeoy8AzQai+FyTyG5/UOUuPFBl63tsVjSjty
	dpl5/VMGFBRSq2JmKEBGvBLjfv23QecIslLdU+5OmHZSaV+YLNJNDIBmUvbU7wWJSyAf7jS4PfWik
	BKWqERgqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9cIL-0002qy-6i; Tue, 09 Feb 2021 23:19:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9cII-0002qE-Of
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:19:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FE4C64E30;
 Tue,  9 Feb 2021 23:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612912782;
 bh=EsCYx4e6aSbp9Bwrp1F5WRMx2a9KgKO5uK+Y66H2i5M=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pTy6uzqVoHFIPTwej+ov1lLD1lZty8/RSR+zwK4RY5w7j6KjtDYJkbXl6uxzSYBWr
 u9Tyf0AOZB3J1LAWBebKEf2JlSubQPRetba5krpyYVSl9GExIVKKtkCcl6Rl/GiwwS
 NsO5N0sID4t/7PaNSQbo/BBFwNRPqgZqf3gF3OAjKtYtmHBThsbd1Yv9p5rVF+dDvW
 KvOP+3t/i/R90dgi8++1Qfap6AfLa5FPztor5PzkA9jvabtOkuI/dkfVcL9SeCHAC3
 x+Ec0Z956OrqvrYj3avYt62GRjuSy623gBXTwr92jYKbh238hZgk7KCS/PpH8bSj0B
 DU/fmW0eUnA5A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Subject: Re: [GIT PULL 1/6] i.MX drivers change for 5.12
Date: Wed, 10 Feb 2021 00:19:10 +0100
Message-ID: <161291272322.978640.8692820949134074215.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-1-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_181942_918624_8A09B451 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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
Cc: Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209231910.4qTBnPuOidsp8ErfmBd7NoetZtfvsDPkswSDNI5rWE0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:45 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.12
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 168b322e36c5f8903f31d89f34355004920b5e00

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
