Return-Path: <SRS0=QEH7=LN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B7FC2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jun 2021 20:17:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0247E6100B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jun 2021 20:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0247E6100B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3Cn/gaLAU59+cl+n2ermIBAVLsdxh/IEVHOwgKU08U=; b=UXdWTTsihvEvj+
	uLWTzeeWH8NoqS5cL8CamabKkNnumR25xnpCymBCOLWaettLvGG7fmpRLglfZwvQG3ecihLglTkxe
	s0K5UuY4OKyuBqZ+blOtD6Nn8mD5PSDvr6gIplGB0duFveHjS06kiNEffPdKplySArb1RSkgiVWUw
	b3XMcf8zsvbyxvexmgUDwyL86HvK6tnSkaUavIPriDHVKPsMSyOLiqFqq+KN+ro2ANCEwk4oZ7o1k
	YdDm4FMOd5uFGMhtJMpxmBvvByJW6yJkwucfWIiXsgcUGJ/Wy8HO84+oUZryms1Y4YFc1C3493ang
	Ft5z/uGRnCYulUXHE7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luhOH-00HXDF-4w; Sat, 19 Jun 2021 20:16:29 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luhOC-00HXCG-HH
 for linux-arm-kernel@lists.infradead.org; Sat, 19 Jun 2021 20:16:26 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3c7cff3f-d13b-11eb-960d-0050568c148b;
 Sat, 19 Jun 2021 20:16:31 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6324C194B39;
 Sat, 19 Jun 2021 22:16:19 +0200 (CEST)
Date: Sat, 19 Jun 2021 22:16:13 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/4] Mainline imx6 based SKOV boards
Message-ID: <20210619201613.GA533354@ravnborg.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609121050.18715-1-o.rempel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_131624_760605_6DB6DD11 
X-CRM114-Status: GOOD (  10.42  )
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
Message-ID: <20210619201613.y1IsUvrYbSFHG6NbESH6tu9jBiR_C6VyLPJr1eA-Hgc@z>

Hi Oleksij

On Wed, Jun 09, 2021 at 02:10:46PM +0200, Oleksij Rempel wrote:
> Mainline imx6 based DTs for SKOV A/S boards
> 
> Oleksij Rempel (3):
>   dt-bindings: display: simple: add some Logic Technologies and
>     Multi-Inno panels
>   dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
>   dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards
> 
> Sam Ravnborg (1):
>   ARM: dts: add SKOV imx6q and imx6dl based boards

Thanks for taking care of these!

	Sam

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
