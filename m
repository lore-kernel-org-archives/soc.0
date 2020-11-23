Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BA0C56202
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:52:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 14BDE22203; Mon, 23 Nov 2020 16:52:10 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7256222202;
	Mon, 23 Nov 2020 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150330;
	bh=0KRw8QIfbHyS8hXZ4+Vre9RrFfEs20GpDCyyYTxcj9A=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rONtCpaMQmyk18/A9cqpHtNMaIrMCDH+RMtZuI1eJ27kPTKBy+dAvPU85vUoEjQsr
	 XpynGDqfeUEk30dGo7r5k5hAvesxQvqWjn07dXZmGBxtwNn6GlfxqG2PCJ/jXYkxoe
	 6p1KfxigNY9t7DunSvfZ1M4qv78LQYTZZA+m+ObQ=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/4] Renesas DT binding updates for v5.11
Date: Mon, 23 Nov 2020 17:51:59 +0100
Message-Id: <160615031083.69876.6945333656572147951.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113150854.3923885-5-geert+renesas@glider.be>
References: <20201113150854.3923885-1-geert+renesas@glider.be> <20201113150854.3923885-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Nov 2020 16:08:54 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.11-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 019d70bffd35bc721482ef8312d9dbb7c9702436

       Arnd
