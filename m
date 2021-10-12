Return-Path: <SRS0=hZui=PA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB920C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Oct 2021 12:55:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B692A604DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Oct 2021 12:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B692A604DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDi3mUAl/MT7FLB905mZJUtXinZCK9MNhLuUQchd4uU=; b=H6nFw3Ucxgp1ap
	M1FXqnZv7WcvvpCiJOQhjuRNJOeBZCBX4U3hE+WD8RSbaaS3l78NxxAfT6XAWcpoO4tiQ7BW0vMQQ
	bOuDWXS3jW5opunsHvIMW5B7wDow22TxNpVg3po7m9hTsORANePBv5JM0IjpisJu2FccVCkQyUCaM
	gVQ8c0jiPFXeKQfzl1JUbtZaX0QbkNA1EvhOA1R6JWalexQq9drVAISAaHNa1SJl531AZRKiF56x7
	ticeYY335m99xt5y9P7O47nr26d6oZM+WWchUKhG9Wtmw2lC6uCRd6/D7uEJHKCkyEAh+nefMCij5
	TdkrPlCX8UjtlIIsQzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maHHb-00Co3I-C0; Tue, 12 Oct 2021 12:53:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maHHX-00Co2U-8h
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Oct 2021 12:53:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2649F6101D;
 Tue, 12 Oct 2021 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634043202;
 bh=Zea/rcCmhh7Fff0Xhx924YiVvYsVwhC0VK6LiSCleJc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZDJ6vwFLHX5N61u1mC/ZyL3ABtJ28oXzNI9hDjUM4tcL3CyU04EM4p5hxYnk4WOid
 HsFC2AxfdKPryANSzR5CQ7OtVhh0a7+2IQciY000u5/e2CYraXARZopSufiveME9+2
 B78m/m0LtOH9wlDNQXpFigMn3waawshTL4ppPN/sMkEJqK+CMdSb8rbbYLYtO4GhDx
 ptYFRRkeY+o9haRpBI3NirIj4dSJCCD1lHi8npBWEax/UQQ6/a8BZ9GSZNPXE/b92T
 SGDxZOU9OmcPrQkFx9EK5HHbQNeyC7pEiL7+11obkVpwC+cUtFx0UvdfttS80yOo1z
 +4vFt/JMbtmHw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Nishanth Menon <nm@ti.com>,
 arm@kernel.org, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [GIT PULL] arm64: dts: TI K3 updates for v5.16
Date: Tue, 12 Oct 2021 14:53:18 +0200
Message-ID: <163404319366.2123613.33460515111591195.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211012120817.beqhp4tygnf3xyi5@wireless>
References: <20211012120817.beqhp4tygnf3xyi5@wireless>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_055323_344483_2C3F22D5 
X-CRM114-Status: UNSURE (   7.55  )
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
Message-ID: <20211012125318.TfCnGNbYNl7ulcpMG3bqLPjFXxqfj9qCz39hcHlU7Bc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Oct 2021 07:08:17 -0500, Nishanth Menon wrote:
> We are still working on cleaning up various other existing device tree
> binding warnings, which we hope to address in follow on kernel revs.
> Primarily: audio, adc, ufs, display bridge.
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 96c7f32d17c0f1be464da3434f6ba5cb3a316d66

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
