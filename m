Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F32C433DB
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:31:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5DED164F97; Wed,  3 Feb 2021 12:31:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD07B64F95;
	Wed,  3 Feb 2021 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612355461;
	bh=FrJVPJQum+fI/aQynaEY+xiiN7V3Dhizoh1Mlot+rTU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ANR+sHjIYNfgcgj8vEBdIo11iAQl3DuPtwulnWVnkvo0rmCn7lwmWJCEpYI6ZRgrn
	 k7VL1DPImrWPDsiX81C+0Ebm2yAB6eTiggMwwChjgVXpDtT0zTwQgHFXLfSF7wWc5+
	 tpOYeKlkQ+xFd75q6M/UICXRM3+N+eXPbWgIbFwfOa4GIEbpMKfBwtrWZOos8b+Xz+
	 80/YgsF4SaiBGOS5pjYaBDP/YnYWXQchXFWI3r60mzZzH/Ce7w+NAsJAGKvtz/y9G8
	 uHJ1c6Qn+ZQxWZXu8ibwhlvbLaY7HXrjxfq/+LFPsA1LIMSSmHzNuy1Yx5hcBe1HJU
	 jJMNljnZnh+VA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: Re: [GIT PULL] OP-TEE fix for v5.12
Date: Wed,  3 Feb 2021 13:30:56 +0100
Message-Id: <161235543740.2002596.8962861009539553209.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203120953.GB3624453@jade>
References: <20210203120953.GB3624453@jade>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 13:09:53 +0100, Jens Wiklander wrote:
> Please pull this small fix removing an unnecessary call to need_resched()
> before cond_resched() while the OP-TEE driver is handing a RPC.
> 
> Thanks,
> Jens
> 
> The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: d94bd41a0022ca3e14479ed7b71cc5f79f159750

       Arnd
