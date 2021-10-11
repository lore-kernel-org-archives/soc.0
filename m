Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C96C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 14:57:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4C9D60E98
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 14:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4C9D60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjVilUd6tcKb+mHRzQPyOCQUuf9HxwE18DVh/3u0z3k=; b=4/BEnx5dZ3XWbd
	QbJWk7cZ7pusY3cVIA0ebiHVMPVj4cqek+yPSoQwLL2sDbM072XoNxMGvKRKXVRgzRD8XX/ZPg3Fj
	RvbwQuix02bXvHzKlY1N83pZb6qITnpg0ndnR0X9WwBeo3Lp6f+9x9njXP424HZjUjeOIgsfK0+GL
	1bwoiJWpjmILifeyGljwEDnBx3nmWlU7gVrFOtAxHyydU9gXQa/4CDK6Ls8EhW9WUfFb4iNi1pn3H
	UcSZbuYUAVsRbh/FgR7fT/BPg3kYLEtGdOVtMxJadNkK8H+Dt28S9s3zO57q/AwR4rDOtO6HTSFlC
	8Fo8iMKJT+6YlHfBBw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwhh-009q2n-RV; Mon, 11 Oct 2021 14:55:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwhQ-009py0-HV; Mon, 11 Oct 2021 14:54:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0472860EE5;
 Mon, 11 Oct 2021 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633964084;
 bh=C+r4dLx6Ys+xr9OG/lS4p3ctbdi36eShMGEjAuZymw0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rLQ4Oros8AgSX4MQNsGHNoi8T0zrIlCSMBBA/wYGbakokMdfYJDhIEwuUaLy1GbiA
 iu3zQ5UYdDsRY0IPeG670Q6eFXdcKzL6dFf2G+lwoX4rJIsdviGxG2EgVllT3wDq8I
 ugZXMMOtwfUdGSOLpXkPo7DBcp6Hu3p7ztpaBe4/ClowKOF2XRbD8GMDmhbng752Wo
 ufoMirfIsY3UHz5fT3DXuKTOw2fHYZhPpd7/vBluSP/+6cKEsmnJ/p52u8l13J3mWx
 i9d6R1lGQGExK/MRjtGx1cfkvhCvjYa0dkKa1efceWBgxAuiiO1g4oYjGoJuqJyedw
 SZVpQAFcnLmlg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "arm@kernel.org" <arm@kernel.org>, soc@kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-amlogic@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] soc: amlogic: driver updates for v5.16
Date: Mon, 11 Oct 2021 16:54:28 +0200
Message-ID: <163396399096.3170841.5782337655825464618.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <f8e020d3-29f7-0745-3864-01975edd20f7@baylibre.com>
References: <f8e020d3-29f7-0745-3864-01975edd20f7@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_075444_617091_4C9E0DCB 
X-CRM114-Status: UNSURE (   6.14  )
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
Message-ID: <20211011145428.pnmuAAs6zCZM0xPxBDays5rtU64oxpbUpFoG1eeuRp0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 7 Oct 2021 11:43:57 +0200, Neil Armstrong wrote:
> Please find for v5.16 two devm_platform_ioremap_resource() updates and a change adding a new SOC ID used in the new Radxa Zero board.
> 
> Neil
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 88557618909a70460a3c1a898cdcc10c43a2aad1

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
