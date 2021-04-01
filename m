Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF97FC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:06:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 64767610FB; Thu,  1 Apr 2021 21:06:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CC05610EA;
	Thu,  1 Apr 2021 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311173;
	bh=y3yBk9ynKuJc7txzq3HWIYL1ONu1cfXnyIbKBtnoosA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cfUmuEFwQeXLZE2UbBM03tgjk0HmQQp5HDdN8uqaDS4K19K4bg2ymphDgmJ54qz46
	 H2JjkVYi+Va25CX6eY7/lMS0FZmtIKAdgeKZVomEOpGaAWvKafqCO3iaUHSILWytev
	 ndolEFiIBsjlZMBCNHlbgKsT8zay5McmXAZ5Rf4L9DftVxaLi5ZcLu5FKizxGpIYJp
	 PmJw/5QfvWGxWrmm8Nq2DaWE58jwhH3fDGg/OFU9PHpaf01uegT9a8oKBVk0S5IGFf
	 vdru1/Sl6PU6o3j4DEwFlr2G/qZVfKBS/1XS7sTL3rE9CoO9CvSUFwZXK74il1/tH4
	 UTrt65RDuTMWg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 3/3] ARM64 defconfig update for v5.13
Date: Thu,  1 Apr 2021 23:06:03 +0200
Message-Id: <161731114622.662954.10671908726741751060.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330110430.558182-3-dinguyen@kernel.org>
References: <20210330110430.558182-1-dinguyen@kernel.org> <20210330110430.558182-3-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 06:04:30 -0500, Dinh Nguyen wrote:
> Please pull in this ARM64 defconfig update for v5.13.
> 
> Thanks,
> Dinh
> 
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 1288974df752635fd6276466daf1924dee6c8e25

       Arnd
