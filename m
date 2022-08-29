Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCF5ECAAD5
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C440BC433B5; Mon, 29 Aug 2022 09:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D922C433D6;
	Mon, 29 Aug 2022 09:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661766174;
	bh=EFmDW0lNNy+phVo8D42MeT7H4eaj9CXR9RDHLb1MMcw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NRmnVfmucdN+3TABrNfrmWxtit612evZvHDX7StQMSykpsz+8PJbZHjUlwnHkLMII
	 fwSHi4TTQ9vDMeCysybJroeym2H8O1pTRdNmH8/EW9XeawE2PpsyV0K+kjQdvMMguA
	 hHhiqDxSgM8kqy6Rjw5GccsBWydMRrxNy/xtDpNU4w/XlE4QKyZ9m5Eq9G59n981dE
	 S7uVvi1laYDfBc346dass5cAIu/tdMW8ykVvGrYzMdwyYMSOprFBTqEDEwqsjYPo0q
	 cZB7YNv4LZ6Sc6HjcMiRqjg8q0xgTheSFl9eKHwF/iw9epUOQvg8IS/NXNvtBSVYH/
	 M2ZLnLn6uOxoQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Drop ARM_CPUIDLE(generic idle driver) config
Date: Mon, 29 Aug 2022 11:42:39 +0200
Message-Id: <166176606750.192368.18029115177408721770.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220822121604.2213778-1-sudeep.holla@arm.com>
References: <20220822121604.2213778-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 22 Aug 2022 13:16:04 +0100, Sudeep Holla wrote:
> Since commit 788961462f34 ("ARM: psci: cpuidle: Enable PSCI CPUidle
> driver") the generic ARM cpuidle driver probe no longer worked on
> ARM64. It was however left enabled with the driver failing to probe
> successfully. However the commit 51280acad855 ("cpuidle: cpuidle-arm:
> remove arm64 support") removed the Kconfig option so that it is no
> longer enabled for arm64 platforms.
> 
> [...]

Applied to arm/defconfig, thanks!

[1/1] arm64: defconfig: Drop ARM_CPUIDLE(generic idle driver) config
      commit: 853ff6c3215070c38cfe2b1bedee3ccb21e29b52

       Arnd
