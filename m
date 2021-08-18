Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EC0C4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 12:59:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2031B61058; Wed, 18 Aug 2021 12:59:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13EF3600D4;
	Wed, 18 Aug 2021 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629291581;
	bh=6LJXht9xHb9GLhl4f2c4k/QdVVJdiRxUmRy4Fg5gMzw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VKTNNXavNLoB2JMY27WDPWcN3MFs9ScWewKHSjcuGNpvLQV/VCsYpBb4mKttGKbjm
	 JfjkjY8nCBALiWRV30x6FYGDKOxfen6AABVSr/RVnj6Mj2TZj1BUX/MwCL5Bs2BtVD
	 UYBq1yQaK/QWIDspxQ773j8ZQzUq8UcZ4hQA56C7p3+OqS8j+V+yMfiunkEQrH97lY
	 t2WGJC3bOqXbn31faPEcdSxUOnA/OlsdLoUg1pP5bMM55C6tAIz3Bq6CRuF75MvVNA
	 /iefQjJjgJv4ky4L2pcqgx3lfTFpTr4ps5i/4Z5p3n0wmvvi2oL+ywAtJe9P59enUL
	 spwXjkjuQcmGg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Kathiravan T <kathirav@codeaurora.org>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-msm@vger.kernel.org,
	Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
	V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Alex Elder <elder@linaro.org>,
	Georgi Djakov <georgi.djakov@linaro.org>,
	Sandeep Maheswaram <sanm@codeaurora.org>,
	Thara Gopinath <thara.gopinath@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Robert Foss <robert.foss@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan@gerhold.net>,
	Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Felipe Balbi <felipe.balbi@microsoft.com>,
	Andy Gross <agross@kernel.org>,
	Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
	satya priya <skakit@codeaurora.org>,
	Martin Botka <martin.botka@somainline.org>,
	Caleb Connolly <caleb@connolly.tech>,
	Robert Marko <robimarko@gmail.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Kuogee Hsieh <khsieh@codeaurora.org>,
	Vinod Koul <vkoul@kernel.org>,
	Sibi Sankar <sibis@codeaurora.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Wesley Cheng <wcheng@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Ravi Kumar Bokka <rbokka@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	Baruch Siach <baruch@tkos.co.il>
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
Date: Wed, 18 Aug 2021 14:59:22 +0200
Message-Id: <162929137182.372162.1107207134095888693.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210816231223.586597-1-bjorn.andersson@linaro.org>
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 16 Aug 2021 18:12:23 -0500, Bjorn Andersson wrote:
> The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> 
>   Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: a0f480dc6546b9d97027bf7bc8145aad48ddad00

       Arnd
