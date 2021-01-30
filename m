Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20946C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D995F64DE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D995F64DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V7H+r6j87xS5FXwY4yP2rimSQXr0p8EqYSYOoZticD0=; b=zojoKTUO4Z4iKodrs4CzlUasm
	510dzTMU91KqReFJPlCDshn+rERa7eY7rmw/B1MnEEWU7SQ5TxVLOJ5SLDfsiYwvoNoG1b7lcM2fr
	MoNOP3lwOmyCFVXOzqwY2Je5oKl+2U3GGybMJD3YWYxIiUjLmVi4KmEg03kz4a3nE6cmodz9VFSTr
	Ikq/f6KTcC8jkorLWkTuO9+TAigf0X4yBkVJz08pqdxSzgwwUHpDrZ91kd6LO652XiqGj4yNL83Gc
	n/AHA3VxS+Or43VOn0+WmvXOlh7xtk9qu0/7aLlMwaktP8V2dQJloXidI0g4378+0aaFP876vq8Gx
	tqDdyUP5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oWm-0001Y5-VX; Sat, 30 Jan 2021 11:34:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oWM-0001Q4-Pc
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:34:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9400A64DDF;
 Sat, 30 Jan 2021 11:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006470;
 bh=c3GEQT6oF9+wQR9UrszOyvn7CwWaAsxfZPnG9Fw3y5k=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uhBSM8+kB3ldiLDr9je46/nAXbfiZbUElDmzIFQbewJccel1VemPA8Uc1y8xF6mZX
 WLcEvfr8PxNkD9nm5CUo4cNmVZzR8tmBYRNlbg9lpVZkprGntSSVWX8NsKosA3dM65
 eFOPcvHMfkRoXembeLQj3HW/QOyUsryePS2eXsAmwgwJkpveZ6pmBOp5ttIGXF2r5R
 W8OaRppiXMBQKwVeOalH0k7gtFfNO5NOj/27iK1n89zy9uSWc8wXMgjhkwcmuDYo3R
 XSlR64W3yJo5l/291x91PNCs77EL/a4+Q2KnAkOtddj55xLq/ia97KQrGW5VQFWbo/
 BCjoE7qFOCSGg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>, soc@kernel.org
Subject: Re: [GIT PULL 5/6] arm64: tegra: Device tree changes for v5.12-rc1
Date: Sat, 30 Jan 2021 12:34:13 +0100
Message-ID: <161200641725.2316427.6123673465143311055.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-5-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
 <20210129193254.3610492-5-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063430_983283_3A14EF7F 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113413.ecbb6qAQ_BCQxj90Su7clUH39tdaJgLSS7RcmUGIyFU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:53 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm64-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 3161160c8a1c9978dc8d5ab79f2a467d59a312d9

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
