Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082FBC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:54:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C529A60C41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C529A60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZ9sc5omKLIjWOYKjTjMXrV3ehp6DFeGXLnp/j8P2fk=; b=vASfozdH7FztTW
	J/fYbGx+kSfpD5nq1RRPPLRjD0F3rojwtF2icM3Gkwv0sI9IbOj6ZkhZeZ+Bxuva7WxbNLUtd8BVP
	ZM1AXLiljEofDu4fjTRVoPZny3J2s0d27NZZD97g5AYspJxEAlDuMqmjxLoyRWLPIotkfenMFFu+v
	02AWZo/zw/wZFDApm2mTNqBYrnwPKXMqxaaLKLrLbENd1JuNBzF6sLcj21s4H3KZwoTh5I84fxbZb
	zqlhffp7aobL/WgE+aWjBUWcC7O1dYJ2CiGTymCFIXZ3Ph9es61xehJMDg+pK42sKLK8Kypj/fKR/
	lYx3etHIM1hjGD7oZC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHfp-00BFeI-I4; Thu, 12 Aug 2021 20:51:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHYr-00BCe0-OZ
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 20:44:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB6ED610A3;
 Thu, 12 Aug 2021 20:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628801061;
 bh=ptodn14ZQiYyFJvxrpcOtswpVmzfOzl8SaLJcD6g+hk=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e/jt6mM8bc7TKK39hbhQYPHFgIUTyZaQKfC22bWTbWZ7hlnstiQv8O8sSkb9nqcBU
 yjxkjQr1lYImgmmhMnsk7O8p7Up9684fdSM5SHjkTEtjDBtZPEVvYYmRxUb7gtfJD9
 8Nd7xxo85EKHL2kSm/3YDgEgP4/jEdnChpDFXqXYbzlbr96ccnr/8UpLPpZ8qtLSjg
 Wo0rN5Zl6QTrCkzbYujrvpS76JWf1msuFj5MW9UHMVeKsIKh7a5oex531ezWY95Cfw
 mWCz/itOlvrD8zJMiR3jDi8EYBjbL21Ldq89ulYm9ZZyD5FDcAq9i5DSnABRqul/vB
 JCrJYVSgrereA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com, Fabio Estevam <festevam@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, kernel@pengutronix.de,
 Mark Brown <broonie@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [GIT PULL] i.MX eCSPI errata handling for 5.15
Date: Thu, 12 Aug 2021 22:44:04 +0200
Message-ID: <162880092609.1372486.17696747808216287202.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210809071838.GF30984@dragon>
References: <20210809071838.GF30984@dragon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_134421_891051_38F37D35 
X-CRM114-Status: UNSURE (   6.88  )
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
Message-ID: <20210812204404.0YXZQtpJ91dnHo9hJlDzQcWoMorfJ_5ATJTc8TBUVC4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 15:18:39 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-ecspi-5.15
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: a41461b6c400442fce28f706b7e9d03d3cab8f9e

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
