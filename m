Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53504C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:32:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1924464DDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1924464DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kODfXCKLVROGV8rf0+Ei6tJsiU78PUrKbxMRbjbAGkg=; b=wTOP6p+yBlvrAPbmxgXQs4vwH
	qwvoIM09674ZEfRDSB4o5+Xig7LK4YZqUD70s1COMWZ1deI4MP+awX5RRJsnRPz3tSjUE3eFNdUcS
	WVCR91rRCkcyVqCToA5h4wnbOTt8Tp42XNycHU/7IsN6mVAkRaE55thI2dc+NOS6B7xufOBoivNiZ
	odN/hXCa5wRwYVxOThMCKy22kGV+4/w0s7zVyTPLL6J6OfNgk9KF9ogVxByKStihxXvez12r2mR0e
	YpRbAvUE9Mm/2dnqG08CO/IafWe5PNZ8BwrcYQvJRbuCmgvMNu2mHhrsnxzhvCHe31hOaQjd2RU2o
	PB9mPxfiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oTC-00004v-1Y; Sat, 30 Jan 2021 11:31:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oT1-0008TH-EM
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:31:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6BD464E0E;
 Sat, 30 Jan 2021 11:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006262;
 bh=rWm5qSEWlYg86Rpo8qFvrwtsNEUMx1P5Exn7jOyMXFs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aJn7N1ZcuctSPepF5NlNOZZtdZwc0gC/51LLoM6O0rTBwI8B3zRS3Lm+xdKemfOlf
 B2ct1X3MHaCTverFSNjYoj2JPapnQRsiIqN0Ex/nfbVL0RjdB/owU0qzDq2GlF+xRG
 CzcN/7JjMDT4QUR5LWOR4bRL+JMMGOQAQpKHVuCwCfhzvZ7kzlkinouN6HlZ8tzYTq
 Mw/AuYl7NrPXABEbA11uVaH2HpVIcp+2OsgAodA52PUpK26feJbb2oBAGmcOB5XRjC
 RB/flm0bWa5kbLEUrD7Wro3ThHd/aC+T7Ffo41CZAidgrSv7prZDA9Zq7FBibfYQ63
 Wm/RaDZW4EwLA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, arm@kernel.org,
 soc@kernel.org
Subject: Re: [GIT PULL] Qualcomm ARM64 fixes for 5.11
Date: Sat, 30 Jan 2021 12:30:48 +0100
Message-ID: <161200622985.2192465.526164988632554427.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125232039.642565-1-bjorn.andersson@linaro.org>
References: <20210125232039.642565-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063103_605043_8FF661CA 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawn.guo@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113048.swbrSp64NG-CwFOa9sgrKoW4EvsLaERl0oyYWKvfHpg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 17:20:39 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.11
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 3de834b29239fb752f042dd78c88158541202063

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
