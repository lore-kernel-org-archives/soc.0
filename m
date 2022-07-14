Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70610C43334
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50C3FC341C8; Thu, 14 Jul 2022 16:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42E5C34115;
	Thu, 14 Jul 2022 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657814641;
	bh=8U6V44BkYj52yzWOSlU9p6mm1n2NzTMWPwCG+aD6ErY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sQ+pqawcT3SEz6rqJnNTn1Rxn+WLS2iD47JZ1lbSRE2idRXIrg6W2iaTg6TDHt4TN
	 tRFB5COjaqDOEznedO22aJ7Deb41bfYEDyerkbCmzT7P+/7Iq42ITPRBTk5X8qEnsn
	 4dRHt1msG7ckT/mSUVmEO8KkdrLb7sEUwH3Da8BjXqXJqbMJ85J8z23o0tOYIlEzNi
	 fdd6lTG+qbTaqjQtSyfhwQVTGpjnJIpjH9DnWoqUi0DHsQp+8ZbrDlQfaHMVH/n2b4
	 /NWk2pe7evY6BahAdGJHFCQVidHtZMd8hI0i5cp+HKE+9xMFtBbXnbocWj51h3xLuV
	 00lhfhBYo4/Yw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	David Heidelberg <david@ixit.cz>,
	Emma Anholt <emma@anholt.net>,
	Gwendal Grignou <gwendal@chromium.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lin Meng-Bo <linmengbo0689@protonmail.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Dang Huynh <danct12@riseup.net>,
	"Joseph S . Barrera III" <joebar@chromium.org>,
	Dylan Van Assche <me@dylanvanassche.be>,
	Alec Su <ae40515@yahoo.com.tw>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sireesh Kodali <sireeshkodali1@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Douglas Anderson <dianders@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org,
	Markuss Broks <markuss.broks@gmail.com>,
	Robert Foss <robert.foss@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Anton Bambura <jenneron@protonmail.com>,
	Robert Marko <robimarko@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DTS updates for v5.20
Date: Thu, 14 Jul 2022 18:02:22 +0200
Message-Id: <165781428857.3197247.898700430393746668.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220713203939.1431054-1-bjorn.andersson@linaro.org>
References: <20220713203939.1431054-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 13 Jul 2022 15:39:39 -0500, Bjorn Andersson wrote:
> The following changes since commit 5fb779558f1c97e2bf2794cb59553e569c38e2f9:
> 
>   arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo (2022-06-27 15:09:32 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.20
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e0a592505566c82d60a2010d0976b8ae0a831fcc

       Arnd
