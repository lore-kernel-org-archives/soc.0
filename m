Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E897DC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CECD6C340F6; Tue,  8 Mar 2022 16:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E57C340EF;
	Tue,  8 Mar 2022 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758149;
	bh=whrrsb8CPPNNCMRKSsnG44U7V5T88jVoTshij7m4ttU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=avmCi5z+/zDva1ZbbWyIgwpqgjqARbfi8+pDXFG2x8YOBlqgsqUG8D4ILs2MnQu+d
	 KErPjFSPRxNirozlzJAqeig2E/TXk2096sKtTHH6MmYPV6osUdE97snx+L6TMCtnSJ
	 7msgPXH7aTDG2Ds3xHi/cK/zOpjm+cNdFDA317E9UTDxRdmnLRlILPmq1aT4e2n2bq
	 KSn0fA2RaCT85T1IrT+dreANFxXoWRpB1sk0/pMViLjCAJbaUOBTgxb9LWNmrGrEXG
	 /2oUyHIMg2R+mYWsuvBoKly1Fu4vo7SMialXjzlceXYsrIJzV2LgUbz2w5fjW87qKd
	 0xh6qtxT7EglA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Steev Klimaszewski <steev@kali.org>,
	linux-arm-msm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Jonathan Marek <jonathan@marek.ca>,
	Andy Gross <agross@kernel.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DeviceTree fixes for 5.17
Date: Tue,  8 Mar 2022 17:48:57 +0100
Message-Id: <164675812200.4164061.9528871879791402816.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220301033526.1801295-1-bjorn.andersson@linaro.org>
References: <20220301033526.1801295-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Feb 2022 21:35:26 -0600, Bjorn Andersson wrote:
> Sorry for the late fixes request. If it's too late, please merge it towards
> v5.18.
> 
> Thanks,
> Bjorn
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e1d7eed180b6355cedfbbd5c69ef7e0f145a5510

       Arnd
