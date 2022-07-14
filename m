Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682AEC433EF
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F315C385A2; Thu, 14 Jul 2022 16:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91973C341CA;
	Thu, 14 Jul 2022 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657814652;
	bh=hNv23IBWT1IxrUPHt61YoTAjsybCjUn1c64rReihcWY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=udCxOmQ/q2Xji7IhZ2Pk+98RE7mSKDuXS5yeZf5iw+QAz9sxcvgsfVvhnBQH+tLg5
	 f3gd1fEb4hfnWr0IPMlyWivlSPt1m3OsgUY8LUpb+KZW8sze2EeIv83FdTL/B/KSwB
	 h1dDqwEDB8vCb8OD1NtBPZT2X4Mhnx6Mt9RF1W+Iwdyhb/SeBHyraixcnqlD1Wi6N0
	 7TZZPAVSoSolCg3UFO2LF38XFcpPUqueaErFg2xsmEFDPr9OLDsGnrL2v7nx4Rqw4M
	 kXeiH0OrrY9YVmdIIsJz5vkdGLL+LPS9+7fTobtNpR7KVoIdYVaKVa64umveCsSjMV
	 t3YumTsxuUp/A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	Luca Weiss <luca@z3ntu.xyz>,
	Andy Gross <agross@kernel.org>,
	Ansuel Smith <ansuelsmth@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Kaushal Kumar <quic_kaushalk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Qualcomm DTS updates for v5.20
Date: Thu, 14 Jul 2022 18:02:25 +0200
Message-Id: <165781428833.3197247.4819287633173202781.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220713032024.1372427-1-bjorn.andersson@linaro.org>
References: <20220713032024.1372427-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Jul 2022 22:20:24 -0500, Bjorn Andersson wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.20
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8c1e9736c5bdb280ab45eba58254f048b750481e

       Arnd
