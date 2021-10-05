Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5ACC433F5
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:55:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A2FBD61503; Tue,  5 Oct 2021 13:55:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B2EC6023D;
	Tue,  5 Oct 2021 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633442119;
	bh=dL0FGtRiz8iLH2Xof9EcpJ2EZOleGZqnCdSdnFG41iQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C3BDtsZWTaDWdli7a7B7xBL5Y0ffMsLsY7u4vu09KwS28DW95gFJYH8e0vUtAZSSr
	 ryzl/Z0P4H3gKuBVVmg935RklhV7uQb7d5CfGuL0biebgmdchRNfOnQM97/gkTdx2A
	 tiDlUeygQQwx4xwiVmtUkjlgseFo/uPuzz8Oe0S51uwRBmyOVolSMCBGtHmbSXhamJ
	 IXQc3LdGlfAPKbSiyad82jsBhQeh0cNQjniWM3ZH96JIq5l/GM/z/TAYwqbRWeD2OA
	 iP6l7xUrhJAAGtXX1slCbTnahzh/Wz4ukK/JXJV0TrjGAv5tiQP83wvMko9G6HeRWW
	 k2szR2q+xWpdQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	David Heidelberg <david@ixit.cz>,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] Qualcomm DTS fixes for v5.15
Date: Tue,  5 Oct 2021 15:55:09 +0200
Message-Id: <163344208489.2721567.9809348887551925791.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210930025526.1146-1-bjorn.andersson@linaro.org>
References: <20210930025526.1146-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 29 Sep 2021 21:55:26 -0500, Bjorn Andersson wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.15
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: c147392b652b6af7d96f1f844a4938a6bb4921b8

       Arnd
