Return-Path: <SRS0=r9aA=DF=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B181C001B0
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 19:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7018C433C8; Wed, 19 Jul 2023 19:32:34 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5ADFC433C7;
	Wed, 19 Jul 2023 19:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5ADFC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-55b78bf0423so410513a12.0;
        Wed, 19 Jul 2023 12:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689795153; x=1692387153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgIpzoU0VyQgL0NkVcRHfS3NqAECcKE/nlvXM/xlG+M=;
        b=h/Rc6xYRpJRL80HYp/Qg/Vf5WIp3rIkulUvx5EI0vtSzDl5SuUL5lXqyJTmlvq/Drg
         nGmkeNdHbOnfPBs0pHIoGxMpMm++ePmxrF0txPoCrIvQoj8g+1ZkkT860MrA6Mex/a9z
         Rez08BJTdM0buF9FOhAdvyTkIb31qJ/x9R357vJz2yUkYRmksEuwrg64aOsHMhb+1S5F
         oOFU3NexOR4rdOCmxJ7yHjhCdLTaTmnkAGATqTd0C5v0C/ot3DXmMujQYq2n1DUyW/vZ
         LVlaC5GroqcdfmbIZotE9X6NqlunqYQ4wPeQkeydIJCPMNYAm49Z+ajt2vnGL34F8lWI
         Ejaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689795153; x=1692387153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgIpzoU0VyQgL0NkVcRHfS3NqAECcKE/nlvXM/xlG+M=;
        b=NA2bfrNNqL9o5f0hKohxlO9ebkq0Y4UyxsjzsKFCR2imAkSVafG1iPjuCF/c/cUfRq
         5Psk5Z4q9PVrsqNdZedzAFKfd+NRKgfRKRzPG+vNGCyEt3uzNxnWxQOHuwi2EDiX13Lg
         8/ZGKvFietkzCmX+vF6OuxUCCNS9K4/i+93i1+deKM0ibIqwviKP9RYgLLj8JI5L+ssT
         lzOrP1YLavXIT9F9gx2sZh9Hpwf0G2VQPkf0g6MieK8k+8YWC/UD5eySqBRu1G2MZlei
         eh3JFGAqyBhc3cIy89cmZDqRG8Ux7Ng0EfLM8hxUdKfRSc/vVmCcgimhFQiAV112IOrp
         SKww==
X-Gm-Message-State: ABy/qLbw8NgubVB0/syzZglKUSM8T78qjQlil+J28lX/yZOfBjJlyWdo
	9jrHHGYrIlyjq4eYGQQO14si9YhsmMJH+lwwK4g=
X-Google-Smtp-Source: APBJJlFQl3zbsRGAKqJGd4h0afkfwXib7FZqWkCfiL9xu+3C9/loC7Gq+fzEIDjgESruY8JcSm6o30/KrThsBUyIdYA=
X-Received: by 2002:a17:90a:3e05:b0:25b:88bc:bb6b with SMTP id
 j5-20020a17090a3e0500b0025b88bcbb6bmr193123pjc.2.1689795153073; Wed, 19 Jul
 2023 12:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230719160048.2737423-1-james.hilliard1@gmail.com> <20230719160048.2737423-2-james.hilliard1@gmail.com>
In-Reply-To: <20230719160048.2737423-2-james.hilliard1@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Jul 2023 16:32:21 -0300
Message-ID: <CAOMZO5C_BFm+P=9uizL0buSJ9a33PM6hNgG5OcZ3B4YxD=h_6w@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: Add Variscite MX6 Custom board support
To: James Hilliard <james.hilliard1@gmail.com>
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

Hi James,

On Wed, Jul 19, 2023 at 1:01=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> This patch adds support for the Variscite MX6 SoM Carrier Board.
>
> This Carrier-Board has the following :
> - LVDS interface for the VLCD-CAP-GLD-LVDS 7" LCD 800 x 480 touch display
> - HDMI Connector
> - USB Host + USB OTG Connector
> - 10/100/1000 Mbps Ethernet
> - miniPCI-Express slot
> - SD Card connector
> - Audio Headphone/Line In jack connectors
> - S-ATA
> - On-board DMIC
> - RS485 Header
> - CAN bus header
> - SPI header
> - Camera Interfaces header
> - OnBoard RTC with Coin Backup battery socket
> - RS232 Debug Header (IDC10)
> - RS232 DTE

Good, but what exactly has been tested?

> Product Page : https://www.variscite.com/product/single-board-computers/v=
ar-mx6customboard
>
> The dts file based on the ones provided by Variscite on their own
> kernel, but adapted for mainline.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Is this patch from you or Gregory? If Gregory is the author, then his
name should appear in the From: line.

> +&iomuxc {
> +       imx6qdl-var-som-mx6 {

This ' imx6qdl-var-som-mx6' should be dropped.

> +
> +               pinctrl_ipu1: ipu1grp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CL=
K      0x10
> +                               MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15     =
       0x10
> +                               MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02      =
       0x10
> +                               MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03      =
       0x10
> +                               MX6QDL_PAD_DI0_PIN4__IPU1_DI0_PIN04      =
       0x80000000

No 0x80000000 please. Use the real pad ctl value instead.
This applies globally.

&mipi_csi {
> +       status =3D "okay";
> +       ipu_id =3D <0>;
> +       csi_id =3D <1>;
> +       v_channel =3D <0>;
> +       lanes =3D <2>;

These are all NXP vendor devicetree properties. They do not exist upstream.

> +       lvds-channel@0 {
> +               fsl,data-mapping =3D "spwg";
> +               fsl,data-width =3D <24>;
> +               status =3D "okay";
> +               primary;

This property does not exist upstream.

> +       lvds-channel@1 {
> +               fsl,data-mapping =3D "spwg";
> +               fsl,data-width =3D <24>;
> +               status =3D "okay";
> +               primary;

Ditto.

> +&usbphy1 {
> +       tx-d-cal =3D <0x5>;

In upstream it is called fsl,tx-d-cal.

> +};
> +
> +&usbphy2 {
> +       tx-d-cal =3D <0x5>;

Ditto.
