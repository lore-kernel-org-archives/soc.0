Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7FFC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FBEAC340F5; Tue,  8 Mar 2022 16:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879E8C340EB;
	Tue,  8 Mar 2022 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757905;
	bh=inrmXLbjesOxSD8+03Lwu3YYsfx0pW1a7LBoB194sVM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eJm45IR86CGtG6NCrySjeimMyZ6f7u2XeJZdcP4inCwUJ/2fZt5vNZ3BnyeCrizTo
	 j6ZFPpFvgkj8nKMYv6gN6UlydWruUb6b0yKletkq2vClI0aBQmeQ/kUGHFL1XwZWjs
	 bC/96KkHd3Np1BNUdj7Hxgs2orP/W/Tqu40khi3nXhqXAg+mMI8LkI2jjMksiMgH0p
	 CIKBCG52sUPiqbWnN5rOKiaR3i+DPesONn/Nu+I9hfRTMuy86IceJxF7dRKSuFZv36
	 N3Tnz/YqXBgEg7U1vNis69PAk36nUiXgdyrc4ZLhQTmQL+7Bd3xcenw2Vcky0RUGF/
	 KsaYueJ8rLUxA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andy Gross <agross@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
	Robert Marko <robimarko@gmail.com>,
	Taniya Das <tdas@codeaurora.org>,
	Rajeev Nandan <quic_rajeevny@quicinc.com>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	David Heidelberg <david@ixit.cz>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Alex Elder <elder@linaro.org>,
	Baruch Siach <baruch@tkos.co.il>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Petr Vorel <petr.vorel@gmail.com>,
	Nikita Travkin <nikita@trvn.ru>,
	Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Rob Herring <robh@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Baruch Siach <baruch.siach@siklu.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Jean THOMAS <virgule@jeanthomas.me>,
	Luca Weiss <luca@z3ntu.xyz>,
	Thara Gopinath <thara.gopinath@linaro.org>,
	Balakrishna Godavarthi <bgodavar@codeaurora.org>,
	Olof Johansson <olof@lixom.net>,
	Felipe Balbi <felipe.balbi@microsoft.com>,
	Caleb Connolly <caleb@connolly.tech>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Alexander Martinz <amartinz@shiftphones.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v5.18
Date: Tue,  8 Mar 2022 17:44:36 +0100
Message-Id: <164675781040.4163171.18026767052081542389.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220301053929.1809684-1-bjorn.andersson@linaro.org>
References: <20220301053929.1809684-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Feb 2022 23:39:29 -0600, Bjorn Andersson wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.18
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 29cefaaf2b3579a0146849ea590055a563a14db5

       Arnd
