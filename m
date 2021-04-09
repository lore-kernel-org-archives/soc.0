Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD0CC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 20:02:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82CBC6105A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 20:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82CBC6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vnh1GBmDDYNzyoEBw3pXIJkLS+exK39OjP6E6IxeEeU=; b=X3IvSCvebcbqicK5KvyaZjCyk
	xWgMy5khhgWXyPQM/Vm52JHLkh1b+KAqZ0ZZTwMPs/w/1gA68CMR2W0b6EOa0sZbwgiqhf+TdHbLN
	/8IbQ7p/O4vRLkaDTbydRLCoHkW9LtM5ixPzHAKyqWoT3Q8PDLz4N/JGLCFduca6wIbnZoVILQBpv
	1zQ/XHBlm/CF9BC52JU3K1N57IUlPfJWzg9j9Wqh9vJl7/zL+BQJZj0axGz2DPf8QCp0lZLAEn8RN
	jr6cwUQdj3Rxb56N2aY0AwLycnJys9IpKT/u7jW+guyDsRe065ucCrT0mDR4e39rHeuzBW/Mj3qWz
	zFjH8Algg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUxHz-001SCh-22; Fri, 09 Apr 2021 19:59:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUxDb-001Rx7-Ma
 for linux-arm-kernel@desiato.infradead.org; Fri, 09 Apr 2021 19:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:List-Id:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=49hVlg4hsE98lW2lNhjnPxAs6x6hwsGbD6UBsXcAegc=; b=VyWMs3uw2igGrLA+mPG6UKqJ0i
 kzn3DvcYlqidiITCTDYl1YATPlpBnM/pU1vUYb3XFqGrs8wlJFEzizuHBDOOOtApDh4aTpZniW45i
 8K7yPWiZ2AwlAZoLQ9uGIZIHxW52fl5lEv1ggRCN4Bj6LoUbRhRyAKs35ujBQ7JVHgk0r3zN9xlCN
 B9fF8EOFkvByrYriWvyTBavwFqBQVUquOGmYGbMcpYoLf/dSqmr0bTVPFwHW+X9q9eecS7GY6xuFV
 jFwvNmvzpbUPEe2R+UzlNNwrbUkArmZwfs068hiIFPytySVlNBiYdEeKgs6wLvAj79ZbZngMAFdrq
 fWrBVukQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUxDZ-004m09-4j
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 19:55:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86789610F9;
 Fri,  9 Apr 2021 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617998100;
 bh=AP8+aNUTnD+CO0BIHhYhziWO+97Lau3/XEnosXE8xuI=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u8bpe3brRgIT/CSUUmz24bHvRs0skQ7oGM1Ky5kT2vqK6UyHh7KNKI+p7QjcdkzuC
 yPvBIwpa1b9RurPI7wsP6h0zktCiYJSHmIUCldtUNcruL4AerJAdJuHb7uBGXUT8ww
 aSqiWaxVKRaTMXdBai3LmEwlprJCWo9XXKfl2zshvpy4tzgf8e3cT7/+Fjrs0lQTtH
 FCdBZYhMBP8QL8s5XUcyM6+PH4NQHv/O62sSNN4NLtjQWrtzjxSs7vex08ILR9txbS
 U9bRccwM8uzqJqmebu+lPI+uNmb3fJtf5tL09jWTXunbrq4Q+m40fNkkoMAM+f0nZI
 RhgUmFJ9lo5JQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, soc@kernel.org,
 arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Ajit Pandey <ajitp@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Caleb Connolly <caleb@connolly.tech>,
 Jami Kettunen <jamipkettunen@gmail.com>, Andy Gross <agross@kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephan Gerhold <stephan@gerhold.net>,
 Sujit Kautkar <sujitka@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 satya priya <skakit@codeaurora.org>, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] More Qualcomm ARM64 DT updates for 5.13
Date: Fri,  9 Apr 2021 21:54:52 +0200
Message-ID: <161799808694.1862218.16413759565351084850.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210409163949.776530-1-bjorn.andersson@linaro.org>
References: <20210409163949.776530-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_125501_228021_012DA4B1 
X-CRM114-Status: UNSURE (   6.46  )
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
Message-ID: <20210409195452.VK7ND5SuyP4zJdIckuTEa6qNRjmXgE5_vtrKQgZZpt0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 11:39:49 -0500, Bjorn Andersson wrote:
> The following changes since commit e9269650db2f5b4aeeafced1a42b2e51d10bcdf5:
> 
>   arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS (2021-03-18 09:35:42 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13-2
> 
> [...]

Merged into arm/dt, thanks!

merge commit: a8f6ba28257ab6fcf08138496afdcb2d6de3955c

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
