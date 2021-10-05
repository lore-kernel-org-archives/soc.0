Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D25C4332F
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:55:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BAAC961526; Tue,  5 Oct 2021 13:55:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C2E3615E6;
	Tue,  5 Oct 2021 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633442114;
	bh=0yFLZfiig6DnOFmH1BxwGDCchrWxNojEqVqmvxccNEs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dvj+1UNbR8kKCFrZ0ySq+u90hm854TnBluJHQx3Lu4HSEZ2D3bw53z/vf6yQ8wPVP
	 89H/0qezVcQn+bn5r0JNv3wqkoB8bC8XxuxfxF7zdVwA24QkQYL1I+F4IYOV92duB5
	 kkJYpOWu+IHaeOFVqKEGuU0hInrg/s6y6e50mxXan7tXmTAJmDDu9d/WTqMVuDkIIT
	 1gkJma+toGRPOWkp28BTASQYMVEh6pje73816UbPEU+9iZc334HX+nKGGHo6Ky2JKk
	 tubZNK7K/94AY7rC37zULzDpNOVCobXkllFvhYqQWkp17TJ3s1vxMOg7xzVTjhhQhf
	 Q992RYBpNsrnA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawn.guo@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Antonio Martorana <amartora@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] Qualcomm driver fixes for v5.15
Date: Tue,  5 Oct 2021 15:55:08 +0200
Message-Id: <163344208491.2721567.2925197313159262269.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210930025456.1035-1-bjorn.andersson@linaro.org>
References: <20210930025456.1035-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 29 Sep 2021 21:54:56 -0500, Bjorn Andersson wrote:
> Arnd, I noticed that I've had the QCOM_SCM change from Geert in linux-next for
> a little while now and would prefer not to rebase my tree. I do believe per our
> other discussion on this subject that QCOM_SCM becomes hidden and therefor
> shouldn't depend on ARCH_QCOM again.
> 
> Would you prefer me to respin this with a revert of Geert's patch, or can you
> effectively revert this as you're applying your patches on top?
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 6147eb53bb80a8d12f1c9de4e3474bc9524053ec

       Arnd
