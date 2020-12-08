Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65E0C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:12:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6878623AFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6878623AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EV0mE9fV8APRuKX3iU1MQt9aBvXJhwGoAma0GIvyprg=; b=VEVjQ3shP1cVUKW+aA42jpzMZ
	2/kHBuGnSV+Nd0lx9Rvf5PI31pX1G5tJs/JPQOGQqVsZRR+gWNUTw+UTZ3CGEozf+2PFrsl9OLi8H
	jNxjL2QoSEUnXV2dXEiJXLDkh6qJfBd9Qo/Vj1jC0+8uriRelN4FxGDJrrjUe0r+6y08lfckF0DDO
	cNvgnOrTHw8jdDt2R6mVmbiWMRWezqPacILBEzWQKa1tUwvu7PjRT4tR0C/e3Y5ASqGfjs/78CigM
	kNLl8J5CFLs7K/jzUYgdm3Dksue/io7rKnEvHw17TDWu3rwdZuIUT2TAUOZ0R+/uzACObJ3CxeoxO
	heJ/OOSYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfaG-0005Ci-35; Tue, 08 Dec 2020 16:11:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfaB-0005Be-WB
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 16:11:22 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Santosh Shilimkar <ssantosh@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 soc@kernel.org
Subject: Re: [PATCH] ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
Date: Tue,  8 Dec 2020 17:11:10 +0100
Message-ID: <160744385141.3969289.3072466462786407841.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203231847.1484900-1-arnd@kernel.org>
References: <20201203231847.1484900-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_111120_110041_6C961A77 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208161110.nae-fbxDri33Lx4ebu4dFYWu5kRwG3cpQEcEIEEbwok@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 4 Dec 2020 00:18:40 +0100, Arnd Bergmann wrote:
> These definitions are evidently left over from the days when
> sparsemem settings were platform specific. This was no longer
> the case when the platform got merged.
> 
> There was no warning in the past, but now the asm/sparsemem.h
> header ends up being included indirectly, causing this warning:
> 
> [...]

Applied to arm/fixes, thanks!

[1/1] ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
      commit: 9280f726097b436c8c907825131cd346d7eb0c0f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
