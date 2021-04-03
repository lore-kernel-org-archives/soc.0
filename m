Return-Path: <SRS0=y6Nc=JA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5895EC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Apr 2021 20:58:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED30961357
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Apr 2021 20:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED30961357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K0OgjHACzfQnTM/KQtOvoibXFV0vXvb1CcXx/K8+z5U=; b=KnTqiIyZVWpmItyICO9+rMLRc
	vATmxsBtO4Q9fIuvrBG3gnSWmyqa0DEd7e5MfNu5RvvF5GqTedwxKVZZatghQZwnXcRXOj2SPicA+
	XOj2veDhHxYqBQ2AtLIE/fTDjkbaERzAsjR8HxYp4y976hA4gv02GlZlrSR82bXL9gQAjvZU7dJ8W
	hSjK83C4f5G3fB/sVPzP4dO/xA9xjg18oyyMieHnU/gMv+EF/VqWVsMtA83/96g53xZtHex57E9Lw
	4kp4Q04dmEfFQuHjj2rIwhm5ppTmEC/d8ic/nOAmcwmhkqEn7D8q53tBF0l4aUPC6iq8aeYMT9m7I
	kzL9Fd4aw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSnKa-00F4A1-LZ; Sat, 03 Apr 2021 20:57:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSnKR-00F49H-90
 for linux-arm-kernel@lists.infradead.org; Sat, 03 Apr 2021 20:57:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8925661353;
 Sat,  3 Apr 2021 20:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617483430;
 bh=hO9/OTmLG0RXUwfVmsv9gdrqok/H5a0w/xDzWkp2i7A=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZajaCon/njBo9pGm+jWQASujV40hBo+PtYAEOKd73nE+EXJCwG82gkrE+D2S1WGR5
 acuXKICJI5a+v59tqWP3Q29a0tSrfupXJqY0PbfRQBAmmqjXFZ/GA2CHQATGHU8xx/
 fqlpFzCqRrMiyuOz9grBOZMrhDy3IICbVx61fUNzmwKZ+EaenudgaeLhn11tmS8ze/
 btfuWY+tHwY/mcQSvXyiWivny9jtsHhJ3Oug2SbmH3SU6QpOeJI+PfhSNjahSxQ0xV
 l4I+qlsOYdAEhQ0A9S7NW2NoW6MuReml8h8dGKoWqKlM1XNc+hN2B2Fp/Bh9LGuzJK
 q6ytpEhMQCnOw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@siol.net>,
 Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Fixes for 5.12
Date: Sat,  3 Apr 2021 22:56:57 +0200
Message-ID: <161748340980.896324.15422033544003499472.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <9df637a0-945e-4469-8e6d-0903cc9d3196.lettre@localhost>
References: <9df637a0-945e-4469-8e6d-0903cc9d3196.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210403_215711_603451_4D0B1D06 
X-CRM114-Status: UNSURE (   7.67  )
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
Message-ID: <20210403205657.H5adIVh9D6cTmVEnT-ZkoMLmPuE8FEEdLMTYum2veTc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 2 Apr 2021 15:36:33 +0200, Maxime Ripard wrote:
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: d06d82146c3b4b1159b052c6c2e143293ee9f687

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
