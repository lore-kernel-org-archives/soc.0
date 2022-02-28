Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D794C433EF
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03B1CC340EE; Mon, 28 Feb 2022 15:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9999CC340F4;
	Mon, 28 Feb 2022 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061416;
	bh=iotUXSVRAsgCAxjVe24Hv/UGCld9GWaXNWqGObqqwRo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IypZfkP4TmSMComB8FdHwurKuQZ/9xwd2cGcXLhM0/rShSkYCnOGH9KQOHTnYHTII
	 70H9a2TUmFFSoGyM8hQyVNxGlqtz/4qVeBs2h3tA2uU95Ccxr4MD5fL1swm08FzJ/9
	 9eIZXklMLs3xjC9G4N4TIImktQ3CA8lrFYYhG7inOd5/LcmZvwZJTzDbId+A8i86Jn
	 F/LTUxoodw1dSBXlDRvZlMhQUaurxtQ7HBLZ0bBzXS6bT4Qc5TvMB237l4KbsOCjdz
	 g8Hkl8xYKqIFMeFZ4oZf2LfexW2ol382niWiPRQjsiaoGCMXaA7r0BxM2Q3w1YvVg9
	 vCI7/OZnvddKA==
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
Subject: Re: [GIT PULL 1/3] ARM: dts: samsung: Second round for v5.18
Date: Mon, 28 Feb 2022 16:16:32 +0100
Message-Id: <164606117080.3364867.3300738865653956388.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com>
References: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 26 Feb 2022 23:01:14 +0100, Krzysztof Kozlowski wrote:
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit f5b721d2c91144b7c494a05003fc840f1607e876:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4216cd957b23bb62350472749932888bebbfa0b1

       Arnd
