Return-Path: <SRS0=GWmK=ME=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCE0C07E99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jul 2021 20:15:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C2A061245
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jul 2021 20:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C2A061245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qK3xKyFscbIFERs3o8R1wTahndxcDzGvSeQgCI0fvoc=; b=yOohMeSRB6NGtT
	dqPhQPbKb8UqOTILt9+zyXFBNiR9oYOfmhaByipYQAgvSjebc6DJaIJro37YeZ+0CyXsIaXp5tcE6
	jx7ylfT1G5pDgjtBFdPifinUZa7PBvx0LtQstqGR/dPORbtNToAW81YhH0/4j371Dyq0sz4iQ+Zee
	wWtPQckb2eY/rfHzSUcc6YElFwne4Z2puFzKv5Qc2Ax9maBHq8YMRfjk+DMU8dMxMaOQtwLVvnGqh
	3o8WIq3sUa/hSHm0F8jisoGyjDMpqNtaMN500Pv9tszx6bKRH8TgR5iTMtIyjXjmGbFlO3oByOsZh
	7KqgzckDKorJrDSm3N8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m32K2-008MdK-Tp; Mon, 12 Jul 2021 20:14:35 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m32Jy-008Mbf-Ub
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Jul 2021 20:14:32 +0000
Received: by mail-io1-f51.google.com with SMTP id z11so2518185iow.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Jul 2021 13:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ujFMA+hMrUmT7cVUeg1tfuvODZSAIYxTqES6NtonES4=;
 b=pZ76GGF4NR/LFJOgOeGweN9eCVZotgQ2uF9lw9NF6OmGmrHWFGwbH3HidPwm+dqo/6
 qC8Xqcgars6F3wutQoECUlM7wE1nMsN+QUzFyeOoQpRyPPz/s8CiFAytVsRpGGYPcbbX
 FgYUNM78kfIUkYOrGrXDxLkO1HNQExg9wWXidw8vREY+AujjT0imzHV8Q3pFwa9nBXs1
 89vrMwNrB9ZLGMroG76DWZgoXoJdTA0D6nYfT5vbadvLZlTT7M5fmCdWslsGUPU75wyh
 yQhuZeNKOSeR3fXE0r0Yb2ZlL9wKSLiKZtTnkmhR2FYP+7ad8YF/2oGOFn2XPNGex39W
 kQ3Q==
X-Gm-Message-State: AOAM5309HMm7lC5z9f//31JLka5JC9TknehXYCjY+fJa5oXwD2ReyZ5n
 gx6zIeZlYmG9lZpA5/wMsQ==
X-Google-Smtp-Source: ABdhPJzOLn4APGVG1nKmc2qZ2z5S2MfzNNZt/cT3GpZl4Pv4O9svr42eRc1ndov0GLJQAPDrJRbBfw==
X-Received: by 2002:a6b:fe09:: with SMTP id x9mr533070ioh.20.1626120869835;
 Mon, 12 Jul 2021 13:14:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id h13sm3137813ila.44.2021.07.12.13.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:14:28 -0700 (PDT)
Received: (nullmailer pid 2412840 invoked by uid 1000);
 Mon, 12 Jul 2021 20:14:27 -0000
Date: Mon, 12 Jul 2021 14:14:27 -0600
From: Rob Herring <robh@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, Li Yang <leoyang.li@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add SolidSense boards
Message-ID: <20210712201427.GA2412806@robh.at.kernel.org>
References: <E1ludJe-0001rQ-8c@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ludJe-0001rQ-8c@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_131431_060991_459C46FC 
X-CRM114-Status: GOOD (  10.66  )
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
Message-ID: <20210712201427.T24H_KGzXsNFLf3bjrvEowv5DwLbP3PvPOO6zHEYkzQ@z>

On Sat, 19 Jun 2021 16:55:26 +0100, Russell King (Oracle) wrote:
> Add SolidRun SolidSense boards.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
