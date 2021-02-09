Return-Path: <SRS0=fMZx=HL=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A43FC433DB
	for <linux-rockchip@archiver.kernel.org>; Tue,  9 Feb 2021 23:07:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E0A64E4B
	for <linux-rockchip@archiver.kernel.org>; Tue,  9 Feb 2021 23:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5E0A64E4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BbBXGdGVx93+S2fr1jq0kwRIow4UnRroGfuPbQtzXhA=; b=HrzT2s80for9NLJuoglzijudI
	CCqP2HH0NEogl5EYu79cWB73zuix0EvqjUj/QbioDL0A8a+jnURqdzJNjvUUBgZE0XFasYoeRZM0R
	G4zCvfnxkX14DGgYZ4Q7F1vxT5bHmaDetPIzRqutLVtaaxrsyJAkKDQa2EJsH1D8aYUlsCZ4roLZn
	AhZ4sRsel/XZD4TfkcqMrmZRyF+Qzyc3H7AlwiAQ86KHtjOvPpReUAlWUftraD/Ug7hs6cnyS7WOk
	2FwDIGYVlsizfc1/2Ks8Na41i/amdn1Sl2bJw4QEK/ISv9JdMcZb8/5hl5OXd/IH4UozwKGU1GGMq
	drwc30dbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c5v-0007MT-Uc; Tue, 09 Feb 2021 23:06:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c5Y-0007ES-OW; Tue, 09 Feb 2021 23:06:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5E0E64E40;
 Tue,  9 Feb 2021 23:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612911992;
 bh=rAcG2UB8Kq5DbCJSjMVawZ9I9vxStmotuOgB9Re6wVQ=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=TVshADiI4hTeKvjOr7t0fSVpfP39ybZfTYVPSvdzmtaD8rGwpS3houLoNGgFdcssW
 /x+zFEum1H08HEJt0BE5yDDXQuWTIAziHVyEUz7MJQFxGkT3OgkUHxw2wefToh426l
 b4i3potnZ6Rz8AIiQZ0bihtqq7l31zaTSk9tYgf5BTJii9CPB7yNmIocyaN+/HXt+E
 dTiOi/1QVMvlcr4LxrE2eT45GLFs4pW1+No56KnWYc3uKSSN1fgrWrJedSzLMAGRI4
 dJXYvDkXRkU1JTTZ7kk/tdMCRg4zlV7BZmidc7wTLy0gErS6KQ+5dTW9oB+zjKpdkS
 Y//qV7EUC+Asg==
From: Arnd Bergmann <arnd@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
Subject: Re: [GIT PULL RESEND] Rockchip dts64 changes for 5.12
Date: Wed, 10 Feb 2021 00:06:06 +0100
Message-ID: <161291108121.974605.14393901422512013571.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <12699743.uLZWGnKmhe@phil>
References: <12699743.uLZWGnKmhe@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180632_983340_7FB09D9B 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Upstream kernel work for Rockchip platforms
 <linux-rockchip.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip@lists.infradead.org>
List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209230606.gAfXhZZH_E-i8hqW64rGo9V3M9I3kQAyy_Sa8DV9FHk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 06 Feb 2021 11:18:18 +0100, Heiko Stuebner wrote:
> sorry I mixed up the versioning in the pull's subject.
> The changes are of course meant for 5.12.
> 
> Thanks
> Heiko
> 
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 889231c6c80113ad0929eea01e8272048be38552

       Arnd

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
