Return-Path: <SRS0=byvG=NC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748E3C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Aug 2021 18:42:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FBF6104F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Aug 2021 18:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16FBF6104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnQv+3nK+eDZ83STVw1n2Pc7i7yN6wWHnXN5sVM95QM=; b=fvf66oIOvdlpSk
	spuGIWk0P1rHf+JXd/RHPSQc6rQoZksIXJtNAOSvMnHgK/+OQYdxvmL7mx099L3fnjY9ZXnLqcKsp
	gb0AI4zkAeo+LC2TnztdOdaJM5ecASGqG0FdllSVcfjr+AysN5mwoTSyaLC3M/nwLCf3IlmvrK6hB
	X02PcgKgshjkZHWtTrBEOycw0e7weHYZEBxNU2fzwhrMSUEhHaDBPGIUpAs0/GywqaHEGVPDO15jk
	PmgAwyYAV749r/oH27nuH6UBOS4lonXCxpoBm6ywy4uDthlC+lptQLB4WocUKBxK2PK5NW1zlClsM
	9gEPZv8N599ozhUGWc9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDt9X-007u4R-Vq; Wed, 11 Aug 2021 18:40:36 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDt9S-007u3d-14
 for linux-arm-kernel@lists.infradead.org; Wed, 11 Aug 2021 18:40:33 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 lw7-20020a17090b1807b029017881cc80b7so11050389pjb.3
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 11 Aug 2021 11:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6XWZ7uipzmbT4b9s5UP3Dp3Et7I/DEvFdMWNyQg4EWo=;
 b=JtbU/sN195ExYvC3rEi88LylsbKzETpr1xrzek8RWKx5JbmKm229P6mg46Nylb4A9P
 nK4rZWp4MEIyepvvZbzSKPK7unoKl/1GjxW8p7+a58RShqtB1X8O4/5qkQDTnepFHwpC
 XohjBQVSf7s2buaeEGoKMiH9XiKI2V/rTwYJCrlXQcXFw8MmQko0oxmXdxQl3xD3F+2a
 WcwB4l8BoYKFrThd7g5UKgM4ZfQQrgUATl0xFtFoWPI+YyyA9dYwTzhKjGcuc/U9PZ5b
 6AzaqP+5gg2WM/5kY/6DgIMz502QB5LViX3zmyjcXzS+TwlDRX9Pw4zrogpUFbmZjDNG
 Q/+g==
X-Gm-Message-State: AOAM5335WfTlM8SNhKYhKtMfj//Bxae+6YJg7dIjmW2Uht/swYONQNFe
 szWcTjAyu9TKxHXJITrxLA==
X-Google-Smtp-Source: ABdhPJydzGSNHHLbCABFjtI2hErQQ3Hvcs3ObcdrBQP2nvWLFn8lM3bPlQ55R/pujUDc+0x05iMkZw==
X-Received: by 2002:a05:6a00:150d:b029:3c8:e86e:79ec with SMTP id
 q13-20020a056a00150db02903c8e86e79ecmr182380pfu.62.1628707228843; 
 Wed, 11 Aug 2021 11:40:28 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
 by smtp.gmail.com with ESMTPSA id u21sm218257pfh.163.2021.08.11.11.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 11:40:27 -0700 (PDT)
Received: (nullmailer pid 66990 invoked by uid 1000);
 Wed, 11 Aug 2021 18:40:23 -0000
Date: Wed, 11 Aug 2021 12:40:23 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Olof Johansson <olof@lixom.net>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add an entry for
 SKOV A/S
Message-ID: <YRQZl94LsG9smzI0@robh.at.kernel.org>
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
 <20210804043439.11757-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804043439.11757-2-o.rempel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_114030_117039_BCA790A9 
X-CRM114-Status: GOOD (  11.56  )
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
Message-ID: <20210811184023.SJIQYqQa4GBfrFjx-pOHGOocgWcZTK4DI8KDclDisck@z>

On Wed, 04 Aug 2021 06:34:37 +0200, Oleksij Rempel wrote:
> Add "skov" entry for the SKOV A/S: https://www.skov.com/en/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
