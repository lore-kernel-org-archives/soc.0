Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1684FC27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 11:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 086A5C4AF1D; Mon, 17 Jun 2024 11:02:31 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C00CC2BD10;
	Mon, 17 Jun 2024 11:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C00CC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so44674421fa.3;
        Mon, 17 Jun 2024 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718622148; x=1719226948; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBNPAyKM/9VjbtdhIX8js16gxPGL5iqO2JAeZzYJsj4=;
        b=Rvl3qFnheM+tzEMuxCzVEWrLFW34S3INc+SGqfrMT0++DrSeyfg7kNb0CVFxWaU6Tf
         t3vUFrQQQOpUv4TBhgFRhNzPKu/D2tI1qrpNpLE4zyHRIOSOjD5cdIXNEDVDWodmb8DE
         CBjt1TeitksHM4BLdptUnS6+wrhhkHWSzUoA75aqdX8x4P3atjjhQ7y1CgHDcbImAZhm
         IxO2Il9nhiY7LTpzY67JBdKoUuf3RoBYdomtw0d+9xRATKARrIv9gJqPMSyN9a+YqWEA
         CM56K1uvOckHn5SY+9BzB3QXiU49WVivMzTxvSZcOKXtZb7ZuH+bwPgHThLgiqk0Llh4
         PMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718622148; x=1719226948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBNPAyKM/9VjbtdhIX8js16gxPGL5iqO2JAeZzYJsj4=;
        b=WOfeCDGPqUbXsiSlxPXdFz85cxmplCAkU44Mdod/PgF1YEDgWJ7/6LhlEocBIXwpIk
         AH2vPowbjKVcwG73arlrp76LVJeZI6GTb6AqWUEOuQOVwq0UVGxnU+KhNp6H9ODggiXg
         mTNBexZWoM9ADTUqW4D0aZbPjdVuW2/Q+QaTdSH+zX14E0kN1L/xTIBgIvbY51H+63q7
         XfAGh/366SQlKoslcs+PYzf+gf/k3rwDW6shTOTjaDB85AIpOe4ChEtf6E/fWb2qj8K3
         EWGf1goHawPGhyaaJ+qG3rryr66ql4kHot4f72DlgSie1TcIzZ3GmYsmaFU34KzLAYuV
         dxXA==
X-Forwarded-Encrypted: i=1; AJvYcCV4JcmzWbh3mKDaDIWPtxvlmtID/waBbtXkaAgDD9vQsX1rSp8++71Ib1tVQaD1aHN6ZTVrxL7g1FvMqjgu2b4jhK7cfuf/ZJYoHVM2DEuM1MVYi+YvWMKZRPUULNqhkQ==
X-Gm-Message-State: AOJu0Yz1e4rkFVUf+cI5vvnJXJmY+vlML692M/nH8r0Yt2BJRhVVMgL8
	gwFrMG0q+Dk3vUtLljLGDiF3RbYVW/yT0IkfjS6xBDKbyr5JoMuiSWE4ZRcsb6UGszXxzq8jgVp
	zCfj4zYngL7RcPnqin2eXrbcO6m5Ng7XpO+4=
X-Google-Smtp-Source: AGHT+IEpUM+NqyBMCg/W5YQAexQFKWnxwc7nFPb8G8nUJkgqbn89pUovtraTCWHja4cPMrBkRe85YXh+DFlWSrRJ/sE=
X-Received: by 2002:a2e:7217:0:b0:2ec:e08:8b49 with SMTP id
 38308e7fff4ca-2ec0e5c586fmr58831971fa.19.1718622147556; Mon, 17 Jun 2024
 04:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240613161045.29606-1-kabel@kernel.org> <20240613161045.29606-4-kabel@kernel.org>
 <CAHp75VeRjddGOG72dkH7pvrebA2-BkzrEH2ZBk0s8Xtk-bD1ew@mail.gmail.com> <20240617125758.05bd5208@dellmb>
In-Reply-To: <20240617125758.05bd5208@dellmb>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 13:01:48 +0200
Message-ID: <CAHp75VdwFYpnx4VnU448tLwer2WC6xZpTN1ob5_vwwrSh9T67Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/17] firmware: turris-mox-rwtm: Use macro constant
 instead of hardcoded 4096
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 12:58=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:
> On Thu, 13 Jun 2024 19:51:56 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Jun 13, 2024 at 6:10=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.=
org> wrote:

...

> > > +       if (max > RWTM_DMA_BUFFER_SIZE)
> > > +               max =3D RWTM_DMA_BUFFER_SIZE;
> >
> > You probably want max() from minmax.c.
>
> You mean min() :)

Right, or even clamp().

--=20
With Best Regards,
Andy Shevchenko
