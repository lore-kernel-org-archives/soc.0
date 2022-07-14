Return-Path: <SRS0=ScWV=XT=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B55EC43334
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 15:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 112C9C385A2; Thu, 14 Jul 2022 15:46:15 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52BB5C3411C;
	Thu, 14 Jul 2022 15:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52BB5C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id va17so4233023ejb.0;
        Thu, 14 Jul 2022 08:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=adLCRjyG9ql2dpnI6XTEKDQmCPOfQAuHG5SMH18mDPM=;
        b=GUjfArcxHRm0/PWidPnP5+up2cPSBhcf+NbNQJSDjl35v8MRismPbEPQE+JFGwEe9S
         p6PbGP2SmmrNCjVsXkLsEYF9SyyPm+epMA490reQCc7WGu+er60puPqonmvwKGyiq2p2
         E48rZ2jY6DJZnu8aKHuWLJV0H4PMaQWLV5U2LOgXNxQMssGGsgWAoeB6odtN+sV99+Kx
         5tDhGoeMsUnn7D/GPwzDwidXAtNNNwYp7ps0y2v2LBYN8w+DKDN8kj2qKeRSshbXW8/C
         NujTASdguIyfKtgy7KGeEj9heY4j4bqnVNJLjqpj84lYfxepZIfvf1kEiXcBvId0il8w
         KnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=adLCRjyG9ql2dpnI6XTEKDQmCPOfQAuHG5SMH18mDPM=;
        b=zJr2Z+Tvv+r9FpY9QGyiPixAWwEc7qXXRlN6oFutYl0PoBoCa/HGT5OokptfOResnI
         v+9SoXWppYxmMZqXNm92RpiLFfnpDlxpj2DH8tFcclEINkL8NAPmZWKQPGyHKhJu0dNT
         5fB0T5ZmKovhMGtM1FYzxGam1u440JygkHXZ2XNEkfmfHi8Ntje+c4aF+mLkKfV3KzrO
         Tp+WnsboHZOU2jUROhx6yVHkSb71TVtpCqqoGIH3jih6OPHaxPsf5KyC34x/tdt2pJeV
         rs4QvQncwNrjoMqYcN+0/ait6ToHUtDdGj7oL01dt7152OHQyrnlsOkIAJNv+SF5mK5w
         T73Q==
X-Gm-Message-State: AJIora+tBUL7eK0mYvUCur2PTdVsXdWbx5hvuYrr24BJ9BIX8xZCzvZ6
	o8JxMz9zp131fQhpmj/oX5EKdLHVEZw=
X-Google-Smtp-Source: AGRyM1vQiNm/I64hNbcGE8zd0cyKohjH6SoOVBwY9xjYiLG+BQDcBgSyuS01ppH+w9E1NDbqP8uyng==
X-Received: by 2002:a17:907:7632:b0:72b:4d5d:ecce with SMTP id jy18-20020a170907763200b0072b4d5deccemr9841203ejc.11.1657813572648;
        Thu, 14 Jul 2022 08:46:12 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id ey6-20020a0564022a0600b00431962fe5d4sm1241399edb.77.2022.07.14.08.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 08:46:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, wens@csie.org, samuel@sholland.org, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner config64 changes for 5.20
Date: Thu, 14 Jul 2022 17:45:59 +0200
Message-ID: <5838152.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <165781258677.3193274.3635616027978236662.b4-ty@arndb.de>
References: <YsheC0hgyJB9kPsS@kista.localdomain> <165781258677.3193274.3635616027978236662.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 14. julij 2022 ob 17:31:23 CEST je Arnd Bergmann napisal(=
a):
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> On Fri, 8 Jul 2022 18:40:43 +0200, Jernej Skrabec wrote:
> > Please pull following config64 changes for 5.20.
> >=20
> > Best regards,
> > Jernej
> >=20
> > The following changes since commit=20
f2906aa863381afb0015a9eb7fefad885d4e5a56:
> >   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> >=20
> > [...]
>=20
> Merged into arm/defconfig, thanks!
>=20
> merge commit: 2b4b612638b8e87719f82ab7a9cda8925375eef6
>=20
>        Arnd

Thanks! For the future, can I send changes to 32-bit and 64-bit configs in=
=20
single pull request?

Best regards,
Jernej


