Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54890C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:37:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2284460238
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2284460238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9h4JkTRQ99sQggIvgRhdnTOyJSxu11ursLeXKpr6fI=; b=yRzqGfIdmsjc9h
	/Sf+5+baAWNUg3AAWTNVtCJFJzjrt3Bjx2LQ6JUF0TOkUm02/5BWQgx13PWSEdlGMiHT53TlRH5G8
	Wy7BSjZEKBWPs8MojyzwnysQZ9XqRF0Fe4hOYQbu56/SC80C/8FPzNOVRFMH0EC4Yr4Dy5G1FEFY9
	kRnK70OHG+vnCrMzmTI/saSCVu07RIHT8/t8isqvEDOVAX8Sd/9tSZbXBDVDni0NYKaxxaXEBaH/c
	4ki39G6on1eNzzM8bqnpz8lMYNaJ3CAA/UG1wY+UplG1cIG86otW163fW/cOGnT9Uq3DNQpM3aKtl
	sCBcET+FzJySZN20V0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLir-005hm4-23; Wed, 18 Aug 2021 13:35:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLiT-005hhq-Fp
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 13:34:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE62D610CB;
 Wed, 18 Aug 2021 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629293689;
 bh=kI41ksHBqXluVmOKZ8LHnyVCAsk2ZgY/vW3TXgfci+M=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X82ElnmVF/m3fC2HjFn/bmo1SkPibem9icTqXdoyXjwITcdYNJDE9cYhDaq6KFOx9
 CWq4iQkvJp9Z1yX3nywAXTpmYwwyQUSn+wCXXCDCUI45DklKclOUIRhBb3k2OeGZ87
 g3tB3hXl2l4UHrJ2qLpwtuH9CGJGALEFXw4XMU0ASLvqcQ7/63wvKRU1G146tTL4NG
 CbLa3pS6nXQddQFyzpZRLNecOPcJ9598F4fokUmHbhg/g7y5xMQete0rrenMGZxq1z
 P1EUxO5S9nmylnTLTzbUm0imz+JZ/BX86kUItiFCASpZLo1QBiacjtBvW2C90KDkAc
 aNofRkYU5GMPA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 2/6] firmware: tegra: Changes for v5.15-rc1
Date: Wed, 18 Aug 2021 15:34:38 +0200
Message-ID: <162929367306.377646.6251992787945452705.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-2-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
 <20210813162157.2820913-2-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_063449_588894_0D2EA4ED 
X-CRM114-Status: UNSURE (   6.79  )
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
Message-ID: <20210818133438.ONHoZsYJYHhxiPojtjy1oAiVu8D6xqGLNq7IKaw4Bqc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:53 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-firmware
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 8745d0e9155f0ef13656ab3447f71a8b53556842

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
