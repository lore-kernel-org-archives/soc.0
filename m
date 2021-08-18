Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AFAC4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 13:34:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A003C610A7; Wed, 18 Aug 2021 13:34:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 394FE60F4C;
	Wed, 18 Aug 2021 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629293685;
	bh=Z0OtzPiQEVUXlvnIMq7uGNCiABndU5sOI74VjC79fyw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rDkHI8s4k/lAorGDr3QGCDWhaIgLbkgZOQhYGkMtVVuOz0t2rIQ27etNihU/z7WwH
	 Wh0S6db+Ffg9JlakiIucdpihTX8WPVk/A8gjLXygzpHoqj+NffHzGtLKLdD+U3Gcqc
	 xxJK48Mx1q9P2q1B1dNR9meFJCVk3RAhjqC2Sx/3Fm+nejpXca0wwvmWXbcflXspo2
	 0CNn2csd2co2iZ6CkoGrovPb+XR19BAS41fXL0EnksehCFOKREMxHljxNgG5RwUSoL
	 /+jvmlflxZufsYz6/3bXsSl3r85QMDcNmu+L1sE7V2J6QIHchhcnjVuIXc5FZduSNI
	 uCveD7IodYEPw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Alex Elder <elder@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Caleb Connolly <caleb@connolly.tech>,
	John Stultz <john.stultz@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Junlin Yang <yangjunlin@yulong.com>,
	Iskren Chernev <iskren.chernev@gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for v5.15
Date: Wed, 18 Aug 2021 15:34:36 +0200
Message-Id: <162929367332.377646.799358526302496478.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210816214840.581244-1-bjorn.andersson@linaro.org>
References: <20210816214840.581244-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 16 Aug 2021 16:48:40 -0500, Bjorn Andersson wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.15
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 5c785014b67fb25d8e2a36d24940dad0c416a005

       Arnd
