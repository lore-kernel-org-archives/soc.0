Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06D7C433EF
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A354C340EE; Mon, 28 Feb 2022 15:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F05C340F0;
	Mon, 28 Feb 2022 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061425;
	bh=J3VmrXgdHmB+uvDki6YP3nYfZOJ7dx/A2RUCurXsSko=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kZ24Lnpa7+cNm1W4qotItBYkoA24vFHtzF0Ao/EKrDPuQB1M6GTJWUtsNra3yY+Bv
	 Z427zoTB+qQLjiBESBhllOiCCjzQjElVhEzOgYZGfoJDrB9pMV/nsc8UCw1lxH5hbZ
	 IOakBd2vpE2j13YPgMdvcj3Z0biyzqJEzNIoKi0znTTXo1EhHHYuu7psps7nm4eGx1
	 qXWR9tf5FC8PUSm1vV/eqg5gFMD8f3AFFkaLIQdoW5hw6JIcPwxICE9eS8UfpWxTwV
	 mBpXbMFlW5GkMhHCiVZxooeYmUCeaqcUDR0e2PR8KCm6UOcqH+mUhlxFaKPVyP1FGn
	 YbhTfGQyeiRFQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/3] arm64: dts: samsung: Second round for v5.18
Date: Mon, 28 Feb 2022 16:16:35 +0100
Message-Id: <164606117118.3364867.7242093674219751827.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220226220116.13452-2-krzysztof.kozlowski@canonical.com>
References: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com> <20220226220116.13452-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 26 Feb 2022 23:01:15 +0100, Krzysztof Kozlowski wrote:
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit a0d5455330ece6f50ddf9e71d530f91c302803e9:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 2cd76c2aba5e40c280739c3131939b5f5c93f1ec

       Arnd
