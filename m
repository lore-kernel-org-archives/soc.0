Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93DAC433F5
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 14:51:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8C5BC60EE7; Mon, 11 Oct 2021 14:51:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0905960EBD;
	Mon, 11 Oct 2021 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633963902;
	bh=qImxdEySkisRbl7VzAtNi2ey1A7keFMa0kHEUhQvIEo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVCQy9oaCG9Nu5SCE72s1zcWAIBiwIBS2N+X0TvCCY/szdsS6NOfLv+CSXJxFZjai
	 F7WOcsMGKNb6KjeSU1QguqFwJ1MZ0MDUHNrE+8UT/mNwx2nH2KanrMV9W8ocNatvjk
	 4vNV5fYaEuoDWj5UkobWizfGcEVCOM0k0b13BowkVB+nwZbve/S5eQXoCMzDZV06TS
	 iQkZ7Dh8cwqmLvtc0bZDeOX6KSV2Ec8svkmwztgEX1F6ZDkaS7XenkiGuF4atOt8zQ
	 5RBH5BvhCiUo14V1YmxCM0UB9ahfiSxktpCqVgLPodo6I4QpGtYm2MC8oeCH1aEcd2
	 GEt23Xsh8CSfQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v5.15
Date: Mon, 11 Oct 2021 16:51:38 +0200
Message-Id: <163396388944.3084489.15615015867935355904.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211006153231.4061789-1-sudeep.holla@arm.com>
References: <20211006153231.4061789-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 6 Oct 2021 16:32:31 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 209ee634bc0d2fa10ac8f799abf09207b5ce489a

       Arnd
