Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD7BC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:51:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA0E761107
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA0E761107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Bue3HEEUjr8I2YZ1u/yYFmYvnjT5hnZYXMd413tuPE=; b=TTojOI6AozikP9Roat8VBV4cM
	c9u4O89Xxr+OqIVMXojnKx2eqC6EYaAOWu9zjXNtww55e9Fyz5vQ54HizrlKNDetJ6wyHstafoJwR
	e9TZS28Z2gIAeDs0xwg2qcBA3aC1V6TKrmUPBB0TLAJvkpZoAB/rtZELVOzvMYExvjUuZELnOyh7Z
	11x9KrCNaFdf98T7vHUlAxzxrCYXQCFdVBvwQD5S8TRyVUxzJP3oSLdTbdZb4BDnFhHHBUBZUqGx7
	KypjWijvI9B8P1/Io1gAvCqIlVYzCsGMrBH1Syw/fT9pk+CBE/5GO7SozSpMiHb/d0pd0HqIAPOsF
	BGiQRx20w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWuj-008V53-Nr; Thu, 08 Apr 2021 15:49:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWud-008V1c-7W
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:49:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE89F61132;
 Thu,  8 Apr 2021 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617896981;
 bh=olb/BeUnUWrIc42bUkFXurxIFBPFBMmAbAPvSCR7p9M=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YVwKJ/rVn3vHbPuD358X4rRHMRsNqz18wGOZDnhZ9jmS888M01VGfoRUcACaBugAW
 x3fPtYsPY17AtEdiz7u5iWTOOoKelioOPR0OR3fvzIyFAA5eCtXk15aORUDN7tA9d4
 7bPaVzaaWrk+1V0Hhcz+Bna4VOfpGmODpD7WJgsY6i4jKKDCfqhbdFZERtDd4G76qr
 TV6eBX/leLjdNeg4kIUjr2W3pptGym2NkYpW/dxPk7Szn/2PpnuiCha7Su1pV/9r9K
 cdcnc27jp4a96RYpvB8l3w3Q2srtLO1O2NbgJymojwak6i1ypUEYLZmLoZUAck0csd
 NepUzUyfIQhsw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, arm@kernel.org,
 soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Sibi Sankar <sibis@codeaurora.org>, Pan Bian <bianpan2016@163.com>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>
Subject: Re: [GIT PULL] Qualcomm driver updates for 5.13
Date: Thu,  8 Apr 2021 17:49:27 +0200
Message-ID: <161789693288.1636044.1145984086185945508.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210404164951.713045-1-bjorn.andersson@linaro.org>
References: <20210404164951.713045-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_164943_590382_BF76C194 
X-CRM114-Status: UNSURE (   6.27  )
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
Message-ID: <20210408154927.Q_HqjXSxxOnG70CWa0Xtt8eKv2a6YZKdwg_lFdYTe1E@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 4 Apr 2021 11:49:51 -0500, Bjorn Andersson wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.13
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 207481077b07d53cb378bc5dc71ae5379c91e8a8

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
