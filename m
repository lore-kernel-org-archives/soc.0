Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51514C433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:36:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2789364F69; Tue,  2 Feb 2021 21:36:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2CBE64F64;
	Tue,  2 Feb 2021 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612301817;
	bh=BbnJSr6Ege++aFAAeZmKTDK8JpUtr5OP94Bw0+A/zX8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tnW9lbtBK/1Plx6K15vOxWIzlWfcj6T2ASg7s2OZ6hfwoUEeBCojIWrP7gWI0/KDA
	 8CFJGZNw4pxLnYD3n6t9qnWj+yMeSdWEPpLY66c/Ptj51JvkDPa3Ls9aiRM9VOUyjz
	 MmMpA1/5KAD6VJwyosZ9aO7ZToZ6EUGWLXsxiB9LbKr/SwLpp1U6eleWzSOh6vRR86
	 heQmfo6JEmAuEKYVkL4ZB+85CYB/5UAcm1Pw7i2sHinNy/A6NALLh7SOYmj7Zq3YSA
	 vZ72yUn90gz2lSIX/hEYs9J09kFN7akivGQmi5q7HjvmAM5QZniRlJK+gFIeRB/Ftz
	 SmXJsSwybulfg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 1/2] memory: drivers for v5.12
Date: Tue,  2 Feb 2021 22:36:48 +0100
Message-Id: <161230178526.1902917.16304011124716230610.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131180109.11510-1-krzk@kernel.org>
References: <20210131180109.11510-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 19:01:08 +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.12
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 993fd7d6fef65330b1a4abd0005ba09e0d8de3de

       Arnd
