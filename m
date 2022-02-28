Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A28C433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD283C340EE; Mon, 28 Feb 2022 15:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C72C340F3;
	Mon, 28 Feb 2022 15:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061422;
	bh=9IwpEwrETSBlG/xBRQJP/lY6BEq54i+oH9bLD92byoc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hcl41tTThc2FPzyNGWRkXRwEINp+zAz4wf6AK6oONHTQTFRtxM7/8pRaXSLgq24Ig
	 CNoXo0PhQhRjP5GyBAhp0fYykeGJ4lJG8SllZauTLgvNMrcqIDwcaHKsBaCKSPyIyT
	 41JCp2aELf3L+FGANCboCnQmUt/mDbZ0pGJrSYR0r5Z+hMHap87RcqqYnFycSEBxDa
	 8mNgqxYfhmSItGSADX0uoM5nCnpxlV8F4CQ/y6d6P8m/vKDNfHoxp3MXX6E0Y/p+dx
	 xJv8SweaFmbqBUGODUfqxQb0aE55rPtHRWt9a3D7dql8hlWSe4GLfqr2J8C7xzn3Dk
	 cKD57zaNcqgsQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/2] arm64: dts: samsung: Exynos for v5.18
Date: Mon, 28 Feb 2022 16:16:34 +0100
Message-Id: <164606116929.3364867.7581706251470314776.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220209145226.184375-2-krzysztof.kozlowski@canonical.com>
References: <20220209145226.184375-1-krzysztof.kozlowski@canonical.com> <20220209145226.184375-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 9 Feb 2022 15:52:26 +0100, Krzysztof Kozlowski wrote:
> This includes arm64 DTS changes for v5.17-late which did not make it.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: daeb1c2b50fb98118d6318b5fdbd9ef9bdfaeaf5

       Arnd
