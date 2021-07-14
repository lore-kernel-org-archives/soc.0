Return-Path: <SRS0=XmkM=MG=lists.freedesktop.org=dri-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5453C07E9C
	for <dri-devel@archiver.kernel.org>; Wed, 14 Jul 2021 16:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9186D613C2
	for <dri-devel@archiver.kernel.org>; Wed, 14 Jul 2021 16:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9186D613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=dri-devel-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44BE6E42A;
	Wed, 14 Jul 2021 16:37:37 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3B86E42A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 16:37:36 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id l5so2900595iok.7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 09:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4tJeunAnZHlhQuigtds/Y0c5fgwGRcJ1HpFKTFeZvbU=;
 b=L6LiGlySJVDKwtYdM+EqcDbiWW+5FnpxImtCu6ks8IRuGUAoTu6hrQV+3u9k+pNE/t
 rLGLLCOwTgQL8RTkod19IZiOpOioFoQWmQ0uTAjfB1K/hvMr2Oi4u59BSfhiGQ0EjMje
 HBz8P+RYWQFH0BGDqOPWLYUtzmW7pnkbcAXFiqpNBtfTAG+3NQFD2AlGhN2J5tGWK/65
 zhtg2uuN7UgTU27BTDH6QxNL5kBcx4sku0fIQFj5245DAoPEl2YKKdAhmgQk1C2e5nGm
 6RNGTf7Trg0++gPtl++D4Nm2EYIn7hLduHm2XA/hFVFECatxJ+jxQv/1TQByS4rPeBYj
 b8JQ==
X-Gm-Message-State: AOAM530OXiiRJEhPGicc6+tOSpcvTZxHo2uwKtb9krCuk1Wur8qbsDHx
 Uja5gfh/kpSmfwU3ynyN6Q==
X-Google-Smtp-Source: ABdhPJzVkkc1P8a634IL2iHsgXQyZ4AE005dkCM4T2KN3A+q4PdX0vgxBSC65J1kRJPnYNA0vZBkvg==
X-Received: by 2002:a02:a595:: with SMTP id b21mr9600496jam.122.1626280656051; 
 Wed, 14 Jul 2021 09:37:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id c26sm1446889ioa.32.2021.07.14.09.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 09:37:35 -0700 (PDT)
Received: (nullmailer pid 2719952 invoked by uid 1000);
 Wed, 14 Jul 2021 16:37:31 -0000
Date: Wed, 14 Jul 2021 10:37:31 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 2/4] dt-bindings: vendor-prefixes: Add an entry for
 SKOV A/S
Message-ID: <20210714163731.GA2719790@robh.at.kernel.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714045349.10963-3-o.rempel@pengutronix.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Message-ID: <20210714163731.TrScVjsw-s4Hhdu6gceMDnCcgdYGl-kpPgA6Yck4ddQ@z>

On Wed, 14 Jul 2021 06:53:47 +0200, Oleksij Rempel wrote:
> Add "skov" entry for the SKOV A/S: https://www.skov.com/en/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

