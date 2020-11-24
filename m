Return-Path: <SRS0=Sdul=E6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E245C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2020 11:02:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245A12076B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2020 11:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VEy8Y+ex";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0q6KmBBF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 245A12076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HEPQAbdjS+N3qGY4c9gBr+/UEeX36KGrKyX2/195vo8=; b=VEy8Y+exxbJ+AnFzheXuseNkS
	9G+YQdy8Vio7QquesqNCobk86L3bXf4O+BIht74gNUkkVGom46wl5d4WrUUR8IRJG8pAX94T6oalA
	wh43GFIKyPq8uBrX1VnJIQdumGECGuOG+cTYKtjWpsBklpt3ChoU0x1vhaqelpWsu6P3OW6hQBtCn
	CV4tJcpaSL+nkx0gb/13gAYtGVwppqubnnXW6ZVYm6mhhXJzjsAB/a19n6SeJYZZygmNsWcW4x6Zs
	3KA9CTRy332r/5UIrILfZiHE/J0OlwRusP39KUOkMxC6eUawtFr3FD+8dG3HfIxVtDC0s1kVXpwfp
	IBW1I+ryQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khW5N-0006EW-Pi; Tue, 24 Nov 2020 11:02:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khW59-0006BU-5H
 for linux-arm-kernel@lists.infradead.org; Tue, 24 Nov 2020 11:02:00 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F72A20857;
 Tue, 24 Nov 2020 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606215718;
 bh=I95pbgJatRC7byPCt1unVZCiiAycqDpUz4/X3Opnm0U=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0q6KmBBFSlKHiZEEN2Cpgv1upG5N8JsV22VsqHoEsfESdsxIHIDj0UTOJwPpIb9q1
 ysngpoqi07iu+yXo1zmJ+Ald+oVBLB0cqagKGnJ7kSyAUo1nMz3OwsYaeifhwvvyhI
 DQRZSz/7eGQIkqWCrB3swQ69rGSS2i+4hLnnGcn4=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <maxime@cerno.tech>,
	soc@kernel.org
Subject: Re: [PATCH] soc: sunxi: Fix compilation of sunxi_mbus
Date: Tue, 24 Nov 2020 12:01:50 +0100
Message-ID: <160621564607.128147.1507965938951028693.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124103546.839711-1-maxime@cerno.tech>
References: <20201124103546.839711-1-maxime@cerno.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_060159_355965_CE1AFD8D 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201124110150.F3PGQzIqNYTbMw-_sKEW4LyV83ULNTWMfQ8w5dKV84g@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 24 Nov 2020 11:35:46 +0100, Maxime Ripard wrote:
> dma_direct_set_offset has been moved from dma-mapping.h to
> dma-map-ops.h, but our driver hasn't been updated resulting in a build
> breakage. Let's change the header to fix the build.

Applied to arm/drivers, thanks for the update!

[1/1] soc: sunxi: Fix compilation of sunxi_mbus
      commit: e24f7fac3b973ad24b0fd96f6de47695c90f6528

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
