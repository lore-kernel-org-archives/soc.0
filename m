Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8FAC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6295060FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6295060FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0aYDZtYLZdAZDy2Gfh69qgGhNLA3hvL1nOocRnUHbM=; b=jBQEEOj06LlJX/
	gdq12jJra59VJrYkzXw/JX2RUVZqJKfGACQcQUa06VWNqUjwhHzmAkZCOMktrNdnEa1LGlPxk0ZEm
	pUyh4LGq65NdOYzp2f4q0cDf5FgcOAu2o5V6VHvNgQdfEzkwVuIvCMV1cWC1yIh61O5DVO0ecuqxu
	rnVhdi+nT5oQapF0ojx2b1Eko+QzWZYqxNHVzXnuIXGHTBnwGqbfHfqp8zOakWiTkpydvKPjPuxlA
	t0Oh3GYMHDCUadjZ5UmtKmmHk1mRpj9f/jW5rcLQhdf5hhNDNXBq8kNZs0B/uSC8NV20w64CfVzaN
	eU0voe0/THWw5JbC4zZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdD2s-004rzD-C8; Wed, 20 Oct 2021 14:58:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCvI-004pzA-7C
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:50:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7523E6135F;
 Wed, 20 Oct 2021 14:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741431;
 bh=wrgs7T4ZLBeMVFa6tFCqCMVoFnqpPqRMSoIsTnjCxRo=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fcYEmY/hCJPAEusJT+ySf5npE4Z+67jlKfucHaIqJxL3Nvjd75cSx6zBJW9HCSUNp
 DEsoZ46/rn82l6wVujgp7Kf1WCWbZBVpNPGlfKPpY4ugcf+yJF/h7UaUT6Z3XIEeQi
 Va295VBahEwlyGO92deWIXVVgqF5EFg4mHMBYVxnm5JUH+jf9cd7qM2hDbJY4SId42
 mDzXbtAA6aZSF09t84tltk+4udoTeiLAB3bNAJ6C5T4T5VtqmlGWFzcL+c2+Asze4A
 VLW7rZRoPsnBZR2c7SPTPBCh30SFwD+hW0Zv7qVDEfmYIEwu4FfBJzt29S2Iyst+aA
 mmRx79qAZs1kQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 linux-arm-msm@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Olof Johansson <olof@lixom.net>,
 Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Kathiravan T <kathirav@codeaurora.org>,
 Sujit Kautkar <sujitka@chromium.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Shawn Guo <shawn.guo@linaro.org>, Andy Gross <agross@kernel.org>,
 Taniya Das <tdas@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 Steev Klimaszewski <steev@kali.org>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Fabio Estevam <festevam@gmail.com>,
 Roja Rani Yarubandi <rojay@codeaurora.org>,
 satya priya <skakit@codeaurora.org>, Robert Marko <robimarko@gmail.com>,
 Rajesh Patil <rajpat@codeaurora.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 dts updates for v5.16
Date: Wed, 20 Oct 2021 16:50:11 +0200
Message-ID: <163474139757.4099414.7541706080164770292.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211012231155.1036519-1-bjorn.andersson@linaro.org>
References: <20211012231155.1036519-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075032_327721_3935D321 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211020145011.IhlYNwCIAxY2KD5d19wy1ySZBVYzsnqE8M2PnOyXuI8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Oct 2021 18:11:55 -0500, Bjorn Andersson wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c7613530d1ed3534168c219e6e6069f91e771b00

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
