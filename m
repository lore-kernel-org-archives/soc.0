Return-Path: <SRS0=mIJF=DF=gmail.com=james.hilliard1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE78C001DE
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 20:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 845B5C433CB; Wed, 19 Jul 2023 20:05:13 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 770E2C433C9;
	Wed, 19 Jul 2023 20:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 770E2C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1b0249f1322so23731fac.3;
        Wed, 19 Jul 2023 13:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689797111; x=1692389111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzA46Lk2UXF11sprTNDhbjiZv+TKiXPilVyGd/tnrZs=;
        b=qo+h+TGhjzhpvyATm8i6Z9UqhupRzO1vwYEMVJGZ3+fWc+AvzxBwJ8Ayiv58L/wSWy
         H4lbuzsN6JTwUBlCjEz8lYcfOkraayGve9ULbNxwS46A7Cd7GtOJD4zxu6UDCAK4GbW7
         0tb7oWnlKZBuFtWj102mIroQ/oyIPlqyiSUvGweXt1A5mYSAxhwATnmDTktYNSfFMszw
         4bsQo2LtBzaIFQUmDkylP80wB0q4TmvBXxJgRseELbdn7V1WEL/cQZGzH3WyxchDhAG7
         GjxkskISt6wdp2tepe/SmtBDx6xxkDZosq8qyFTz0Ru2th1kIVNZ2sTgziodBLsscg+z
         LOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689797111; x=1692389111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzA46Lk2UXF11sprTNDhbjiZv+TKiXPilVyGd/tnrZs=;
        b=LIgCgpdAcw0Mad55+uDXvXGvSss2566NaznqI4FAwCfw4/Ghn05Fb9XxPMQ0olNr8T
         Xv1vyhXYejRuboHSuXj8DNLwVvFxzkEaq29kRs+GrQiKLb2E/Oey/QRoCjhmwWdxPkoL
         pt7vvbWSj4Yi2u7flOvh2ty0WHV7I4ez2BaFgOmmVx5AY9q5WSh6BhFzfMEP7sV0XUOi
         hpJ4IOrn/L2geQZxFMVtiiCaLkAGUyRbl8Xk11kHffHn6ZsKO8vxOHjx9JzSeJMHzdkP
         +TXpcERxQwq6ePIHrdyXDl0gjknHt5zjsbjATlqZSeRnq9qfOOBoxMzJvwraJpGpsS6z
         WRlg==
X-Gm-Message-State: ABy/qLYW6WHHpeWiTyINAKZH+67a90IrPuMMDe1DrURf0P0fyU+25IWR
	Q6ssFRxItyyXpm7fdjkif54syhD/31297uKryxk=
X-Google-Smtp-Source: APBJJlHAlTSJ110yNHkRqVUIwD0OPnA3aK9Ibuy17pZQK3cmfgDVCyDcL1GULmIlB2lGI2LeDhV5iPaInFr29yZEVJk=
X-Received: by 2002:a05:6870:5493:b0:1ba:6180:ff47 with SMTP id
 f19-20020a056870549300b001ba6180ff47mr3702650oan.21.1689797111224; Wed, 19
 Jul 2023 13:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230719160048.2737423-1-james.hilliard1@gmail.com>
 <20230719160048.2737423-2-james.hilliard1@gmail.com> <CAOMZO5C_BFm+P=9uizL0buSJ9a33PM6hNgG5OcZ3B4YxD=h_6w@mail.gmail.com>
In-Reply-To: <CAOMZO5C_BFm+P=9uizL0buSJ9a33PM6hNgG5OcZ3B4YxD=h_6w@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Jul 2023 14:04:58 -0600
Message-ID: <CADvTj4ptXGo8bcZ65hq-JzOpJdwsV1JwTO8c-=ziLtbeZD4A=Q@mail.gmail.com>
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
> Hi James,
>
> On Wed, Jul 19, 2023 at 1:01=E2=80=AFPM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > This patch adds support for the Variscite MX6 SoM Carrier Board.
> >
> > This Carrier-Board has the following :
> > - LVDS interface for the VLCD-CAP-GLD-LVDS 7" LCD 800 x 480 touch displ=
ay
> > - HDMI Connector
> > - USB Host + USB OTG Connector
> > - 10/100/1000 Mbps Ethernet
> > - miniPCI-Express slot
> > - SD Card connector
> > - Audio Headphone/Line In jack connectors
> > - S-ATA
> > - On-board DMIC
> > - RS485 Header
> > - CAN bus header
> > - SPI header
> > - Camera Interfaces header
> > - OnBoard RTC with Coin Backup battery socket
> > - RS232 Debug Header (IDC10)
> > - RS232 DTE
>
> Good, but what exactly has been tested?

Well so far the basics such as the screen/networking and such seem to work.

Tested with:
https://www.variscite.com/product/evaluation-kits/var-som-mx6-kits/
Part number VAR-DVK-MX6_V2-PRO

As well as another custom PCB with a very similar design using the SOM.

>
> > Product Page : https://www.variscite.com/product/single-board-computers=
/var-mx6customboard
> >
> > The dts file based on the ones provided by Variscite on their own
> > kernel, but adapted for mainline.
> >
> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Is this patch from you or Gregory? If Gregory is the author, then his
> name should appear in the From: line.

It's from me, the original(seemingly abandoned) patch was from Gregory on t=
he
mailing list which I have been attempting to clean up.

>
> > +&iomuxc {
> > +       imx6qdl-var-som-mx6 {
>
> This ' imx6qdl-var-som-mx6' should be dropped.
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
>
> &mipi_csi {
> > +       status =3D "okay";
> > +       ipu_id =3D <0>;
> > +       csi_id =3D <1>;
> > +       v_channel =3D <0>;
> > +       lanes =3D <2>;
>
> These are all NXP vendor devicetree properties. They do not exist upstrea=
m.
>
> > +       lvds-channel@0 {
> > +               fsl,data-mapping =3D "spwg";
> > +               fsl,data-width =3D <24>;
> > +               status =3D "okay";
> > +               primary;
>
> This property does not exist upstream.
>
> > +       lvds-channel@1 {
> > +               fsl,data-mapping =3D "spwg";
> > +               fsl,data-width =3D <24>;
> > +               status =3D "okay";
> > +               primary;
>
> Ditto.
>
> > +&usbphy1 {
> > +       tx-d-cal =3D <0x5>;
>
> In upstream it is called fsl,tx-d-cal.
>
> > +};
> > +
> > +&usbphy2 {
> > +       tx-d-cal =3D <0x5>;
>
> Ditto.
