Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE6EC433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8507364E4B; Tue,  9 Feb 2021 23:06:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6654F64E3E;
	Tue,  9 Feb 2021 23:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612911986;
	bh=oB4tIzOClHplFUemBkY0E8w5tnOKnNu44xzqHHz985M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YnMmZR9SRE7EW27CqpqSDpSgJWL4O8d90iSw6JkqzRW0xwfUf11Qnss0UIGti61W0
	 VASccT3bxHj1Yd+EkozvJ5/4nYknafkNKW9IEU/WMHyYji0XE3vctU2xAHYfrDCamH
	 iHTcpPyzQUEEl6Xv4WmKraHoBQAIDeUqW3JAM0v1S7Vtg1UnxhBEL4MNDGy3wI8TTb
	 UtICx/AhmCrpGYrf1fyTFKrzj/0ULd/3vWLPlxtfh345mGgN7hbGxJk1ixkSaYbDIs
	 WA5QGqtkvM4m4C4y/kqxNXoM1QLRze6p1WH5h4UmKk6oIhpODaSFkNDd7SiDwH8RFC
	 3btXQr4D4ZJ2w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Gross <agross@kernel.org>,
	Robert Foss <robert.foss@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Gustave Monce <gustave.monce@outlook.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Akhil P Oommen <akhilpo@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	Danny Lin <danny@kdrag0n.dev>,
	"J . R . Divya Antony" <d.antony.jr@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Jonathan Albrieux <jonathan.albrieux@gmail.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Steev Klimaszewski <steev@kali.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Vinod Koul <vkoul@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Eric Biggers <ebiggers@google.com>,
	linux-arm-msm@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Caleb Connolly <caleb@connolly.tech>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.12
Date: Wed, 10 Feb 2021 00:06:04 +0100
Message-Id: <161291108058.974605.13581246808545504549.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204052043.388621-1-bjorn.andersson@linaro.org>
References: <20210204052043.388621-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 23:20:43 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.12
> 
> [...]

Merged into arm/dt, thanks!

I noticed that this came fairly late in the cycle and has a fairly
large amount of changes in it. It would be nice if you could try
to send some of the DT contents a little earlier in the future to
avoid risking them to miss out.

It could also help to split up the largest branches to make them a
little smaller, e.g. by having one branch just for new SoC and/or
new board support, and another branch for changes to existing machines.

merge commit: 8a2b1ec1708566e032f22a95635ac2d105103b42

       Arnd
