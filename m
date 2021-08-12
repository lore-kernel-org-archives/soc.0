Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F620C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 20:44:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7DAE5610EA; Thu, 12 Aug 2021 20:44:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26FCF610E9;
	Thu, 12 Aug 2021 20:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628801066;
	bh=CQfTB94Vr5Aey5uTzfsiqjmBm0NX7ybP9kXrD/fwodc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OjpKdzBMQX6ZDApJ1yQXjKstRRSlSDwatqJr/3A8ht3pm9afLbo4Bf1IyVoqOikwL
	 UdtGFx+bHhcKU4HPae/Rn8Ipfij3rdjIWj7/wreNn0dGzvzKYC1vE56bXODoJdD195
	 1q7JM1ekNx5ZWppkcM/DhLNdIAEpJIFcHREWtP/peXcj30DWX9OH2UViGSrk+3Hxin
	 aG7y7hsPV7XcG7QszEmoMII7rI8yxGKzIKWAB18tHaPhmJLQfALAmiMOl4+smnmXqk
	 vQno5edv3KHV82Gp+if+ubppPzmx3O5L75VBlgo87B+7hyxHtmzROD8tZeegqoYt2f
	 oBGTKM7o3IRtg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Drop pm_runtime_irq_safe() for smartreflex for v5.15
Date: Thu, 12 Aug 2021 22:44:07 +0200
Message-Id: <162880092655.1372486.6465059399635399754.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628751694-126144@atomide.com-2>
References: <pull-1628751694-126144@atomide.com> <pull-1628751694-126144@atomide.com-2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 12 Aug 2021 10:03:43 +0300, Tony Lindgren wrote:
> The following changes since commit fdc07ca0724dd8ad00c22909a1464dc73ed6783e:
> 
>   Merge branch 'omap-for-v5.14/ti-sysc' into omap-for-v5.15/ti-sysc (2021-07-27 12:02:24 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/sr-signed
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 699fe4b190da7da239f70166288d792129acff21

       Arnd
