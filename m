Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA8AC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 13:57:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37A2E60EE9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 13:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37A2E60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wn44SFglfpzpPwxKz0E/IqkuxjzlVDl1JVjPKJ5ydb4=; b=2inh6xQIxsV5HZ
	ehdcyNW9qEFAoDJIZNRuBmcLwY+VvbDIuX+mQEh6XCZP3A5+KHWnmS9we1F5RE+doZJCYptU4i/pm
	vef/8Rq/oSZ58utW2wg03mCjs4h3gFgSon3pyXhG84kpAPd6f7SbB6H3qWvto4ItIZhjQN9pSR7oJ
	PkS8dfWwC7TvxJCpQUbfvjzl2OJwrs0hmM1c9n9ehtznPUp8EcIfPWWIrR2hllagMV0iFVHSyB7Ja
	bTSmiktKfO4nDSEoiVFw4X05+P5cYftaJ1l3cQVcSb/ziBRSgkQKkh2rl22IS0IwrHexuHwVhqn1L
	O54YbyT3+WHQtoZMFO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHMq-006Dt0-N8; Wed, 04 Aug 2021 13:55:32 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHMl-006Dr1-PT
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 13:55:29 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MJnnV-1mR0vn0yDp-00K7fD for <linux-arm-kernel@lists.infradead.org>; Wed, 04
 Aug 2021 15:55:26 +0200
Received: by mail-wm1-f43.google.com with SMTP id x17so1258197wmc.5
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 04 Aug 2021 06:55:26 -0700 (PDT)
X-Gm-Message-State: AOAM530ghiUvlC9o/pr2TSMZVParoJ+38sZ1KZ9r6ec2HAuBncgrcy9t
 QH1dbbou3wmQqL95jEXJk+g5uze5ooaB6X/9BUs=
X-Google-Smtp-Source: ABdhPJwDFsHBF22f8Wqozeaut6UIlHtczJbkX0G3MU6rJlQNmQa5Uqm62X/H+k4KrenEDbOxO68Jg/vZ6B5uO0dsHAk=
X-Received: by 2002:a1c:208e:: with SMTP id g136mr9939159wmg.142.1628085325875; 
 Wed, 04 Aug 2021 06:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
In-Reply-To: <20210804043439.11757-1-o.rempel@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 Aug 2021 15:55:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0285V=N5HPS5grOTQ+q1HF8J6_PsxCLgLvYMsD0hVeUg@mail.gmail.com>
Message-ID: <CAK8P3a0285V=N5HPS5grOTQ+q1HF8J6_PsxCLgLvYMsD0hVeUg@mail.gmail.com>
Subject: Re: [PATCH v34 0/3] Mainline imx6 based SKOV boards
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 SoC Team <soc@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, DTML <devicetree@vger.kernel.org>, 
 Fabio Estevam <festevam@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Provags-ID: V03:K1:lhzlFong9ImWl7HZMRrMGGF3sQy8O39OZsNgOjTV/Zjsz/hK7i7
 9CHIicphGeJ46zNAimhIumnvsdJYsVRjzIpt9ulAshuqIAihFpHGAaGjLCxdc61X0sWxGQ6
 ChVVPnjLXSUKk9QYnpt2zaxkg1cVQjh3z7iNtojBWmMtA1dz+jkPOD5lDRVcebEyuSQBvuS
 BL4uD45R0jQbnXXLybL7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6iIKnnI28ac=:D5PKkqQQHov78qxwuao3qa
 ZtTyMywUjO8LOtKMtqmtZ9ARWz9t9hNe6XUa7BFoAQq7MY4WvRpwqw4nU82Pfiop5PZIUcQOx
 O7GRX5otzZHeyfLpQ2jkV2p2G+G80UOMBkw5LkJlZcpHEaKXuNXuvd+Zz9YbGtymEJ6cxSDxn
 C9hQIG9dtUJzpXQNGGq3RsZAoRNrDLBrRNTXbMa9935DivO71AVQmvM0CWAiJCIGfSi8VEkiy
 18KzIFEQHjIOjyx5H5iqDezn6yv+Hd5IRMdHcP3THeM7UI9Z9/1BXSQgRlw+CZPxLavY4fU1O
 Fe/I8dJYaWlNS60TX3FdCrloDMODm/ObC4Qyuo6attW+msuGM245RkM+K9d5q0aSwT4KJ3aiF
 FONkdfjuCpnzPLe8reMCzHnUdNygEYJ22ovBEStqUbcQVdKc/EXwTtxgPtSeU1oPxXRnYMefU
 d+NBnBg2iPIQFOk3GAcaYBSyEBmFZd5Acs5868LHHgS2gk7dWb3UsXpSWPk7nvKqIi6EwNYud
 pTQW9fQK20XSuskNX8Ys3vMjm+P+AdK+2qr//3jL7vVL3zZ9iXvLE6N5Z1jxGB4D0pXSponNm
 NAMNKUBI8FfT79Mu0XWciXVsP0LmixVpjbUY7tpL2hjhKtTJeFCpCzr83YgW+Vxo+pAbHV3Du
 AKN96Sd9V2/DGxVSDgpdf24hBVfzTtCXci7gRlvx/tSCVDzXh/yZlbBnkCpnDhoNhVlXjMHLN
 zWxXjpnNeVOC7+9Pj1LKC2V/gra51S6uYgkyYlpi9MZVG8fia3XF0ogpFbHJbNQDq+HAIJ4tW
 zaq70QfZg3oQjibXHkYf+MjanFWLHb7lOujqD4ntPf+40gUyG5yLZCyzgtziiGy9hocEKUGc3
 mXxI7cUrupH9p49M4uoMsH72HKjtmqSZdgilzT2UcFoIwPJxuhhaprs/0S3qOIkRioNbCwqY5
 fq9cRVXwXU0YZCxcjoPGAoP1M4SwwWcahAGweJ3lRqvsR1uPvHpNf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_065528_163792_8B44BD85 
X-CRM114-Status: GOOD (  13.73  )
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
Message-ID: <20210804135510.ZV69Azl-tFuh2TmCD3LEohinpD-xsNf52oyavXgDQ9c@z>

On Wed, Aug 4, 2021 at 6:36 AM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
>
> changes v4:
> - add vref-supply to adc@0
> - split gpio assignment for the mdio node

Hi Oleksij,

I've dropped the series from the soc patchwork, since this looks like
something that
should go through the i.MX tree. Please make it clear from the cover
letter and from
the 'to' list what you want to happen with the patches, and who should take care
of them.

Any patches that are meant for platform maintainers should not get sent to
soc@kernel.org. If you think you need me to review the patches, you can
send them cc my personal address.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
