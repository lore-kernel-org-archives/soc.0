Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E24C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D5C5761359; Wed, 20 Oct 2021 14:50:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7523E6135F;
	Wed, 20 Oct 2021 14:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741431;
	bh=wrgs7T4ZLBeMVFa6tFCqCMVoFnqpPqRMSoIsTnjCxRo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fcYEmY/hCJPAEusJT+ySf5npE4Z+67jlKfucHaIqJxL3Nvjd75cSx6zBJW9HCSUNp
	 DEsoZ46/rn82l6wVujgp7Kf1WCWbZBVpNPGlfKPpY4ugcf+yJF/h7UaUT6Z3XIEeQi
	 Va295VBahEwlyGO92deWIXVVgqF5EFg4mHMBYVxnm5JUH+jf9cd7qM2hDbJY4SId42
	 mDzXbtAA6aZSF09t84tltk+4udoTeiLAB3bNAJ6C5T4T5VtqmlGWFzcL+c2+Asze4A
	 VLW7rZRoPsnBZR2c7SPTPBCh30SFwD+hW0Zv7qVDEfmYIEwu4FfBJzt29S2Iyst+aA
	 mmRx79qAZs1kQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
	Kuogee Hsieh <khsieh@codeaurora.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	Sibi Sankar <sibis@codeaurora.org>,
	Douglas Anderson <dianders@chromium.org>,
	Thara Gopinath <thara.gopinath@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Kathiravan T <kathirav@codeaurora.org>,
	Sujit Kautkar <sujitka@chromium.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Shawn Guo <shawn.guo@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Taniya Das <tdas@codeaurora.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Steev Klimaszewski <steev@kali.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
	Akhil P Oommen <akhilpo@codeaurora.org>,
	Fabio Estevam <festevam@gmail.com>,
	Roja Rani Yarubandi <rojay@codeaurora.org>,
	satya priya <skakit@codeaurora.org>,
	Robert Marko <robimarko@gmail.com>,
	Rajesh Patil <rajpat@codeaurora.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 dts updates for v5.16
Date: Wed, 20 Oct 2021 16:50:11 +0200
Message-Id: <163474139757.4099414.7541706080164770292.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211012231155.1036519-1-bjorn.andersson@linaro.org>
References: <20211012231155.1036519-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Oct 2021 18:11:55 -0500, Bjorn Andersson wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c7613530d1ed3534168c219e6e6069f91e771b00

       Arnd
