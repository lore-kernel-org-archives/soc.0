Return-Path: <SRS0=Qnqp=TM=gmail.com=paweldembicki@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12A0C433F5
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 20:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8F7EC36AE2; Tue,  1 Mar 2022 20:32:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF409C340EE;
	Tue,  1 Mar 2022 20:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF409C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id u1so22307134wrg.11;
        Tue, 01 Mar 2022 12:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CrQXtLIGnRJeaQHQZnoEPNrRNT+7/qaBjqmC6+8ZDYA=;
        b=gwPNVZYiRqm/ONMrZpXb5c/9raUwfFAFa5xWtypoXxpNWHjRwbdBrN7ce1jsSnUi5E
         qu4tjsQE+/eFRINGfuAAC8fxvuigawD6NshWh2jJsNbNyD5ncd4CGkmQN7fiCcvHqNJv
         hpt8YYho7cEwf6o+a4lgCnCb7BgzNWGqovXSt3wU93Kr5yG8/ajgaZ6H5Du/HTLG/mEF
         VY+xszOpxm1UffGR4FrA3BcWhCSDC6tSNi9zV7kFRamiK9cNTlrMkhP+LqXD0yl/nv4E
         h4ZZYlUUsYobbY33WFhIOejaEVjjSnXLyiXi29U2rgYN+KGhINIWsTc8QGkdYlRtEWuW
         RZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CrQXtLIGnRJeaQHQZnoEPNrRNT+7/qaBjqmC6+8ZDYA=;
        b=XOr+uaOJtCLZgCTV7qSTnErBPxPtELOdE5Z9vnU8JbtRjiRma9myIIyZvc3zP+iikm
         5wM1sb79e1E4Re+sesyPS54m1JlV8mLesz823L9Z/OLN8UcTlpUUaOBrQFfvNWnofjvS
         hpoKJiFyg3Ns6vjucqr5JjYUx5I3ODh/kw5OZwBVJVXfgPAsBwT4Ccnc8KlxN0T9LCHL
         ouCqI34JQHUETof0SrbtPqz/1zcinuSwZdaCudoRMGVHguXxKAwUcDD5ei4MKkEu8kjt
         cdWF24QClBHkmZ24fgBKNxDOtJwdJQNnQNpFTmmQ94JvcP75zqVyzUcQtUu0H4hk9OjH
         sNag==
X-Gm-Message-State: AOAM5316A70x+LoV1kW17RS5tOw7uMMJkY1lP5Lq6i9Q26GDF7NiTRKE
	YXYcPh9zQuhdd46VILzobWl1RIlJ+mT3OBsnMEM=
X-Google-Smtp-Source: ABdhPJyOyqrAmq0du9j8vJye29kK1c8pmM58hk4zrpISMGQfTykc6McfVWvFM94evxgpJmtoTmCcTROBwR2hlAwTSlk=
X-Received: by 2002:adf:efc6:0:b0:1ed:f546:bd94 with SMTP id
 i6-20020adfefc6000000b001edf546bd94mr19989617wrp.33.1646166758969; Tue, 01
 Mar 2022 12:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20220215163926.894-1-paweldembicki@gmail.com> <CACRpkda=ky29PiTjWimnNihLDHSTfYWk68qg5GcLqZTD76ba=g@mail.gmail.com>
In-Reply-To: <CACRpkda=ky29PiTjWimnNihLDHSTfYWk68qg5GcLqZTD76ba=g@mail.gmail.com>
From: =?UTF-8?Q?Pawe=C5=82_Dembicki?= <paweldembicki@gmail.com>
Date: Tue, 1 Mar 2022 21:32:27 +0100
Message-ID: <CAJN1KkygDrGPzJj4nobS-ZFSRqP+g9LQ49tbcLA8V7KvPhfYOQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: kirkwood: Add Ctera C-200 V1 board
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Corentin Labbe <clabbe@baylibre.com>, 
	Oleksij Rempel <linux@rempel-privat.de>, Hao Fang <fanghao11@huawei.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 1 mar 2022 o 00:43 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Tue, Feb 15, 2022 at 5:40 PM Pawel Dembicki <paweldembicki@gmail.com> =
wrote:
>
> > +&i2c0 {
> > +       status =3D "okay";
> > +
> > +       rtc@30 {
> > +               compatible =3D "s35390a";
> > +               reg =3D <0x30>;
> > +       };
> > +
> > +       lm63@4c {
> > +               compatible =3D "national,lm63";
> > +               reg =3D <0x4c>;
> > +       };
>
> Think about adding chassis thermal zone for this sensor,
>
> I suppose you don't have any active control of cooling (fan)?
> This often sits on GPIO...
>

Hi Linus,
It has a fan controlled by the lm63: PWM controller. But the fan blows
only on disks, board temperature won't change even when PWM =3D 100%.
It should be controlled by hdd temperature.

> In that case just add a critical temperature so it can't burn
> down the house.
>

Patch it's merged now, I will add critical temperatures in a separate patch=
.

> See:
> arch/arm/boot/dts/gemini-dlink-dns-313.dts
> node thermal-zones {} for an example of how to do this
> quick and easy. You need CONFIG_THERMAL and
> CONFIG_THERMAL_HWMON for this to work.
>
> Yours,
> Linus Walleij

Best Regards,
Pawel Dembicki
