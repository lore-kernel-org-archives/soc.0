Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEC4C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C347F64F4B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C347F64F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8aGXunlo5AzEzd8bbrJt56vft00ha0JzA5icJc5pEMM=; b=aXKirKWFyFJlHZoDQJRVgco1o
	mRzoYLApCgtSYg8q6ono8WnnfMe7QwPFezhtfiyyvyrn72xqZ7XTkg5V4lVGlFwdxFtUFbE4oxLww
	fdniqQr8rX/Pz6loEyFkZthHw7KFDU1SRQG5BrkCN8c8h5H2qdVc+eAQrHJtbvREWCzHtD4bjwtJ4
	aQqHdaXap1e0FAu41MqdnCnYTzl+1oPgHyD0z8FwhK0GjsthUWO8QxRAFNRP4L5rK7vzy9AP2YF8L
	yb8mgTdQ515cnB/M9sue7cCT2F3q0IR9sA335QEfn6gDrxyZmhO7/je+fRDBZnimqVbBHYLLs4aOx
	GbPyeh+Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zCV-0003Ft-V8; Tue, 02 Feb 2021 17:10:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zCJ-0003AK-T7
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:10:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90C8864F86;
 Tue,  2 Feb 2021 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285839;
 bh=XcUrcconZBoVwljDtRrz0i6sZfRdOVhysC6GamICygY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kBzwUVpHu4am1LGv32E7kBjLSq9G3pGWQHZ01ggwJhuqDtkTokFAlZaVU+VQbbNzS
 hJQPNuAhCEfRF08YF8+olsLBNm5xxsQS8reXhZbztyIzF/OFMn3EmBHOHPMGR/9p/z
 l953PF9Ih53gr/a+txFw2IGwjbyZ7pEjMai5J6BCOshGRiZ/dvA2thquWjx/ziyruQ
 4v5WrUvgxY81Ed5bjts6K0Jj2fn/7QztBb4O2xmyjH6NpfIVMLXUlV4DMlebfIVmEf
 1XGfKm9oIDQW4r0msPyFLqwIweY1Yf2KSvbLnPyssS5y7mMFtt2MrjZIfNRTBnFDUk
 eZVE6RmrEjYXg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, arm@kernel.org
Subject: Re: [GIT PULL 2/2] arm64: TI K3 DT updates for v5.12
Date: Tue,  2 Feb 2021 18:10:14 +0100
Message-ID: <161228552194.1852435.5824728761330791687.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130131422.yvq2edxfongys7x5@pendant>
References: <20210130131422.yvq2edxfongys7x5@pendant>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121040_360465_54B3BFA2 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171014.S11o3dNiqpjN6HReKGnpDVF4_THsM8tgxJ5CU_kfSsA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 30 Jan 2021 07:14:22 -0600, Nishanth Menon wrote:
> Please pull the following device tree changes for v5.12 cycle.
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c2f76057d3e6ca318d0aac83731d365865907c29

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
