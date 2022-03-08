Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A54C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFC9DC340EF; Tue,  8 Mar 2022 16:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B075C340EB;
	Tue,  8 Mar 2022 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758695;
	bh=jqLd+hY6R4msJuS1jALcVq5jl5XkOoD1/fuJoijyU+4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qLCURMkS4ZHfeRGJFqi1IkR4YezNkiNQDFE6S7SOlGKCHvUoqvgsgttgvWYJRLmRy
	 Ctf0wbtJfaIrL54ElQXMHHEp4G3hV1pT6gQ3CIy8MvP31AvDzxr2W5+dDmx3HNmTAp
	 zfqvFMJf/1koIC0629S0FNZL/K2Tt9sI4mDuKBmlxBYUBiP0A1OjTPLLG4UMQFnGcx
	 XkwhRUIuCQpp2zjPdY4wROLBwsX5Rrkc5jzZjEtxRR43RKQZVBNQg3a2zp678KlxVG
	 9N2EgxBB1rq2i/yXdJWcaZjbpKYeX3kM553Ds/QqHSmqemlEPoGV0N2TaxHFtRVTtw
	 6xEUhGAxDV38w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stephan Gerhold <stephan@gerhold.net>,
	Andy Gross <agross@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] Qualcomm defconfig updates for v5.18
Date: Tue,  8 Mar 2022 17:58:09 +0100
Message-Id: <164675866019.4165470.5078983567717169000.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220301041036.1804008-1-bjorn.andersson@linaro.org>
References: <20220301041036.1804008-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Feb 2022 22:10:36 -0600, Bjorn Andersson wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.18
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: c199a67c42d65ec3f60b2619d1e2bc1da8ed3dd5

       Arnd
