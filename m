Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE085C0502C
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 23:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9ADFFC4314D; Mon, 29 Aug 2022 23:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2BCC43140;
	Mon, 29 Aug 2022 23:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661816798;
	bh=1oNh5w1KIBSd2HqNnIZAajBmzaVBNDOBaxATR0S2Bkg=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=W7TX3szDziu3pCQABlRG09P0JytKYfKnOp0TKKid6a2YYgLXCGWn9kEgn0DAtdl/9
	 U7yrUNeezf3M/TX0exuaftVByUv9jWfb4UwOumvuN/aRmTkvFg0fmacm3vbHZwZRmW
	 XABt+KDB6jiZdTozTatJ1FLcnvyUppY8Sy+hW47zBjLakAZjfqaZ5O7BTZbJLvklLU
	 iXR9IzFwv5Es2L9Bn7iLC7PXNPrsh0gm9uKHW827FYj3brhVV2ryMAk+0jSl9uTCoZ
	 FYIN6cwUSwHx8efzp4Jz8gNO4Fxs1du4RFyLMQggu+AgUuZEzYFRJmqsLIe5tfmD95
	 mEUebh7l0QS5w==
From: Bjorn Andersson <andersson@kernel.org>
To: linmengbo0689@protonmail.com,
	devicetree@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: sboyd@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	robh+dt@kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	soc@kernel.org,
	konrad.dybcio@somainline.org,
	stephan@gerhold.net,
	krzysztof.kozlowski+dt@linaro.org,
	olof@lixom.net,
	agross@kernel.org,
	nikita@trvn.ru,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/5] Add Samsung Galaxy E5/E7/Grand Max device trees
Date: Mon, 29 Aug 2022 18:46:00 -0500
Message-Id: <166181675967.322065.6702450360343605616.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220724095039.13568-1-linmengbo0689@protonmail.com>
References: <20220724095039.13568-1-linmengbo0689@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 24 Jul 2022 09:53:10 +0000, Lin, Meng-Bo wrote:
> v7: Fix incorrectly squashed haptic patch
> Fix email in Acked-by tag again
> v6: Rename touchscreen analog regulator for a2015
> Use regulator haptic instead of GPIO vibrator
> Fix email in Acked-by tag
> v5: Fix Error:
> arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi:36.2-22 Properties
> must precede subnodes
> Restore Acked-by tag in the dt-bindings patch
> v4: Disable i2c2 until lis2hh12 accelerometer is fixed.
> Add GPIO LEDs for Grand Max.
> v3: Add a cover letter and changelog
> v2: Add dt-bindings documentation
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: qcom: Document bindings for new msm8916-samsung-e2015 devices
      commit: dc1b8ce9db8c5181b3345505a66dfe8136b83f21
[2/5] arm64: dts: qcom: msm8916-samsung-e2015: Add initial common dtsi
      commit: 995d1ac509fb92f3288a8eab3342a5667183fd2f
[3/5] ARM: dts: qcom-msm8916-samsung-e2015: Include dts from arm64
      commit: 87c1b199e622bc2d9b16da5d870ab6b92db96154
[4/5] arm64: dts: qcom: msm8916-samsung-e2015: Add touchkey
      commit: 90ca46731599ea364d2d8b5310341ab766fea637
[5/5] arm64: dts: qcom: msm8916-samsung-a2015: Rename touchscreen analog regulator
      commit: d749d52e251b094322315c359cca814adf2249cf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
