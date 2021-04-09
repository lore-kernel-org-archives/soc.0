Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCDBC433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 19:54:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6673361178; Fri,  9 Apr 2021 19:54:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15FB1610CA;
	Fri,  9 Apr 2021 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617998053;
	bh=cOzyZqca5gwW2gABD9EnRTP6HqnEfJigmShKZpH8ayo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g8/9j7hCL0IuLIZ9M6dn2nlwTIszeftBcLdd7o7os7uUI8JXwldEKZrd+7nOh5TiK
	 9K/lzrnw3nnsZIN4hDh1jm7gYmgkabMWPmLsrGQkrONyf7zwaO7u3d8mUFZJNbOz3z
	 HMs5/VUmRz8xWx/GxWDZfXRMZgSMWpUuhRxPBWyrFhGbl8PfOOPmzLpZxD24GrRLSA
	 k1rRD2GYZQH5ChFv1ehy63+3K/Fgg3ZKprFp1B9DvW2HRWtyukndbwVm7BXTr7Q9/h
	 KDm7+epwEs94Op/dt1KCfLFGcqWAJ0LguDunAIP9mxhhvhj4ksbfaV6eAFzRCIItmf
	 V+ARDfRfHk/Fw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Gross <agross@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Qinglang Miao <miaoqinglang@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <swboyd@chromium.org>
Subject: Re: [GIT PULL] More Qualcomm driver updates for 5.13
Date: Fri,  9 Apr 2021 21:54:08 +0200
Message-Id: <161799803678.1862045.4284365394007319918.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210409162001.775851-1-bjorn.andersson@linaro.org>
References: <20210409162001.775851-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 11:20:01 -0500, Bjorn Andersson wrote:
> The following changes since commit ac6ad7c2a862d682bb584a4bc904d89fa7721af8:
> 
>   bus: qcom: Put child node before return (2021-03-29 22:01:27 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.13-2
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 30be8446db39be8dc52fc8cd2cb601d3d6319e9d

       Arnd
