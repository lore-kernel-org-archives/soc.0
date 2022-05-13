Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8283C433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 12:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA2CEC34115; Fri, 13 May 2022 12:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658F2C34100;
	Fri, 13 May 2022 12:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652443289;
	bh=e6yJNnqyTjWpIb+f8hDiRnejuWh3SUunPskiFRkXWxQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hOZPdibjKA6xb3s7O1El1SbzfQDpqhSXnuEqYQptYfZD2B2Qqhv6f7V7ywXvO4stN
	 qGEr48kOmIjNiOfXvO2uv6k7vRyvukMC+fUBXstHd5EPtnXMCyPDXfw2SFLpKh2CJM
	 fx4EuPuUxUUxkrrOpAXU8+u3WNJy2C296wtjoMjVWrPJL0sS0goAoCI5G72SFehWID
	 wd3cNei8HFz/GG94WPOJyHZy0gjOaaRNBXRMYwz361fdt3OTd5SIy4IxARW4Bpa+3s
	 IyDX4885HYM0crFyc+cvTXtkuKCu958JhyYTf/d64fzTEMzNMSQQK6Lez2Wks0mljo
	 xO3EpA/MXjmNA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Michael Srba <Michael.Srba@seznam.cz>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	Deepak Kumar Singh <quic_deesin@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Tom Rix <trix@redhat.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	Adam Skladowski <a39.skl@gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for v5.19
Date: Fri, 13 May 2022 14:01:20 +0200
Message-Id: <165244327638.2870002.13437566424875177456.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220509181839.316655-1-bjorn.andersson@linaro.org>
References: <20220509181839.316655-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 May 2022 13:18:39 -0500, Bjorn Andersson wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.19
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 3f656f2618fb0a7fd1ae128628f2a7a789645642

       Arnd
