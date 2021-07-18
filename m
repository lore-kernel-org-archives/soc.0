Return-Path: <SRS0=eCXV=MK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AB1C636CA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jul 2021 20:24:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7B161006
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jul 2021 20:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7B161006
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mr1a0zdzxs+5RAMgd++J01nyoCUxb2gi/AZFGIZX+wQ=; b=Fwh5JhyF3RWgaV
	1vcolllpXcTdWHk6sMAOKNMGrmumHSkbBJefxOPeinwl5aJT5mhx0vEz6O4V82vn1QTMod2wpZHpF
	XNnYIbeg7zJYvZAJ6jc3ZplvYUkiS08t+Zb5hDCskTJvsnfIUSb6leV1WqG5blMxqd15XsC2CHuGe
	senALGH4al6N19xEaCJLOwyxlJbcNQC9yt4waC5MoEkP0d1nDCwaT7NtwK+G1+Bi1lHpMSOi7x7ic
	vu393bw+XyKzOxYHAL68SkvAH0WKx5KohnHezt0lM4qhSKx4Cmcx3Dz2ITGNl3mSQo4nFUCchUbs1
	9OD5ifvwuAjH0+8wYRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5DIz-007zRY-8O; Sun, 18 Jul 2021 20:22:29 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5DIu-007zQd-Hg
 for linux-arm-kernel@lists.infradead.org; Sun, 18 Jul 2021 20:22:26 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id d9970e3e-e805-11eb-9082-0050568c148b;
 Sun, 18 Jul 2021 20:22:18 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1F2EA194B06;
 Sun, 18 Jul 2021 22:22:30 +0200 (CEST)
Date: Sun, 18 Jul 2021 22:22:14 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
 Juergen Borleis <jbe@pengutronix.de>,
 Ulrich =?iso-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] ARM: dts: add SKOV imx6q and imx6dl based boards
Message-ID: <YPSNdvUhQ6fCTUjj@ravnborg.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714045349.10963-5-o.rempel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_132224_775628_CD5124A7 
X-CRM114-Status: GOOD (  14.99  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210718202214.czbqFAjcOnopM4fB8jX0LoczE1MHccUURXKVQVQCc1U@z>

Hi Oleksij,
On Wed, Jul 14, 2021 at 06:53:49AM +0200, Oleksij Rempel wrote:
> From: Sam Ravnborg <sam@ravnborg.org>

The real author one these dts files are Juergen Borleis IIRC.
I made some internal refactoring / renaming which is why I thing git
says otherwise.
So onless Juergen says otherwise we should give him the author credit.

Arnd - would it be OK if I take the bindings patches through
drm-misc-next, and then you can take the DTS files via arm-soc?

	Sam


> =

> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> =

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: S=F8ren Andersen <san@skov.dk>
> Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
> Signed-off-by: Ulrich =D6lmann <u.oelmann@pengutronix.de>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/Makefile                    |   5 +
>  arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts    |  13 +
>  arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts    | 108 ++++
>  arch/arm/boot/dts/imx6q-skov-revc-lt2.dts     |  36 ++
>  arch/arm/boot/dts/imx6q-skov-revc-lt6.dts     | 128 +++++
>  .../dts/imx6q-skov-reve-mi1010ait-1cp1.dts    | 127 +++++
>  arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi  |  54 ++
>  arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi       | 475 ++++++++++++++++++
>  8 files changed, 946 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
>  create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
...

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
