Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327D5C433EF
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 15:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB1F7C341C8; Mon, 25 Jul 2022 15:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA75C341CD;
	Mon, 25 Jul 2022 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658763874;
	bh=u7yPy3yl0Fxoy64KRob7uWOhOPpqYFpU21AgTiq4bdg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iYRfGAeGPb0TdFBXXNogTZ1XSwNEmNPuHfdzal9hCt1dJ2qTfcPJEZ6xj5KHN+6Jy
	 DHAiQXDDTGI374HfMIHC2ZelxAPf5RJDwLaNbaZIv0Qm66b0rzBwph7y9qqORg0I1D
	 wC9yoUcxHNdl/yhO45y34wygqUkAIlDjvnWy9mwBJ3CB4kjLj/SQ9Y2hZc4P6wM3xJ
	 N3GViteLLF2MJSrGG5zFGH4hEI9ic/LEV/ZLvANWvzBlOYCX8LH4sONJw7Zumsdi+W
	 NryDHgnj8WR0MoEPYYAKtGbVqe3FpneLGHZxg/YioFRv5skCxPmbZHu39g/v6lNpkw
	 i99TltBYi+3Ag==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Parikshit Pareek <quic_ppareek@quicinc.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	linux-arm-kernel@lists.infradead.org,
	Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] More Qualcomm driver changes for v5.20
Date: Mon, 25 Jul 2022 17:44:14 +0200
Message-Id: <165876383744.2817697.5086121138634324716.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220720230648.2113609-1-bjorn.andersson@linaro.org>
References: <20220720230648.2113609-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 20 Jul 2022 18:06:48 -0500, Bjorn Andersson wrote:
> The following changes since commit b9c2ae6cac403dee3195fda9eb28d8ee733b225b:
> 
>   soc: qcom: icc-bwmon: Add bandwidth monitoring driver (2022-07-06 15:57:51 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.20-2
> 
> [...]

Merged into for-next, thanks!

merge commit: 99978d2fd90b9a43d187dae7b0f3266ccd980c5c

       Arnd
