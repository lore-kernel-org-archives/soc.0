Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D1BC43460
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0391B610CF; Thu,  1 Apr 2021 20:15:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECC31610EA;
	Thu,  1 Apr 2021 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308139;
	bh=sTPEpCedOMP6NsQzAyeMia6L39jCpccSHElVcNk6MLE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Czwm+J9vC8BQ4vMruag8aeq3C2SRODsK2s4Al25YSPYA7i6JbIj1mD4AfLHe6PChc
	 6tyL8LYvJ8VpLvlWz1V1Fi5k8SWnorgQhBf2jD0ShyycelpewbDvdR2FzKfLk9gbyH
	 21RBdEJ60aCjCRcX5RcRr0iUrM+SlpkTq43Vm2XnB85s9P2GbNFcTA45QYYBS0/x9m
	 tX8V7h3CNpbufPQ/2nkaLTP6S4rzenGgbRgcoS4yrSAL8fpUKatOp+rUgfjOBrr6B6
	 J/sUVHZNZNa8GIUQIWtOim3CrDev4+1LGlYFONP9wnqzjsEoFJ6PwmA8WdumtDTKzU
	 uhhZQQWHABx1w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/3] SoCFPGA DTS updates for v5.13
Date: Thu,  1 Apr 2021 22:15:17 +0200
Message-Id: <161730808599.655497.9234172904421244664.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330110430.558182-2-dinguyen@kernel.org>
References: <20210330110430.558182-1-dinguyen@kernel.org> <20210330110430.558182-2-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 06:04:29 -0500, Dinh Nguyen wrote:
> Please pull in these SoCFPGA DTS updates for v5.13.
> 
> Thanks,
> Dinh
> 
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 61de0971ea913d262225dff5621018d590e67025

       Arnd
