Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0918C433EF
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 15:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B5A5C385A2; Mon, 25 Jul 2022 15:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5170AC341CE;
	Mon, 25 Jul 2022 15:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658763878;
	bh=AAealKp4VQVDcPiqiUZcvfdDX4c5BZeToXNinl3BRxk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rANzYTZoOgvd55usl8RY60xGo07N15IoLZl8xG5dbfBxB3Nu6nvy5PvjoKWozemlt
	 iyjgvCJFkJkjI7P2yO1vEYjyjGZ7w1JY9ih6KrsOVnPaas6eJah79+EbAGYmEvUauj
	 /MK2eCIYmPZLU5NmbYH1E+Yk3BvIt/7jyYibidl1co+VnFJB02Xm4HioXl8cloK+dP
	 GvvmQZRrK8tn2HDuU6Z/icrJutOS6G5mqU9xD1YmFvustX8Lapk3lPLfOZ/9/pbJoi
	 NQG3U0NeH/jHtkjHEIuqkiqe5E+vhJqsP9Cj7BF5LW8nxFieaz8Ut+ctLPSW89ymAi
	 6V6+rvqCeoNsQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [GIT PULL] More Qualcomm DTS updates for v5.20
Date: Mon, 25 Jul 2022 17:44:15 +0200
Message-Id: <165876383675.2817697.7004456203940930306.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220720231111.2114025-1-bjorn.andersson@linaro.org>
References: <20220720231111.2114025-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 20 Jul 2022 18:11:11 -0500, Bjorn Andersson wrote:
> The following changes since commit 864cfdeb76735909a9afcc314416ccaa1ce82a1a:
> 
>   ARM: dts: qcom: msm8974: rename GPU's OPP table node (2022-07-06 16:04:22 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.20-2
> 
> [...]

Merged into for-next, thanks!

merge commit: 3d2b5fddd067080c8930bd51f72cf3a21a310c4c

       Arnd
