Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7222C4332F
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:54:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BE2366120D; Tue,  5 Oct 2021 13:54:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26EEE6023D;
	Tue,  5 Oct 2021 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633442066;
	bh=QRyqinl4PMVbQ7Hm9SGv+YX+OH4lBkNZw8ZzZOdgDPo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W/pPxagP1GNPp88nx9DJ978vOtGm3uQGgepzF/mt3AbpA0quFJS5lv91PfT6ZVnpM
	 ISlBXjPnNrZkMcpR2JkfNdamOk44ZD5OhbF6wNf6ueVr8FZhMCreoZcXuFJfhvRNJW
	 cFfBQMrGKgEQ1XmqNJRbSb+/ENzgn764vR1V7bVs3kohr/3+WDKZJXWmRRfbMGY66/
	 mcq3qxlRsVWjsrXcLwdNiVyfGuHHbCP4JBWqOhpclnkObHeT4gJaLTnA04hzO/nVfN
	 myjWaE2AaBe/5hOj7z59KjcGC6p6x5bOO4TgAF7izWVq+MlZSZkp9aqiOsfkjjQ9tC
	 usOCqmQBpBIag==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Amit Pundir <amit.pundir@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawn.guo@linaro.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DTS fixes for 5.15
Date: Tue,  5 Oct 2021 15:54:21 +0200
Message-Id: <163344201899.2721334.537065914671320241.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210930025509.1091-1-bjorn.andersson@linaro.org>
References: <20210930025509.1091-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 29 Sep 2021 21:55:09 -0500, Bjorn Andersson wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.15
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 04e0ae8d2b96a3d992e1024b215071c61e45512f

       Arnd
