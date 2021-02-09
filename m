Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA81C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:09:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D25A64E54
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D25A64E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oIJSbeCKfRi0Ruy41458N1xRTjeslFx/dqeoGKsq5ko=; b=Xkb0brRV8ifKH2l+CFAzr82ET
	XFCoI5yQODuZvvRigwRglyUVJTKLNkyFaeFYkM+YkbLe8T7oip/2Uvh8WjQDukf6sZn+OAlP+WlpV
	OgNr6ojLJS52QAyZRlE84AMRP741kws8SIfWKna5m93/0SzsMfeJjLyYljWiwyOrEh9baBU8nxLn+
	P6rDJz8uhhhTPtiRK6kCw4faJVqR3RUdaDaL0m/ImXAHqDqjbCGnt+EAjJf+GwoX1Aqwfp8fXZBQw
	iWLXcD+99DFUxJY6jdxd7aDNg1rstWyWx6XV2409Wbca6OqQiQR0pcAV69XbqHOubZH8XU81mByrG
	B7pIwcy0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c72-0007mF-IZ; Tue, 09 Feb 2021 23:08:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c5k-0007IX-1q
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:06:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A47764E50;
 Tue,  9 Feb 2021 23:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612912003;
 bh=N+wrpsvcANkoNLYnDnDHfEuPrrF952t2G46nComfzVE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V+v4BUV6Z7H420/g4LSh0oejzN1nhraurspA12nZRO3J78bXQFKaf0hdjIduSKD9H
 yAYLmpChVsk8IEsiSSHN50KWj139UCVAAtWGEBppg1s6BmnrqeKVGL66LHLZLn1pqa
 W76FVdwDQfM8vEyWRd3bqzCvQV76Yrer5/kJWzvz2gxM7M/qO1J1BjM/17OBm7+yxu
 IPXfJA0AV322amPoXAGeLV33weC7Xu7XhLMY2Y5VljewkvYoqmBiH4O/xMjcV3uCPw
 99Q82bMtGMCcixrzJU3k7PvTatabHyBPzsuDmNJJo9Q49FvnJC7J9+t6bJJD87z48v
 cU234w3LSVLuw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT PULL 3/6] i.MX DT bindings update for 5.12
Date: Wed, 10 Feb 2021 00:06:12 +0100
Message-ID: <161291108076.974605.15340898669997318905.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-3-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
 <20210204120150.26186-3-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180644_432540_65416EBF 
X-CRM114-Status: UNSURE (   8.59  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209230612.kHWLx4aAU3RN3EGp91VNAsVg894tYKGYc0ExGbgUPnc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:47 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.12
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 6f771ce6c3bb2c4dc9d348b578871c7adb8b285b

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
