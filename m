Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111BFC4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:05:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CFE0760C40; Thu, 12 Aug 2021 21:05:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 060F36109F;
	Thu, 12 Aug 2021 21:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802355;
	bh=2G86AhtLUzdMz/KXHU0KCDVtgkzZLYWuG4BdYDF/eeg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IWxTYEuDwDz8pIkMXE5OS2vfh1fQPxk81xZUwt/3EZIZcTMJOu48bYSGgc3n9ln/h
	 rFk1CmfqEij7+tIvN9VLFtvIXJP7wuSHjvvi/NcLgrb/R6rcP1qo6tsHPlnyCI3jcp
	 ga1PKpvD+PW/Yi+P96lT0e3DVrV0vPrUFfX3cGnHrx9llVmbmAaeRfhI5pQVRE1LEm
	 lakpNEXNqGmO//9ZY8nN4raUWOuUc4fBoM6JIWV7KrIkP6ieE0QsEyAT+GHk6C+Sjj
	 ODwj7HRXsYLl56X9Tn38m7xdib+Y2tS+bYDuSoLm6g1Cjlm2xBHWY22zZroQNiS9qC
	 oxLWzWqmiFyDw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/2] arm64: dts: samsung: DT64 for v5.15
Date: Thu, 12 Aug 2021 23:05:37 +0200
Message-Id: <162880206183.1376011.8279173071110124884.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210811085128.30103-2-krzysztof.kozlowski@canonical.com>
References: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com> <20210811085128.30103-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 11 Aug 2021 10:51:28 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: f73979109bc11a0ed26b6deeb403fb5d05676ffc

       Arnd
