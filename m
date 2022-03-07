Return-Path: <SRS0=IkeH=TS=linaro.org=sumit.garg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D21C433EF
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 11:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C6DBC340E9; Mon,  7 Mar 2022 11:32:18 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 425FBC340F4
	for <soc@kernel.org>; Mon,  7 Mar 2022 11:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 425FBC340F4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id w7so11952725lfd.6
        for <soc@kernel.org>; Mon, 07 Mar 2022 03:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PfDSGTII8OEq1qMEWbwlEjjVe6Gd0qQ3i7mpLlNovXo=;
        b=s6fHa1lvEZ+3Bh1MehfEE0HK2VfASVuaxT8SUp12QuE277aF8K2ybSSCjlQLOh6dJi
         6zpjHIwqMHH72jSXgtSQe2JtnejXCOauODmvOckPKVdOlqqp/Vq/CrgMeT5SJw6kS6BK
         ZsPglIRC5dj0Yt88BFUbW4EjjleYt8+jh83REiycP2I5e2xY/+ZmyvS75mTCoQQE5uYQ
         CArbxumWu4wcAdWMeCHljWrnasDzzlg8KtdX/1wPmtgkubTys0XMuhk8eIkc2S20PRVT
         sMIq8M2tKLu1pwsBS6LquT12mIPGWldhjYkSa6AmYa3Z6uB/hkjIgZ9yUH25RUYEoCcB
         Bk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PfDSGTII8OEq1qMEWbwlEjjVe6Gd0qQ3i7mpLlNovXo=;
        b=wMdmf0m18VP3gdyj7bZBeZtcGhlRqLbCC1JbGqAjYKZYJfRh4daRVUlkBta2tYvRnM
         v0IwGQEg0tRN1AOGX8XSRDid/zROetPH1yzQzUN++iHw6uqgygvYxVtLX5BhNfZmCxVr
         Ai0RwCCfKFuhlE2OSY3qWZGW7iMk/uLmYnaDLGEMIgNzDJ2elc/biSEXnzTVX8OANtqx
         iySbcLD6hlOgf+NONlFS1s0zoP9pxDiLpayeh6EHbKqU1OIl3x5eEjZRQGZ9kjcjM/vk
         ws0yLV7vCHx+MKUXNYrceSNTjWTmRPMedqIOATGSf4cmEoNdhkVhjERotinrwF0cgiav
         QRkA==
X-Gm-Message-State: AOAM5306lsJig9aSgNPK4OTrT00lVjQ9EtRThKb7f74zXxeQuLurMU3/
	2SSjLNvrbdK0MrMJvrDA8HyumAdKphUw/exSgWWyzA==
X-Google-Smtp-Source: ABdhPJwrz3os6eByp/EdpREzHyJ/tokDYc1QXytMUsDeDk0Qqfiy5D7kAKidVGdZ+pKK2v++O45kzV7d0Lmw+p4uxYg=
X-Received: by 2002:a05:6512:220c:b0:447:413d:f9a2 with SMTP id
 h12-20020a056512220c00b00447413df9a2mr7324231lfu.22.1646652734247; Mon, 07
 Mar 2022 03:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com>
 <20220304064324.331217-2-hasegawa-hitomi@fujitsu.com> <CAD=FV=Udf=MzyPa_o=vz=nc7ZVXBuuVNqw-VOSfrShuv0hN64Q@mail.gmail.com>
In-Reply-To: <CAD=FV=Udf=MzyPa_o=vz=nc7ZVXBuuVNqw-VOSfrShuv0hN64Q@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 7 Mar 2022 17:02:02 +0530
Message-ID: <CAFA6WYM77XTttu4H35PL7tkZxtBA8XaX23QW1UTBcESBE4V0fw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tty/sysrq: Make sysrq handler NMI aware
To: Doug Anderson <dianders@chromium.org>
List-Id: <soc.lore.kernel.org>
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	linux-serial@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson <daniel.thompson@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On Fri, 4 Mar 2022 at 23:36, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Mar 3, 2022 at 10:45 PM Hitomi Hasegawa
> <hasegawa-hitomi@fujitsu.com> wrote:
> >
> >  void __handle_sysrq(int key, bool check_mask)
> >  {
> >         const struct sysrq_key_op *op_p;
> > @@ -573,6 +606,10 @@ void __handle_sysrq(int key, bool check_mask)
> >         int orig_suppress_printk;
> >         int i;
> >
> > +       /* Skip sysrq handling if one already in progress */
> > +       if (sysrq_nmi_key != -1)
> > +               return;
>
> Should this give a warning?
>
> Also, can you remind me why this is safe if two CPUs both call
> handle_sysrq() at the same time? Can't both of them make it past this?
> That doesn't seem so great.
>
>
> > @@ -596,7 +633,13 @@ void __handle_sysrq(int key, bool check_mask)
> >                 if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
> >                         pr_info("%s\n", op_p->action_msg);
> >                         console_loglevel = orig_log_level;
> > -                       op_p->handler(key);
> > +
> > +                       if (in_nmi() && !op_p->nmi_safe) {
> > +                               sysrq_nmi_key = key;
> > +                               irq_work_queue(&sysrq_irq_work);
>
> It looks like irq_work_queue() returns false if it fails to queue.
> Maybe it's worth checking and setting "sysrq_nmi_key" back to -1 if it
> fails?

Thanks for your comments. I hope v4 here [1] addresses all of them.
Please have a look again.

[1] https://lkml.org/lkml/2022/3/7/1059

-Sumit
