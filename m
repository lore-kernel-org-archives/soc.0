Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7DCC433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 19:55:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3B04761185; Fri,  9 Apr 2021 19:55:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0ECF610CA;
	Fri,  9 Apr 2021 19:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617998103;
	bh=nCtEdRhW89YXTx2iWEJ+OoLpmlFebL7FXdfZQQWfs6s=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qlbEnXBxpoHdbKIMnTSwROw09edcaCeQJM5AZX6iXxMSG0lo9OX7+rzuBCy+9iUT8
	 M+d4IfxH8pMYFl9z8znD0yNtFVVqaRLLjjnMo4xCcM9rajyOWpTDBRXteOg9WGKzXO
	 gYbJm3Jdc4yIwye1VOaDe3W/c+545azjNJXrP0WGHB8TnJZlp4YU9JZz6zjEPoHLVY
	 XarnaBAAQ+80YNSDXl3ozsr6OLYhm1GVBjp1MyiUZZAnO3G6stJEiiMiDE2/siYt1X
	 LlHxpDSzqOI+/VBWfiFXIsMIiyJTpGx1HxeQArecpl3uFmmclSZQyg8N8sgy38Iy18
	 IV0D9u8rM5dRA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca@z3ntu.xyz>,
	linux-arm-msm@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm dts updates for v5.13
Date: Fri,  9 Apr 2021 21:54:53 +0200
Message-Id: <161799808686.1862218.8412636987649764617.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210409162359.776076-1-bjorn.andersson@linaro.org>
References: <20210409162359.776076-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 11:23:59 -0500, Bjorn Andersson wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.13
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e8adf27e9766525ebedb8e6607c023997f93c353

       Arnd
