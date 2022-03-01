Return-Path: <SRS0=yDTJ=TM=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038E6C433FE
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 22:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C745EC340EF; Tue,  1 Mar 2022 22:05:02 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4A9CC340EE
	for <soc@kernel.org>; Tue,  1 Mar 2022 22:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4A9CC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2dbfe58670cso18634137b3.3
        for <soc@kernel.org>; Tue, 01 Mar 2022 14:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UcPAPgfcldc73jEP+C7Dej+leQMSuSLsqYm57vv73+s=;
        b=nRakB6HmSQvAY0Kx8G5e0XiHu+lZH+cNOSVvManb39OQg5KXxnMddGx3eaTlkqCwZ1
         tD3b2Xov2F7FLOGsOzjBxOVPu9aKqb2AqpjUU1eWbTbx00Ju3UR40XNvN0l3LMy4bkt9
         Rui06CAZMrodVpaNMV5lUTT+sDBGnsNvtd0hVGWHCjSw8DlzZ7frrYemADTorf6gcuYD
         kHhnCqVDMa2qFBaQLMP27xmcmelDgZEstkQIDIVpK1HV60D9tRmgAUcp+g6b9yplwuZ+
         Spq9ZALSr6S9zZA2jhs1GuzgkujBQTV2BcBMIp2DZVmie1F4BWb+HD0OKh8S+TaUi8zF
         espg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UcPAPgfcldc73jEP+C7Dej+leQMSuSLsqYm57vv73+s=;
        b=YhZaAzKdwO5fLlNo+QnvZyl0+sqTflNqyIpbsK+06nZYHIMEZV8JjtKz5d8pNHTkhT
         OKYmWmDbWVGC2RiRHtwP/hVG2LT0qONuY6XBVZ98NvtbCveLjBMMXSnRpogsNAUv4rNe
         jIrXsq8/DtyIxwdasJo7yjIF/BeaqyXchmxmR2ymy8URHJsU+Ktl+yL52J2+OS4riqmn
         8x/40la1OISYcDoihXzUjhFXo9I1tg+TlaaQXVFDXTGs8TIh4wf0ENTjDQlVuIlR+vYD
         xcrVbFFLQtqKTH3wAL8pwzrS2sRCFQHKbMOG1ODHPb/M5ficKjUSERDGOTSys1qeJiI+
         om2Q==
X-Gm-Message-State: AOAM530PGd0+WWDWFtaZiTSgZEoEFviy/g2qTpB88oAIqtqQEJK55wCb
	4VjUdzDZqN0WQ70DhPpipNerpCWBsdX+oUPNcxeNuw==
X-Google-Smtp-Source: ABdhPJz0z5NUDx5yT9o5PaqMCK36QA8R6U5yziPTGeHEgqZnWomadFex96iDbgDg/IFQkrR5Udu+iKW6bIM/vAp44rg=
X-Received: by 2002:a81:d15:0:b0:2db:d348:2fda with SMTP id
 21-20020a810d15000000b002dbd3482fdamr6926473ywn.151.1646172299759; Tue, 01
 Mar 2022 14:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20220215163926.894-1-paweldembicki@gmail.com> <CACRpkda=ky29PiTjWimnNihLDHSTfYWk68qg5GcLqZTD76ba=g@mail.gmail.com>
 <CAJN1KkygDrGPzJj4nobS-ZFSRqP+g9LQ49tbcLA8V7KvPhfYOQ@mail.gmail.com>
In-Reply-To: <CAJN1KkygDrGPzJj4nobS-ZFSRqP+g9LQ49tbcLA8V7KvPhfYOQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Mar 2022 23:04:48 +0100
Message-ID: <CACRpkdaks_R11d6+LS7ER6KgS2uupO3xLunH1CxfoMiJtc2qaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: kirkwood: Add Ctera C-200 V1 board
To: =?UTF-8?Q?Pawe=C5=82_Dembicki?= <paweldembicki@gmail.com>
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

On Tue, Mar 1, 2022 at 9:32 PM Pawe=C5=82 Dembicki <paweldembicki@gmail.com=
> wrote:

> It has a fan controlled by the lm63: PWM controller.

Aha it is one of those combo things, sorry for my ignorance.

>  But the fan blows
> only on disks, board temperature won't change even when PWM =3D 100%.
> It should be controlled by hdd temperature.

We have a way to even monitor the temperature of individual hard disks
these days and I create a thermal zone and use it here to control a fan
in this DTS:
arch/arm/boot/dts/gemini-dlink-dir-685.dts

Yours,
Linus Walleij
