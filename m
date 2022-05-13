Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15B8C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 11:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E07AC3411C; Fri, 13 May 2022 11:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFFBC34100;
	Fri, 13 May 2022 11:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652442231;
	bh=Vntbv8lOXS5M1wDSe5VDU+s5QUpPhc3bh7pvHsX0/Tw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g647krTys9PsCDH9RlTfflNQZpcfR0toY8V0NLTNdrPUW+dTw3G0ZJnWyANhGd4Gp
	 lDJg9qYXjrBODOg/W7wHwC+mH1aXqp6P4F31gkvmv7biiHPDIHKNPX8U88dW/5yvN+
	 d/+tDn/ZkhoFv/oPnh/I7XJgWPUBhx8mei+lzkqMXsrcCk6pmmMZX8tGORHbmjtat8
	 dzydATw6GHE9di/A0PtZ0elGsEi+FMDiGXe3SZiOUh4YMdyGkM0fHAEnkT0QEX5mqg
	 1KG6LLNLItu0uoCrVyttPcR2k6EQjBuON4CZMxwFjYnxulS0rCsGVcAdf98CkVjFUZ
	 kIZYTgP0XoyvA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <swboyd@chromium.org>,
	Katherine Perez <kaperez@linux.microsoft.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Michael Srba <Michael.Srba@seznam.cz>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>,
	Rakesh Pillai <quic_pillair@quicinc.com>,
	Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jami Kettunen <jami.kettunen@somainline.org>,
	Ivy Jian <ivyjian417@gmail.com>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Michael Srba <michael.srba@seznam.cz>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Joel Selvaraj <jo@jsfamily.in>,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	Baruch Siach <baruch.siach@siklu.com>,
	Douglas Anderson <dianders@chromium.org>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Petr Vorel <petr.vorel@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for v5.19
Date: Fri, 13 May 2022 13:43:34 +0200
Message-Id: <165244216384.2862916.2782320004784237666.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220509204451.325675-1-bjorn.andersson@linaro.org>
References: <20220509204451.325675-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 May 2022 15:44:51 -0500, Bjorn Andersson wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.19
> 
> [...]

Merged into arm/dt, thanks!

merge commit: d4dcdc53c492a7b9fa9031cb85e238b21208ada2

       Arnd
