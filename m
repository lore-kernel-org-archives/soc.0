Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869B8C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70EB1C340F4; Tue,  8 Mar 2022 16:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF5EC340EB;
	Tue,  8 Mar 2022 16:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758450;
	bh=I9sXGTx5S0vYny6dqaTUiA4xjzkMNcA7OoseR7fDb4s=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZmJPeDc8RQ6xSu2jEb6sR/OhJ1pB6UjKmUzAkUHnp6ITl93tyUWln97kzuNTb3Sj3
	 pm4zm12MiTtuiY8xPHckGmL3LP42uv472zn7pOdC4H9Bajj8+3xEATq6mF/1wEHUCj
	 F5b3P0btPy20rWbEWe+ibP+jnmU9ICqz8Y8z8Q4Yw0iL1oIn0npjZ4ZmLUMvnQhXxP
	 goTjUK+0hRa3VNwfxDg8w/zIz2fo9RXx//kRuyvEs4xlMvPl6YHEp+DJwxeLUj8gWG
	 CRa8EdQt1IDYfEDckeOSqeMcS332BQZfkZ7oH9zrIZBo7ifKMGsPRzdLBMamek1pwn
	 8AvkJZ6vzU1KQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Andy Gross <agross@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Huang Yiwei <hyiwei@codeaurora.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Olof Johansson <olof@lixom.net>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Xu Wang <vulab@iscas.ac.cn>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [GIT PULL] Qualcomm driver updates for v5.18
Date: Tue,  8 Mar 2022 17:53:55 +0100
Message-Id: <164675831418.4164581.12319975008365181552.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220301042055.1804859-1-bjorn.andersson@linaro.org>
References: <20220301042055.1804859-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Feb 2022 22:20:55 -0600, Bjorn Andersson wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.18
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4d558d4d88afcaad01ea20bcfcfb37d904756d2d

       Arnd
