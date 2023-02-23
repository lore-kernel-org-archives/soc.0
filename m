Return-Path: <SRS0=J03N=6T=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AD1C677F1
	for <soc@archiver.kernel.org>; Thu, 23 Feb 2023 20:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B894EC433A0; Thu, 23 Feb 2023 20:59:50 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AA28C4339C
	for <soc@kernel.org>; Thu, 23 Feb 2023 20:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9AA28C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-536cd8f6034so194270507b3.10
        for <soc@kernel.org>; Thu, 23 Feb 2023 12:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohz7ibnthCjmkK/bN3U7vjBvXHhe/lwMEhzdp9DLnfE=;
        b=WbvFlX320ZPeHHjI9qrDmKxpseWZnbB0LFo0Tgy2z2lvJtrhvb97eIXdT53lbG6snc
         TdJPR5xTBmpVUEqnq4q6mRF5An/8KQs23Sqikhsrxi7tV5WXKwZ0jiOPuJ954UPkGrpk
         MSbQHQ5WxClUkp+h5uV9k+NUWcORvRnSQfn519uO7n5VwGus3A0W/jbGt2YKuUC0JD47
         19HB4uJy50znKKTPOE+WkZiRddkSxmknMAZR+eVclnRtoyHPp5GgRyp0v9AARvquwxaU
         RGxqfiy+ReDwjaTkefpw/ifShrWs1zRG/AY67lTdEFWhPcCXAOuALmhUovczQcqb/Zyb
         b/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohz7ibnthCjmkK/bN3U7vjBvXHhe/lwMEhzdp9DLnfE=;
        b=XBlwF6oB8OoxEkz3HYseOfo40XO+h3PDm0ekQBE0Ud4G/338AZsEinLBuIMY5vggB8
         L2ZfTjK/ZGSh2QNVbpeMU8R8hxoClXsEQlnaYTykDrimu/dS7DRfjsllob2OE4/PJZuo
         OF8o5WeX/O/gWdQCABOn6Pf5Kw9t3Dg4Q3kOVCmgd0ncCYQnC/mF2WEo5bRWcR55nPOe
         RLWISub1qmoZELzIrUrQhcU8/gfcMjcX9D8QPZcTBiSSc3w2N5L0yTaz40flAIQYnNc9
         0fvoPMN7s8xdOcYjylNbKJNq8MA10giVXAspqzUhsEHzcjo+Z2ul+PP4LQx2r7tAmZMW
         fX3Q==
X-Gm-Message-State: AO0yUKVyDVhnYzKGhyjAIEwsFQI9h4x8fsV97UTikVTQs6MQEZ+z3Ibv
	M5ubz4I691hx26s9Ued8F4iYWjIX+bHM5977T8h5AA==
X-Google-Smtp-Source: AK7set8+ipO/Zwoq487SWgkmX9GiP1XQ7/puxKDDMGSogWZxeEgQ+93XWZeggEDg9clGRmt+mwM5cYo4Eogy/RgwGio=
X-Received: by 2002:a81:b606:0:b0:52e:c79a:cda with SMTP id
 u6-20020a81b606000000b0052ec79a0cdamr2943098ywh.10.1677185988446; Thu, 23 Feb
 2023 12:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20221226123630.6515-1-pali@kernel.org> <20221226123630.6515-2-pali@kernel.org>
 <Y9OycfvJEZ3tX/xm@google.com> <Y/d2vNUeuQTwQ2VG@google.com> <20230223164833.bsaqwgevphnsenal@pali>
In-Reply-To: <20230223164833.bsaqwgevphnsenal@pali>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Feb 2023 21:59:37 +0100
Message-ID: <CACRpkda8QQZrUkcKKvQ1z1u9X-uOrL-VAVgfkrgU3E+ihJ-YDA@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/8] dt-bindings: leds: register-bit-led: Add
 active-low property
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 5:48 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> On Thursday 23 February 2023 14:22:52 Lee Jones wrote:
> > On Fri, 27 Jan 2023, Lee Jones wrote:
> >
> > > On Mon, 26 Dec 2022, Pali Roh=C3=A1r wrote:
> > >
> > > > Allow to define inverted logic (0 - enable LED, 1 - disable LED) vi=
a
> > > > active-low property.
> > > >
> > > > Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/leds/register-bit-led.yaml | 5 +=
++++
> > > >  1 file changed, 5 insertions(+)
> > >
> > > Needs a DT Ack (now Cc:ed)
> >
> > I can't do anything with this set until we have a DT Ack.
> >
> > If you don't receive one soon, I'd suggest resending the set again with
> > all of the DT people on Cc that it should have been sent to in the firs=
t
> > place.
>
> (Re)Sending one email multiple times is against email etiquette,
> moreover it is spam technique and reason for marking sender on the
> blacklist.

No problem on the kernel mailing lists actually, we love to mail
bomb each other here. Yeah maybe we are a bit weird :/

> Moreover I have already sent it more than one time. DT people are known
> to not respond to patches and pull requests and I have no motivation to
> send reminder emails for them for more than half of year.
>
> So I would suggest to not send emails to people who just do not want to
> receive or read emails. It is logical reaction.
>
> This patch is here for more than 6 months, so I do not see reason why to
> wait for Godot. Rather move forward than stepping at the same position.

I understand that it is annoying.

In my experience Krzysztof and Rob (now added on To) are usually
quite responsive and helpful, so something must have made them
miss it I think.

As subsystem maintainer, if the DT reviewers haven't said anything
in ~2 weeks I tend to sanity check the binding as best I can and then
merge it. The bigger and more complex it is the more hesitant I get to
do this...

Yours,
Linus Walleij
