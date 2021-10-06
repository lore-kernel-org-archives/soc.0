Return-Path: <SRS0=v5LI=O2=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5365C433EF
	for <soc@archiver.kernel.org>; Wed,  6 Oct 2021 08:21:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 92C9E61177; Wed,  6 Oct 2021 08:21:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6704D610E5
	for <soc@kernel.org>; Wed,  6 Oct 2021 08:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6704D610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f44.google.com with SMTP id j5so7011062lfg.8
        for <soc@kernel.org>; Wed, 06 Oct 2021 01:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cqsL7nmpDtL9qLcDue8NBKVDE/qYyz1CBypo5Syruf8=;
        b=mAGBCOG8Y6MhZ2DI5ZjwgEBWbQ915GDR3i3vQ0xDlyzhPZpRjdEIoGwtX7qrKa4anY
         oubQey7oOqQ8EfDNUuefm2z1PnW1+1mKfyUp2BWQyvowk123zDmobaY8rN8/DM4JNa9j
         lIb0xIVeL3bWTChvJ4gMgZL1jito/EHg2EO4z7aQf77ef/Bl+v7PQ/UmqXZ5g3ZO01io
         X4HNdm9F9cjV9mfUvGOlEWmjX8i6r+g6jeooIEJSLAsbwxTBYOFNgRCYrI87tQ/CJq1S
         O/n9rLsy4msA5o44WObwpUNmvqE0RXiRew28dzIaZqpkdEFVkNmkhUmhOqwbFL9tThd+
         I4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cqsL7nmpDtL9qLcDue8NBKVDE/qYyz1CBypo5Syruf8=;
        b=140I64fdXl49wblfAp5MJNTcONrdC5qxg2hCoxziqVH4WwSbPSj3u6I+ikr1yjdIjd
         tzsJFmjOvGnpyMdWiBa+WthO3+KMs0B0YjPouWxRGCD2IccbrRiruxLkd7nBQOVIesQh
         sbIqy/vgMz78xo+bou3Zjiul6FWPgGlcG1gbys6VTDa7xpWZcE99xXnRZrQU1DrfqE/C
         cgkTVuFpFn5TaYTrdpfainbycX04Wiy9kR/J3fh7zcqxz42bRfCWhLjJJi2s8MgU4u/Z
         mEBSzfMSHliA4M/qj67eSN+aVmIBip+m6XY5Zk6JXJNEYef2q32KWKNLAEcZ13zpyCSF
         JWSw==
X-Gm-Message-State: AOAM530k2i8/IBgEIg5k7RLtoytWp+hTyALLXbXqSaJn0YbRIkJ7DL33
	e7d8pWSeYLjtndVWMRqMtntHjnUo8Dyh7e6bcR0OyA==
X-Google-Smtp-Source: ABdhPJzuDER5ATpQSy+KCokvxIG5hcMMHR7Y5eFvAVkW0D4P/61scHGLVzUICq4pR1wCvvaq/ov/SO9BIYXqCIQon4M=
X-Received: by 2002:a2e:530b:: with SMTP id h11mr28129229ljb.260.1633508508684;
 Wed, 06 Oct 2021 01:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211005143748.2471647-1-pan@semihalf.com> <20211005143748.2471647-3-pan@semihalf.com>
 <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com> <YVx9IMk7cJSCK79/@piout.net>
In-Reply-To: <YVx9IMk7cJSCK79/@piout.net>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Wed, 6 Oct 2021 11:21:37 +0200
Message-ID: <CAF9_jYT6mbk6dr8=ZYZ8B=gxnuHas7QBfDfuoTJnMzSKZt=WGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, jarkko.nikula@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, 
	Tudor Ambarus <Tudor.Ambarus@microchip.com>, Linux I2C <linux-i2c@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	"Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Konrad Adamczyk <ka@semihalf.com>, 
	Tomasz Nowicki <tn@semihalf.com>, Jacek Majkowski <jam@semihalf.com>, Alexandru Stan <amstan@google.com>
Content-Type: multipart/alternative; boundary="00000000000065eb4105cdaad6d3"

--00000000000065eb4105cdaad6d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2021 at 6:28 PM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 05/10/2021 18:22:12+0200, Arnd Bergmann wrote:
> > On Tue, Oct 5, 2021 at 4:37 PM Pawe=C5=82 Anikiel <pan@semihalf.com> wr=
ote:
> > >
> > > On SoCFPGA systems, it's desireable to have fixed numbering for
> > > i2c busses, while being able to enable/disable them (e.g. have i2c1
> > > be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
> > > be achieved using devicetree aliases (see i2c_add_adapter). However,
> > > having the driver be self-contained without relying on aliases is mor=
e
> > > robust.
> > >
> > > Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> >
> > I don't see how adding a nonstandard property in one of the i2c bus
> > drivers helps at all. How do you expect this to work when there are
> > multiple i2c controllers in the system using different drivers? What
> > should happen if both an alias and the busno property are set?
> >
>
> What happens when two nodes have the same busno property because e.g.
> one is in a dtsi and the other one is in a dts?
>

If busno is set, the alias is ignored (the code that checks aliases
is never reached). If two nodes have the same busno property, we get
a WARN in drivers/i2c/i2c-core-base.c:1637, and only on of them
gets attached.

What is a better way of doing this then? Is adding aliases to the
devicetree like this okay?

aliases {
...
i2c0 =3D &i2c0;
i2c1 =3D &i2c1;
};

--00000000000065eb4105cdaad6d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Oct 5, 2021 at 6:28 PM Alexandre =
Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.bell=
oni@bootlin.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 05/10/2021 18:22:12+0200, Arnd=
 Bergmann wrote:<br>
&gt; On Tue, Oct 5, 2021 at 4:37 PM Pawe=C5=82 Anikiel &lt;<a href=3D"mailt=
o:pan@semihalf.com" target=3D"_blank">pan@semihalf.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On SoCFPGA systems, it&#39;s desireable to have fixed numbering f=
or<br>
&gt; &gt; i2c busses, while being able to enable/disable them (e.g. have i2=
c1<br>
&gt; &gt; be mapped to /dev/i2c-1, even though i2c0 is disabled). This can =
also<br>
&gt; &gt; be achieved using devicetree aliases (see i2c_add_adapter). Howev=
er,<br>
&gt; &gt; having the driver be self-contained without relying on aliases is=
 more<br>
&gt; &gt; robust.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Pawe=C5=82 Anikiel &lt;<a href=3D"mailto:pan@semih=
alf.com" target=3D"_blank">pan@semihalf.com</a>&gt;<br>
&gt; <br>
&gt; I don&#39;t see how adding a nonstandard property in one of the i2c bu=
s<br>
&gt; drivers helps at all. How do you expect this to work when there are<br=
>
&gt; multiple i2c controllers in the system using different drivers? What<b=
r>
&gt; should happen if both an alias and the busno property are set?<br>
&gt; <br>
<br>
What happens when two nodes have the same busno property because e.g.<br>
one is in a dtsi and the other one is in a dts?<br>
</blockquote><div><br></div><div>If busno is set, the alias is ignored (the=
 code that checks aliases<br>is never reached). If two nodes have the same =
busno property, we get<br>a WARN in drivers/i2c/i2c-core-base.c:1637, and o=
nly on of them<br>gets attached.<br><br>What is a better way of doing this =
then? Is adding aliases to the<br>devicetree like this okay?<br><br>aliases=
 {<br>	...<br>	i2c0 =3D &amp;i2c0; <br>	i2c1 =3D &amp;i2c1; <br>};<br></div=
></div></div>

--00000000000065eb4105cdaad6d3--
