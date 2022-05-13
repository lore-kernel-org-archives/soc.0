Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D11C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 11:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EF90C36AE3; Fri, 13 May 2022 11:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63424C34100;
	Fri, 13 May 2022 11:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652442312;
	bh=FxecrmjKtsjJo90xsF+STC5RKLH6ahZBRmu4vBsf8mM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MjFKfL/KH+CUZuDv4fu3hkNu//UzNJDnaWpkf161UK396VUVfnBYIT5dJ2cuVrcMk
	 PH4Iqm2vxK1apheJsLdIQdXdWdwp42Jb4hC9IkJX3c3mGHuVmrNsr5rRZWDfGZTJry
	 3W0dP0Lz2SxobHNXiKliFEp0Q00AOaLSCxNtwKjxmi8VvI1N7s7UGsP5VlolbB6Xi1
	 AUK1+ZFgXKSzR0/XxA91U6M4tV5+K5AdeowxeWj4YBeBy0UMyQtvzosXY1ugXwAl/X
	 ZwkPfJucTqqVnJizypUweFQVd1NIA1CNGl+GwtKbBxTD3Fjbbgh2bib30KN7CRg4pd
	 CZTB/cRSAt9qQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Ansuel Smith <ansuelsmth@gmail.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Kevin Hilman <khilman@baylibre.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Jack Matthews <jm5112356@gmail.com>,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] Qualcomm ARM DT updates for v5.19
Date: Fri, 13 May 2022 13:43:35 +0200
Message-Id: <165244216380.2862916.5200189581934236248.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220509172125.313259-1-bjorn.andersson@linaro.org>
References: <20220509172125.313259-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 May 2022 12:21:25 -0500, Bjorn Andersson wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.19
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4c94666955356944b7ba95a35c140cd6a72b4ea8

       Arnd
