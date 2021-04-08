Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A404C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6A7BA6113A; Thu,  8 Apr 2021 15:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A91BC61132;
	Thu,  8 Apr 2021 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617897030;
	bh=xeNSzYM/Ta9cIglDv1HNHX8o3BK030gkoZ/JrlML3XM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SNDo+fh9LOkioIFghwtUH026j3WGjodgHZmY/pxrycvoyPbH5hMLY2TU8jQxTV0QM
	 A/CsXt4VchWV7iP5boxCuDj1mfAElc6J0JflyAyzxmy/dZGiRFV2l4f8xtGJcxS4BK
	 zgKsqFxX201evs12hVij9odjR8rZQX5UEBk8k5LlEzpjDCddZzqvt6rlRdO6u1ZVdI
	 ZxJq38Vcqtz7UCZXiGbLvN4irbVK/D/LkQlwnVpUZ6/Aj6mH3/KacwzyGfJtATD6GJ
	 7wk1pCNm5tMfMQGoJDXKI60G47VB0F9N22fJJEplkNXM/sXHtKaIq4AezLbPjj6bgK
	 N+LskFGVENPpg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Gross <agross@kernel.org>,
	Shawn Guo <shawn.guo@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm fix for 5.12
Date: Thu,  8 Apr 2021 17:50:23 +0200
Message-Id: <161789701046.1636297.9206583528663846986.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210404155604.712236-1-bjorn.andersson@linaro.org>
References: <20210404155604.712236-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 4 Apr 2021 10:56:04 -0500, Bjorn Andersson wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-5.12
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: aa68a77863b3fa74aa6659c7cb46ce708a09429f

       Arnd
