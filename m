Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DB3C433F5
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4147C34604; Mon, 13 Dec 2021 14:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27007C34603;
	Mon, 13 Dec 2021 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639406010;
	bh=0KP5RiqfRbx8AGqs4LGjwAVD0r8NMJSxdqT8cquzQxU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PklEmRZuuqnoVu0HVi9jQ7TvypfHLsmTVt1qHeEV/nwSuHQDWFL2+xUlu1QVSfbZb
	 WsuRo/G94mr3WYF4RYlZ8Rfar9eS4Pm+dKzrW3jDkRb6FFpyV+RUvSEXyc2YZcuypi
	 uhvAbjZpxb90rBgA/rShyWJuAQCZ0KxF04AB2NRGwL2JJ9ff7jc/7UiTdcgd1XFxQn
	 Xk8wK+KeO/pNgvpcrZ2YDKpZD5kSlYT17priv4fgC4xcRbwRNmXNazZ5F9RAO3U3Nv
	 MhLSZCAVsv5xlI4S57OVFua/MvnNn3Q6oV3U3q13Z9IliETEu0/k1eTbXyFfVYL2Od
	 i9uS7ewaUlFhg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] amlogic fixes for v5.16-rc
Date: Mon, 13 Dec 2021 15:33:25 +0100
Message-Id: <163940599183.928695.2462743017012142857.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <ab9f066f-480b-84b2-248e-953f2f2b5f59@baylibre.com>
References: <ab9f066f-480b-84b2-248e-953f2f2b5f59@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 1 Dec 2021 11:40:40 +0100, Neil Armstrong wrote:
> Here's a couple of fixes for v5.16-rc1, one for the amlogic Kconfig and another for the JetHub D1 DT.
> 
> Neil
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: b257c5f03508a9606fff8ce76592c2bcb27191e6

       Arnd
