Return-Path: <SRS0=eiK6=TP=chromium.org=dianders@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DD3C433F5
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 18:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABE7DC340F2; Fri,  4 Mar 2022 18:06:01 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06237C340EF
	for <soc@kernel.org>; Fri,  4 Mar 2022 18:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06237C340EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a8so19075163ejc.8
        for <soc@kernel.org>; Fri, 04 Mar 2022 10:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ScIINym/s1zYwdre28Fn9pTUeIcuABEqsfOfpBejDew=;
        b=gTDLuJI8Mi9+ftvhMPpwI3xkvmlECcV27R9BSVD6hXT0HmVBRR0FwwoLXYb6N1Al2i
         bK/j3t1B1Ljjq+Fc5+0SWeynkJdvwuff3j4suXxefwL460DXjznAMYUx8jShSKhXaT81
         LAKUCxOZsJQtuiy2ZURKJeOVgZdTpa69HCVI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ScIINym/s1zYwdre28Fn9pTUeIcuABEqsfOfpBejDew=;
        b=EiacH5rV93guatX0v7101KJgJ6NQ0KmsMn5krwfX/QEhtBIIjRFGjvoAS/86wysBjo
         jO420Kqtr7vr1/GcPNBZRITSdE32Fn3eqiykxp7HxRAu/BTVaqj8DaNOEsdatFFkU0pB
         /Rxpq5BDwwzP+Wb25Ss0XTLKh0k9xspAhi1qdapE2psVOF7cEyTQBvcztad8ucSgTYsa
         n+jhkcFKLK10rYj6LdXmVJKjRpSckCKFcBwM4aHil5gfYRj0B50wRcmZxp8dI96g7ZiA
         bRiQ+XJbAU7kdKrI6uTow/B1SnvyeDsbZM+tRI+Eh3mc+uNztoFVpMPV42uye6Ce36It
         Hltw==
X-Gm-Message-State: AOAM5311LeUJnL5nF5L5L9Y05JDGYYE9EU6aIjRpm54C7pbOHXinryP3
	KF0CeAzUMMwSZ1K5kNwKLj7XATnliiIQJLd6
X-Google-Smtp-Source: ABdhPJzbM+VTLA56Xtbhuxr3pWlJL/jMPL/O5iq7iCSQ+nYH0Wi8Y6op0Yxq9U4sqETZuRelt5r77Q==
X-Received: by 2002:a17:906:7852:b0:5bb:1bdb:e95f with SMTP id p18-20020a170906785200b005bb1bdbe95fmr33558316ejm.435.1646417159361;
        Fri, 04 Mar 2022 10:05:59 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id y12-20020a50eb8c000000b00410f02e577esm2458764edr.7.2022.03.04.10.05.58
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 10:05:59 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id bk29so13855190wrb.4
        for <soc@kernel.org>; Fri, 04 Mar 2022 10:05:58 -0800 (PST)
X-Received: by 2002:a5d:64ed:0:b0:1f0:6672:f10c with SMTP id
 g13-20020a5d64ed000000b001f06672f10cmr4171901wri.679.1646417158156; Fri, 04
 Mar 2022 10:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com> <20220304064324.331217-2-hasegawa-hitomi@fujitsu.com>
In-Reply-To: <20220304064324.331217-2-hasegawa-hitomi@fujitsu.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Mar 2022 10:05:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Udf=MzyPa_o=vz=nc7ZVXBuuVNqw-VOSfrShuv0hN64Q@mail.gmail.com>
Message-ID: <CAD=FV=Udf=MzyPa_o=vz=nc7ZVXBuuVNqw-VOSfrShuv0hN64Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tty/sysrq: Make sysrq handler NMI aware
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	linux-serial@vger.kernel.org, Sumit Garg <sumit.garg@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson <daniel.thompson@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Mar 3, 2022 at 10:45 PM Hitomi Hasegawa
<hasegawa-hitomi@fujitsu.com> wrote:
>
>  void __handle_sysrq(int key, bool check_mask)
>  {
>         const struct sysrq_key_op *op_p;
> @@ -573,6 +606,10 @@ void __handle_sysrq(int key, bool check_mask)
>         int orig_suppress_printk;
>         int i;
>
> +       /* Skip sysrq handling if one already in progress */
> +       if (sysrq_nmi_key != -1)
> +               return;

Should this give a warning?

Also, can you remind me why this is safe if two CPUs both call
handle_sysrq() at the same time? Can't both of them make it past this?
That doesn't seem so great.


> @@ -596,7 +633,13 @@ void __handle_sysrq(int key, bool check_mask)
>                 if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
>                         pr_info("%s\n", op_p->action_msg);
>                         console_loglevel = orig_log_level;
> -                       op_p->handler(key);
> +
> +                       if (in_nmi() && !op_p->nmi_safe) {
> +                               sysrq_nmi_key = key;
> +                               irq_work_queue(&sysrq_irq_work);

It looks like irq_work_queue() returns false if it fails to queue.
Maybe it's worth checking and setting "sysrq_nmi_key" back to -1 if it
fails?

-Doug
