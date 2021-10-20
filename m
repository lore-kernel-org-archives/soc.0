Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0632C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 958606135F; Wed, 20 Oct 2021 14:50:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23C8661373;
	Wed, 20 Oct 2021 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741437;
	bh=mpRePlm6u4J/C/3COAhH2LODj+z/wdm5n9+Lom2qZa0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o89qH2YXoae4AgL4xTj58Wf2vOrFMpWcBypDqj/d7gHBWLPZg1VuCNN5DD0aZYAHJ
	 Auud8HvPUbl63B7qh/m2oss6KQo8qWr1NsBYXZkKoDrSq3S5to+4w5Q9cEhEV+zZH9
	 +RqqNAXi+Ow+sU1B0Z/lV1TbOuWq09wYEewmZ60+z6CgZihkwWp1zuSZF1G+iI9dKT
	 eNOYCQjFG9lHfR/hLcDhF9aqpm76iOTpchjNA9q0RxmkG8MJQXpFL4d4nPY7EXpNiv
	 uVuuBkDhsEk9SmgdNpAhkwwBCtZ5sRJjPxpSjLUsQnOFjbfKyEUdzGMeZK2McPlkgA
	 wbaweosb6KfHA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Vamsi krishna Lanka <quic_vamslank@quicinc.com>
Subject: Re: [GIT PULL] Qualcomm DTS updates for v5.16
Date: Wed, 20 Oct 2021 16:50:12 +0200
Message-Id: <163474139750.4099414.12479165813622902564.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211012174310.1017857-1-bjorn.andersson@linaro.org>
References: <20211012174310.1017857-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Oct 2021 12:43:10 -0500, Bjorn Andersson wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 878e26d3601ba5232d94749ad9f8989d8247b358

       Arnd
