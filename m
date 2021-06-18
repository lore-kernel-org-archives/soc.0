Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7F6C48BE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 21:09:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C3C461260
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 21:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C3C461260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9E5BJmlB8MfSt10TPsZGdMb16hMZQQJ9A4Gn2WczjY=; b=LUAeBSNkJ+4noY
	Bw5pUs3xLjIE6/b1jWAak+iYeD4AQRm7rKPNQ0BoX9Vuuol589Fwdg/W+uMKqGl8VjDF7q3z1qBGH
	SlVr/diGrrRIlTAT/O/w+9ygp3SBroCa7dzLRNGHrnPsaFykSrJq7PZ7Fz8yZ3Bv/4LfGzv/d+VgN
	uZYauZzp8Zs0l75zthpWdsWfs41H3H7kqnbgUpnJBR7lCmRdwekZw2SROQ+vf81GgzEW+OXgmPtj+
	gBni4S8AuQSNia+vTg0j1YuFk+qXJtPltlOYDI+FxCdPnYiJLjBDl58djxS49gUUcrP3+NKA9J+Rp
	YgQx1an10eVkim/656Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLhf-00FXTe-AQ; Fri, 18 Jun 2021 21:07:03 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLhc-00FXRs-1Y
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 21:07:01 +0000
Received: by mail-oo1-f49.google.com with SMTP id
 128-20020a4a11860000b029024b19a4d98eso2443992ooc.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 18 Jun 2021 14:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YtiOyReou+pF/1rfufORAr+idx/wS1LrrDO07j6J4ZY=;
 b=VC+0d59CZ+w54mR3Y7Pf2AogzS5EGwipVonZX/JIcWwycv+twBiSX+4IgwlCVe8PyS
 Bfe554QFjMGf2vmGU342jwbyrGAD8OsGkXTMI8YpcU+3ixDw8BhX6gvCVLkG0z9pmyf+
 WdoHrvsF1aQEHjVW6ycPiOHPq1gie+R8f4t2aemFqdnMtTLsGQdArJzuiZX+Q/auDreb
 BDoUnRztjKTsKqOy6MbYsAE9OfJZ37LMEUk1uGSbQtLWpFrwZeNJ75//+Kyysh0Cbc9L
 NYwh1TUJViKkgaYSuHvd+FtHiaq1CDc6dzFAVjqg1JHE61mXnq8UV4j92vcC/wM3LNKF
 63Bg==
X-Gm-Message-State: AOAM5304ZQAorTeQpp+n/x/ySWaXWR4DpupK2YWJ+CTv0BarkKrEKYvb
 vvB4wBV+cey24nAn4BumRA==
X-Google-Smtp-Source: ABdhPJxMCbp/u0TP+JyeZh7NKeN4BrawJlBzXSydp60BTZbERp/w/KlhgnJ1kT4nGA+auxBWoWyDRw==
X-Received: by 2002:a4a:cb06:: with SMTP id r6mr10657436ooq.15.1624050418226; 
 Fri, 18 Jun 2021 14:06:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id t39sm2014170ooi.42.2021.06.18.14.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 14:06:57 -0700 (PDT)
Received: (nullmailer pid 2874848 invoked by uid 1000);
 Fri, 18 Jun 2021 21:06:54 -0000
Date: Fri, 18 Jun 2021 15:06:54 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Fabio Estevam <festevam@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 soc@kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 3/4] dt-bindings: arm: fsl: add SKOV imx6q and imx6dl
 based boards
Message-ID: <20210618210654.GA2874818@robh.at.kernel.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
 <20210609121050.18715-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609121050.18715-4-o.rempel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_140700_128928_4841EDBB 
X-CRM114-Status: GOOD (  10.60  )
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
Message-ID: <20210618210654.OZOEcnF9E7h3Kg7MEUSSYTfOlcwNwqop0P2dA-xklF8@z>

On Wed, 09 Jun 2021 14:10:49 +0200, Oleksij Rempel wrote:
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
