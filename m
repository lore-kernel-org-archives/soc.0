Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D829C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E07361058
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E07361058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoLVox2Z1aGRIIHvHxeg1O2thEs38gwwdgm61IeHGd8=; b=mRsdesxlO1BcA6
	irymPR9S6O9hDBYu/m0Lx9ms1JYR2gxiCpQ8RZqZfUxlL2PKg6Mt+W8aaBtbnGCWGe8Li8SvdYmAA
	mosqD6vEQEzGtOf86GQfiY22j3tT0vRTYDrn1w5JKIG9CD11dplnFBU82RwEeee2t1HCbWNeVgqLw
	3ygSPZyAE1fNhg2BF612P8ep3AtK2Y/D0f3dsr4ynug1w+kod1iHFsXFxGA80x/AMCiqERvEgmSg8
	AwWmE1/Zvloy+PNeG/6uOOF//8O8FQeeFmfLrhpYi8et03P/QRnedmNGqK2ESSJGOhHX20pxxQX20
	ooVGiK62B+gTFtSkyiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLAX-005bFj-A4; Wed, 18 Aug 2021 12:59:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLAT-005bF0-Qh
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 12:59:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13EF3600D4;
 Wed, 18 Aug 2021 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629291581;
 bh=6LJXht9xHb9GLhl4f2c4k/QdVVJdiRxUmRy4Fg5gMzw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VKTNNXavNLoB2JMY27WDPWcN3MFs9ScWewKHSjcuGNpvLQV/VCsYpBb4mKttGKbjm
 JfjkjY8nCBALiWRV30x6FYGDKOxfen6AABVSr/RVnj6Mj2TZj1BUX/MwCL5Bs2BtVD
 UYBq1yQaK/QWIDspxQ773j8ZQzUq8UcZ4hQA56C7p3+OqS8j+V+yMfiunkEQrH97lY
 t2WGJC3bOqXbn31faPEcdSxUOnA/OlsdLoUg1pP5bMM55C6tAIz3Bq6CRuF75MvVNA
 /iefQjJjgJv4ky4L2pcqgx3lfTFpTr4ps5i/4Z5p3n0wmvvi2oL+ywAtJe9P59enUL
 spwXjkjuQcmGg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yassine Oudjana <y.oudjana@protonmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Kathiravan T <kathirav@codeaurora.org>, Olof Johansson <olof@lixom.net>,
 linux-arm-msm@vger.kernel.org,
 Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Alex Elder <elder@linaro.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Sandeep Maheswaram <sanm@codeaurora.org>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Judy Hsiao <judyhsiao@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephan Gerhold <stephan@gerhold.net>,
 Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Felipe Balbi <felipe.balbi@microsoft.com>, Andy Gross <agross@kernel.org>,
 Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
 satya priya <skakit@codeaurora.org>,
 Martin Botka <martin.botka@somainline.org>,
 Caleb Connolly <caleb@connolly.tech>, Robert Marko <robimarko@gmail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
 Sibi Sankar <sibis@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Wesley Cheng <wcheng@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>,
 Ravi Kumar Bokka <rbokka@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Baruch Siach <baruch@tkos.co.il>
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
Date: Wed, 18 Aug 2021 14:59:22 +0200
Message-ID: <162929137182.372162.1107207134095888693.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210816231223.586597-1-bjorn.andersson@linaro.org>
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_055941_925331_086BF7CE 
X-CRM114-Status: UNSURE (   6.95  )
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
Message-ID: <20210818125922.xsO4T5WMqSF72qasTN345cyFNOOrsBrglJp8clm2VbI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 16 Aug 2021 18:12:23 -0500, Bjorn Andersson wrote:
> The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> 
>   Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: a0f480dc6546b9d97027bf7bc8145aad48ddad00

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
