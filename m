Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B7FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 15:15:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96EDF64E88
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 15:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96EDF64E88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ikj1ZmbU5B8tqQeAhcXxoKviyWZeS+hVojXRqBh7NHc=; b=qlLszVQ62HqJB9Y5lInj7p1EB
	1SsFgEJw0Fglj8QRXyrY7/5qR5vagpxRJOej8Y4L4EkCT0dPryikVIf8QzuWqCT6AfSAQ1X+PvP4z
	igiQTHtk3dCEK1p1mevYh4fhqUppwWcRtWeWD/uytk0lh3H4sB/h5qmfQpyd88J/M8vwFlmMPjF6z
	GGDumlzeZtLGwnbMP3G1koNk87/UdVEgGPXWdRw79gUchk0waMoK51Loky67Kt3qkqx8dJQWueP3c
	T3rrXY6+uttpX9W8nSuktu+TMhUleatQLOQPFfbzWRmm7Fx6P//rEFFcTjRLJusNTAc7wGmLXEhcC
	4TKqIDBxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9UiM-0005CO-TQ; Tue, 09 Feb 2021 15:14:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9UiK-0005BN-0l
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 15:14:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3032F64EB1;
 Tue,  9 Feb 2021 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612883643;
 bh=X1mye9xPr2RjF5BpDtAu/7UvJiSKLQ1v6OO94UnDmwM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mlmPKT87POWwEG2peRcegHhgTNMzAjfHWx+A1cL4VKECcy5NuVzQA9avPw+3ttAem
 6YZqGJpGZdt6C8xpwZJOyDV6u4NZyCQYaavf82W55VW2mcJwAa1o5r6Xfq5flYCA2E
 +SqB2WDy2IoTX+3X2Clxpzg7j3SaGIvUkL7FogtMdt1yrw0jB8XnVnKtkksfguQuBm
 DV2E+wiXl+TvbxQDpFSbKzcYZxOPuCRSDuvT6yZTIusAHmClTmqb9GVXnRHJLcqIPX
 n30Wd3v5RFJewiI+c6ZFife/X6O/cXxQCXLAnslO09o1p+V2u66DRtS/O0EgqJc0LG
 hV2u8F1bip+Qw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, arm@kernel.org,
 soc@kernel.org
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for 5.12
Date: Tue,  9 Feb 2021 16:13:51 +0100
Message-ID: <161288360517.2910447.6558653724221288151.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204051956.388355-1-bjorn.andersson@linaro.org>
References: <20210204051956.388355-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_101404_172763_CDC0404B 
X-CRM114-Status: UNSURE (   8.52  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209151351.U2LqB0Rgh2GRjTT3Vd5_q1VfIEwqTFi-1-yxs73Iopo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 23:19:56 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.12
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 8c4501f0c03a3a9d1c875cfd99c390f4b86bf1ec

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
