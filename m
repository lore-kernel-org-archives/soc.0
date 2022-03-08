Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF3EC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B50A5C340EF; Tue,  8 Mar 2022 16:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1C8C340F7;
	Tue,  8 Mar 2022 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758152;
	bh=V52YLj0WUko30xGyJXmn9lixFF/ohnx8NLFQgx0hxNY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kKBn7RTCg31TFEj+ICCyl6KYjpL9OFTb76Sb02MDZPnkHrmhCIlyDGJWJ/T2HNHAb
	 bkVOK926K7YDSqZXxDwzEXmBp9sakZZxcDaQsBSBSEbn+vOK+bGb31IUU2tIjaw71p
	 1h6giSsoskmjyItXlIhJK2GaawNrBcc31CKqpaRiNfwUmo5S12SzIVoups/8ydEnjo
	 zppiX3CVeySFZojgeZmxyjSYUqPhdcEZ5Y47sOL75oCMrtPj6whcNkBxe2shxcenNy
	 2sXlau06Iaxh5n+Vb0yLMcuxwM9LW3AMa4/v7/fBDpr1+8JKpnkpw1vUii3PGdIDNR
	 vzMF3UgJZVi3Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>
Subject: Re: [GIT PULL] Qualcomm DeviceTree fixes for v5.17
Date: Tue,  8 Mar 2022 17:48:58 +0100
Message-Id: <164675812238.4164061.1202978444735455248.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220301033838.1801689-1-bjorn.andersson@linaro.org>
References: <20220301033838.1801689-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Feb 2022 21:38:38 -0600, Bjorn Andersson wrote:
> The following changes since commit ef5ad2608511596b8bd28f1e2b4fa8fadfd2f536:
> 
>   ARM: dts: qcom: Drop input-name property (2021-12-15 16:40:52 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.17
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: cf90e2f1de977fb79873b1eaf6df113e4e8b4469

       Arnd
