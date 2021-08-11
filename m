Return-Path: <SRS0=byvG=NC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA50C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Aug 2021 18:42:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4868561019
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Aug 2021 18:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4868561019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4huJ5109ax4MliDEyNbExDGIuOoGD//9JZHgqia/ucA=; b=HkpzxB6cUxlnlb
	N9F6qv4logphHTegDXQ7Y3aiV4k8LsNTvYbs/6w9K39xUhtt54grsqZfSMn/8ukuJuNdK9N1/MTjV
	Oqs2A2deuTsqUgTG7Hr4vQ7q9j/4SbXVTsh4ybwzFEBISkmGFKFXYzwPcCYq16sdXZat2rhd5Ip8T
	GoIZGC3IKCyK3CPaRLnJWWjho59eKhjB2FJSaGzELYLdVIz0PVIoUwQ9ocr584GCV10g6EtgXc4DX
	MztIH9Goh1Tv2hVVyPZo/HtioQs9P87xNht8h6PCIov6g9+WdJ269KW1yDx4rT0ccKQM+b6EvFr2q
	qRkwv1qJ8b4NjmfQYWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDt9i-007u5q-II; Wed, 11 Aug 2021 18:40:46 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDt9e-007u5A-FV
 for linux-arm-kernel@lists.infradead.org; Wed, 11 Aug 2021 18:40:43 +0000
Received: by mail-pj1-f42.google.com with SMTP id w14so4918874pjh.5
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 11 Aug 2021 11:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YgL5QZA+nttpaayeuohalxKILerIeWnfwKqrpAxGEV8=;
 b=aeShcIIE6IOUf465zvBBc53DWBFZ0sEqEn/2Th2NwhCff0lNaKZSqYftZ+ZeLI0KYM
 d4BFj3lrdFIsFCxULRIwGR5QJddai6NZvjPj2pyTAhsw4bnU3TqmYSK+3d5Hw7KCumTt
 kHMYFYXNaJnYQCJNCfmjEhozY6XB1D7dQ408y+Ll2ufjVrRUoHIqP4dFJ63fWkjFH22W
 suNs6OFgFh7ep+PnGQF8o2vze/W0g3fCxxbtpjsTwcSQBSbDMFGg8kehlKGcdgv/ndLs
 wVbhKxQTa1iC5xR/+e9ACA4Kbwr3Kt8hL7bUTines+HisFRQutT19OU+Xaxa9hP8Aa3o
 HnoA==
X-Gm-Message-State: AOAM5304zqQYS4rMZVC1OS2UtCEg9ULsYPEeOitOBDA/uGmnnv4PfXpY
 YlDVwkYd29Mu2VzvAkKWMQ==
X-Google-Smtp-Source: ABdhPJwnahoo1EM8pHpP+QSc3xuGsCPXqSQ/jRidO7xuzVac8Xmgh3XG//7qIy7NBtmcjC/sj/1XOQ==
X-Received: by 2002:aa7:9906:0:b029:3c7:a6a1:c73d with SMTP id
 z6-20020aa799060000b02903c7a6a1c73dmr199239pff.1.1628707241447; 
 Wed, 11 Aug 2021 11:40:41 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
 by smtp.gmail.com with ESMTPSA id d9sm224216pfv.161.2021.08.11.11.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 11:40:40 -0700 (PDT)
Received: (nullmailer pid 67452 invoked by uid 1000);
 Wed, 11 Aug 2021 18:40:36 -0000
Date: Wed, 11 Aug 2021 12:40:36 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Fabio Estevam <festevam@gmail.com>,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: fsl: add SKOV imx6q and imx6dl
 based boards
Message-ID: <YRQZpGn/+XfDy4Gj@robh.at.kernel.org>
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
 <20210804043439.11757-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804043439.11757-3-o.rempel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_114042_560740_D42ADE97 
X-CRM114-Status: GOOD (  11.07  )
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
Message-ID: <20210811184036.mCTqywGm0O2A998rxZ4sxarn9lDRE9Psfw1IJyK27oM@z>

On Wed, 04 Aug 2021 06:34:38 +0200, Oleksij Rempel wrote:
> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
