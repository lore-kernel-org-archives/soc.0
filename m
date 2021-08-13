Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A73AC4320A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 18:58:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A77F60FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 18:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A77F60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JV3sxHgiDRx0AHPa0wAJZxAJovI9y/lg36nfrUDYt0I=; b=JJ6OxYR3XLCOKY
	Mh7v6LSU4DhfBJFquqWmv5eHAn8IqB8LAs1ZPZm6UlOX1XKQEDgi1jhEZgr7ZyyTXp/uNjup8AiUM
	gBrLl1xwHS5D+4CbOCOqX8Ad+wHWSlzC4JF0CX3UrP6xAT62V8UJ+1A+6iyWj/H7bPeEmvzAwZhbv
	2m+OaTtVc0BO+oh9EVnGhct7NC9+w9KLpSQQZrdeGHiWDj00K0F62erI8Gq39OcZqCaP82b2mfgrs
	9JSoppimBZ7ECV57UQ87xpt8tsFI/6L2ZIMho+38mmYCjDeYN5qFfdP5kKFPmX1jk7rc5i+Otv+mh
	4w5SfY5h40tIF/PQqCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEcLX-00DO8y-LL; Fri, 13 Aug 2021 18:55:59 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEcLT-00DO8H-RE
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 18:55:57 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 u13-20020a9d4d8d0000b02905177c9e0a4aso2594330otk.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 11:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L0pfLxRNKo02qzCvo3QeOM9KCSwF5hE7nSVfXNEo/n4=;
 b=eYQ1FUZ3v3RbAUMh6oBuSUiMgFyqDs8ojFUq8vOuUyFMNyju6ZCVgSdoi0UThSHLaH
 EbdNO1hc1bvDcjQ3bONVyuS5DXr0K/qCoxRtmrv2IlNKkhpZQ8VZBBfPzBZqnjz2P5Na
 fwsDS7ZiHE4bh/jFBkrbXZ6BfRxGcF+vH3pnn1E1qF+ffKQaaDe4NASBJgSoEa/Ti8Pu
 CVuLg+n+M3XzS6P1MTI0IJn4ZAYjVIx6YhUWfLva6qkespxKI4YpJIoeLuKmAkKa5SUf
 crHhMZfZWeSGiOEbWbBGX7Ea7p6NLL6kbty6TAjoQ5Tuo6nqHVfGzS/semqr7wkt2gyK
 dO7A==
X-Gm-Message-State: AOAM530I4xdcvqHf+LxBwcsEUtBW0elNeIUtgE1mQ8HBVb94bfSO380w
 P010+YphW6S47hgMLd2CBA==
X-Google-Smtp-Source: ABdhPJxF8W59I5HF/nGleAn8s5FNFCVTubE+Y9Cx1YpkOP7Ji8jY4ePHPHUQr9pRU2lN8utICytuLQ==
X-Received: by 2002:a9d:266a:: with SMTP id a97mr1850524otb.114.1628880955277; 
 Fri, 13 Aug 2021 11:55:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t21sm463096otl.67.2021.08.13.11.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 11:55:54 -0700 (PDT)
Received: (nullmailer pid 3860141 invoked by uid 1000);
 Fri, 13 Aug 2021 18:55:53 -0000
Date: Fri, 13 Aug 2021 13:55:53 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 3/7] dt-bindings: ARM: at91: document exegin q5xr5 board
Message-ID: <YRbAOYoRoMCtxuGL@robh.at.kernel.org>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
 <20210805155357.594414-4-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805155357.594414-4-claudiu.beznea@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_115555_926373_B071021E 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, arnd@arndb.de,
 soc@kernel.org, linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com,
 robh+dt@kernel.org, olof@lixom.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210813185553.6NSeCQJ90TMCYfAPk64XgpYytojSzFy9WsyM1F6Dpuw@z>

On Thu, 05 Aug 2021 18:53:53 +0300, Claudiu Beznea wrote:
> Document Exegin Q5xR5 board.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
