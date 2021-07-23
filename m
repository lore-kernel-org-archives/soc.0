Return-Path: <SRS0=Eam1=MP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6ACFC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jul 2021 03:02:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880DF60E9C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jul 2021 03:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 880DF60E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kHelXPOXay7j0L1f9mebghqVKdoB17giILJk4cgXKM=; b=1QM357lvWseGkJ
	vr+l3bHjdKsnOahmXN8DgzKID7zKS2KDjDTkUu/c5vSnpxLhQwe5cafCP2lsrVRIsWZvcXj6c+hWc
	/MrAyow4JZZLJSmQNmIYdvAwAmhNa7Acn3piGOlHdQjZkciwb3WgO4Xrp0byGskwLF3itfiIeoAsZ
	vY5gE/LI59+9Vxny21a37cW6jQfjT9XNTDX+BVYSN3isjS++fLnN0Kg8QJVt/WzvLl65GWv6NzLP1
	P/Ag2Xy3eoLDqJoqG8fuian/17MSDza2uV4EV2NfB/ig5EndQbPZAw8i/B2OcIyh8pM0Bi4xbAjEB
	MZWuV8T1PHdMjwHGuiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6lR2-0039Mg-7r; Fri, 23 Jul 2021 03:01:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6lQy-0039MF-VW
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Jul 2021 03:01:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA3260EB2;
 Fri, 23 Jul 2021 03:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627009268;
 bh=+pVRuUCXuNnSNbnIJkHUZSfYHS173tYlhb7QGty12i4=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=ViDcLqMqUM/pqSKrSdsw3ca1tnANu4ijSt9Rz1rcjLbl4K0VuadCiwMaSTHrvMf/N
 ZQ3wksRxfBh7rBkNUzbgpJvwUa/U8KIdtgcACNEGgrbMWipk8zhdubG8i6AdWy+yZt
 jGQ3CePMasDLU7kF+VHEjGlVoTHzLxNfGty9Tz6LGxxU2w29XqBDq3n0tGx8ealcUp
 XcrozpLUhn01zGyd7bmUEnGyN9R0NsfUqD2zWV7QjxesKOHq/UDqkDWP5SlRSQqywi
 8mehkDzM8WGsYxUlLQo0GVupiLM2yMEDZADVKmTOQ2jmaP/VI2m14qDONtWwsrBR47
 XQtdbRBRZZjvA==
Date: Fri, 23 Jul 2021 11:01:00 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
List-Id: <soc.lore.kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, soc@kernel.org,
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
Message-ID: <20210723030059.GG28658@dragon>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-5-o.rempel@pengutronix.de>
 <YPSNdvUhQ6fCTUjj@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPSNdvUhQ6fCTUjj@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_200109_074517_0FBBF5DF 
X-CRM114-Status: GOOD (  12.83  )
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
Message-ID: <20210723030100.Yvt6cOa01DYOUbZw0dQJvADqGsRBZzwkcTcQaC33huM@z>

On Sun, Jul 18, 2021 at 10:22:14PM +0200, Sam Ravnborg wrote:
> Hi Oleksij,
> On Wed, Jul 14, 2021 at 06:53:49AM +0200, Oleksij Rempel wrote:
> > From: Sam Ravnborg <sam@ravnborg.org>
> 
> The real author one these dts files are Juergen Borleis IIRC.
> I made some internal refactoring / renaming which is why I thing git
> says otherwise.
> So onless Juergen says otherwise we should give him the author credit.
> 
> Arnd - would it be OK if I take the bindings patches through
> drm-misc-next, and then you can take the DTS files via arm-soc?

Yeah, it makes sense to send panel-simple.yaml change (patch #1) via drm
tree.

Shawn

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
