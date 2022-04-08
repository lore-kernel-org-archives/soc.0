Return-Path: <SRS0=BsUX=US=gmail.com=itaru.kitayama@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29903C433F5
	for <soc@archiver.kernel.org>; Fri,  8 Apr 2022 10:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCDB3C385A9; Fri,  8 Apr 2022 10:44:35 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2FDBC385A5;
	Fri,  8 Apr 2022 10:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2FDBC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id n5so6267532vsc.4;
        Fri, 08 Apr 2022 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q84CpmN6HcAdLjwgnok8DT6LnoTrdsedTAsaK5EuaM4=;
        b=Z4P4yFSOUSMA9y9zFXitqSaVKi0NHwNN1KTzbODc5a2DaiWoogIdh6RKnXThQGYtdi
         uM1svG5l8LTJpUxTHnib37budyl6hIP4LBPuFkXWLPygL8SvGgbiZBAMQcYCVdqP9o0n
         HUmotu5gqCai7t4Vafn0KkXJtT33wb2467vPAnM/5rYfsDhG1vUtv8YjzdQP4eotDmLK
         99e3xiTyXTsaubmiTZsk1SNb093Dmu0MiQClzZMXUXpB+YjDsBvtlWHls4Z2GSYlasw9
         3hj1tcM/T18rjCo98RERlKBezQfPdej9tvDYyeuroFcToeDgm5nh9/NqUpqhRiktHv2r
         5WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q84CpmN6HcAdLjwgnok8DT6LnoTrdsedTAsaK5EuaM4=;
        b=UUbrdHoDm0QYCrKS8WABT5ypRY4jn+IuQIOegUtWGJc3T7v/6o+b1EfWxXYlHAI1tq
         xcVo6Vi7nbnueOEyTmI1mW/OS3d4s2ZK8sRzYXZMrhdP9beNM6qmMcjpPKOiGUHigsZ2
         kAdZoNJyq2DK2WfMUodbyQG0wO5Y/1b4LQ814nSD0uqK2tyIQyQnlOAAhj1vCjiZLNQa
         OzDaMZ3/OS76Jg5z/pAAaNubbsN1QEljeMvqOMmErIqvOJyMFKWAsPIS+U3Jzk0CVECo
         7dZj7WhI6h0yYlW/kvz8U+mAJwHAPj4HUcCGUx+eJlRnpOa/0jskEpUwoVwvMa54hCI9
         ykeg==
X-Gm-Message-State: AOAM530EbNSwq2HAquo4UwWvwI6KsHf7T3mjl/dIPwgfKlF1ySZIcC46
	idQY944mZAzAESDqzfQMhCYBXvNYL3b7/11NBZU=
X-Google-Smtp-Source: ABdhPJxjK6n4PMUa+0B+m32pYHOhwY0WKuX/21o5BeMt/s5oSpqtnDh3IFRtRrzi4nKQz20KwYV8OJQP7KmPVvHpKP4=
X-Received: by 2002:a67:c981:0:b0:320:92c2:d2ee with SMTP id
 y1-20020a67c981000000b0032092c2d2eemr5291342vsk.79.1649414673778; Fri, 08 Apr
 2022 03:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com> <YkWVTEG5oFO82GPL@kroah.com>
 <OSZPR01MB7050ED8D47839EAC9B4FC5BFEBE49@OSZPR01MB7050.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB7050ED8D47839EAC9B4FC5BFEBE49@OSZPR01MB7050.jpnprd01.prod.outlook.com>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Fri, 8 Apr 2022 19:44:23 +0900
Message-ID: <CANW9uyvYSQNOAimKmJBmiWkfo4F+K9g+JOfoa+yFDLwSx2xcPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, "arnd@arndb.de" <arnd@arndb.de>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, 
	"dianders@chromium.org" <dianders@chromium.org>, 
	"jason.wessel@windriver.com" <jason.wessel@windriver.com>, "jirislaby@kernel.org" <jirislaby@kernel.org>, 
	"kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>, 
	"peterz@infradead.org" <peterz@infradead.org>, "soc@kernel.org" <soc@kernel.org>, 
	"sumit.garg@linaro.org" <sumit.garg@linaro.org>, "will@kernel.org" <will@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000b7cad505dc2247ed"

--000000000000b7cad505dc2247ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wondering if, Greg you approves Hitomi=E2=80=99s updated series, then you p=
ick up
it whatever the tree you maintain?

Thanks,
Itaru.

