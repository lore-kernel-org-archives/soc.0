Return-Path: <SRS0=mIJF=DF=gmail.com=james.hilliard1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A3C001E0
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 19:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94EE6C433C9; Wed, 19 Jul 2023 19:11:47 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7A4BC433C7;
	Wed, 19 Jul 2023 19:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7A4BC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1ba79f16f4cso3389082fac.3;
        Wed, 19 Jul 2023 12:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689793905; x=1692385905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yawocYEJ44V0eHQLJuZe86F3h3cwFvu38nD+qkGCl5c=;
        b=DJiOlhEE2RklGMQv2eKPVbLCkXO6As3b59Rcyp/9poyvIj9TAGmk/6sarD2QgdiNRr
         GjJeGLxJe8lKoFEH+Un3VclURyZv4CA1p8x3VMGZgb+31HuEdFrpMvICI3qw/hgMLW51
         mpySn2hgHj765/TGFJf7KQCZQrrVqmi/OoGh2LyqoUaNmW82N0k7fIwqPht0YWKIS3wi
         gmqe4bTkhnSDM/LTBLV2oPw95NCQsPlzGhxW0Joq7ZEpUwS3FxhNInraIriMpQMbbcAj
         t/8O3Gz94cV7pCW8X1Qvns7q6dcTTxnfi8LHyVbtVaFm9jERpJSMtQ4nwEdl1c9S7pqd
         1TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689793905; x=1692385905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yawocYEJ44V0eHQLJuZe86F3h3cwFvu38nD+qkGCl5c=;
        b=Q7cf0kBaKBSUSDKuorSKOCyiLtZ9yVoqTM4EEK4VKWzdUzYGulJ4YW4LP5Zw8Trkwf
         zKVMwm/5A4o6C4FmYWY2lB1E4RsVEapFDd5fAPagzQRoZpM7QDZzZmGMO2ASGbxknM44
         EZfJrui7colDlV1XrqChUjagoPJT0nCrfnRbJSE4miRzsHdBtBN1YjKWmvXc099qH5t+
         S+0ZGqVpOjUKJuxtXjSTnkfXmuDkFXJbdhn3/4zxDPAUNKcuSlfhlf50UUPcEvyxxflj
         ikheT7Yg4ZswhGyukD7cBFBUfbYJ2YCPRxXsTbzUqM8mOGrm7W9XShpehRBswY0X59sM
         hNog==
X-Gm-Message-State: ABy/qLYNFO+HTZvFkQlH7S7GU5VBYz9yNBiNoRpNVPvrjp5qY7yaaxYn
	Stnej9JxaG2LmBsh/mAbHXV8+Sz4L6WxL7LrnnY=
X-Google-Smtp-Source: APBJJlGptWfcIcTTronFnKnMMIshwN3gP7pSWP7bAHwZjMet49AEuwP+SHndRnhbKpqCIKbb2NIUYsTAA7pI+BqUwgE=
X-Received: by 2002:a05:6870:8a1f:b0:1ba:df9e:f2e9 with SMTP id
 p31-20020a0568708a1f00b001badf9ef2e9mr1845566oaq.0.1689793905589; Wed, 19 Jul
 2023 12:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230719160048.2737423-1-james.hilliard1@gmail.com>
 <20230719160048.2737423-2-james.hilliard1@gmail.com> <15268646-a38f-f530-4c04-1164617d2b25@linaro.org>
In-Reply-To: <15268646-a38f-f530-4c04-1164617d2b25@linaro.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Jul 2023 13:11:33 -0600
Message-ID: <CADvTj4oPjGZzjJzjRNXprF1Nz9Hmn=Qs+s=0cke5e3Lb27YLFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: Add Variscite MX6 Custom board support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 11:18=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> > +
> > +&ldb {
> > +     status =3D "okay";
> > +
> > +     lvds-channel@0 {
> > +             fsl,data-mapping =3D "spwg";
> > +             fsl,data-width =3D <24>;
> > +             status =3D "okay";
>
> Again, why do you need it? Is it disabled?

I think so?
https://github.com/torvalds/linux/blob/v6.5-rc2/arch/arm/boot/dts/nxp/imx/i=
mx6qdl.dtsi#L87
