Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05000C433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 11:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8523C34117; Fri, 13 May 2022 11:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A227C34100;
	Fri, 13 May 2022 11:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652442355;
	bh=1z2aXcrqrheBe65L1zcvWye7O2xD7J/0cAifwr7dUHE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MbV7RD0KqXQS+4GePqx7oBiBLJyiFTut31dfzU1djldkK9hVVl8aaPlgZERhEz6iy
	 njM52eYBKuwgncOLlK47QVstvZY+60bxRiHkKk85YulpvSjWjAv6jk6WmjzovVUkFo
	 II9o5ColWetFxV7ktGkPs2FIgkaPhK9hjJ6IRGxuNGh0MA5yroWu8Y1tgAE1i57nfc
	 ANQL5194o81NYncZhy7KNRg+fCpvzprQhMYCC7EKlwJB/ZngTpZxNt6Wg4D89ozRAV
	 cikfSPO5Zi5tBA3OV92SZZ72cS5tTF6zELCeoydzL2eTAZJXkfJFRTl8PMNYTpqIu6
	 aevRYuMQ5biMQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm ARM64 DT fixes for v5.18
Date: Fri, 13 May 2022 13:45:50 +0200
Message-Id: <165244234730.2864125.5498507051223802681.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220509152310.306179-1-bjorn.andersson@linaro.org>
References: <20220509152310.306179-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 May 2022 10:23:10 -0500, Bjorn Andersson wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.18
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e81c07e25e5b8240f95ed9be5108b8f3455225cf

       Arnd
