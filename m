Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1685AC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:00:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F29436138F; Wed, 20 Oct 2021 16:00:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 997B16136F;
	Wed, 20 Oct 2021 16:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634745641;
	bh=k4aADcYr2Vm+5Df9wGPuIbaYI912G5FOFGxfObEkVf4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KJzE4iscBjFqa+Vt3FSTekv0sQM9HuDkUUP4BbuR2ReINycGOMYuRQhD9pRSzjkJY
	 Hz94MCoZbWq2rL9q+O89rIosYNR8ZWhrM047MRSGCKxYR2/g6pJgaDzwM/0330rM1o
	 Kn/tOU9iQ3jU3pPy0lpMCsT3QjmIXpe8UD3dxWokTsDBP76WzBDa55sq9Gc8L3wIDK
	 6McAWG/F3+UIYnTATb3NAyVbNt3R35XhWzuAPqLhGK3ULXee5qCwLGJhPhmWNeGcX0
	 R/ku46FsOkJBhWgb02vwVleMSE06yQPhj6CP/D27RYkH1lz96IIMD43P4tQo+fw45o
	 I3reO64CyyJZw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] OP-TEE FF-A for V5.16
Date: Wed, 20 Oct 2021 18:00:31 +0200
Message-Id: <163474562374.2274953.13067132975473108014.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211018121324.GA2943530@jade>
References: <20211018121324.GA2943530@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 14:13:24 +0200, Jens Wiklander wrote:
> Please pull these patches which adds support for FF-A [1] in the OP-TEE
> driver. There's a bit of shuffling in the code where everyhting related to
> the old SMC based ABI is moved to drivers/tee/optee/smc_abi.c, but there
> should not be any changed in behavior for with the old ABI.
> 
> Note that this is based on top of the recent fix 7f565d0ead26 ("tee: optee:
> Fix missing devices unregister during optee_remove") which has already been
> requested to be pulled.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 20f6d9586eee5734072886cf052b72807b0afc4c

       Arnd
