Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CCEC2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:53:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311AE20756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fAseRvS5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rONtCpaM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311AE20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/ziRUyIM/6cX4eg3e7u8a0DvtobGI4I9h2AMUEsGWu8=; b=fAseRvS5f1PYpBaoxYnti/WHS
	0I/55CdAf3iszIl6rnTYtdqvEiBmb46soSH/FPaOunfDZshTbT8phZk/0EJ+6OWy72APR6M6gEL8L
	z5+Tvq9kyKbP8gVJq9OYSDZquxN2dvG7LKh8bR58Crf8JiR+sSgoyYEW0ixsvuhxAkapmiZwm7Nzz
	w0U/1jDwjmlOBauaaUTdDt4Pu8PGKycwyIcMuxtmkGvDj2jHDPPXv9ksbuWt7LPeHyfKYbY/i+NPg
	stNNRbZfFXqo4nAMFOoLZ/ujidoBvkQHTPr7JOhMNFjjsIMDBdUXiY5RFE19x3ZikHiW8ZYx3ygHk
	9NqccfMOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khF4k-00036d-V0; Mon, 23 Nov 2020 16:52:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khF4U-00030e-QN
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 16:52:11 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7256222202;
 Mon, 23 Nov 2020 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150330;
 bh=0KRw8QIfbHyS8hXZ4+Vre9RrFfEs20GpDCyyYTxcj9A=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rONtCpaMQmyk18/A9cqpHtNMaIrMCDH+RMtZuI1eJ27kPTKBy+dAvPU85vUoEjQsr
 XpynGDqfeUEk30dGo7r5k5hAvesxQvqWjn07dXZmGBxtwNn6GlfxqG2PCJ/jXYkxoe
 6p1KfxigNY9t7DunSvfZ1M4qv78LQYTZZA+m+ObQ=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 arm-soc <soc@kernel.org>
Subject: Re: [GIT PULL 4/4] Renesas DT binding updates for v5.11
Date: Mon, 23 Nov 2020 17:51:59 +0100
Message-ID: <160615031083.69876.6945333656572147951.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113150854.3923885-5-geert+renesas@glider.be>
References: <20201113150854.3923885-1-geert+renesas@glider.be>
 <20201113150854.3923885-5-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_115210_966977_77AED6D7 
X-CRM114-Status: GOOD (  12.12  )
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
Message-ID: <20201123165159.2RU1pafq73l0MNPoyMgNp2NmCpkLC3I6fAZqz87pwiE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Nov 2020 16:08:54 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.11-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 019d70bffd35bc721482ef8312d9dbb7c9702436

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
