Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D4CC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:31:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD20823AC4; Tue,  8 Dec 2020 23:31:54 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Roja Rani Yarubandi <rojay@codeaurora.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	Maulik Shah <mkshah@codeaurora.org>,
	Olof Johansson <olof@lixom.net>,
	Jun Nie <jun.nie@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Tom Rix <trix@redhat.com>,
	Lina Iyer <ilina@codeaurora.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Evan Green <evgreen@chromium.org>,
	John Stultz <john.stultz@linaro.org>,
	Konrad Dybcio <konradybcio@gmail.com>,
	"Isaac J . Manjarres" <isaacm@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Vladimir Lypak <junak.pub@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	Souradeep Chowdhury <schowdhu@codeaurora.org>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for v5.11
Date: Wed,  9 Dec 2020 00:31:36 +0100
Message-Id: <160747024139.3766805.9402422461225342898.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130190142.345246-1-bjorn.andersson@linaro.org>
References: <20201130190142.345246-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 13:01:42 -0600, Bjorn Andersson wrote:
> The following changes since commit 80e8eaab5e98fc013fd4afb4aab1fceeb049cbfd:
> 
>   soc: qcom: geni: Optimize/comment select fifo/dma mode (2020-10-26 10:29:19 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.11
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 6855f7bdeafb7f6997aae2b065eafd8f4b9ca3db

       Arnd
