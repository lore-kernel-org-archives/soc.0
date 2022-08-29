Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7D5ECAAD4
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B134C43470; Mon, 29 Aug 2022 09:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F382C433D6;
	Mon, 29 Aug 2022 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661766261;
	bh=ZjYkrsDmXs9UNvlFPv1sryuSfJlaigqBDsrTr1exmgA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TW+J1CVlurPQIUh7tvwtAVkB3XyQ1rlBBtIh4vmTtMdwXA879AEEo+TVYfefzRlJv
	 memopbAovU/2z0bLzIVVoJipXXRY8DVcI5zRpEr9HmE7gH3P28wSKSakQVvlPlpDSf
	 XGIKpa6zLYJObQMh2QtkunTC4xL/rYdZF0nWKIoWt/OcjXlOiHwE/mYZmAdrUoZVMQ
	 LR0LBqcqF0nELnRTSzCjILKFO/oBEYwAfTlk88dMeOCpouiTE8vsz7ME37o1VYCyaX
	 dXmFsedakIaWqXWO0YLbR7vp+nhFH854wFx8sKZBMX9SV5aNcb7UE0zoiRIL4nrwH0
	 fweok1g8KFjHw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Some Gemini DTS updates for v6.1
Date: Mon, 29 Aug 2022 11:44:17 +0200
Message-Id: <166176624329.193145.21170237941169688.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdZt58ExwG+6EicODLhuVc8NSgCGUj4uNQmtnES8Cnf5uQ@mail.gmail.com>
References: <CACRpkdZt58ExwG+6EicODLhuVc8NSgCGUj4uNQmtnES8Cnf5uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 26 Aug 2022 14:32:17 +0200, Linus Walleij wrote:
> here are some minor Gemini DTS updates that should be queued
> up for v6.1, details in the signed tag.
> 
> Please pull it in!
> 
> Yours,
> Linus Walleij
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1db560169211e66f12f24707e30403468847c44b

       Arnd
