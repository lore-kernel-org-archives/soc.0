Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFDAC4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:14:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B5FE561056; Mon, 16 Aug 2021 21:14:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60ACA61053;
	Mon, 16 Aug 2021 21:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148480;
	bh=vFfHS6ri4OrW2M+HU8eNzG+V4pD2HdHaaiuBD7QCIL8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q2bAla3/lYhJoAoyvZ9zZ2quPXnusX/zLcQ0IoqzPwCJ/+4zwn/lqKyU4HFEJ+WYj
	 Uc7QZZQaP7qu4FKkzcqf7GAMRPd4XftL6ckPBR+C3JEiwfCGkmLtGk12AvKhkqhFV3
	 OHw7UIrmpD/EEVDFbNcIwsEgbqfwDIut8lM1X7UjTOieRIV2GmLmNR9lBpFX7XMC2A
	 i0j/6zubnGLODjIBaDsXyx8iyPyN4m6HHRKWEdyrHWPp74O4ZgR2hrOIICdaIF7T32
	 nDiXiBzTheun44SIk70cRJ3SGjHz459/4hBp0WIZOZhobGfKQ0EyqyFvdQvujMa2xx
	 ETHoneUCXrnGg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: configs: Update the nhk8815_defconfig
Date: Mon, 16 Aug 2021 23:14:34 +0200
Message-Id: <162914846686.237742.12685570963154533210.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210807225518.3607126-1-linus.walleij@linaro.org>
References: <20210807225518.3607126-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 8 Aug 2021 00:55:18 +0200, Linus Walleij wrote:
> The platform lost the framebuffer due to a commit solving a
> circular dependency in v5.14-rc1, so add it back in by explicitly
> selecting the framebuffer.
> 
> Also fix up some Kconfig options that got dropped or moved around
> while we're at it.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update the nhk8815_defconfig
      commit: 813bacf4109802926d86f2d7c6583c6c0a0fddb5

       Arnd
