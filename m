Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F698C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:33:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6B2464DDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6B2464DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KEsZFIIx20g4Q0lIrEywypwY9TQmf22Xm2I0eL5yroo=; b=rZjzdre1unWa2ni1YIXJ/5Lj1
	2US5d9rAUvwdBtrCg/Y7SaSn4yQZG/ViJftN+60sfxqMu3As9REufgKGqClxSwVl36pkd1kSyJ+DK
	ZXia5MD7p4knjsrYd9jKmI98+TYvKdjZRPuuEm4iNb153jXsfRIWL0c1a5hP0aH/3YpCVY+hqORfr
	zVshlhmcngk9DC5YzST7SakO1BuzkttniK6IBdia0Sw2w96GBWoLZvKyp7tkNCK/OIeC+PFkyjjpr
	4EG5GWMgT2PEIQFRogNHnggp2aUwsscHRlAvzfbI3JegwWJ9nbkfQCz9b19teNVsAohUQv2bT2vUP
	JCknYz2Jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oTz-0000NH-7p; Sat, 30 Jan 2021 11:32:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oT6-0008Uw-ED; Sat, 30 Jan 2021 11:31:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 878BF64E0A;
 Sat, 30 Jan 2021 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006267;
 bh=L8bTIvuS1euv231F8JRvQ/VwgAk835JUMJiRXZ+u9gE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iNeC/sdpLhajhVtSqfwRFcsIY7YtLCzbaTfVp3wK4IBGld7lHAnkIJm6+b3eFXcZo
 3sJyWeuudAQNMb/SiVcydci3B/qbUzZQc2/1eYu7s74i/piSxKnQMzF+CtKaSR9okm
 g/DJhMcsk8FytQLs5sZoociOzElI9OefELqdZguP/fjJLHrBZYF3Li/uaPp6v7o0Mn
 hkFztWcytPIVy9Cb1O61dnrROtz+Y1id0oj7hnspaKy7oJpYDgZO/o4VZxIJuXyngL
 dSKWscXSDOk/BeHKnq2bvKlkj5PW0IrOC+oKI4ccgLFwFP8h+z4+1BuyEdu+mJuf40
 OaFrCoQ0D2/Ow==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Subject: Re: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc (round 2)
Date: Sat, 30 Jan 2021 12:30:51 +0100
Message-ID: <161200623030.2192465.7465169805022530361.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7ho8hai7e6.fsf@baylibre.com>
References: <7ho8hai7e6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063108_560764_4CFFCD64 
X-CRM114-Status: UNSURE (   8.39  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113051.G51OgfrWuFtt7LyK7_25t4vT73Kqs9JaB02EC5aAgfQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 27 Jan 2021 10:04:01 -0800, Kevin Hilman wrote:
> Arnd, Olof,
> 
> We found one more regression in networking on amlogic SoCs needing a
> fix.  Please pull for v5.11.
> 
> Thanks,
> 
> Kevin
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: daf12bee07b9e2f38216f58aca7ac4e4e66a7146

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
