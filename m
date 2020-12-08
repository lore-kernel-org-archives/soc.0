Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A3EC4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D5DDA23B19; Tue,  8 Dec 2020 23:10:18 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nikita Travkin <nikitos.tr@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kathiravan T <kathirav@codeaurora.org>,
	Taniya Das <tdas@codeaurora.org>,
	Jordan Crouse <jcrouse@codeaurora.org>,
	Rob Clark <robdclark@chromium.org>,
	Jishnu Prakash <jprakash@codeaurora.org>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Michael Srba <Michael.Srba@seznam.cz>,
	Matthias Kaehlcke <mka@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	Souradeep Chowdhury <schowdhu@codeaurora.org>,
	Thara Gopinath <thara.gopinath@linaro.org>,
	Antony Wang <antony_wang@compal.corp-partner.google.com>,
	Akhil P Oommen <akhilpo@codeaurora.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org,
	Douglas Anderson <dianders@chromium.org>,
	Alexandru Stan <amstan@chromium.org>,
	Alex Elder <elder@linaro.org>,
	Evan Green <evgreen@chromium.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Ajit Pandey <ajitp@codeaurora.org>,
	Georgi Djakov <georgi.djakov@linaro.org>,
	Sibi Sankar <sibis@codeaurora.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Terry Hsiao <a804335@gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.11
Date: Wed,  9 Dec 2020 00:09:36 +0100
Message-Id: <160746884620.2839681.17580415072842947702.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130190131.345187-1-bjorn.andersson@linaro.org>
References: <20201130190131.345187-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 13:01:31 -0600, Bjorn Andersson wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.11
> 
> [...]

Merged into arm/dt, thanks!

merge commit: a39d2ef78d44d79ed00fe9256b30c0de1a61d0af

       Arnd
