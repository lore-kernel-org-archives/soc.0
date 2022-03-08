Return-Path: <SRS0=aJNj=TT=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D397C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 13:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06E14C340EC; Tue,  8 Mar 2022 13:40:59 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 978EAC340EB;
	Tue,  8 Mar 2022 13:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 978EAC340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MzTCy-1oMpPD2RYu-00vNRO; Tue, 08 Mar 2022 14:40:55 +0100
Received: by mail-wr1-f48.google.com with SMTP id j17so28691185wrc.0;
        Tue, 08 Mar 2022 05:40:55 -0800 (PST)
X-Gm-Message-State: AOAM533CU+6EPbA2zdb4xs+0fse8YfyRAIRxcoZPIyU4a0TrRPFIh2tg
	LO6WJ40t1G46PSvEhgNvGhvMaxnqmDPzfsKXAbg=
X-Google-Smtp-Source: ABdhPJy4i4S2Td2DIwViO6a2d4Sf3lMdP84U7BC96iZ7illHQ8jOEHBv73Ig/cIeTLgrsoD3sDhn22NUtkKMGcU2wFI=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr13058079wrh.407.1646746855181; Tue, 08
 Mar 2022 05:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-14-andre.przywara@arm.com> <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
 <20220308120750.0bbe0122@donnerap.cambridge.arm.com>
In-Reply-To: <20220308120750.0bbe0122@donnerap.cambridge.arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Mar 2022 14:40:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3g_zPW5xEFRku3TsZTdovevwyxyWVaN_=eD+FN2G8YLg@mail.gmail.com>
Message-ID: <CAK8P3a3g_zPW5xEFRku3TsZTdovevwyxyWVaN_=eD+FN2G8YLg@mail.gmail.com>
Subject: Re: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from savedefconfig
To: Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	George Hilliard <thirtythreeforty@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uOSDTX1EAMtmLIquE0QWRtpNQnAwMSQL//9v92qU0PpEn0H31RD
 84fTCODySS1eTUmHaw5sp7hDQVV6I2jvLTyPbk0ax6k2eRLvL/eOO1Bnj5hFhEh+Q84L+k0
 kxBSikdhnLUMjS7FKwCVZGW13fAkjQtH6u9sKkWjqyPfo2UIi7s2aI8cJmTldbjeFQjsKKU
 BUsvASdZ2b4B2LPq6pY0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LKpszD82Jto=:xLVQF6ZqkwkukZwPgNvrY4
 rsl3Rg+f3dRpmX0wyNm6nrn7tuBbHKMCHJoD7qGeBB2KeAxR4n8H60NCPAPAVU6BFvSVBBmBQ
 BJ2AYDhcusaro0OHuwtM/Ia3Y9S2NDiO7y64j555ZaNtXNEl2ukALFMBjRzKSbchUW/t+5OJf
 2FUDy+QsFMECLvZjubsiJ5O9IppMFDUvnjGP2gWHG6gqSkxP4lVBon4RdOhNcTnIilqS56kaM
 PuSPy3mDekjfNVz0OiH6ZdQloO1EE7W/H6yMGqHAAoc+adStDimgkAnZXUKIBJE8Xn5o4J7so
 QWhNJjVmXmwH+ExLt32cXYCiSA0ByyvNT4ZaR92PCE99tci4SGu4ByqmQYJ83VSFK6SUiz8Cx
 /TmvhmSwWd2NpyzPawyTggc9QunyB/z+5dm3yVBXv/aB5CHBZXGFcnhcCImZ5o57icHS71gL+
 Ddevw8OAKi+jQ2ys6/QPUEIDdPAZx1GOwuYRjdD4EOTo0X+/SoWi53IOXIPI9xCd4BOHzbwL1
 5aAnQU6TprzVQGtsvu3xAMXQkgv85Bq5jlOAS0gxiB1dRHgch1wgEiMFOccr7FK36PXvVI6gm
 0Jw4t7KgV73P/kJBxNmYbiKOL+dnS8PcF5xYKZT0KkXAWx4OK/RbP+NvfOAm0hetK1Qgt5eVH
 dwBwZxwcsVbPrVTRcsDjLHi+S+u6ABmO/KMoj578dqAtcQPnYaZGfuCZ51pE9Ra95Hz7l7HkQ
 eXbVYNeBb0D9EzUrMCocOV5niKrEdykQ+heoWMAyBmufpjBFsL260a8yMipp84qR87hFAfWq5
 mggP1cZk27ZipxfgLgksWIu+nJ9Kc6qIbya4YVE+ZIKYklQI9k=

On Tue, Mar 8, 2022 at 1:07 PM Andre Przywara <andre.przywara@arm.com> wrote:
> If you find that useful, I can try to find those dependency chains for the
> other options, but I definitely lack the knowledge about the history of
> those old platforms, so I can't reason about them. But I could present you
> the findings and you can then say what to do?

Back to this point: the most interesting ones are those that broke because of
some added dependency, or an option that got renamed. This is what I would
use to find the root cause in a scripted way (after identifying the last "good"
version):

$ git bisect run bash -c "make -s O=obj-arm ARCH=arm
multi_v5_defconfig && grep CONFIG_DRM_PANEL_SIMPLE  obj-arm/.config"

You can group the ones that went away because of a deleted platform
or driver, or those that are just default-enabled now, but for cases that
no longer use a driver that may be needed by some platform, just
having the information about what patch broke them usually tells us
what happened. We still need to decide on an appropriate action then,
which could be to include the new dependency explicitly, or to remove
the entire platform that used the driver because we find that the maintainers
never noticed it breaking.

         Arnd
