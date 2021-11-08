Return-Path: <SRS0=LkCy=P3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC45CC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Nov 2021 07:51:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B285861059
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Nov 2021 07:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B285861059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WY0bsMAoHuYM1ib/cXwEftbMA+m0zLR6QF3bsaq4Ec=; b=0eVGoI88SLLU6X
	o5UxikZ74fPy/YkJWW3MJeRBPUk5vOPl1g4G+ksD0jdsHPeKCpFxa80F6xVCUpLWAbq6LLr9QmoY2
	Ik1wksxbT63O/VKoqWsgp0oEUmvhpJqnidPm+uX43HTN5y8BoOdfDKI8gB+As2Jsj/TMeW8icQ65G
	2F6EnkuWrzxEBmAQgcKxlBeCC3EPJcS+vgMXq8LfV3Am5YOxcjABgl0PL2GxtpUp/LiFYOEJgKXIp
	lYLW6G8GIQ/5QRzfG9zQVPz3XiI+pyumYB+qGs89fMUzt5rNEViyNSfIrJDN+tho0H6nQHUrDZPaZ
	o2SKPCoo2kcHNPu3XWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjzQ1-00FdDj-2L; Mon, 08 Nov 2021 07:50:17 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjzPw-00FdCZ-Ua
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Nov 2021 07:50:14 +0000
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
Content-Disposition: inline
In-Reply-To: <20211105075119.2327190-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_235013_093771_7709F90D 
X-CRM114-Status: GOOD (  10.79  )
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
Message-ID: <20211108075007.lPrXjLtPDCOah9fI2hWfGaKboYUVTuUxwLnabM7vHwI@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
