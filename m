Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A799C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:21:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 94872610CF; Thu,  8 Apr 2021 20:21:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22B47610FC;
	Thu,  8 Apr 2021 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617913307;
	bh=RIGHTTrrlRxVS5C+wMeteqopPhyIKQCIHurDzF43Ss8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S+q7N+UOUfy95EaGzuz5bvcZp6YlRFh1s3k34bnQ7APtcNJk6NW8mROXtUone7rVU
	 Bs0l7vp6IA01K8PjN3QblEyHuRlGyYnnHLWGdYSkmXR/2vnEVzYv5waib4x9k5s94I
	 vT+LdIA/rvgj+H7BM3vYWwT97nAsRecVwVryaNN4lQdMzerTxAHOwUTrSEpSP216PM
	 HGCkvh+iSPKIcoEByI8sltEiPdJztm2sMTFwb9RScoL4Zstn1uQZDAtrlSdiyd9J+W
	 WVTVATdu4trL961Y8Xi9unIJrk1YpbD5hEGLVfah5d97Oq/6l2TK3eCUCoDKfA7nHy
	 ZvoejPFzK5Qfg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	thomas.liau@actions-semi.com,
	linux-actions@lists.infradead.org,
	olof@lixom.net,
	Manivannan Sadhasivam <mani@kernel.org>,
	cristian.ciocaltea@gmail.com,
	afaerber@suse.de
Subject: Re: [PATCH] ARM: dts: owl-s500-roseapplepi: Add ATC2603C PMIC
Date: Thu,  8 Apr 2021 22:20:56 +0200
Message-Id: <161791325045.1663215.17065971485977562987.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408062232.3575-1-mani@kernel.org>
References: <20210408062232.3575-1-mani@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 8 Apr 2021 11:52:32 +0530, Manivannan Sadhasivam wrote:
> Add device tree node for ATC2603C PMIC and remove the 'fixed-3.1V'
> dummy regulator used for the uSD supply.
> 
> Additionally, add 'SYSPWR' fixed regulator and provide cpu0 supply.

Applied to arm/dt, thanks!

[1/1] ARM: dts: owl-s500-roseapplepi: Add ATC2603C PMIC
      commit: d8fcfbf38fe168d55a1e73095f831a60e3e95b91

       Arnd
