Return-Path: <SRS0=I5yJ=E5=chromium.org=wenst@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B37CA550A
	for <soc@archiver.kernel.org>; Wed, 13 Sep 2023 08:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06320C433C7; Wed, 13 Sep 2023 08:49:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65A8FC433CA
	for <soc@kernel.org>; Wed, 13 Sep 2023 08:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65A8FC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-501be2d45e0so11107281e87.3
        for <soc@kernel.org>; Wed, 13 Sep 2023 01:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694594986; x=1695199786; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6OWBjAU1cxgbQTAWQU05/QpiwZ7u1WWxVUcWDMnlOc=;
        b=EueqT2aFQQJVrb5NQimd8dNRp+B+4+8naYgfvbnnoxC30h8iTyoVu8l0gDCyzt/hXc
         Oh3V885y+aKUsE7Ha8XfDk7sLY8sAaqWSrIfwC6Ua1L/eW8nqLrw3Y8WT2Vdi9JVP0i4
         fMgpVVyKF4dAuILI0QMWT7sQz7ni0BB5JnU/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694594986; x=1695199786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6OWBjAU1cxgbQTAWQU05/QpiwZ7u1WWxVUcWDMnlOc=;
        b=tgdoCy+3KDQyna77lLfU2kpUPzQ6PvbgX8M5L6KQXsuo8oUcAGl/CI5ggMpPVsWhSU
         xVb4gxkyZp9FIji13Cq0z0whFmYeJlorGxtp3tCZv6TH2dwwo1oVVgZMZzEx1gOrYKvv
         YFTahBO/vsgVe4SBrSB6jt3YSkFs8/H82Hjox3t5ScE/jsVQbevMSu43vns4YFCRAuqm
         2Qyw2Bgf8GEpUHFYXN1CQ+Aeq0cWZ4m78QF/9aMqpks8eVDYKsYTTI2wOsGZ+BSxhvCw
         nGNsmb/uqS0qS5F4MZgmcRS7US4BEoZr1sCEMTLlV0+NWfy/P0CNb+yMf/vkZtgRlpg0
         owmg==
X-Gm-Message-State: AOJu0Yy6g+G1dYEEev08JJtmue+ds7W2xVEMZ3fAjFW4KClN2PNkSEId
	mF+u3wgu+YaTc2IsIQFN7jMQ4A311J7atTREJe6rOQ==
X-Google-Smtp-Source: AGHT+IF326eu3RL07fH01eFNOizyYWT0naK68BbkFy0V0EwYECudUIkcOek+Rh5jKTj4V8DX9iBXAl4EHd5E1HbBXZE=
X-Received: by 2002:a05:6512:32aa:b0:500:94c3:8e3b with SMTP id
 q10-20020a05651232aa00b0050094c38e3bmr1304740lfe.57.1694594986120; Wed, 13
 Sep 2023 01:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230804225813.12493-1-robh@kernel.org> <f8759d51-f808-8082-ceaf-6c6dcaebe2d9@collabora.com>
 <4c99c180-3b79-6aef-6ff2-d430e575957d@baylibre.com>
In-Reply-To: <4c99c180-3b79-6aef-6ff2-d430e575957d@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 13 Sep 2023 16:49:34 +0800
Message-ID: <CAGXv+5FWhEab_wHs9+Q3begEBXCVrE4fK1S3sntDuRRE9iGFpg@mail.gmail.com>
Subject: Re: [RESEND PATCH] arm64: dts: mediatek: Fix "status" values
To: Alexandre Mergnat <amergnat@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 9:10=E2=80=AFPM Alexandre Mergnat <amergnat@baylibr=
e.com> wrote:
>
>
>
> On 12/09/2023 14:54, AngeloGioacchino Del Regno wrote:
> > Il 05/08/23 00:58, Rob Herring ha scritto:
> >> The defined value for "status" is "disabled", not "disable".
> >>
> >> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> >> Reviewed-by: AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com>
> >> Signed-off-by: Rob Herring <robh@kernel.org>
> >> ---
> >> Arnd, Please take this directly I guess. I think Mediatek maintainersh=
ip
> >> needs some help. Maybe AngeloGioacchino should be co-maintainer as
> >> that's the only response I seem to be getting.
> >
> > Sorry but I've seen this message just now as I've been on holiday in
> > August.
> >
> > Thing is, the MediaTek scene is starting to see more and more code,
> > bringing
> > an obvious increase in the amount of reviews to be done and in the requ=
ired
> > efforts to maintain the MTK bits - and we will possibly (hopefully) see
> > even
> > more of that.
> >
> > If Matthias needs/wants a co-maintainer for MediaTek I'm here and I wil=
l be
> > proud to become one.
> >
> > Cheers,
> > Angelo
> >
>
> I started reviewing MediaTek patches for some months now, so I'm still
> new. From my PoV, I'm agree with Angelo when he say the amount of patch
> is increasing. I support Angelo if he wants to become a co-maintainer
> and continue to do my best to review patches. ;)

I might not have enough time to do a lot of reviews, but if help is needed
for administrative tasks like queueing patches and sending pull requests,
that's something I can do.

ChenYu

> >>
> >> I think for future .dts patches I will not bother splitting them up by
> >> sub-arch because it's a pain to chase down the maintainers to apply
> >> stuff in a timely manner. /rant
> >>
> >>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> >> b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> >> index e4605d23fdc8..86cedb0bf1a9 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> >> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> >> @@ -585,11 +585,11 @@ &pwrap {
> >>   };
> >>   &sata {
> >> -    status =3D "disable";
> >> +    status =3D "disabled";
> >>   };
> >>   &sata_phy {
> >> -    status =3D "disable";
> >> +    status =3D "disabled";
> >>   };
> >>   &spi0 {
> >
> >
>
> --
> Regards,
> Alexandre
>
