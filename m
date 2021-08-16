Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FB6C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:34:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D049760FA0; Mon, 16 Aug 2021 21:34:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06FE460EE4;
	Mon, 16 Aug 2021 21:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629149640;
	bh=A/MP9TWlw+XqPHTw0ocgamuLBQ3WiXFgC2I/e2wda94=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E54ttbG8zO+IFpIyMQor2zD+vgTaFDn2o/czLOItV7dldkFLhyOXR3eY5GQLJy7QC
	 drwxsBV+ZGTbEaLHkePlZ676eDZfDAXSw1tsvEaT++A2FDEXGuAFs26DakJSZ54D9Q
	 RnOUgxfw2MFXVPvoYkc5pUawMqsHcFHRLzZ5LZRCMTKr1/TSK0/WXknZJr/a6IQCrv
	 knCpROq6m4FQtGIMAUvC317txV+jIn2OcwiVPqcReJSeZcYQabFIPO6/EUit4cdIOS
	 1COxQ5OikwyLwhjE8vdfUCaEQj2dSFp7oJxlRMOTXo486ajAg/fcCWllulF59PW4Qh
	 juB9E8b7mDL2g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.15
Date: Mon, 16 Aug 2021 23:33:54 +0200
Message-Id: <162914958933.240013.2336454374694008313.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210816210014.577699-1-bjorn.andersson@linaro.org>
References: <20210816210014.577699-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 16 Aug 2021 16:00:14 -0500, Bjorn Andersson wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.15
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: ecdbda1746b5bf771cd86dfeb84c20d62f5bfc51

       Arnd