On Fri, Apr 8, 2022 at 19:36 hasegawa-hitomi@fujitsu.com <
hasegawa-hitomi@fujitsu.com> wrote:

> Hi Greg,
>
> > > Enable diagnostic interrupts for the A64FX.
> > > This is done using a pseudo-NMI.
> >
> > I do not understand what this driver is, sorry.  Can you please provide
> more
> > information in the changelog text for what this is, who would use it,
> and how it will
> > be interacted with.
>
> I understand. I will add a description in the next version.
>
> > > +config A64FX_DIAG
> > > +   bool "A64FX diag driver"
> > > +   depends on ARM64
> >
> > What about ACPI?  Shouldn't this code depend on that?
>
> Okey. I will make it dependent on ACPI.
>
> > > +   help
> > > +     Say Y here if you want to enable diag interrupt on A64FX.
> >
> > What is A64FX?
>
> A64FX is a processor designed by Fujitsu.
> For the sake of clarity, I will describe it as "Fujitsu A64FX".
>
> > > +     This driver uses pseudo-NMI if available.
> >
> > What does this mean?
>
> This driver uses the pseudo-NMI feature to perform diagnostic interrupts
> for A64FX. However, I felt that it was superfluous to give this explanati=
on
> here, so I will delete this sentence.
>
> > > +     If unsure, say N.
> >
> > No module?  Why not?
>
> request_nmi() is not EXPORT_SYMBOL. So this driver cannot be a module.
>
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * A64FX diag driver.
> >
> > No copyright information?  Are you sure?
>
> I will add copyright information.
>
> > > +#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044) #define
> > > +BMC_INTERRUPT_STATUS_MASK ((1U) << 31)
> >
> > BIT()?
> >
> > > +#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040) #define
> > > +BMC_INTERRUPT_ENABLE_MASK ((1U) << 31)
> >
> > BIT()?
>
> Okey, I will use BIT().
>
> > > +static irqreturn_t a64fx_diag_handler(int irq, void *dev_id) {
> > > +   handle_sysrq('c');
> >
> >
> > Why is this calling this sysrq call?  From an interrupt?  Why?
> >
> > And you are hard-coding "c", are you sure?
>
> As mentioned by Arnd, I only called panic () at first, but after receivin=
g
> his suggestion, I decided to call handle_sysrq ('c').
> This driver only supports the function that causes a panic when receiving
> a diagnostic interrupt from the outside, so "c" is coded.
> Also, no data is added when a diagnostic interrupt is sent.
>
> > > +   if (mmsc & BMC_INTERRUPT_STATUS_MASK)
> > > +           writel(BMC_INTERRUPT_STATUS_MASK, (void
> > *)diag_status_reg_addr);
> >
> > No need to wait for the write to complete?
> >
> > You shouldn't have to cast diag_status_reg_addr, right?
>
> Due to the specifications of the machine, there is no problem even
> if there is no write wait processing.
>
> I will remove constant and (void *). Thank you for pointing out.
>
> > > +           enable_irq(priv->irq);
> > > +           priv->has_nmi =3D false;
> > > +           dev_info(dev, "registered for IRQ %d\n", priv->irq);
> > > +   } else {
> > > +           enable_nmi(priv->irq);
> > > +           priv->has_nmi =3D true;
> > > +           dev_info(dev, "registered for NMI %d\n", priv->irq);
> >
> > When drivers are successful, they are quiet.  No need for the noise her=
e.
>
> I will remove the message for a successful NMI/IRQ registration.
>
> Thank you.
> Hitomi Hasegawa
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--000000000000b7cad505dc2247ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Wondering if, Greg you approves Hitomi=E2=80=99s updated =
series, then you pick up it whatever the tree you maintain?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Itaru.=
</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, Apr 8, 2022 at 19:36 <a href=3D"mailto:hasegawa-hitomi@fujitsu=
.com">hasegawa-hitomi@fujitsu.com</a> &lt;<a href=3D"mailto:hasegawa-hitomi=
@fujitsu.com">hasegawa-hitomi@fujitsu.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi Greg,<br>
<br>
&gt; &gt; Enable diagnostic interrupts for the A64FX.<br>
&gt; &gt; This is done using a pseudo-NMI.<br>
&gt; <br>
&gt; I do not understand what this driver is, sorry.=C2=A0 Can you please p=
rovide more<br>
&gt; information in the changelog text for what this is, who would use it, =
and how it will<br>
&gt; be interacted with.<br>
<br>
I understand. I will add a description in the next version.<br>
<br>
&gt; &gt; +config A64FX_DIAG<br>
&gt; &gt; +=C2=A0 =C2=A0bool &quot;A64FX diag driver&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0depends on ARM64<br>
&gt; <br>
&gt; What about ACPI?=C2=A0 Shouldn&#39;t this code depend on that?<br>
<br>
Okey. I will make it dependent on ACPI.<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0help<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0Say Y here if you want to enable diag interr=
upt on A64FX.<br>
&gt; <br>
&gt; What is A64FX?<br>
<br>
A64FX is a processor designed by Fujitsu.<br>
For the sake of clarity, I will describe it as &quot;Fujitsu A64FX&quot;.<b=
r>
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0This driver uses pseudo-NMI if available.<br=
>
&gt; <br>
&gt; What does this mean?<br>
<br>
This driver uses the pseudo-NMI feature to perform diagnostic interrupts<br=
>
for A64FX. However, I felt that it was superfluous to give this explanation=
<br>
here, so I will delete this sentence.<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0If unsure, say N.<br>
&gt; <br>
&gt; No module?=C2=A0 Why not?<br>
<br>
request_nmi() is not EXPORT_SYMBOL. So this driver cannot be a module.<br>
<br>
&gt; &gt; +// SPDX-License-Identifier: GPL-2.0-only<br>
&gt; &gt; +/*<br>
&gt; &gt; + * A64FX diag driver.<br>
&gt; <br>
&gt; No copyright information?=C2=A0 Are you sure?<br>
<br>
I will add copyright information.<br>
<br>
&gt; &gt; +#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044) #define<br>
&gt; &gt; +BMC_INTERRUPT_STATUS_MASK ((1U) &lt;&lt; 31)<br>
&gt; <br>
&gt; BIT()?<br>
&gt; <br>
&gt; &gt; +#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040) #define<br>
&gt; &gt; +BMC_INTERRUPT_ENABLE_MASK ((1U) &lt;&lt; 31)<br>
&gt; <br>
&gt; BIT()?<br>
<br>
Okey, I will use BIT().<br>
<br>
&gt; &gt; +static irqreturn_t a64fx_diag_handler(int irq, void *dev_id) {<b=
r>
&gt; &gt; +=C2=A0 =C2=A0handle_sysrq(&#39;c&#39;);<br>
&gt; <br>
&gt; <br>
&gt; Why is this calling this sysrq call?=C2=A0 From an interrupt?=C2=A0 Wh=
y?<br>
&gt; <br>
&gt; And you are hard-coding &quot;c&quot;, are you sure?<br>
<br>
As mentioned by Arnd, I only called panic () at first, but after receiving<=
br>
his suggestion, I decided to call handle_sysrq (&#39;c&#39;).<br>
This driver only supports the function that causes a panic when receiving<b=
r>
a diagnostic interrupt from the outside, so &quot;c&quot; is coded.<br>
Also, no data is added when a diagnostic interrupt is sent.<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0if (mmsc &amp; BMC_INTERRUPT_STATUS_MASK)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(BMC_INTERRUPT_ST=
ATUS_MASK, (void<br>
&gt; *)diag_status_reg_addr);<br>
&gt; <br>
&gt; No need to wait for the write to complete?<br>
&gt; <br>
&gt; You shouldn&#39;t have to cast diag_status_reg_addr, right?<br>
<br>
Due to the specifications of the machine, there is no problem even<br>
if there is no write wait processing.<br>
<br>
I will remove constant and (void *). Thank you for pointing out.<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable_irq(priv-&gt;irq=
);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;has_nmi =3D fa=
lse;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(dev, &quot;reg=
istered for IRQ %d\n&quot;, priv-&gt;irq);<br>
&gt; &gt; +=C2=A0 =C2=A0} else {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable_nmi(priv-&gt;irq=
);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;has_nmi =3D tr=
ue;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(dev, &quot;reg=
istered for NMI %d\n&quot;, priv-&gt;irq);<br>
&gt; <br>
&gt; When drivers are successful, they are quiet.=C2=A0 No need for the noi=
se here.<br>
<br>
I will remove the message for a successful NMI/IRQ registration.<br>
<br>
Thank you.<br>
Hitomi Hasegawa<br>
_______________________________________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"_blank">l=
inux-arm-kernel@lists.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/mailman/listi=
nfo/linux-arm-kernel</a><br>
</blockquote></div></div>

--000000000000b7cad505dc2247ed--
