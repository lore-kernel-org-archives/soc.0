Return-Path: <SRS0=mIJF=DF=gmail.com=james.hilliard1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB5DC001B0
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 22:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E90D5C433CA; Wed, 19 Jul 2023 22:43:56 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05734C433C7;
	Wed, 19 Jul 2023 22:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05734C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1b0156a1c4bso120166fac.1;
        Wed, 19 Jul 2023 15:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689806635; x=1692398635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjiDxr1nXNWtgDkK1YQqGF6vepU1fThitQZLPVNjH2s=;
        b=a8EWUNEHbKaI2dWxEqqYHcy/MKh86lVXbPCclaaJYYp806S+gH8Jdbs96/7PTzqi2L
         tHPid87EpJFcmnP4oQoZsjRFcD8LjsyB341jJFJ9BhgxOXSdh8mXz92qvMcpFcJimns4
         9Z4JMDsG3VDmU5JD5XatuR7T9VBlUgrltpFgZ7CZ7p/rolqw14gUxaW1bUA/ZS4qcBiP
         GDBDsEMdtvd7nCbtDovAy5FVquILzVsEjwcrRMOh8x/4V+Kp+kufoBC3wAuJJDeZJzIw
         MSnNjoBQN1rYWJNqAR8Rvdfj7oGnCm3f2b1fu1VNsebjjxZgRjqlH/kfKuWGpEJ/5Thw
         90Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689806635; x=1692398635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjiDxr1nXNWtgDkK1YQqGF6vepU1fThitQZLPVNjH2s=;
        b=B0fQRmle0NY7X96CpnfVeDtCjctYut9lCOtpxQN0QXogIyzsa/SjYeLAaRqHs0TLro
         MhCgENw8LJjn6FCQCyZL7WRS0jn5OL29wgxsyoa/fjx/PD9esXVPD5iz+cdmDE2BSqgy
         GWtPazIcgy1mxhRtHqedxQXUGWNWzyTeAdehfSJbIMEHVQLazW4bNFussp+n+DXQwsMz
         G0LspVOKdZQj3Kq8qLjlobipeYWuYd2t9n5HbqaeuaFzkmUe8Ef/nRYW4capmSdGk5JC
         7e7a7nVLQ19BYUVDmZE18qI6yfk4WjyJp/Lu7z6SC/b9J/0ZByFPAGth9lgLft57dcYE
         bX5Q==
X-Gm-Message-State: ABy/qLZCLFi3+fvWfClSUKFnfIEL6JHd4ziaoq9zdZVWNLA2CVvfQCdA
	fIuJmltprZCf+G7onK7qOneeP1E4cHfUXmKGmSo=
X-Google-Smtp-Source: APBJJlHtF6KGL5L0+PSVX0OP5opYr3x6DMPcTKzipI2nqzUGgLF8+FRWshPhjFrk7vPcMCTrp/4gWmbm64g2U+reWWg=
X-Received: by 2002:a05:6870:7022:b0:1a9:8606:dfcd with SMTP id
 u34-20020a056870702200b001a98606dfcdmr897051oae.0.1689806634818; Wed, 19 Jul
 2023 15:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230719160048.2737423-1-james.hilliard1@gmail.com>
 <20230719160048.2737423-2-james.hilliard1@gmail.com> <CAOMZO5C_BFm+P=9uizL0buSJ9a33PM6hNgG5OcZ3B4YxD=h_6w@mail.gmail.com>
In-Reply-To: <CAOMZO5C_BFm+P=9uizL0buSJ9a33PM6hNgG5OcZ3B4YxD=h_6w@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Jul 2023 16:43:42 -0600
Message-ID: <CADvTj4piksWhua5W6CMr3ZpkRJcFvR=545hsQhW16KL4gQb4pw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: Add Variscite MX6 Custom board support
To: Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 1:32=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> > +
> > +               pinctrl_ipu1: ipu1grp {
> > +                       fsl,pins =3D <
> > +                               MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_=
CLK      0x10
> > +                               MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15   =
         0x10
> > +                               MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02    =
         0x10
> > +                               MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03    =
         0x10
> > +                               MX6QDL_PAD_DI0_PIN4__IPU1_DI0_PIN04    =
         0x80000000
>
> No 0x80000000 please. Use the real pad ctl value instead.
> This applies globally.

How would I determine what the value of these should be?

The vendor device trees are using 0x80000000 for these values from
what I can tell.
