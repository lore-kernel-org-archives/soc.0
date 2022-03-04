Return-Path: <SRS0=UCf6=TP=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD2EC433F5
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 13:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5E3DC340F0; Fri,  4 Mar 2022 13:05:38 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82BC0C340E9
	for <soc@kernel.org>; Fri,  4 Mar 2022 13:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82BC0C340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-vs1-f51.google.com with SMTP id d11so8980796vsm.5
        for <soc@kernel.org>; Fri, 04 Mar 2022 05:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aiwsrecM9WtgaZA42WLqCTiy2D01II3AHBBfXeGJehw=;
        b=XtswYgscLWfBsIzJNXZFzQcbI/jfyHYdIDRPbw9LjtMv8cSr2yn8XQ9oa5flPtqM47
         vrOX/cnESCZg7IBfNjx3JoHa3H7nVTb5zbl1TOM6O0Vw5RVs45KA65H4zZoKTlrAC55O
         BdwOFqk+JWoN/PtUJK/z0tQ2/TUS+TNMQyItE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aiwsrecM9WtgaZA42WLqCTiy2D01II3AHBBfXeGJehw=;
        b=Ms8BiOdydRSQFpUovlfKBEdeH6LWEWchHkOCCsRgIyGbU92dBca0xdq8LYLNXaDtRx
         TqZUHkUrc5PbboMqCjvXkNypVGw7KNzcS71yU1Z4O6H/3+BnJ640FoY9GSHPvzBgw0eF
         s1cN2pfp5E3ukD0N8nO0LOwMfpJmk4YUb8cbHjaNxWGld4crTMJw14A+LEylQ6DoNZoL
         LSBGQLyg3G/WVXWX8LOGwP8iqOG5oT5ZTlZNcWkMhR9+CEH99lmB/PIpWbtmn6/XPOys
         +znorQHY2b4q8Y+tNRncrU5aJnX2ozEp+dcjmMXfQEcIdCMyXb6DK1Zk84nO7xpvHylZ
         UdHg==
X-Gm-Message-State: AOAM533NumVPmI8jcxL7PTmSPKkvhyDRLOBE6abRXYwbSc/VEs9NJBnM
	/7Kd5ZSSUh6+ZbTOJr4YMXwia3BvDAjME8ZGM71+YD4nszc=
X-Google-Smtp-Source: ABdhPJxNkSI1cjXklKhFVfilChMNkEq+84m444X6hclD5m1QYaP1K/9FO8hIFo8GLU0Ronevz+YSxlb6ytQb2IkxjVM=
X-Received: by 2002:a67:fad9:0:b0:31e:be9f:4974 with SMTP id
 g25-20020a67fad9000000b0031ebe9f4974mr6604754vsq.43.1646399136281; Fri, 04
 Mar 2022 05:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20220301104349.3040422-1-daniel@0x0f.com> <CABgxDo+32A+akgbcD5Y+oGGJwZ_2G+dqfNTAdHYSD3xVPUnoTQ@mail.gmail.com>
In-Reply-To: <CABgxDo+32A+akgbcD5Y+oGGJwZ_2G+dqfNTAdHYSD3xVPUnoTQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 4 Mar 2022 22:08:03 +0900
Message-ID: <CAFr9PXnvF5ArbO_E4oPbz-7DBPiCaZxr3dsE1G=Ln8=+VyoPrA@mail.gmail.com>
Subject: Re: [PATCH] ARM: mstar: Select HAVE_ARM_ARCH_TIMER
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000ad4e1505d9642b0b"

--000000000000ad4e1505d9642b0b
Content-Type: text/plain; charset="UTF-8"

Hi Romain,

On Fri, 4 Mar 2022 at 19:09, Romain Perier <romain.perier@gmail.com> wrote:

> Hi all,
>
> Interesting, when I wrote the patch for msc313e-timer, I always had
> ARCH_ARM_TIMER implicitly built, so I thought that it was implicitly
> selected by MULTI_V7...
>

It was getting built somehow until 5.17 I think and I only noticed it got
broken because the CI build uses a defconfig whereas my development tree
has a full config that has ARCH_ARM_TIMER in it.


> I agree that we should at least have ARM_ARCH_TIMER enabled, otherwise
> we won't being able to boot correctly (no clockevents)
>

Arnd applied this for us already.


> I have also noticed that we missed this commit
>
> https://github.com/linux-chenxing/linux/commit/4cf42fcb4618cd77d80f767d5524c32fb40a91c6
>  (that selects MSC313E_TIMER), which might explain your initial issue
> (not being to boot).
>
> MSC313E_TIMER being optional on ARM (because of ARM_ARCH_TIMER), we
> should be sure that arm_timer is enabled and we can keep the mstar
> timer optional, imho.
>
> What do you think ?
>

I think MSC313E_TIMER should be optional but default for ARCH_MSTARV7.

Cheers,

Daniel

--000000000000ad4e1505d9642b0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Romain,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, 4 Mar 2022 at 19:09, Romain Perier =
&lt;<a href=3D"mailto:romain.perier@gmail.com">romain.perier@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi al=
l,<br>
<br>
Interesting, when I wrote the patch for msc313e-timer, I always had<br>
ARCH_ARM_TIMER implicitly built, so I thought that it was implicitly<br>
selected by MULTI_V7...<br></blockquote><div><br></div><div>It was getting =
built somehow until 5.17 I think and I only noticed it got broken because t=
he CI build uses a defconfig whereas my development tree has a full config =
that has ARCH_ARM_TIMER in it.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
I agree that we should at least have ARM_ARCH_TIMER enabled, otherwise<br>
we won&#39;t being able to boot correctly (no clockevents)<br></blockquote>=
<div><br></div><div>Arnd applied this for us already.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
I have also noticed that we missed this commit<br>
<a href=3D"https://github.com/linux-chenxing/linux/commit/4cf42fcb4618cd77d=
80f767d5524c32fb40a91c6" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/linux-chenxing/linux/commit/4cf42fcb4618cd77d80f767d5524c32fb40a91c6<=
/a><br>
=C2=A0(that selects MSC313E_TIMER), which might explain your initial issue<=
br>
(not being to boot).<br>
<br>
MSC313E_TIMER being optional on ARM (because of ARM_ARCH_TIMER), we<br>
should be sure that arm_timer is enabled and we can keep the mstar<br>
timer optional, imho.<br>
<br>
What do you think ?<br></blockquote><div><br></div><div>I think MSC313E_TIM=
ER should be optional but default for ARCH_MSTARV7.</div><div><br></div><di=
v>Cheers,</div><div><br></div><div>Daniel</div></div></div>

--000000000000ad4e1505d9642b0b--
