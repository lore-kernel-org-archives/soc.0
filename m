Return-Path: <SRS0=t/un=Q6=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF730C433EF
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 16:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1B8DC34602; Mon, 13 Dec 2021 16:13:40 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6202DC34603;
	Mon, 13 Dec 2021 16:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6202DC34603
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MyK9S-1mbyHn0Sh2-00yknH; Mon, 13 Dec 2021 17:13:31 +0100
Received: by mail-wr1-f48.google.com with SMTP id k9so10146745wrd.2;
        Mon, 13 Dec 2021 08:13:30 -0800 (PST)
X-Gm-Message-State: AOAM5310DJIQgn2oavmqI13eLnOCvHG90f8OBMdSXducXJPJJhgzFFJd
	tUmCP5wNPDnNRwUnaS5ZUNYwIFrzUzSSPYgQ5q4=
X-Google-Smtp-Source: ABdhPJyD50jfhG5Bk5HQF08ZCgBdnrXlEDYXnH62ryDCntSWnjN96ManZ9op0yOcSUAzuDa3WBNH2Tsz6DiS9k1Pvsg=
X-Received: by 2002:a05:6000:52:: with SMTP id k18mr33594696wrx.192.1639412010694;
 Mon, 13 Dec 2021 08:13:30 -0800 (PST)
MIME-Version: 1.0
References: <20211201125327.3704500-1-andrej.picej@norik.com>
In-Reply-To: <20211201125327.3704500-1-andrej.picej@norik.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Dec 2021 17:13:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a30OQ9AUSU2p4X3R90GwEOLLY3h4Vj78Tr01JKb2NLZHA@mail.gmail.com>
Message-ID: <CAK8P3a30OQ9AUSU2p4X3R90GwEOLLY3h4Vj78Tr01JKb2NLZHA@mail.gmail.com>
Subject: Re: [PATCH 0/4] PHYTEC i.MX 6UL/ULL devicetree patches
To: Andrej Picej <andrej.picej@norik.com>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Oleksij Rempel <linux@rempel-privat.de>, 
	Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>, NXP Linux Team <linux-imx@nxp.com>, 
	Yunus Bas <y.bas@phytec.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:HhBKyEOzKvkbIspxH5/SlI9x0l4quvPGvpjBE3SvqmXDpriYkLV
 5K5wiSRQpIo47q9PnT4/onZzdAEtXq4sG1Zet6vSKufpjjJ9WolHTxQKvYca7lNXUCFDP8I
 E0tNjDE3tfmvjttp/PYOq6XNqKcp/6Mmym7KHSuG25GXdrsfAn5EXfJDBdAoLjlpjM598Im
 SsYonS2U42Al/4GL7fVVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Vq/EQrY+x4=:f9V68zUdmn64whC9oVa0T4
 EkEMOrSjzY80shm734BKIxbc+UUoA41B8fzyCDiu4Fpijg6P9VlK/8DPAAXK90M3u4M9WifeJ
 c6FKBuWh3YXOVoKEg0+e88ELmqwt5wsPEoBkC7v6cTswDUDIuXj+GFxmsbYHYO8/gon25LtGd
 bYiG0wtSmNni2B9Oc06c05+6vcMNT/sXEqGSGFS3zMX7alnB+BqY7DKxHJfiRo2F2VS5NI3dv
 NgcYhiDAfBL94bVuI8AIXyRbBtsIbJlYyEegzmQiQaI5lLC4+YPxaWOftBl9ra+sHPK9xtE6a
 LBbucg2os1eamxORJt5GldQj8CG/QzbPWt0oh0ZGT2tIXF/r7+rSxV5Qxc5MloK9DYRadFwEq
 Kbh5ER6WjXIqXi5DL2n4O5d1hZMVGDW40IdUIbBjHX+brQnPooNpgX0f+NLsSkfrSClkOE1qi
 Y1QisJLvpmQgSwWvk658N4Tv3e2BxYVmKmAWHWy+4BREu8hGFFQ4xVWqDYNeOWs28UZeTrr01
 eDHW6BpT7eRSqcofIO4NyUek/FOz7oBQ9zCIOcEDShEVd1TzvP2CZUA72y6qiOxh1FwQu+WAB
 KwVbn88n4ab3rcZxGMnlDE2XwsMinGKDkKRXN971CPiT4fx6BdCqXhH6aBwceRANZpqgzuHNK
 jYx5EBFSejpmR2g+7WKWDSZB6u8raUAEmbMtczn5Q5IuS7XaSmNFkTm+DIml2tFPRgF+MQyD2
 muVuvZj2sUDuI14PZS9a+Be0+drrowDNqwVEz/PUMw+/2MhEFIOPopfWSxL7WGegq8MMd7/K1
 7TKlvV9IqrhkcmMKqjFFRZE6gI1G9zy91AWaNHQXSWgqfPUwgI=

On Wed, Dec 1, 2021 at 1:53 PM Andrej Picej <andrej.picej@norik.com> wrote:
>
> Hi all,
>
> this patch series contains PHYTEC i.MX 6UL/ULL devicetree patches not
> yet upstreamed.
>
> First and second patch add devicetree for relatively new phyGATE
> Tauri-S, which is based on i.MX 6ULL.
>
> Third patch changes USB LDO voltage for i.MX 6UL/ULL phyCORE devices so
> they match USB Full-speed compliance.
>
> The fourth patch moves from using 2 pwm-cell to default 3 cell pwm
> property.

Hi Andrej,

We don't normally merge board specific changes directly into the SoC
tree, please
resend to the i.MX maintainers. You can keep the rest of the Cc list except for
soc@kernel.org.

As a general rule, try to make the "To:" address of the patch series the person
that you expect to act on it, either reviewing or applying.

        Arnd
