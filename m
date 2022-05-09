Return-Path: <SRS0=ZukV=VR=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10A6C433F5
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 15:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DD14C385B1; Mon,  9 May 2022 15:06:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA95FC385AE;
	Mon,  9 May 2022 15:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA95FC385AE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id n6-20020a05600c3b8600b0039492b44ce7so1460187wms.5;
        Mon, 09 May 2022 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vtuult+HXOI7ZtF/5BeS7qYq/jPa50ON+a9bpjtA634=;
        b=pgM6nmm4hymS4A6ysjr+inu879QqK9kEaxseJfecvNfSf4ksYX99cBKbLO7yZcX74J
         pCs2urfaw5fX7fzbhoP08fziLPQBtjnpysD0YFKqjJLmEX9+7bqcu9nA6PIgu0tGaV10
         MqFL/WtRVB3uzsGeNxl+6a3yI0dSnhg7Oa4OtMrf5386cfuk1W04xtIWEQxJcc4Nli1h
         tgE80prFkmOwQHvwiE6ZYBIDTV5eyRbtOevjK/XSqcyhk2ubQITMCub4UPYXjfcyrxjx
         WvPWpKu/L3AHeuJENWieIn8T8f3z2sufVz4K1ETqWwVeNrgW2Vfw1OP6c1o3NNlkEpQ8
         IORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vtuult+HXOI7ZtF/5BeS7qYq/jPa50ON+a9bpjtA634=;
        b=CO//WwlOXuu8e5xQArnqqUAz05QVe41FYnsrpUxB5I6t96nJIZfb2+TPbXAKY04S8a
         Jly2osHQwJlyANdBLIcegpg1baTOBT81zTPql7h34I7BrOpNHZTzr9dBA0e01msamJhs
         oIxcfRLEaK/9KdpsYJJ9paOLPtqTdXHfrxRURAVZxJFZ3Pz/dvllsGDd7u3zIpjkc5gY
         E5y8YNRm0p4JrFGDHqSAPpQCnz2Wd33EUfhlhODmFEMqCNRGXlPL88gdpk2H5fXYrTrE
         oYAypGsPQJl0KP6DZHg18NhYP1dTun92yki2kbGyfp86jcBcLlcw7amjvjqAbRmJymJA
         qZfA==
X-Gm-Message-State: AOAM532xXrqHjtJInZEnEaz4orkc1cfCske3zUbR7B4Q4SOOhCNf61NE
	H+A3/tKvXLe+LDieOziJ/0Y=
X-Google-Smtp-Source: ABdhPJzd2YKTa7mT7VfKRjs9oRnYPy836QDekr6iO5gL5PTiA2RYsK898fSfq3OMC/h7EM4qRoeb2g==
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id z21-20020a1cf415000000b0037fab4d1df2mr22572130wma.75.1652108786180;
        Mon, 09 May 2022 08:06:26 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id y14-20020adfe6ce000000b0020c5253d8bbsm11230631wrm.7.2022.05.09.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 08:06:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Subject: Re: Re: [GIT PULL] Allwinner DT changes for 5.19
Date: Mon, 09 May 2022 17:06:25 +0200
Message-ID: <2368089.jE0xQCEvom@kista>
In-Reply-To: <CAK8P3a3ePzJbh3p9edaDfZhZoYc=0-GvFCs3+2oLGjSoAhgvhw@mail.gmail.com>
References: <YnVUmSLE1MZFkApt@kista.localdomain> <1789096.atdPhlSkOF@kista> <CAK8P3a3ePzJbh3p9edaDfZhZoYc=0-GvFCs3+2oLGjSoAhgvhw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 09. maj 2022 ob 16:21:29 CEST je Arnd Bergmann napisal(a):
> On Sun, May 8, 2022 at 10:52 PM Jernej =C5=A0krabec <jernej.skrabec@gmail=
=2Ecom>=20
wrote:
> >
> > Dne petek, 06. maj 2022 ob 19:02:17 CEST je Jernej Skrabec napisal(a):
> > > Hi!
> > >
> > > Please pull following DT changes for 5.19.
> >
> > I missed one patch, please disregard.
>=20
> I had already merged this one, merging the new branch on top, while editi=
ng
> the merge log to not mention the duplicate commits. You can always follow=
 up
> with additional changes based on a branch that is already merged like thi=
s=20
one.

Ok, thanks! I'll follow up with new PR next time.

Best regards,
Jernej

>=20
>         Arnd
>=20


