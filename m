Return-Path: <SRS0=S6xn=HB=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96ACDC433E0
	for <linux-rockchip@archiver.kernel.org>; Sat, 30 Jan 2021 11:31:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E1864DDD
	for <linux-rockchip@archiver.kernel.org>; Sat, 30 Jan 2021 11:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E1864DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NENRZuiBSM9/tpSqja+ONcuSUfAuNRDwyA7svC2F9NA=; b=lsAO0oT1YfC2lNmvmGHyTTZzd
	xgGe9z+Q36nD4cFUbEbukCphJTxr6OpxIP/JkLJKR4ta/gmQ2uOIZAUezo8od8gl36YO0oNdwNr+p
	iVK7oAJiTxJBztBRyqRSNx9o3629dgIVYedH2RrNkhxC80i1H0LyUpX8E0ZyWTxwdLOSknvCOQsi0
	/aJkh7Mg8ODMRtm3A6qm6Wfu45vXVgzDZ9WT4hgMD+YbWqxhH8scEdWNTmABg9L4CgRvjS4lEqLKi
	QalzqQXcMPsZQT0oXGeUwpvcm8+OrN620pSWaxqR+0x1cNKJ8XuuJ/vsxUFx5gmAg0t/jwMISLFh/
	0cg5xPbNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oTM-00008q-I4; Sat, 30 Jan 2021 11:31:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oT3-0008Tp-0y; Sat, 30 Jan 2021 11:31:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38FB164DDD;
 Sat, 30 Jan 2021 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006264;
 bh=wR0IqTfIS+bxQ8ZZ4693iDOruzaEnXNEWqTlrwUflcU=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=qmKlOsw1gbLVr5WTpkJXC98biGX8Xqd84SQV18kozJ5OA1kcujk9i7lj7nUBc6ds8
 cv5p6HPpxS0pisZD/wd96ECBF9eldIqCCQePNJG+4PTqoQbTmpQjcVa+zm3Wwl2ygc
 5XWYa2HaVzgl5bnB6MH4znEQfg5K4fEEoMl7wnX3vxqgnYtqE27uXKMsLobMLXxRPS
 dvGt0767SNvpykGcUIZIC69+t9GnlPuvTtySl1mnCDD9GtwZ+LmbB2xvwT4DJLMZoB
 onnKWE3HP8cQhzpLMlAnWwugdM4BFKVUHrX4Q89KFrlcrIQhi2q2+SQJM0lWX60vOb
 5WOUkHIkq8ECg==
From: Arnd Bergmann <arnd@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.11
Date: Sat, 30 Jan 2021 12:30:49 +0100
Message-ID: <161200623014.2192465.10050654314419322038.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5429065.DvuYhMxLoT@phil>
References: <5429065.DvuYhMxLoT@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063105_154334_C3AD3AC5 
X-CRM114-Status: UNSURE (   8.95  )
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
Message-ID: <20210130113049.ETQwJk6tmTsXxX96m46yXOv7PdjeJDzOAWsX37WzNLc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 28 Jan 2021 09:32:05 +0100, Heiko Stuebner wrote:
> please find below some Rockchip devicetree fixes for the 5.11 cycle.
> Please pull!
> 
> Thanks
> Heiko
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: f2d514b4f428265e418e8fb46adebeb6c0717131

       Arnd

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
