Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD25C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 19:34:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCF846103D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 19:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCF846103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXkknRIKqtYDqtWZmgsas1ZjOwAMEyyNTgB0xu3VnpQ=; b=fGCIY9RuzhDCdL
	nkYHxJnYtCCD9jrjEf2Scj8j+LQR3TjvkxfJ6EqgyhLyREN51NgSJ64WEc6djbxKMXofPWkXFdb1v
	Pl4oupqMDBJz2NO9QrvdXF/jZ1Jn/KCauavUEmbLH4nyiOtdDAdAwraAnjS4aSJYciRcA4DYVSkrL
	0AyZ+aUyvlHQ2jPetnd0PTCte6meAZjhdbBoRsfNi+cGUgyMo8+qJoMmZgneLLNthc1bhAgmARh8B
	1Au5BxglJnxB2ZvmXYdzFeMbRGan5w2P3t3I+Q8YAlgSUc13IXvf/VJEN1K672mCNnEHsFoMVXmsJ
	1J3Av88me+znqbg5O6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mejF2-00EVBh-Is; Sun, 24 Oct 2021 19:33:12 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mejEz-00EVB9-3S
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 19:33:10 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M9nEJ-1mYvwd3E3x-005rCF for <linux-arm-kernel@lists.infradead.org>; Sun,
 24 Oct 2021 21:33:06 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so7939349wmz.2
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 12:33:06 -0700 (PDT)
X-Gm-Message-State: AOAM533gFr4RikiIC0TvdwUOx17EFxlkBAUb2MoJiyMVkTN5p5RrBjTw
 /64FONJVhxdow/+AV+iUX2Gfl4u7r19ReFd+Ffs=
X-Google-Smtp-Source: ABdhPJw4hH7C/a2zk240txDvHL7tN8+k+dIxhQayqZg6YZyRuMpfgd65spSGiNjZlg56v83/yxP5Ni8w6w2+98dAEhQ=
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr15117795wmg.35.1635103986146; 
 Sun, 24 Oct 2021 12:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 24 Oct 2021 21:32:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ccWgpQF8-Ej7Di_=eCs+cibDgiY5962iPKsMgzD_qSg@mail.gmail.com>
Message-ID: <CAK8P3a3ccWgpQF8-Ej7Di_=eCs+cibDgiY5962iPKsMgzD_qSg@mail.gmail.com>
Subject: Re: [PATCH 00/13] This patchset aims to add initial support for the
 i.MXRT10xx family
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, gregkh <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
 giulio.benetti@benettiengineering.com, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Leonard Crestez <leonard.crestez@nxp.com>, b20788@freescale.com, 
 Andy Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
X-Provags-ID: V03:K1:Ost/FF/hJcx1Nv7mbpsZjRuUf9I2SsMnV1C+ZVQ+HyJ4uchjuyx
 KxSGVh4GIVG5md/hF4vuWDd8ofF92r7UsdePr411zVe3AQQnokh7mLDVFZa3PVvrbr3e0Mr
 uOL0hoNp2Ct/Fs1y5cG6+khlKViPxetLSVItLWUP9QkBe5vSsOp2pWaB40DE+haObKUfYUA
 WsxjCAF5BStQtT+VoOBKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cAwDXci+lkQ=:u+mrsZm3kIQZs6dLTrguSP
 0YX7AeaWJem62p2o/o+W6StZfeBrWzr7BTP69BD2a09y+Au9O3Y9209fjXSkCRCHUo2jA8ivX
 xd8cQLiSi8Mh1CJI7SrTopsHv1llg2/u1ZrqPXD6ZjvK3Ms0G0+0SscXhOXR3aKb8yxdvFQCg
 sywZ737QL1Uqi5rDlZ0/GyUT4vbQjKlRCmoA9mXgJ1rMPTGBcLGr+aQczybmBPiALhKoewqsr
 Ksu0LI22RrnP0DyIoK7GhJq3ZQhSXYHst0XTRm5mMvgBJlc6W9csRVRl0W7TJHzce93A0CyYi
 a0Zaom/NCxDWGOXX42Jj+graUOFsSy+nHc1cdM9uFBJRip/US2tmd0CbgCAb73DV3qm5Mjjmp
 6NmwhgfSvwxRCQq8njM3xPF2M+yLVItj2CvF/eWpvsN/kFg27A3xou9ZYwcFykd5pPX34k8Ok
 ypQiXhe3JBd7HzA3LxV7aT2XjO4E0frvlczqxm9hDs2pOi6sWK5wTtruf9CF3tYFyjbTDEp4u
 xRkng8Yy0Tkapg6hp7hpdsnY8E2VU7BuISUVh/5X4Vgv3EOO8ARuWlSC1olArw4mb8yrhGpsP
 bMXA6yeK7w35BqWuzbgob/ndxvlxTcNHRUAEwyi4+Vbt3Hn8W9lPeKIAfKDxXrk2OenQkiZfC
 KcrgenAwm2QxRI/8SY91ru5b6/mx0R4Bowg0KYhvcPz0TY7PBDIYmPevF+qPt8DBc7j39djjH
 6aKcKrPeAmzUhL+1YBYfFrD7sJF50mS8fgDHSQIESxMPBaTMe6zPDUhwuqbQj1IRReFcXrlQg
 V6qNvWPvmzCsEDG5FvG/s34BMt2PvQSTUnfhMsObi5VhCyXAM0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_123309_482985_5154A2D3 
X-CRM114-Status: GOOD (  20.56  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211024193250.r-TI7cSllTGLkmGGF4GfxNY_5LvAlQPmJxQ0oRJRuB8@z>

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> Add initial support for the i.MXRT10xx SoC family
> starting with the i.IMXRT1050 SoC.
> This patchset contains:
> - i.MXRT10xx family infrastructure
> - i.MXRT1050 pinctrl driver adaption
> - i.MXRT1050 clock driver adaption
> - i.MXRT1050 sd-card driver adaption
> - i.MXRT1050 uart driver adaption
> - i.MXRT1050-evk basic support

Can you expand the description a bit more so it makes sense as a changelog
text for the merge commit? It's fairly rare these days that we add support for a
MMU-less platform, so it would be good if the introductory text answers
questions like:

- what is this platform used for, and what is the purpose of running Linux on it
  in place of the usual RTOS variants?

- are you doing this just for fun, or are there any commercial use cases?

- what are the minimum and maximum memory configurations this has
  been tested with?

- what user space are you testing with: any particular distro that supports
  this platform, and do you run elf-fdpic or flat binaries.

- are you planning to also support the newer i.MXRT11xx or
  Cortex-R based designs like the S32S?

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
