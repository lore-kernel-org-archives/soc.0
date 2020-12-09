Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12459C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 02:19:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1CB923975
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 02:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1CB923975
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1CzijsA8kjZ071rDVz2bud2YQbG+bVhDMydNpkdyAug=; b=j03ZTc6qTM98vR+eJ06M7AQ2h
	BjSLSahCXNPKNP7ntkLj1Ghy7yuzwJADsG1V+g5v/KNBH0M+Qyen6ahZFyOZrS3Ygrap9VsXnsnEa
	HUHbUwoRFZZKzqOkCvyfLAWeVjT5u8TEvFVQlY48hjPyX0jpwP/mTdUraRKggmzR0Fo1E3TlcxExe
	FAs042f8AaZD5VdpGrton48IGu81rdPg1gDM1mhKasRWBtVIFFIDy2B2W7qNuewO/AC2CtJP+d/xl
	YJMiJgNPfpi2/JhDVHLBlcgIRZGg6DlyNMCErg0MsLFi7Num6oiXwsNHa3F2lRgYUZFz7uWA0F21e
	c0UVd2Y1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmp3H-0005o6-Bp; Wed, 09 Dec 2020 02:17:59 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmp3E-0005nh-GO
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 02:17:57 +0000
Received: by mail-qk1-x741.google.com with SMTP id 1so15615qka.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 08 Dec 2020 18:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RchfEUxlIXCvXQN3+UYuWNoN8tixWT1ubeZpsHm4KC0=;
 b=aHyykAcG+oJpZsoVUkvKq9j0qjaueWORS/JstpqCyeWkVeqvVNgOwnaNda8evE7cDT
 EB1MJgCLVJBL549P5iDLL8MwA9qmKo5eyPBvRzfcflq/6BpCdrYM+oXQtNw6EhumHsA3
 G5+RjQPPGHQ1xlH/8fyN5vYU668JIsQXJchAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RchfEUxlIXCvXQN3+UYuWNoN8tixWT1ubeZpsHm4KC0=;
 b=YopRlWt3Ib1O8PWYBb9JB0F72aiewK8APjeKGW7Y6MKO/811UwlTh7Z17TRP9zOdd6
 eHXJEnd9i1yBfLeq2Uy6nMv9mTJiQrBaOTIrEEwA6FjwuuhkihxXCgV+Frok2/NMTjlU
 xI6Qj9gHvcH56Xt1mUQtWmVPbjhf+l1Fxcgcf35jgvKI25Ysz0fP8HNfy37RUxmiNFCH
 YHKryZ+PgzG3/Ti1dwdcVetH3tP436/uHwQfgtukW1QaFKvT2ejG0pXtWUxjUMl26ufj
 KlyOB5n3/Vj+C1xJ4HgbqqhmpKaNwKYZ/n885D3d4ppHVE+/e2iVeIsh3LizDzHgo9wc
 60pQ==
X-Gm-Message-State: AOAM531hPPVmiO7sVO+FVSkQNfbnsIgfw7a8/GZ0ke8JRDpSppXrx3Wt
 vKxWv/MEay2UQCgSQJg2GztT3Xqym2K2+bZ4mPK6HgRE3u39UA==
X-Google-Smtp-Source: ABdhPJz5VfxoBA7BSnjZ4eLGjv3bDURJD0HjKPP58xDqbDJFGYMxaK4pEo4lCBNohZLLeaxSa5yV2CU0Q5gc9fj3TKo=
X-Received: by 2002:a37:a085:: with SMTP id j127mr289877qke.273.1607480273131; 
 Tue, 08 Dec 2020 18:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Dec 2020 02:17:40 +0000
Message-ID: <CACPK8XePhJj8HzbLB4QgJQCjTuH_kPq=sWyOhdcGPmptqD6Aqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] misc: Add clock control logic into Aspeed LPC
 SNOOP driver
List-Id: <soc.lore.kernel.org>
To: John Wang <wangzhiqiang.bj@bytedance.com>, SoC Team <soc@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_211756_608034_F266D4EB 
X-CRM114-Status: GOOD (  25.62  )
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
Cc: Robert Lippert <rlippert@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, xuxiaohan@bytedance.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209021740.EBlZn6bq8E3g6GQU2Azc3jlcOCOlI0IlB1jrLjab4GQ@z>

On Tue, 8 Dec 2020 at 09:17, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
>
> From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
>
> If LPC SNOOP driver is registered ahead of lpc-ctrl module, LPC
> SNOOP block will be enabled without heart beating of LCLK until
> lpc-ctrl enables the LCLK. This issue causes improper handling on
> host interrupts when the host sends interrupt in that time frame.
> Then kernel eventually forcibly disables the interrupt with
> dumping stack and printing a 'nobody cared this irq' message out.
>
> To prevent this issue, all LPC sub-nodes should enable LCLK
> individually so this patch adds clock control logic into the LPC
> SNOOP driver.
>
> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc
> chardev")
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Arnd, can you merge this for v5.11, or would you prefer me to do a pull request?

The device tree patch from this series also needs to be added.

Cheers,

Joel

> ---
> v2:
>   reword: Add fixes line
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 30 ++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 682ba0eb4eba..20acac6342ef 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -11,6 +11,7 @@
>   */
>
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/interrupt.h>
>  #include <linux/fs.h>
>  #include <linux/kfifo.h>
> @@ -67,6 +68,7 @@ struct aspeed_lpc_snoop_channel {
>  struct aspeed_lpc_snoop {
>         struct regmap           *regmap;
>         int                     irq;
> +       struct clk              *clk;
>         struct aspeed_lpc_snoop_channel chan[NUM_SNOOP_CHANNELS];
>  };
>
> @@ -282,22 +284,42 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> +       lpc_snoop->clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(lpc_snoop->clk)) {
> +               rc = PTR_ERR(lpc_snoop->clk);
> +               if (rc != -EPROBE_DEFER)
> +                       dev_err(dev, "couldn't get clock\n");
> +               return rc;
> +       }
> +       rc = clk_prepare_enable(lpc_snoop->clk);
> +       if (rc) {
> +               dev_err(dev, "couldn't enable clock\n");
> +               return rc;
> +       }
> +
>         rc = aspeed_lpc_snoop_config_irq(lpc_snoop, pdev);
>         if (rc)
> -               return rc;
> +               goto err;
>
>         rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 0, port);
>         if (rc)
> -               return rc;
> +               goto err;
>
>         /* Configuration of 2nd snoop channel port is optional */
>         if (of_property_read_u32_index(dev->of_node, "snoop-ports",
>                                        1, &port) == 0) {
>                 rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 1, port);
> -               if (rc)
> +               if (rc) {
>                         aspeed_lpc_disable_snoop(lpc_snoop, 0);
> +                       goto err;
> +               }
>         }
>
> +       return 0;
> +
> +err:
> +       clk_disable_unprepare(lpc_snoop->clk);
> +
>         return rc;
>  }
>
> @@ -309,6 +331,8 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
>         aspeed_lpc_disable_snoop(lpc_snoop, 0);
>         aspeed_lpc_disable_snoop(lpc_snoop, 1);
>
> +       clk_disable_unprepare(lpc_snoop->clk);
> +
>         return 0;
>  }
>
> --
> 2.25.1
>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
