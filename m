Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B79AC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:12:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA92223AFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA92223AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5O3QLEYDH2HjzMqKCIYPtH3w/ZhAU2BHQjDD0XLkU4Q=; b=zgB66k9w4Uo/NDF/oYaXFUg12
	eZJP5FrOdx84/KA4YsKJTrcaMMEs1xhaBRLlx5HTlQbhHb50m5TNiwKoIEogWQHCrZhGT2mEHeMqK
	3JGzPNDPmKJMuBGZGXv9I6k7ovu1o6mjVhgONeMNc/fNU/7wNOi3gFVnLgc4//LKl2c8qNiupkXCi
	DlrwjdE+UijBfoAEi+QWpo4uvU3g1/o6w5SZa3GWqT4vYnCq8z6cQDIuE5kZZLFQoUB8JtbI5uzGu
	eXXcgVHS5mLT+YC489Vfs29EwqT3THovreDv6HFlPaFzPcxjXzp+FaOC6zpIUf4de04Bw8SmInw0n
	fLymZVyKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfaT-0005Gt-MB; Tue, 08 Dec 2020 16:11:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfaJ-0005DV-04
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 16:11:29 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Subject: Re: [GIT PULL] Allwinner Fixes for 5.10
Date: Tue,  8 Dec 2020 17:11:12 +0100
Message-ID: <160744385108.3969289.6851147249292904391.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1280f1de-1b6d-4cc2-8448-e5a9096a41e8.lettre@localhost>
References: <1280f1de-1b6d-4cc2-8448-e5a9096a41e8.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_111127_307087_463B8B7B 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208161112.d4F3n94XuARh0kzVZb4cccGWjdG72SNlWHMkXzBfwcI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 28 Nov 2020 11:57:09 +0100, Maxime Ripard wrote:
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 107954afc5df667da438644aa4982606663f9b17:
> 
>   arm64: dts: allwinner: h5: OrangePi Prime: Fix ethernet node (2020-10-29 10:29:49 +0100)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: b11ddaac893ada234895bcfc3be3358957e80717

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
