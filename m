Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50351C433EF
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39BECC385A2; Thu, 14 Jul 2022 16:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2C0C3411C;
	Thu, 14 Jul 2022 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657814648;
	bh=Bz2dCaFxnPZ9LJKDhpka9oPpg2b7lsoQd0PEYkgt6Lw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hGpC4axX5RrihyL2iYWfpYI1W8PSsfoZ5VxdoG4+2Kfv489yTtNiwIExtX6WbT6AP
	 RXKHjlmEVrhA+7lMHBF2Jym8sqYLQuP6oYJ0ApX3igBWq1WvpuRE8uv7uQInKmdnaI
	 CD+/K4Zsx/xlH+VXYcI9pjBYmuQPzvDF8uO8D04ly54eKV3VAaW/B3JXbNKK05ZvV6
	 yn3mNyKrC4BOGnOSQQXKpxKsRGDNuVexO1xbBIEDfQb6ea0nWwvMbzTNDh2jOiwk9+
	 SdDFbxIuUH2+CK2KU3yFOh8MkrQbf282D4cb43VZvxxFbiUtjpBhSoHMgPm7HUOwyL
	 2+SkaHZI5hK6Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Qualcomm DTS fixe for 5.19
Date: Thu, 14 Jul 2022 18:02:24 +0200
Message-Id: <165781428803.3197247.6546413022522929476.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220713030627.1371156-1-bjorn.andersson@linaro.org>
References: <20220713030627.1371156-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Jul 2022 22:06:27 -0500, Bjorn Andersson wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.19
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: d332a1f6b4c4b07bf984f04df897818c7c7fce8f

       Arnd
