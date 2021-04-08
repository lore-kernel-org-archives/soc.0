Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29362C433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:24:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F293D61130; Thu,  8 Apr 2021 15:24:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4D0D61103;
	Thu,  8 Apr 2021 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617895481;
	bh=kzsbDBGOjIoWm7qnPBtVNp4XUNAglBhDYgQLft/09NM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UA7mtA7sWDDKsbxKPemhHK8nTMfykSmtVMA5rsfD7BGqrGIjEvGmLwi8cEqd3m2jx
	 ApwkPUuVkgc9q6Yvok2j4ykH4GjfvSf57wQlQRCOAL0tUGMbTp0nNJzFO2gp8UKw00
	 maQK+rEVbNogC6DTghD7aj0Fz4Q2VJoIeWPn4+bghzPYmS0BGecm5QvyNmx3zkrhSM
	 UYkHwh+kUANDzfxoCWRr+K5WuZEwTX53F8fq37V6Ob2yeTNq2+pqdZUpwQpGMrrS/4
	 De42HNhRaj2cX+QJ2WK6jD8fdtBiMe/2tkL+hyRw+rPHSMgpfkzhh3BaOKRTKt2M8+
	 sBZwIAD0d3vcw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Jack Pham <jackp@codeaurora.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Sandeep Maheswaram <sanm@codeaurora.org>,
	Robert Foss <robert.foss@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	satya priya <skakit@codeaurora.org>,
	Abhishek Kumar <kuabhs@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Shawn Guo <shawn.guo@linaro.org>,
	Alexandru M Stan <amstan@chromium.org>,
	Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
Date: Thu,  8 Apr 2021 17:24:19 +0200
Message-Id: <161789462034.1629934.2631576576205147984.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210404164914.712946-1-bjorn.andersson@linaro.org>
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 4 Apr 2021 11:49:14 -0500, Bjorn Andersson wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13
> 
> [...]

I noticed a couple of new warnings from 'make dtbs_check W=1':

qcom/sc7180.dtsi:1204.21-1220.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a8c000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
qcom/sc7180.dtsi:965.21-981.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property qcom/sdm845.dtsi:3912.23-4045.5: Warning (simple_bus_reg): /soc@0/camss@a00000: simple-bus unit address format error, expected "acb3000"
qcom/sdm845.dtsi:4041.10-4044.6: Warning (graph_child_address): /soc@0/camss@a00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
qcom/sdm845.dtsi:4102.32-4129.5: Warning (simple_bus_reg): /soc@0/dsi-opp-table: missing or empty reg/ranges property
qcom/msm8916-samsung-a5u-eur.dt.yaml: spmi@200f000: reg: [[33615872, 4096], [37748736, 4194304], [46137344, 4194304], [58720256, 2097152], [33595392, 8448]] is too long
qcom/sc7180-trogdor-lazor-r0.dt.yaml: gmu@506a000: compatible:0: 'qcom,adreno-gmu-618.0' is not one of ['qcom,adreno-gmu-630.2']
qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml: memory@80900000: 'device_type' is a required property
qcom/sdm850-lenovo-yoga-c630.dt.yaml: memory@97b00000: 'device_type' is a required property

Maybe see if you can address these in a follow-up, to avoid regressions.

Merged into arm/dt, thanks!

merge commit: 61bac46eed14ad73cd41c5b7075350fef78ca4be

       Arnd
