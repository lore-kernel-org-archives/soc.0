Return-Path: <SRS0=IiWs=P3=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26C8C433EF
	for <soc@archiver.kernel.org>; Mon,  8 Nov 2021 07:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 700D361059; Mon,  8 Nov 2021 07:50:10 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id D42F2610F8;
	Mon,  8 Nov 2021 07:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D42F2610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 1120C80E4;
	Mon,  8 Nov 2021 07:50:45 +0000 (UTC)
Date: Mon, 8 Nov 2021 09:50:07 +0200
From: Tony Lindgren <tony@atomide.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Dave Gerlach <d-gerlach@ti.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee.jones@linaro.org>,
	Zhen Lei <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: ti: fix wkup_m3_rproc_boot_thread return type
Message-ID: <YYjWr6mALJvwJp0H@atomide.com>
References: <20211105075119.2327190-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105075119.2327190-1-arnd@kernel.org>

* Arnd Bergmann <arnd@kernel.org> [211105 07:52]:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The wkup_m3_rproc_boot_thread() function uses a nonstandard prototype,
> which broke after Eric's recent cleanup:
> 
> drivers/soc/ti/wkup_m3_ipc.c: In function 'wkup_m3_rproc_boot_thread':
> drivers/soc/ti/wkup_m3_ipc.c:429:16: error: 'return' with a value, in function returning void [-Werror=return-type]
>   429 |         return 0;
>       |                ^
> drivers/soc/ti/wkup_m3_ipc.c:416:13: note: declared here
>   416 | static void wkup_m3_rproc_boot_thread(struct wkup_m3_ipc *m3_ipc)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Change it to the normal prototype as it should have been from the
> start.

Thanks

Acked-by: Tony Lindgren <tony@atomide.com>
