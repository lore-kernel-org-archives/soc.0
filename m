Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86355C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:53:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1633A206CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:53:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hGHacJhj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3i+Ln7w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1633A206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4scsQH+Ahm15E3xPaVcl37msughh4eij4p6DqdaZkl8=; b=hGHacJhjmaWcZ1jCr6hOGfrN4
	gGgbsSoDXazXQQ3/0kQzQDXCwLt7NObGVw7dE8ZvDDXK6FnkkFCTpEXyYRvF4KRnYweZTmSDwMpdz
	73v5va1QNG4XD8/HajYwgVy6VSXESNbV4ZBiAa+VWsSazvkqTxC2m7thPie97dd7RDy9Qa/lqWs6a
	Coes8SxK4eiauAnLDJYanKeF7hiUqr/adbswRdS4qD4WAC0uHkjAcywZRK74GhlHV/1tcObnO3c3l
	572zY0Mxg55GM45QMsDdsNLIxxfGPvagXZ+jAO+j2hBsOCkjsoIrySlFgu7IONAucUypYll+pjovK
	BNQQz730g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khF4V-00030o-AB; Mon, 23 Nov 2020 16:52:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khF4S-0002zm-Vu
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 16:52:09 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BC27208FE;
 Mon, 23 Nov 2020 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150328;
 bh=0PfBOrg1FbyXkwUsB0saVks5xpeSA8k8+E+BtbcOuoc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e3i+Ln7wojYmcVgzOTWyVFgXSfkvIz5nvJKyUskAbRImmfc89gDjW+SzFA7UHeIAB
 geVjutB5zBxzEg4YQZsUXLixNPh+4YWdYkHAixkPGDH/+IquIXP+5nY1rwpvrf++Ux
 KSXA9BBqVaNpLR+RZYWwFkTu1TnV+wt8+wmxBdvc=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 arm-soc <soc@kernel.org>
Subject: Re: [GIT PULL 2/4] Renesas ARM DT updates for v5.11
Date: Mon, 23 Nov 2020 17:51:58 +0100
Message-ID: <160615031070.69876.12447095775169628189.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113150854.3923885-3-geert+renesas@glider.be>
References: <20201113150854.3923885-1-geert+renesas@glider.be>
 <20201113150854.3923885-3-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_115209_151845_4523F2E7 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123165158.LnGarhMToSZzB3XwjEYXjMvdYNmHNcfHFwTQLTEbfoU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Nov 2020 16:08:52 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.11-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 95f595d1f005918891555818719c91e2fad9fa95

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
