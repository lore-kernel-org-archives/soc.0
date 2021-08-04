Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9655C4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 14:07:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 84BD160F58; Wed,  4 Aug 2021 14:07:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9A3160F22;
	Wed,  4 Aug 2021 14:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628086033;
	bh=nUKjfTjVVS41wLMPjd2wAc1xrHe9Ri5cKv/cFw+Myvc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2Z8IvBIJjBeYfkeBtVHjvwxaDLDBFu0b2ZCg4aq0Z5ZJBCpx5QZG7QFt4dGSUcdY
	 0ima0ahoIpvKWep+qQDMtf9bf0yakQwudYVO4CnpDtsKVgsmonZdV/vY0nmABIfHqR
	 Gz4Edbkb840xlzFrvWA7yCeYyLhOM3eISiv7923HG1IMIW0ejw/VMqeg10JuAAGeSH
	 kKXUIuq71ieYqhhPNMiaDk4RI4ipJWD7PHoQMmezmL+TPoJJ9YVFF11KNlBZebJQas
	 9tIkZeNaCfLT2Ga0yZgUuBvFx1Ww5ie7/TqlE3mWPdjw5AJU2+i2kt1dbq/Zwrth57
	 PvY3ipHniNlrg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [GIT PULL] IXP4xx driver updates for v5.15
Date: Wed,  4 Aug 2021 16:07:08 +0200
Message-Id: <162808601953.733405.10635566719744310466.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdZaCosXsgp02nuUbd_nEvdxm5-z0+d0oSA97UTWQ0RQQg@mail.gmail.com>
References: <CACRpkdZaCosXsgp02nuUbd_nEvdxm5-z0+d0oSA97UTWQ0RQQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 4 Aug 2021 14:44:18 +0200, Linus Walleij wrote:
> this is a set of combined driver updates for IXP4xx targeted for the
> v5.15 merge window.
> 
> I am sending it to the SoC tree because of the cross-subsystem
> dependencies and since the corresponding DTS changes goes
> into SoC. These will be sent separately.
> 
> Note the following:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 775dea4deec679c24b525b258c341a45ff1de9ea

       Arnd
