Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBA3C433B4
	for <soc@archiver.kernel.org>; Thu, 13 May 2021 03:40:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BCB6D61421; Thu, 13 May 2021 03:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A518E613FC;
	Thu, 13 May 2021 03:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620877211;
	bh=/Z3ZsC9rjLJYlaHrIESz3z1PcCsLIZtNc3hRRQinbpo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=V6+w7Z/RMSyJLvsrnbqkxN1nDuc63u0jRnx7uZ2ZIvmijli3nFDGhT0Xf3oe/GyU1
	 JJJSg4AKaLPzTvvhBlteknlwseSb012b8suIzhVG5jjKmxezsBMpIpobzN39SCl6v7
	 h6G3uCON4RDZwRsLOyHpnj0KNlLTR19R6PiDHrkZLrWoyH771Sqb/mgq/hqBbh3o+r
	 WsTKXZgGcWbOh7sgwDhJa+8oCJW/0H/U16jcuI9jYZe+jh7MUje0vrO67aCam1A4q9
	 S26SNTqYKWO74X0LpnzpsPgqxgWU1bjZmipRT2Md4st41YNwB54fQLzuEUQhLk9393
	 8b5Dl314ABHkg==
Received: by mail-oi1-f175.google.com with SMTP id j75so24171522oih.10;
        Wed, 12 May 2021 20:40:11 -0700 (PDT)
X-Gm-Message-State: AOAM531YKhA/8KOvFKzF3wze/FOZGRxEP/CYHskymWVlZTAWSuPnKtBg
	n/qyoA3WzgeM1TOIEpSIqRT0bRSNIxlAm1btjmI=
X-Google-Smtp-Source: ABdhPJwcwtRAr0oZXrAx2M2bBEyduqWP0+i20vscS5lDLyNr4S3gsDmq0dYMWxo4mvltVdjrUw1EUj4TApscAPYusf4=
X-Received: by 2002:aca:d658:: with SMTP id n85mr16261397oig.80.1620877211016;
 Wed, 12 May 2021 20:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210409122036.31628-1-lukma@denx.de> <20210513033631.GL3425@dragon>
In-Reply-To: <20210513033631.GL3425@dragon>
From: Shawn Guo <shawnguo@kernel.org>
Date: Thu, 13 May 2021 11:40:00 +0800
X-Gmail-Original-Message-ID: <CAJBJ56K1SsaAFDTaOr-b2shDayYJnoMCeHdcHw85FunwKPfcjw@mail.gmail.com>
Message-ID: <CAJBJ56K1SsaAFDTaOr-b2shDayYJnoMCeHdcHw85FunwKPfcjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx28: Add DTS description of imx28 based
 XEA board
To: Lukasz Majewski <lukma@denx.de>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 11:36 AM Shawn Guo <shawnguo@kernel.org> wrote:
> > +/ {
> > +     compatible = "lwn,imx28-xea", "fsl,imx28";
>
> Compatible needs to be documented.

Ignore this comment.

Shawn
