Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D856BC43334
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 15:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86372C385A5; Mon, 25 Jul 2022 15:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38C8C341C6;
	Mon, 25 Jul 2022 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658763871;
	bh=pvJcAEDzrrhhFL306m3HFCG2LB02l8s9LzqrcEW2Lik=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOLNd80VaV6Z77JGOCvo8wFA/pUYswARyLG3QPjLzNCKC3mMuKxswk7wN2+RmDtI1
	 EbFuAm1fcGsV9Arcf0kslvo+3lZOvhZnbVCU8nczepWfwjWfVzpnw7H0YpBjFTPXo9
	 SkVCoXe7FWWwt3UC2YaKZw4P+g5BLaSj2apfRV9MoFAHbLvz/mzcezT49LMia2Fhfe
	 LlXg1kckkOF/0bYEFzuEexJgN3tEP53NskzKtb3uf/4nYrHLJnbcuYl9vC5V7hlJ/5
	 UdlUjE7C4RX5nImWKNedKElI4Uqo1xLGRl86mdO5nW3v2cnYDqTs5IRRKgpDup2jOo
	 JZGrFjyPHq90g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Stefan Hansson <newbie13xd@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Steev Klimaszewski <steev@kali.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Parikshit Pareek <quic_ppareek@quicinc.com>,
	Olof Johansson <olof@lixom.net>,
	Robert Marko <robimarko@gmail.com>,
	Molly Sophia <mollysophia379@gmail.com>
Subject: Re: [GIT PULL] More Qualcomm ARM64 DTS updates for v5.20
Date: Mon, 25 Jul 2022 17:44:13 +0200
Message-Id: <165876383710.2817697.3902201804342716870.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220720231643.2114565-1-bjorn.andersson@linaro.org>
References: <20220720231643.2114565-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 20 Jul 2022 18:16:43 -0500, Bjorn Andersson wrote:
> The following changes since commit abf61f7e66c15e00f40ca7e10367f4149639bc57:
> 
>   arm64: dts: qcom: sc8280xp: fix DP PHY node unit addresses (2022-07-08 17:03:03 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.20-2
> 
> [...]

Merged into for-next, thanks!

merge commit: 2c947cd63bfb90456d3daecaf8c3d0f6b8661739

       Arnd
