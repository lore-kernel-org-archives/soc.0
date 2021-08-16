Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD72C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:22:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BDEFD60F46; Mon, 16 Aug 2021 21:22:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F3CC60E97;
	Mon, 16 Aug 2021 21:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148971;
	bh=ZFj4YWcgbOOSBRfEM+e7EdPIzRqLNfUQDTZRDYpIV2M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BZrGIbf3Ta28wwjfXY0M9WJuoKpCT4spGl3m05C8xwZVrRgR7E3HenOra0TcO10Vx
	 iFGwShh1SzF9ZW6AjkeiAYvMa61YiC41PDupP+uNO5k+ngVCdIQF5J+QqWVaGTQ5Sp
	 DtzK5GKOl2ZMMVmf7X9imohWLb5T7/HerVaelx6Vvc0oWTCB3ZsJjXaDudpfWgpT9d
	 L/w6s7T4qh437eR0a2s7mBaBS6pof0Ij/TGmeMNEPnLTJl2qPRcE+xlxqEZUvsIDjq
	 yRZ5hIJ8V7zUqkwWD65o3U3Lqx+Yp1WtLd4CPO4EtINouaouOU5XQp8zWVb5QHQotG
	 o/J6q5CgoDjCA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Olof Johansson <olof@lixom.net>,
	Petr Vorel <petr.vorel@gmail.com>,
	Sibi Sankar <sibis@codeaurora.org>,
	Caleb Connolly <caleb@connolly.tech>
Subject: Re: [GIT PULL] Qualcomm ARM64 fixes for v5.14
Date: Mon, 16 Aug 2021 23:22:47 +0200
Message-Id: <162914895749.238791.1673033166208068515.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210816205030.576348-1-bjorn.andersson@linaro.org>
References: <20210816205030.576348-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 16 Aug 2021 15:50:30 -0500, Bjorn Andersson wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.14
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: d0dc706ab1924e2f41677741cfa26f1c9ed6ce93

       Arnd
