Return-Path: <SRS0=8ySP=P3=xmission.com=ebiederm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB16C433EF
	for <soc@archiver.kernel.org>; Mon,  8 Nov 2021 17:00:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B161B6162E; Mon,  8 Nov 2021 17:00:33 +0000 (UTC)
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6882461502;
	Mon,  8 Nov 2021 17:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6882461502
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in02.mta.xmission.com ([166.70.13.52]:42358)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1mk80V-00Dm7O-2T; Mon, 08 Nov 2021 10:00:31 -0700
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:53774 helo=email.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1mk80U-001noj-5H; Mon, 08 Nov 2021 10:00:30 -0700
From: ebiederm@xmission.com (Eric W. Biederman)
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,  Dave Gerlach <d-gerlach@ti.com>,  Tony Lindgren <tony@atomide.com>,  soc@kernel.org,  Arnd Bergmann <arnd@arndb.de>,  Lee Jones <lee.jones@linaro.org>,  Zhen Lei <thunder.leizhen@huawei.com>,  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
References: <20211105075119.2327190-1-arnd@kernel.org>
Date: Mon, 08 Nov 2021 11:00:03 -0600
In-Reply-To: <20211105075119.2327190-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Fri, 5 Nov 2021 08:51:12 +0100")
Message-ID: <87k0hipoq4.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1mk80U-001noj-5H;;;mid=<87k0hipoq4.fsf@disp2133>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX19xWBTX/qOTO5dbjayArZR1W6WXfYyeGgc=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH] soc: ti: fix wkup_m3_rproc_boot_thread return type
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)

Arnd Bergmann <arnd@kernel.org> writes:

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

Thanks for catching this.  I will add it to my tree.

Eric

>
> Fixes: 111e70490d2a ("exit/kthread: Have kernel threads return instead of calling do_exit")
> Fixes: cdd5de500b2c ("soc: ti: Add wkup_m3_ipc driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/ti/wkup_m3_ipc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
> index 0733443a2631..72386bd393fe 100644
> --- a/drivers/soc/ti/wkup_m3_ipc.c
> +++ b/drivers/soc/ti/wkup_m3_ipc.c
> @@ -413,8 +413,9 @@ void wkup_m3_ipc_put(struct wkup_m3_ipc *m3_ipc)
>  }
>  EXPORT_SYMBOL_GPL(wkup_m3_ipc_put);
>  
> -static void wkup_m3_rproc_boot_thread(struct wkup_m3_ipc *m3_ipc)
> +static int wkup_m3_rproc_boot_thread(void *arg)
>  {
> +	struct wkup_m3_ipc *m3_ipc = arg;
>  	struct device *dev = m3_ipc->dev;
>  	int ret;
>  
> @@ -500,7 +501,7 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
>  	 * can boot the wkup_m3 as soon as it's ready without holding
>  	 * up kernel boot
>  	 */
> -	task = kthread_run((void *)wkup_m3_rproc_boot_thread, m3_ipc,
> +	task = kthread_run(wkup_m3_rproc_boot_thread, m3_ipc,
>  			   "wkup_m3_rproc_loader");
>  
>  	if (IS_ERR(task)) {
