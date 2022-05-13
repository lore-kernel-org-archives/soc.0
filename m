Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3652CC433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 11:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19EF1C34114; Fri, 13 May 2022 11:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B2EC34100;
	Fri, 13 May 2022 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652442530;
	bh=eDnRo29GTsDkRIfwKWCCbCpQlK7xRJOTTkeqW6Ey9IA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZxV/Wn0/CQ46RXqsqeYvEXMiihoVHHX9jiy8aupRJ2x5baDGcX/MqqV2V6tTBg5a
	 gErvk0QIOTG1YBo/4cSXCW3js9ThKglbCktjEU7yYZyuHomEJgn1Cq7kFouDUcOVeU
	 EZz4FiDCchESsZHCY3GgnPhaHumyYK5Nwp3QdQmon/Dx7PC37sszjOhn0ESNrlWO/P
	 H6kQ3GrolV1k+jAPktgtk+CjMuIoop+n4o0FhQicfBipSMG60N52mVbR+yhd02sVc6
	 JsJzNlmWxmJDUX12JHSJaqy7UUsDv8X5/KfGi4PajNkdZqZ9RkHHctI6IyEfdbIRr1
	 mqRXvmWQL7uDQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.19
Date: Fri, 13 May 2022 13:48:42 +0200
Message-Id: <165244251845.2864729.8544230827917179788.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220509170158.311962-1-bjorn.andersson@linaro.org>
References: <20220509170158.311962-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 May 2022 12:01:58 -0500, Bjorn Andersson wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.19
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 0e33a258413e515702fa42081a728da336cb145a

       Arnd
