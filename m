Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5CEC433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 12:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8ED07C34115; Fri, 13 May 2022 12:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4487FC34100;
	Fri, 13 May 2022 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652443216;
	bh=yDDiFpH9S4P3eJdJRr4f2OShBcceTTmp8eDEuYl7fE4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iUAk1sJ8oJy33QgeMOXHd+hwX5SR/hCHdSfchjO7fzBwHZ8eHKBqV6SeZvJKxhQtY
	 1lehQ6xGluhtgvpnOBEmlKDCuzEbq9qFJr7GVk+iNCzsiL49iCVusl405KqkWSK37u
	 SAwASUnTKFk3oQdF0eWAkQviZp8vGkft+KHCcbornKVqp7SR5yzYrIGhS4MtCSs7Nm
	 igmlYfmWHHUwz22veHgWZw0lJMLNUXABvFgA686sbtmdJ3vM0D1sf9hvwfM97OedVo
	 gyNMQxLaUjdj5GqTTdlZrrfJ6xmn5AxHak40xZXha8FQ7RClHqCy0/7Cp2RVSaKK7D
	 dIjLQjVXugAHQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Andy Gross <agross@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] Qualcomm ARM defconfig updates for v5.19
Date: Fri, 13 May 2022 14:00:10 +0200
Message-Id: <165244251856.2864729.1576549327140989278.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220509182209.317208-1-bjorn.andersson@linaro.org>
References: <20220509182209.317208-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 May 2022 13:22:09 -0500, Bjorn Andersson wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.19
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: a2e8bbe07276d8d981d0a88db9c77944877706cf

       Arnd
