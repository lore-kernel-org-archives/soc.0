Return-Path: <SRS0=nd60=UK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B25AC433EF
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 20:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3DE4C340F2; Thu, 31 Mar 2022 20:44:39 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 505A1C340ED;
	Thu, 31 Mar 2022 20:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 505A1C340ED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MJEMt-1nKQcC49Hf-00KfSW; Thu, 31 Mar 2022 22:44:36 +0200
Received: by mail-wm1-f43.google.com with SMTP id f6-20020a1c3806000000b0038e4a0fc5easo329737wma.3;
        Thu, 31 Mar 2022 13:44:35 -0700 (PDT)
X-Gm-Message-State: AOAM532SqB7tl+VWn5PEGBmV16jYO03zd35mbHxGVn+oF1La6AaKo/1t
	IFEFP0mHOo+vqEhba+srZw5Hv6HNDv1tlJhtlh0=
X-Google-Smtp-Source: ABdhPJyFeJUAUK6GAZ/NhueIXRM9Oewyb4HUoVhUwi2uLC9MSZns5oEWdhfhtv0wykqSw0IptauyUmpRy+Fn8YuUnQE=
X-Received: by 2002:a05:600c:4e11:b0:38c:bd19:e72c with SMTP id
 b17-20020a05600c4e1100b0038cbd19e72cmr6187817wmq.174.1648759475650; Thu, 31
 Mar 2022 13:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220325153121.1598494-1-broonie@kernel.org> <20220325153121.1598494-8-broonie@kernel.org>
In-Reply-To: <20220325153121.1598494-8-broonie@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 31 Mar 2022 22:44:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a00ejR8aJtxLPfoKU104J6yD44fS2tRyzCQvT4pUF4m6A@mail.gmail.com>
Message-ID: <CAK8P3a00ejR8aJtxLPfoKU104J6yD44fS2tRyzCQvT4pUF4m6A@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] ARM: configs: Update multi_v5_defconfig for WM8731
 bus refactoring
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, patches@opensource.cirrus.com, 
	SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jYxN22dofoITHQqAc3vX5vn4Rkrcq93oEn9Z6rgIyLPlTEnIiRH
 GJQSADv/ub3ZSE+6HQLtLQoCccuM6VmRqmPZF3dZqY8SVjl4FPe+xOL1csBYNXmbgTYYKqf
 0zqFVIFn0uJ2h7zGUvzeYyyoz9ZSny1kwFYjIJtE7sAQSNeOyD1w8yzkNXxT8gmkR7Bi4c/
 jrFVTCN8aLB5NWrOIxZng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B79nFbV8Icg=:cKP3J4JNuUlj1zsT4anieV
 8I0IpHs2953IHT5bhtYXUeF8HpXONGSxIOfqvLVV9LveuBpN58uKT5CDQG+e5PpziISNLBU+Q
 brClsEpoH/mkbmsFY0ZJ1XDsTavQs7AcfEI8pggiG6HXT4HHL+RyUMxlFis5cKrFEs0a+xo80
 pD+Yp/NjTJI4gfAdtzeODBM1ddoBDNvztkHpHc/DA3wdOzLUJtSeUBMw//G3dgovtfenHFU0C
 /kRu7bMHXpM5pMlNtRaHxva2zFKyX5ZjPN2Xl00Ghvd/NPZQbYIXP1SiEmupMqQvUJvICJ2hA
 HMEj48kLdGSsU4NGyyrRcpXCnnc7rWvxGN+K9kDtmY/1BsZKaO821h/LmAcI6a+cwe4LT8YsE
 ryd1pxVjOnS7Ea9NREghx8ZQdvjmaBOkpAc/6Jvh2BvAZqyy8k1uq61+Q0FUPR+HHyaqmhlmz
 J7YWU8BzOFueQTjTCqyOpG1Du/I46sfKTTauSXrU+H54m2wNqp2JFS4MhY5Kbw71r95hTpCbV
 b94B+enDZdXlAtUj7w6PJJ8wuf8k+cz5cY7Wa/3zh0iyegatYgHOBBRfADV3sx28Ji6PjEqN7
 7f2t/F0Vg1znpFthV70yWIjmZrAW846vfzyfonprG9/JMMO5HoVg3g6MoUsZ7C7MzHiNzlusB
 QUhCwCDaVNC7J4kEnl1Zp1FSnCWnUju3NFQ+vgsGS9eUg3boA2QQCYADXDaQbTKaHfEc=

On Fri, Mar 25, 2022 at 4:31 PM Mark Brown <broonie@kernel.org> wrote:
>
> The WM8731 driver has been refactored so the I2C and SPI bus code is
> separate modules. Refresh multi_v5_defconfig to reflect this.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: soc@kernel.org
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>

If you prefer to keep it together with the driver patches, please merge through
your tree.

      Arnd
