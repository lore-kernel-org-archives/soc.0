Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0FFCCA47B
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56BF3C385A2; Thu, 14 Jul 2022 16:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE57BC34114;
	Thu, 14 Jul 2022 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657814632;
	bh=EE89RF3HfrE2MKdvG2j8i20Dbe05yxoVBMj/zY2/5r4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Asrrc306aeua/7CjGf0Aa9ICr7ij7ouNgKAQGAKt7XZWustGM0mdW+EtinAPFP4qH
	 t6dtGax5I133It0441ZGIT1hIzoHeOn+n2pGIWXi4tAuwI7fX02c36/vYorJg44IWR
	 G2Zz0C1qHw8nAGvDzL60CiXG/l9QaCXUxikwH1cOfL4FARqVWX8c7Vm6+8E6BDBYnx
	 Z8kQ9ylx2duPoqLwRzFaqfTw3c+ILUr7CnBN5Wp76fzpTCS8bbmy5q7f5EGi5X5use
	 fdFp5ubECW2HM8pbtu0glNF4GZoPGjgCjCcOQM5KcZ/lpQdffvVlLVXSvASlPEWzAL
	 EDd1kxo+TCc6A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.20
Date: Thu, 14 Jul 2022 18:02:21 +0200
Message-Id: <165781428778.3197247.12725394529223848274.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220712031812.1275182-1-bjorn.andersson@linaro.org>
References: <20220712031812.1275182-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Jul 2022 22:18:12 -0500, Bjorn Andersson wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.20
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 96c1bbda5e23a83eed97aa97bd8ce902e237a723

       Arnd
